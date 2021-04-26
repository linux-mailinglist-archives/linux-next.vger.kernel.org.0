Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AEC36BB7B
	for <lists+linux-next@lfdr.de>; Tue, 27 Apr 2021 00:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbhDZWId (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 18:08:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34655 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232062AbhDZWIc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 18:08:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTfCP1phfz9sWC;
        Tue, 27 Apr 2021 08:07:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619474869;
        bh=yUSdgMdbiCqL5+OB/Of+i6iHUia7HTBO6AQDdHDUFHw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jExKIdmrd1XvwPEf+Hngt7YG01RUf6N2r6Gq3GQ4U8owT1ZeVnuumYzbTFVVME4Dl
         SpFtXMA4Y6n4I4+1u8pMjtID3Tsf+iMhpLXEvL3pmak1KTaQm6zYBGxWSD3ONGn5Z9
         ZjcTjgNp/IGjuIjt8ks6BUbcFfnwqTluGcERX5ULj4sMTO3H61eKC9facgC+tebmkp
         VlmyIC48qP13Zf/JMYpBt74F59wRnO2oa5ti730nHFqdnLMH951+U1B1z1PfVqGVCr
         0LSkWJTrYP43M/xDJo3ie3k3/FVCWF7tYL146KEOvMkSuorGnvLUv9zS8LZ14yzZTG
         Eiic8arbqchGA==
Date:   Tue, 27 Apr 2021 08:07:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Greg KH <greg@kroah.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <20210427080741.5f3de906@canb.auug.org.au>
In-Reply-To: <20210329165525.32d51a3a@canb.auug.org.au>
References: <20210329165525.32d51a3a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C3oPscR5rztSzRkQu0g316m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C3oPscR5rztSzRkQu0g316m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 29 Mar 2021 16:55:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_read_reg':
> drivers/iio/adc/ti-ads131e08.c:180:5: error: 'struct spi_transfer' has no=
 member named 'delay_usecs'
>   180 |    .delay_usecs =3D st->sdecode_delay_us,
>       |     ^~~~~~~~~~~
> drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_write_reg':
> drivers/iio/adc/ti-ads131e08.c:206:5: error: 'struct spi_transfer' has no=
 member named 'delay_usecs'
>   206 |    .delay_usecs =3D st->sdecode_delay_us,
>       |     ^~~~~~~~~~~
>=20
> Caused by commit
>=20
>   d935eddd2799 ("iio: adc: Add driver for Texas Instruments ADS131E0x ADC=
 family")
>=20
> interacting with commit
>=20
>   3ab1cce55337 ("spi: core: remove 'delay_usecs' field from spi_transfer")
>=20
> from the spi tree.
>=20
> I have applied the following merge fix patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 29 Mar 2021 16:51:22 +1100
> Subject: [PATCH] iio: adc: merge fix for "spi: core: remove 'delay_usecs'
>  field from spi_transfer"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/iio/adc/ti-ads131e08.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/iio/adc/ti-ads131e08.c b/drivers/iio/adc/ti-ads131e0=
8.c
> index 0060d5f0abb0..764dab087b41 100644
> --- a/drivers/iio/adc/ti-ads131e08.c
> +++ b/drivers/iio/adc/ti-ads131e08.c
> @@ -177,7 +177,10 @@ static int ads131e08_read_reg(struct ads131e08_state=
 *st, u8 reg)
>  		{
>  			.tx_buf =3D &st->tx_buf,
>  			.len =3D 2,
> -			.delay_usecs =3D st->sdecode_delay_us,
> +			.delay =3D {
> +				.value =3D st->sdecode_delay_us,
> +				.unit =3D SPI_DELAY_UNIT_USECS,
> +			},
>  		}, {
>  			.rx_buf =3D &st->rx_buf,
>  			.len =3D 1,
> @@ -203,7 +206,10 @@ static int ads131e08_write_reg(struct ads131e08_stat=
e *st, u8 reg, u8 value)
>  		{
>  			.tx_buf =3D &st->tx_buf,
>  			.len =3D 3,
> -			.delay_usecs =3D st->sdecode_delay_us,
> +			.delay =3D {
> +				.value =3D st->sdecode_delay_us,
> +				.unit =3D SPI_DELAY_UNIT_USECS,
> +			},
>  		}
>  	};
> =20
> --=20
> 2.30.0

This is now a conflict between the spi (and spi-fixes) tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/C3oPscR5rztSzRkQu0g316m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCHOa0ACgkQAVBC80lX
0Gxwzgf9FD/51KTFC3rZnCYZSe9dRL02WaB445/tOHbhruU8LQIQ7S1yY0AJXp3t
uDbALgCjeqH6nV2XVVAo1OBZJpkAbuTw5+l2XftwNJwd1gie3AiT/ZvrGbEim/Wj
xm+emzRuPHFCvMtxyJ31JSdUmTS0BMW1/4aSBKHxf6f6Fddy7GSkIZ9bVA5LOtp/
8TiMKWLFE4x0E1ndkvKHkppO3wqk7KQvbJMqcNgF3iKQrRhrSEYb22TMxeXG6qUc
xZPLgW/OKjsRwi3XYEeODX9LrhudGL3wV2XZ+77QUDWl903QPI0jLHNPdTY0fh8u
amrG2Fa7n8HCJO7ja+4yqFyRMYgolQ==
=WGP7
-----END PGP SIGNATURE-----

--Sig_/C3oPscR5rztSzRkQu0g316m--
