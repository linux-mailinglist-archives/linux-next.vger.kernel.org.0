Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E2519A06E
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 23:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgCaVG2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 17:06:28 -0400
Received: from ozlabs.org ([203.11.71.1]:51899 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727937AbgCaVG2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Mar 2020 17:06:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sMM60qtxz9sT1;
        Wed,  1 Apr 2020 08:06:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585688786;
        bh=eiIA93VCZCj0BV+o0eugl5O9jkjn5FnSmOxahgvXpNI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PZT/+9jOum8OWy+vl/035GLEC7wTZAaJDy9Cr4/bMVLUKNfPKuEHwkrPp0vp4POe1
         Jyk9aklUh2lFwaA6kagliT0OFoz4FPdVtw3IGN0BMJyRRSPol4NDbaV70/K7YPBSlo
         N9xG/oYafOpD1uI1BhY0asywc/ErvBd+tHcb96AlYejJstXiet3hdOoWJRy8ocjyLT
         O6oJ0LZFLaOSQwPoKuwqap7IqJxUlIajn2Ak/sGYCflsCHP3fb8E02kjjIwbnBdd5Q
         NJYd3JDG3AcAxkz14GYffctoczaPsvGS8Sip2tlc24nvia4vr7nNEswBKDiaqSK/iV
         nnPUHS9SVuj5w==
Date:   Wed, 1 Apr 2020 08:06:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: build failure after merge of the input tree
Message-ID: <20200401080624.5c3b3891@canb.auug.org.au>
In-Reply-To: <20200325181600.207eb7ac@canb.auug.org.au>
References: <20200325181600.207eb7ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WKjc7kGA0//_OfO+296aCAq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WKjc7kGA0//_OfO+296aCAq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 25 Mar 2020 18:16:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the input tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/input/touchscreen/goodix.c: In function 'goodix_irq_direction_out=
put':
> drivers/input/touchscreen/goodix.c:624:12: error: implicit declaration of=
 function 'acpi_execute_simple_method' [-Werror=3Dimplicit-function-declara=
tion]
>   624 |   status =3D acpi_execute_simple_method(ACPI_HANDLE(dev),
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/input/touchscreen/goodix.c:606:17: warning: unused variable 'dev'=
 [-Wunused-variable]
>   606 |  struct device *dev =3D &ts->client->dev;
>       |                 ^~~
> drivers/input/touchscreen/goodix.c: In function 'goodix_irq_direction_inp=
ut':
> drivers/input/touchscreen/goodix.c:634:17: warning: unused variable 'dev'=
 [-Wunused-variable]
>   634 |  struct device *dev =3D &ts->client->dev;
>       |                 ^~~
> cc1: some warnings being treated as errors
>=20
> Caused by commit
>=20
>   c5fca485320e ("Input: goodix - add support for controlling the IRQ pin =
through ACPI methods")
>=20
> I have applied the following patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 25 Mar 2020 18:04:08 +1100
> Subject: [PATCH] Input: goodix - mark as BROKEN for noe
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/input/touchscreen/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscree=
n/Kconfig
> index c071f7c407b6..98788fb83917 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -380,6 +380,7 @@ config TOUCHSCREEN_GOODIX
>  	tristate "Goodix I2C touchscreen"
>  	depends on I2C
>  	depends on GPIOLIB || COMPILE_TEST
> +	depends on BROKEN
>  	help
>  	  Say Y here if you have the Goodix touchscreen (such as one
>  	  installed in Onda v975w tablets) connected to your

I am still marking this as BROKEN ...

--=20
Cheers,
Stephen Rothwell

--Sig_/WKjc7kGA0//_OfO+296aCAq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6DsNAACgkQAVBC80lX
0GzghQf/RCSypmhvNXsgSmNlKwY3tNEZ+O86i2RhBM+COTB1CF/aGXCKC04axvIa
M/qhUKTVPKF9RBCd8TeSTxWeoaSSTz5xh8Kwh/i0NfP3+gx86ETjBwTwQYJYadfg
hBwEG1406sVoHQ+CEI6yiCUW+ZCJlhSb9ijY4Uc9b+gB9iyZn3DwBfDvXd6HGkaD
vFGs8e0Lk7ICony/IahXPp054LFP0/9wT7fuasrfl9f2zId2Zi7MebJ6QTwZROil
HhnJsRTlfcZAn20XJLIm3AnN9uJCpLyeRJTTGB508XRqJEYYuDU0+vRDmTwZWNRl
v1dRkKDgyrZ7Thjv7U3Lsp8byhikrg==
=P0p2
-----END PGP SIGNATURE-----

--Sig_/WKjc7kGA0//_OfO+296aCAq--
