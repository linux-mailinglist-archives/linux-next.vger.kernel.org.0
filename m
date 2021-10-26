Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEF743AC48
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 08:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhJZGaV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 02:30:21 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43767 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhJZGaV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 02:30:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdhhX1ygnz4xZ0;
        Tue, 26 Oct 2021 17:27:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635229677;
        bh=HwDgHWXjQV0/Tyx4uVSC1CdvJspLC+Oh95JxXXMZYyo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aqY6YMd93pKLIAXonEqrjMNuTWDMece2hGh5CX5J3uclyiPj3vaDMxATAnhKmXGqB
         LGOWaWJDVVJT6ILpr6SZokM0jN320Nzy0irVLIiJTFen5sHGxgvrkahWBwYeL5cxDL
         buzfcoDq57ugnqEqsFZT4rXxqj81f6T4xHXGAGb1EmQ5YfCeCA5uyB42yELKAvEYcB
         ikS22mNYx6/HXR+UDRjr1K2vCj56rFeM5A3TmwBEGwu7zHqtMompebk1Edu/+uVP3J
         kgGsxFwlP2iA6FxGIEL0X4sUlI0/ZD7V3+XIeaPDGsmgW+4uECsW7sa9yewd7ZD56p
         D0yOyPpiaUtDA==
Date:   Tue, 26 Oct 2021 17:27:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: linux-next: manual merge of the pinctrl tree with the mfd tree
Message-ID: <20211026172755.29208815@canb.auug.org.au>
In-Reply-To: <20211015170603.578fc6c2@canb.auug.org.au>
References: <20211015170603.578fc6c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q_7Vf3mme6eLxQ.HxPq.rnq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q_7Vf3mme6eLxQ.HxPq.rnq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 15 Oct 2021 17:06:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>

> Today's linux-next merge of the pinctrl tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/mfd/brcm,cru.yaml
>=20
> between commits:
>=20
>   de80ebd88b9e ("dt-bindings: mfd: brcm,cru: Add clkset syscon")
>   dcc24e936da2 ("dt-bindings: mfd: brcm,cru: Add USB 2.0 PHY")
>=20
> from the mfd tree and commit:
>=20
>   0398adaec341 ("Revert "dt-bindings: pinctrl: bcm4708-pinmux: rework bin=
ding to use syscon"")
>=20
> from the pinctrl tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc Documentation/devicetree/bindings/mfd/brcm,cru.yaml
> index 262284ae80f1,28ac60acf4ac..000000000000
> --- a/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
> +++ b/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
> @@@ -39,12 -36,9 +36,15 @@@ patternProperties
>     '^clock-controller@[a-f0-9]+$':
>       $ref: ../clock/brcm,iproc-clocks.yaml
>  =20
>  +  '^phy@[a-f0-9]+$':
>  +    $ref: ../phy/bcm-ns-usb2-phy.yaml
>  +
> +   '^pin-controller@[a-f0-9]+$':
> +     $ref: ../pinctrl/brcm,ns-pinmux.yaml
> +=20
>  +  '^syscon@[a-f0-9]+$':
>  +    $ref: syscon.yaml
>  +
>     '^thermal@[a-f0-9]+$':
>       $ref: ../thermal/brcm,ns-thermal.yaml
>  =20
> @@@ -80,23 -73,10 +80,24 @@@ examples
>                                    "iprocfast", "sata1", "sata2";
>           };
>  =20
>  +        phy@164 {
>  +            compatible =3D "brcm,ns-usb2-phy";
>  +            reg =3D <0x164 0x4>;
>  +            brcm,syscon-clkset =3D <&clkset>;
>  +            clocks =3D <&genpll BCM_NSP_GENPLL_USB_PHY_REF_CLK>;
>  +            clock-names =3D "phy-ref-clk";
>  +            #phy-cells =3D <0>;
>  +        };
>  +
>  +        clkset: syscon@180 {
>  +            compatible =3D "brcm,cru-clkset", "syscon";
>  +            reg =3D <0x180 0x4>;
>  +        };
>  +
> -         pinctrl {
> +         pin-controller@1c0 {
>               compatible =3D "brcm,bcm4708-pinmux";
> -             offset =3D <0x1c0>;
> +             reg =3D <0x1c0 0x24>;
> +             reg-names =3D "cru_gpio_control";
>           };
>  =20
>           thermal@2c0 {

This is now a conflict between the mfd tree and Linus Torvalds' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q_7Vf3mme6eLxQ.HxPq.rnq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3n+sACgkQAVBC80lX
0GxQUQgAh61lMKUQ/NHzxRS4RGD0jBnAsWUxudakzZIH9Wh7AATDldzygHl7ihxJ
Oyr3Xc9eubQjCZVWmahSsvCL+8pi8W4M2M0lahp//7NugNRkZOyrA8NAcj21ekfM
kbgZCiljAvnpQrxtLoIv6usJE/6Iq1yxRANGBatS2n6cyAsLOxjmQU0mryg35Pfr
3lJJddUuRZMv5fcvLZ9uKlZAZXOfqbUO+flBLzKtrQrzEn9tvRblJXuY8jUX90sa
XzG3laAAWeMpWgGWU6CGF4m4pjOnvq1XW5sjHdyE9cuIoVUqGJqXZJM0NTKYeStp
e3puGreHGPjTVbSnwHqNxFpvjaL2uA==
=Gakx
-----END PGP SIGNATURE-----

--Sig_/Q_7Vf3mme6eLxQ.HxPq.rnq--
