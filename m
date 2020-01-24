Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C46C1476F3
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2020 03:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbgAXCla (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 21:41:30 -0500
Received: from ozlabs.org ([203.11.71.1]:36167 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729340AbgAXCla (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Jan 2020 21:41:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 483k123CbTz9sRK;
        Fri, 24 Jan 2020 13:41:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579833686;
        bh=FcO1sEsS142OWFXaWw24W2vXKioXSusedr8yViPSC8g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mDqooZlEmHUrv/1H/5rFaLtf32F3LEIl4un/rdy2XoNEnazWDx+8f1F8CbYt/Lna+
         p2CTjr2d0dpJwO6pxH+X3RorPK6anx2roN6RtRg6kjlX+3J/s8wBNRsUfZ3niqmq3B
         PE7Gj0nTBFwBoyvTaQmbvWBeJO4T4uroldTtY52rS/KMlEEU7Uo8WORP7s88+JLWfX
         nLX9EM+XH5spkUxgWwwefwP/3XPSwNOsmyN84B+BCKS4qU6z1LnRauDXwU7GhMZW6V
         OnurWaprxcKdzhsKKCIVycnSkgDhoaQdjTNka6m9iW9LfIRRBX7jEejQXnCkS253aL
         fkHmDD0uDN4lQ==
Date:   Fri, 24 Jan 2020 13:41:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Carlos Maiolino <cmaiolino@redhat.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200124134124.57759b06@canb.auug.org.au>
In-Reply-To: <20200110175729.3b5d2338@canb.auug.org.au>
References: <20200110175729.3b5d2338@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dj5/oQ=7f9hsgkLwC.+H_UT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dj5/oQ=7f9hsgkLwC.+H_UT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 10 Jan 2020 17:57:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the vfs tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
>=20
> fs/inode.c:1615:5: error: redefinition of 'bmap'
>  1615 | int bmap(struct inode *inode, sector_t *block)
>       |     ^~~~
> In file included from fs/inode.c:7:
> include/linux/fs.h:2867:19: note: previous definition of 'bmap' was here
>  2867 | static inline int bmap(struct inode *inode,  sector_t *block)
>       |                   ^~~~
>=20
> Caused by commit
>=20
>   65a805fdd75f ("fibmap: Use bmap instead of ->bmap method in ioctl_fibma=
p")
>=20
> I have added this patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 10 Jan 2020 17:53:19 +1100
> Subject: [PATCH] fs: fix up for !CONFIG_BLOCK and bmap
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/inode.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/fs/inode.c b/fs/inode.c
> index 9f894b25af2b..590f36daa006 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -1598,6 +1598,7 @@ void iput(struct inode *inode)
>  }
>  EXPORT_SYMBOL(iput);
> =20
> +#ifdef CONFIG_BLOCK
>  /**
>   *	bmap	- find a block number in a file
>   *	@inode:  inode owning the block number being requested
> @@ -1621,6 +1622,7 @@ int bmap(struct inode *inode, sector_t *block)
>  	return 0;
>  }
>  EXPORT_SYMBOL(bmap);
> +#endif
> =20
>  /*
>   * With relative atime, only update atime if the previous atime is
> --=20
> 2.24.0

I am still applying this patch each day ...
--=20
Cheers,
Stephen Rothwell

--Sig_/dj5/oQ=7f9hsgkLwC.+H_UT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4qWVQACgkQAVBC80lX
0Gx+Swf+JuM1TIB5DvgWdYg0D+lCNr+DSWs/JD5Kgfy6f8nhkB/D48NP4ciRpkMB
HkEdj1nbacp57JMCqKZfqQoMsMR2IuVozH6q9/nTWWoKDLALrJlxLSVIED7B9k7I
Mqz23r/m7vkl6hb+9r3tvudqnCT+jz8v+Z59vk+8ZdUXmtJCXxeXyw2mwBYRNHTh
8VJ8oABdrMBhb40Tlmv8l++SP4Fy/edTHYHrpeQU+ZaDM5FcQhB5OmPvlpwstqaP
l1/VGzaec7Mp1+unMruQNl+XDh+/6RI6g5eyqo923H64lPjvkiJ/H7H4fBHlWN34
YXndiZOvDnhPOJHvl1/MRP8UBFjNxw==
=DERz
-----END PGP SIGNATURE-----

--Sig_/dj5/oQ=7f9hsgkLwC.+H_UT--
