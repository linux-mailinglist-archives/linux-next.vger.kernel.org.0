Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDBE36AA51
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 03:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhDZBaf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Apr 2021 21:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbhDZBae (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 25 Apr 2021 21:30:34 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EB2C061574;
        Sun, 25 Apr 2021 18:29:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FT6kz0q2pz9sRf;
        Mon, 26 Apr 2021 11:29:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619400588;
        bh=XrvhCsOsevjPi0xQr03piCQXomodWW7H1sLbL2ow2bI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tTfAr95NvCp8VCPIj5jc1Ifai9z+BfW9/HEiFN+fn11HeTBoenDEcxcEjtF2xjawk
         HXfiRCj10kEtyjrkmSmVl0Oiy2MhXQ3XhFA6GEGYddbSbh1CUUS76JXRaJLFyL+x5V
         gMGClkjHTLexJZuXd4LFiFJWwY5fxYyJzIVkDaOCN9q5CDUmzLm3OySsK4k59cvkTr
         +3cmDmRYNqDFpC2NMI33VREzAHBOF59DDdrdMJs6o82ufXLUIzCvPCBbGDHcBa6g7D
         1xZktYENA9pE/lU/zYUMGY0vxjVAscXL2aGkkl8adjQODwPzStvFGnS84zlxS8rZ1q
         0oqVFSo0fjpNg==
Date:   Mon, 26 Apr 2021 11:29:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Mark Brown <broonie@kernel.org>
Cc:     Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <20210426112945.32142fcc@canb.auug.org.au>
In-Reply-To: <20210329165525.32d51a3a@canb.auug.org.au>
References: <20210329165525.32d51a3a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X+HPRm.fv92U7pv=q1GpH1S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X+HPRm.fv92U7pv=q1GpH1S
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

With the merge window opening, this is a reminder that I am still
applying the above fix to the merge of the staging tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/X+HPRm.fv92U7pv=q1GpH1S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCGF4kACgkQAVBC80lX
0Gwf4wf9GmAdBIIFEzhthx1ya7B89l8ld/dteRMs21PzvjmIkKo9ILrLDC1bM/mx
HfYkGNobF27+2xHJ7Ejkd9Qg36c80Y5aHSwUUiGzBUccijBmVL8zrGa1WdZ+SzfI
SJYgjyjBslG7rjP9rE2w6lBtDSl6HrWJU/7D2SUEV91rECQVOePnSZx+xa7SwaKh
ZdXivO4lDnADPsg4swyOtUchGkfraAWB6OJr5WTyQuRNuIm/Oh9cnmCDBRpxta3L
6aznb/3H7Kfst5AMwuIofkQQV0VZ/my7qLbCFcuwE3+zM5Ae0z0kGAmU/cb/AikB
eKcozkX8OHI64yVgBeCkyRI5wSgO5Q==
=VvdI
-----END PGP SIGNATURE-----

--Sig_/X+HPRm.fv92U7pv=q1GpH1S--
