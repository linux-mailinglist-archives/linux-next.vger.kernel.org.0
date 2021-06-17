Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810A83AAA73
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 06:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhFQEqA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 00:46:00 -0400
Received: from ozlabs.org ([203.11.71.1]:33285 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229495AbhFQEqA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 00:46:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G58Zs498Pz9sW6;
        Thu, 17 Jun 2021 14:43:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623905031;
        bh=YYZQRTaEz+8GiSnTFk9Nc8Rsg78+vdZcMemhOChNeBA=;
        h=Date:From:To:Cc:Subject:From;
        b=KBhDBqcg+IGpXAhHRn87yNWvpZOJ5M9mvOSerBFkzb3begNXASKK4C8qtduyp2mXw
         sXOs1p/uk7z6zx1BTTUvLJm0QVF/70MBDEjJTeBbxZNFOZnLl636bolBqEUnbP6/K0
         VyDbAJMoHGEo1KVhv6wS4smzM80UxYIiugOBaZ8TtanI1c4uDQbFIVux41/qoIMPOl
         ONDMdobyk1A/Uo9psTL1JhqdZIua0tfFRceKKMDlEcVVA7Y4nRYUYOEoHi93z77fkz
         w7SdpdOkdnIIRGKsylNyOiSNWXBUSbVA2MxyJyYrdtTtCVZ9AT0R5bVkU/Ke/e+hup
         JcAkZXLG5s83g==
Date:   Thu, 17 Jun 2021 14:43:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: linux-next: manual merge of the usb tree with the arm-soc tree
Message-ID: <20210617144346.564be887@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Eo.BL+GwBgSHqa1w194kSj=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Eo.BL+GwBgSHqa1w194kSj=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got conflicts in:

  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts

between commit:

  39441f73d91a ("arm64: dts: qcom: sc7180: lazor: Simplify disabling of cha=
rger thermal zone")

from the arm-soc tree and commit:

  1da8116eb0c5 ("arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard US=
B hub")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index 30e3e769d2b4,bae85f6b2bfa..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
@@@ -14,17 -14,15 +14,6 @@@
  	compatible =3D "google,lazor-rev0", "qcom,sc7180";
  };
 =20
- &pp3300_hub {
- 	/* pp3300_l7c is used to power the USB hub */
- 	/delete-property/regulator-always-on;
- 	/delete-property/regulator-boot-on;
- };
-=20
- &pp3300_l7c {
- 	regulator-always-on;
- 	regulator-boot-on;
 -/*
 - * Lazor is stuffed with a 47k NTC as charger thermistor which currently =
is
 - * not supported by the PM6150 ADC driver. Disable the charger thermal zo=
ne
 - * to avoid using bogus temperature values.
 - */
 -&charger_thermal {
 -	status =3D "disabled";
--};
--
  &sn65dsi86_out {
  	/*
  	 * Lane 0 was incorrectly mapped on the cable, but we've now decided
diff --cc arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index c2ef06367baf,343ed457efb2..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@@ -14,13 -14,20 +14,10 @@@
  	compatible =3D "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
  };
 =20
- &pp3300_hub {
- 	/* pp3300_l7c is used to power the USB hub */
- 	/delete-property/regulator-always-on;
- 	/delete-property/regulator-boot-on;
 -/*
 - * Lazor is stuffed with a 47k NTC as charger thermistor which currently =
is
 - * not supported by the PM6150 ADC driver. Disable the charger thermal zo=
ne
 - * to avoid using bogus temperature values.
 - */
 -&charger_thermal {
 -	status =3D "disabled";
 -};
 -
 -
+ &usb_hub_2_0 {
+ 	 vdd-supply =3D <&pp3300_l7c>;
  };
 =20
- &pp3300_l7c {
- 	regulator-always-on;
- 	regulator-boot-on;
+ &usb_hub_3_0 {
+ 	 vdd-supply =3D <&pp3300_l7c>;
  };

--Sig_/Eo.BL+GwBgSHqa1w194kSj=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDK0wIACgkQAVBC80lX
0GwW/Af/VIpOA7khWDE6TWFICkUJ+u7Q6zy+YUIqAbUfV5pnKfqrxygEq1MgNptw
yFn1bntEwK1a0TRSqBQ23OG6ViEjyL8Iley8YFD9tUZvy8LdgjvqLdG+hFte/rM5
dFsGUV1kzacfOKajUsZj5rfl56Sqg9Ljz6CbEjTUxROsZEWEPS5OsefKaHUKgbXQ
igaXFKFcG0dBXAKGIRW5dyCZLTMbYbRn2dGSR4rzteZ2V3onCtWLtCwF7DdYwS/U
GG85n/PFrrBrbOFHJaXC5gHykpDNWJfHFr8tNvvO9UM+8DUPP6rbhVWWKG1yVUmj
lDurFMy2owkeXi7sSCw817QVfDu7NQ==
=/dM6
-----END PGP SIGNATURE-----

--Sig_/Eo.BL+GwBgSHqa1w194kSj=--
