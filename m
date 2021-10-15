Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752F442E8AA
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 08:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhJOGIQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 02:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbhJOGIO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 02:08:14 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE39C061570;
        Thu, 14 Oct 2021 23:06:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVwkP4Qjmz4xbG;
        Fri, 15 Oct 2021 17:06:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634277966;
        bh=C/lwnmKVYy/YJ9L4WeHu7xurfv9bjXpdhz9atJAHzj8=;
        h=Date:From:To:Cc:Subject:From;
        b=Ta0xDG1UOTaE/tTIEIQlxPBraWfSG0jz4uJzzXiVB5nc2yvCYy9hGYqA8UXO6IRnL
         aG8hHwJ2dchydw6KtRF43lusPS3/K3xnevJJlFZIanc9vXhMBBRjBqntSGQrD3HBPw
         yK6snfjlxhuPjr5oFxOkcQX4Y5kjveaOI0N6HxvU2zCFbdfqqxWGdY3S0IIYGfhaXC
         pUVgqhmRwK+z6ZL35Fd+wP4M1C0POaAIGud1uGEmAFwMLU/jY4Q4/oq1DUlZuZUl/Z
         pNSpO39g+yD33e4+gguXtU2LqT1x3GYazusWeRArj3VI1syBrZZg8SY5mI7wrUlTMt
         MsejXScDauElg==
Date:   Fri, 15 Oct 2021 17:06:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: linux-next: manual merge of the pinctrl tree with the mfd tree
Message-ID: <20211015170603.578fc6c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tmDX/ruD3lcgUGZzv26SfHo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tmDX/ruD3lcgUGZzv26SfHo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  Documentation/devicetree/bindings/mfd/brcm,cru.yaml

between commits:

  de80ebd88b9e ("dt-bindings: mfd: brcm,cru: Add clkset syscon")
  dcc24e936da2 ("dt-bindings: mfd: brcm,cru: Add USB 2.0 PHY")

from the mfd tree and commit:

  0398adaec341 ("Revert "dt-bindings: pinctrl: bcm4708-pinmux: rework bindi=
ng to use syscon"")

from the pinctrl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/mfd/brcm,cru.yaml
index 262284ae80f1,28ac60acf4ac..000000000000
--- a/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
@@@ -39,12 -36,9 +36,15 @@@ patternProperties
    '^clock-controller@[a-f0-9]+$':
      $ref: ../clock/brcm,iproc-clocks.yaml
 =20
 +  '^phy@[a-f0-9]+$':
 +    $ref: ../phy/bcm-ns-usb2-phy.yaml
 +
+   '^pin-controller@[a-f0-9]+$':
+     $ref: ../pinctrl/brcm,ns-pinmux.yaml
+=20
 +  '^syscon@[a-f0-9]+$':
 +    $ref: syscon.yaml
 +
    '^thermal@[a-f0-9]+$':
      $ref: ../thermal/brcm,ns-thermal.yaml
 =20
@@@ -80,23 -73,10 +80,24 @@@ examples
                                   "iprocfast", "sata1", "sata2";
          };
 =20
 +        phy@164 {
 +            compatible =3D "brcm,ns-usb2-phy";
 +            reg =3D <0x164 0x4>;
 +            brcm,syscon-clkset =3D <&clkset>;
 +            clocks =3D <&genpll BCM_NSP_GENPLL_USB_PHY_REF_CLK>;
 +            clock-names =3D "phy-ref-clk";
 +            #phy-cells =3D <0>;
 +        };
 +
 +        clkset: syscon@180 {
 +            compatible =3D "brcm,cru-clkset", "syscon";
 +            reg =3D <0x180 0x4>;
 +        };
 +
-         pinctrl {
+         pin-controller@1c0 {
              compatible =3D "brcm,bcm4708-pinmux";
-             offset =3D <0x1c0>;
+             reg =3D <0x1c0 0x24>;
+             reg-names =3D "cru_gpio_control";
          };
 =20
          thermal@2c0 {

--Sig_/tmDX/ruD3lcgUGZzv26SfHo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpGksACgkQAVBC80lX
0GxatAgAm9YCUbfI84CU/uw0TAsNiOChcMEWJVdDDy/btL6qaDWDYX5iXwpGP6wf
wkEd3LAz1E9ZUTyP1OIVV9CCwWLLTxKX85oYlhXh4AGBzqGrxjyHveWpap6hH6mZ
lAv7G+F8PjZ/KHtIhQrJGenCUWx1zzIEAr3XiKtOblkoljVHjeh/xSBgPY0aHaGI
UMK8OLLNGsWDOpgk3v6g1slXBUbeqnmTA5JB1FG9En8A1A2uTvpCkV3wlBIsSDce
mHWtMShA+GcFYmDB7Nj3naQcwEO4vQauUIHyYuayekjQ6hNteYkySlXQ6HEqv2lS
T1EBZUX0cq/zEJaCrCT4gFnilroyUg==
=lm1a
-----END PGP SIGNATURE-----

--Sig_/tmDX/ruD3lcgUGZzv26SfHo--
