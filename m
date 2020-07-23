Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A8A22A42C
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 03:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733150AbgGWBDH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 21:03:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50965 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729401AbgGWBDG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Jul 2020 21:03:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBvFz3kvCz9sSd;
        Thu, 23 Jul 2020 11:03:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595466184;
        bh=IpD6VASULktpgHAHi1GVOnJ74823SFgCA3i2WxV+1Kk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a1xQ4wLuWfoRGLg8np7TIAVD4uiBTmWI3nruA7UADurrWX5LwSX6JnAyAJZQExRCR
         8jj0yABmLfarfuT9J1Qqkdvb2FrITsVOdfsXnX/mcd2RBab78VgSBjNXnAissr2fFj
         ByPgEY4JBWSlt/mOqRWlr8fNxpC3VYMvdvHUblkJLDDPhcJcuNbNcEuJ0qVJ96mqms
         PPX30b879VrC6IqpFvd+THvwjHYvQrmd2lk8HIPu+JsAU3ZA/kRHWbSnhWkcIC47+R
         Gheb8BEuMQ5qtJ/Ildo3kfl9DtLfaKvaPwMAXNei//ZA/iKrrO8MKNQbN125ruhZqO
         cF58QUCayUXeg==
Date:   Thu, 23 Jul 2020 11:03:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Theodore Ts'o <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: linux-next: manual merge of the block tree with the fscrypt
 tree
Message-ID: <20200723110300.0d7f5d98@canb.auug.org.au>
In-Reply-To: <20200709130254.65d3f234@canb.auug.org.au>
References: <20200709130254.65d3f234@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kS+tRa/ul1qUe/tvyrK57iD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kS+tRa/ul1qUe/tvyrK57iD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 9 Jul 2020 13:02:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   fs/buffer.c
>=20
> between commit:
>=20
>   4f74d15fe408 ("ext4: add inline encryption support")
>=20
> from the fscrypt tree and commit:
>=20
>   ed9b3196d2b2 ("fs: remove a weird comment in submit_bh_wbc")
>=20
> from the block tree.
>=20
>=20
> diff --cc fs/buffer.c
> index dc5e05b47646,2725ebbcfdc2..000000000000
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@@ -3039,14 -3040,7 +3039,10 @@@ static int submit_bh_wbc(int op, int op
>   	if (test_set_buffer_req(bh) && (op =3D=3D REQ_OP_WRITE))
>   		clear_buffer_write_io_error(bh);
>  =20
> - 	/*
> - 	 * from here on down, it's all bio -- do the initial mapping,
> - 	 * submit_bio -> generic_make_request may further map this bio around
> - 	 */
>   	bio =3D bio_alloc(GFP_NOIO, 1);
>  +
>  +	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
>  +
>   	bio->bi_iter.bi_sector =3D bh->b_blocknr * (bh->b_size >> 9);
>   	bio_set_dev(bio, bh->b_bdev);
>   	bio->bi_write_hint =3D write_hint;

This is now also a conflict between the zonefs tree and the fscrypt
tree (since the zonefs tree has merged part of the block tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/kS+tRa/ul1qUe/tvyrK57iD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Y4cQACgkQAVBC80lX
0Gweygf9FJ3c1ht6rbyCJXGjUn57BgOxed25qetWYDKHtfvJf0AYWX+jOjwU0oUZ
0XRnb6MnzmY+OYHytG415rX02M1JNG0XIsqJ6yFnUhsn7APFSJrLBmcve87ggfNK
BWMx5zJxqANAvFvRyabE0x3ECrbgsFtGWe3ZdgeEFEWISMDY8Or5I8giTilKFV4x
lTkD1jO6WDJkNnE0RIkSIAzkANK9cKfREJBvhcrpLcAGHmZAbBNkoCq/7+PQr+ZF
mS0LLLtP85+wG3UENGBNxOhzfZ/QAK3AXgE5gF9V267ObcpXNh8g7MoxNBqFT7u4
06fDHfQ96HfuF6HPoNGc9EcKfZT2hw==
=jT3c
-----END PGP SIGNATURE-----

--Sig_/kS+tRa/ul1qUe/tvyrK57iD--
