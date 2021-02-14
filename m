Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192CD31B302
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 23:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhBNWSP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 17:18:15 -0500
Received: from ozlabs.org ([203.11.71.1]:59425 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229976AbhBNWSP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 17:18:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df1nS0WmYz9sCD;
        Mon, 15 Feb 2021 09:17:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613341053;
        bh=ZAM06fimZ/IJEP0A+kyL8uO8yUPa1s4iqwVx46x1WLw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=i4EawAIxpDc6s9jzUjeczIWrZi0921WyHImv7TrSuh6zo7+NaxRSyuzm/Vi+LxtZ3
         HKgUCP0dHTd1YqJKYKTBJ0VDynJTu4R9rOgBZVq9bCRB14/AR7g0IjHKMXaa8YKXM+
         ImUA48G9AkEHI/YSM9sVvfmncqUxUgBUk7/bfbm7uoQG+J2OZZRIe8yFksNMtM2P2G
         I2aIWKy/VNX6DaBoRGhq1CoU5hSXnzg/N2l+8x6lCZ/wdlGT/bM832YpeY3fN9vqtt
         r5Rq/YrNq8C0fXo9Cg87z0ZzhQPW9xG3v1WPP8x9jfH9mxqyj4OaRjEwx3N46OZbR3
         Vvj6v3auPM3zw==
Date:   Mon, 15 Feb 2021 09:17:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc:     David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: linux-next: manual merge of the block tree with the btrfs tree
Message-ID: <20210215091731.3773315b@canb.auug.org.au>
In-Reply-To: <20210202134559.175ae62f@canb.auug.org.au>
References: <20210202134559.175ae62f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vJ1PGRZ+E1Guyi+RNBZwSbH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vJ1PGRZ+E1Guyi+RNBZwSbH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Feb 2021 13:45:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   fs/iomap/direct-io.c
>=20
> between commit:
>=20
>   dffd1df2d29a ("iomap: support REQ_OP_ZONE_APPEND")
>=20
> from the btrfs tree and commit:
>=20
>   3e1a88ec9625 ("bio: add a helper calculating nr segments to alloc")
>=20
> from the block tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc fs/iomap/direct-io.c
> index e4c258a2cefc,ea1e8f696076..000000000000
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@@ -292,13 -260,7 +289,14 @@@ iomap_dio_bio_actor(struct inode *inode
>   			iomap_dio_zero(dio, iomap, pos - pad, pad);
>   	}
>  =20
>  +	/*
>  +	 * Set the operation flags early so that bio_iov_iter_get_pages
>  +	 * can set up the page vector appropriately for a ZONE_APPEND
>  +	 * operation.
>  +	 */
>  +	bio_opf =3D iomap_dio_bio_opflags(dio, iomap, use_fua);
>  +
> + 	nr_pages =3D bio_iov_vecs_to_alloc(dio->submit.iter, BIO_MAX_PAGES);
>   	do {
>   		size_t n;
>   		if (dio->error) {

With the merge window about to open, this is a reminder that this
conflict still exists.

The btrfs tree commit is now

  c3b0e880bbfa ("iomap: support REQ_OP_ZONE_APPEND")

--=20
Cheers,
Stephen Rothwell

--Sig_/vJ1PGRZ+E1Guyi+RNBZwSbH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApoXsACgkQAVBC80lX
0Gy8tgf/Y/3jbaI5qI2IekFUwr31x/p5QmGxklqVP1pozVtB9jN5tSkCGDfYzFWR
TmDxM/qeY2hcryH6bv72SdulW6oCaeWjpcCO24m53AReGe29D7wmreEgORiPCpK1
6j5PrW0psft11re3pytppHFXr7rNPxDqfIWuvxRALy52JoXXPjwZS171HkQTCFEA
4i87aCmqoZCeFTjl2rrx+wFQkv5dskfxgXgy6cV25MCzRW09RCZbovHAodfzUOID
yAcNm1d6pdaYbYuO1Jb6meK2QTAWgToK21QaHhwY/b+TqtEigY2zsZbXLRHhCBmj
FaNXAXqvrSmmunYsX3d1H5lH+5N69g==
=JVaX
-----END PGP SIGNATURE-----

--Sig_/vJ1PGRZ+E1Guyi+RNBZwSbH--
