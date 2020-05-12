Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7FE1CEF41
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 10:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgELIiG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 04:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725868AbgELIiG (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 04:38:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9FAC061A0C;
        Tue, 12 May 2020 01:38:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49LrmC3r0fz9sRY;
        Tue, 12 May 2020 18:38:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589272683;
        bh=01Dm57sLSi8lbJRj3/Hw/92Lf2Rxt5EKU9oW3GM8ll0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ExpiKCFgZLu+vwdXR3U+be4OG6CSI35MjEPPOPWwIOGrKWBSaiMKXW+G9nHaSeuIO
         N8XeOnqb4e2WHvKqypgqHzZ0mgoSq/sle5gFR04aZh5tc+wIuIRSqlbwz1Ty8ehQgB
         +1ETQT05+4Y+QEJfyw6uFM5SHxUwzdjrCPgyHwBJK9+kg87Xg0NJJRXVJ7dyXbl8M/
         3UQv6xuuj15a9G+nioILx8sup+pon8CMWH1HJ9ry96sIIGVbR7ILT8n16lzIVsNTid
         GUUqheGP2yzR6ooQ+XMO30qpwsIExxmn8P06LgEoMxkBTyZQ3gqF5zuHNCFp3ZTTqu
         RnyMIwXM63fAw==
Date:   Tue, 12 May 2020 18:38:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the keys tree with Linus' tree
Message-ID: <20200512183802.1899b1ec@canb.auug.org.au>
In-Reply-To: <20200511145915.3bef0c16@canb.auug.org.au>
References: <20200511145915.3bef0c16@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LsaJLR+.lbUWqRzqVK0SERT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LsaJLR+.lbUWqRzqVK0SERT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 11 May 2020 14:59:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the keys tree got a conflict in:
>=20
>   fs/splice.c
>=20
> between commit:
>=20
>   90da2e3f25c8 ("splice: move f_mode checks to do_{splice,tee}()")
>=20
> from Linus' tree and commit:
>=20
>   549d46d3827d ("pipe: Add general notification queue support")
>=20
> from the keys tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc fs/splice.c
> index fd0a1e7e5959,6e6ea30c72b4..000000000000
> --- a/fs/splice.c
> +++ b/fs/splice.c
> @@@ -1118,12 -1118,8 +1118,12 @@@ long do_splice(struct file *in, loff_t=
=20
>   	loff_t offset;
>   	long ret;
>  =20
>  +	if (unlikely(!(in->f_mode & FMODE_READ) ||
>  +		     !(out->f_mode & FMODE_WRITE)))
>  +		return -EBADF;
>  +
> - 	ipipe =3D get_pipe_info(in);
> - 	opipe =3D get_pipe_info(out);
> + 	ipipe =3D get_pipe_info(in, true);
> + 	opipe =3D get_pipe_info(out, true);
>  =20
>   	if (ipipe && opipe) {
>   		if (off_in || off_out)
> @@@ -1757,14 -1766,10 +1757,17 @@@ static int link_pipe(struct pipe_inode_
>   static long do_tee(struct file *in, struct file *out, size_t len,
>   		   unsigned int flags)
>   {
> - 	struct pipe_inode_info *ipipe =3D get_pipe_info(in);
> - 	struct pipe_inode_info *opipe =3D get_pipe_info(out);
>  -	struct pipe_inode_info *ipipe =3D get_pipe_info(in, true);
>  -	struct pipe_inode_info *opipe =3D get_pipe_info(out, true);
> ++	struct pipe_inode_info *ipipe;
> ++	struct pipe_inode_info *opipe;
>   	int ret =3D -EINVAL;
>  =20
>  +	if (unlikely(!(in->f_mode & FMODE_READ) ||
>  +		     !(out->f_mode & FMODE_WRITE)))
>  +		return -EBADF;
>  +
> ++	ipipe =3D get_pipe_info(in, true);
> ++	opipe =3D get_pipe_info(out, true);
> ++
>   	/*
>   	 * Duplicate the contents of ipipe to opipe without actually
>   	   90da2e3f25c8 ("splice: move f_mode checks to do_{splice,tee}()")* c=
opying the data.

This is now a conflict between commit

  90da2e3f25c8 ("splice: move f_mode checks to do_{splice,tee}()")

from Linus' tree and commit

  317f078cce34 ("pipe: Add general notification queue support")

from the notifications tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/LsaJLR+.lbUWqRzqVK0SERT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66YGoACgkQAVBC80lX
0GznwQf/caK3ljsA8WBgXtCfV3e5ophh8e6OQOyIbPGA6XtPTsUcW2bwhOUb/HFd
GhwG1XzT91DemIM3jz/aVA8UMQ76c32FTk1v3awcM+luzsseHEEdFR7/4+L+iPeR
CbmJWS8JeDkF5F0MTzZqBgNlzqLOFoGKHlhSE/Kd5ks5x+gmZcyheO8fG4n3TTX0
TVpehZfcB1Lry413FP0Us8dFNpHgcConm6rSAKN2e6x9r6LRK4jvrAW1EzM2oK5F
4UY2AIaaw9zJF9f2d5tEg4xbcqKX+JChCjUDttnhLqJWGMKCiyCVD5bVDefvcZXm
pKs2MLePX21PJq6m18hdyr49Z7/2lg==
=V/vd
-----END PGP SIGNATURE-----

--Sig_/LsaJLR+.lbUWqRzqVK0SERT--
