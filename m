Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE86C14D32B
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2020 23:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgA2Wkg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jan 2020 17:40:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47701 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726222AbgA2Wkg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jan 2020 17:40:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 487JNL1XxSz9sPJ;
        Thu, 30 Jan 2020 09:40:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580337634;
        bh=caZ7dEbqWZapx56yImJF3r7lW4Ok3Y+DvZQIvGtEqkE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QuQutsuKJev2qpmJR0x8ryq+rtskYHechjS11DslypiLkkM/Tmh/ratyuPZOXIpmf
         AOF/CsmQZGnX1rj3w5XmMHNweihO7mXHZ6Le+OWA4DyO2cQS5EK0pTCGrVSyY6dJYZ
         I0iQIs5SaAMK1UaUe1ZYw6zagGeYvjAhNSaz2FDOb8l9hQPwLwl+8098GBoCuzTtma
         ai5pblaC/t+SoP98OwjZsUBShH3SZHR7Gw2kerbjCb7d6gwjGHEQhsLEkK+a0/euPx
         XxxDQvI++6ucSAcBjTK9+KOK92guuOrFpVaXYw2DZ0JPF1ZMWTTS+bXOIKHq4n95Jf
         x9ZKedgqKuBLw==
Date:   Thu, 30 Jan 2020 09:40:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Carlos Maiolino <cmaiolino@redhat.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200130094032.78ea9f8d@canb.auug.org.au>
In-Reply-To: <20200124134124.57759b06@canb.auug.org.au>
References: <20200110175729.3b5d2338@canb.auug.org.au>
        <20200124134124.57759b06@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LZiAlRbMu0VYtHB6LQg1gzN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LZiAlRbMu0VYtHB6LQg1gzN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 24 Jan 2020 13:41:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Fri, 10 Jan 2020 17:57:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the vfs tree, today's linux-next build (x86_64 allnoconfi=
g)
> > failed like this:
> >=20
> > fs/inode.c:1615:5: error: redefinition of 'bmap'
> >  1615 | int bmap(struct inode *inode, sector_t *block)
> >       |     ^~~~
> > In file included from fs/inode.c:7:
> > include/linux/fs.h:2867:19: note: previous definition of 'bmap' was here
> >  2867 | static inline int bmap(struct inode *inode,  sector_t *block)
> >       |                   ^~~~
> >=20
> > Caused by commit
> >=20
> >   65a805fdd75f ("fibmap: Use bmap instead of ->bmap method in ioctl_fib=
map")
> >=20
> > I have added this patch for today:
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 10 Jan 2020 17:53:19 +1100
> > Subject: [PATCH] fs: fix up for !CONFIG_BLOCK and bmap
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  fs/inode.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/fs/inode.c b/fs/inode.c
> > index 9f894b25af2b..590f36daa006 100644
> > --- a/fs/inode.c
> > +++ b/fs/inode.c
> > @@ -1598,6 +1598,7 @@ void iput(struct inode *inode)
> >  }
> >  EXPORT_SYMBOL(iput);
> > =20
> > +#ifdef CONFIG_BLOCK
> >  /**
> >   *	bmap	- find a block number in a file
> >   *	@inode:  inode owning the block number being requested
> > @@ -1621,6 +1622,7 @@ int bmap(struct inode *inode, sector_t *block)
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(bmap);
> > +#endif
> > =20
> >  /*
> >   * With relative atime, only update atime if the previous atime is
> > --=20
> > 2.24.0 =20
>=20
> I am still applying this patch each day ...

Ping?

--=20
Cheers,
Stephen Rothwell

--Sig_/LZiAlRbMu0VYtHB6LQg1gzN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4yCeAACgkQAVBC80lX
0GzYNQf9HOxdBP1EZzn2vHqFBhmbPnA8Icv3kyhoehkQsYdSjQNfykgGPK38Dz0x
IWbPHbOu8darWLkQm2EMxlHkWwak+O5HTnIxE8v/r0+XLnTfUKUUnNsKIE9m1EMJ
FOZ5O+W0T3b/wg5MPTHVhUeauzUYlVHniMQPQSJBm5dThcXE3Rt5Frr9rTvFjAqt
MjYm+XBGYJ9Dn3aro9g0ma2GLnWk5FPTXqq5VO0cNHIwlBcaXN/Tlh8ULyYWR3u9
vCzRAhvjLCYDyKr6qxBm99Ed2VJPE9r6kB5MfKlxvvp0mnhEMDR1ZfoGO2BuBeix
2DRtrlxaikJ+R2+DVIeZSvjvSI+7mA==
=JBkA
-----END PGP SIGNATURE-----

--Sig_/LZiAlRbMu0VYtHB6LQg1gzN--
