Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A798306D55
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 07:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhA1GEY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jan 2021 01:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbhA1GEV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Jan 2021 01:04:21 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9F9C061756;
        Wed, 27 Jan 2021 22:03:41 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DR8zT16k5z9sCD;
        Thu, 28 Jan 2021 17:03:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611813817;
        bh=JaUncBF/71yCM2cUZVv1OMD7g2Tr5z/tA6Ku1wEyQ/E=;
        h=Date:From:To:Cc:Subject:From;
        b=bnJHfCG+/Pvd2eHiBvcZGhvG8Zt1AIekwiBwlK9MAJVY7DkGBE7wkL37GWotSWHVM
         FGqTczb3WgzZH3Rh6ojVRfdG4hIkoVl8n2U1g01OavrluvZFcvE5S9Y6j1PIT/+XvV
         reCXqYPjnmFc3XXvoB+EvVCzjhkZ/qRbWvm/ngK2s/GCl/LNKIlXz4P0p7Vq7xt/E9
         FMIrbwSlLgx7prJR+ljjZAqngIHgKCPvudXlvz1dkg+a1cZS1tWN2jYkyg3fMzQ0jT
         7flOEtTey4cahNit/ufgCAVStmeSYt0NdvHI9dnT3RhoFNkEpX0PBVs9K0OtCvd8sz
         VQu7PdyN8PeIQ==
Date:   Thu, 28 Jan 2021 17:03:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: linux-next: manual merge of the gpio-brgl tree with the arm-soc
 tree
Message-ID: <20210128170331.4f2ac87b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MVycaLEgYb5eMOse.wqg9Yv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MVycaLEgYb5eMOse.wqg9Yv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts

between commit:

  4fd18fc38757 ("arm64: dts: visconti: Add watchdog support for TMPV7708 So=
C")

from the arm-soc tree and commit:

  08bc3941b6a4 ("arm: dts: visconti: Add DT support for Toshiba Visconti5 G=
PIO driver")

from the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
index 37da418393e0,950010a290f0..000000000000
--- a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
@@@ -42,7 -42,6 +42,11 @@@
  	clock-names =3D "apb_pclk";
  };
 =20
 +&wdt {
 +	status =3D "okay";
 +	clocks =3D <&wdt_clk>;
 +};
++
+ &gpio {
+ 	status =3D "okay";
+ };

--Sig_/MVycaLEgYb5eMOse.wqg9Yv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmASU7MACgkQAVBC80lX
0GyHRgf+PxzTZwdzbhhLHVFIuTL/GAZZelHBnqy5oZ/Le/41mQmFOaHG6VDubIOv
E61/MqfdonL237Uki3sTUrWMMa1SCxzDO5dsazJeO/zEBIltwac0WCZm2TV+USSw
59Cfqfv3vm97e/gMCNsUnS8YDE0Mq2PHutiGMkka/jnH+/3VMTnBVtyUJFXuiUva
rGGX89OhITXGUSDAahzIocFDVF4IwvYdY5f3HsXO+LDTxtGHvw4i8pgLCupbQP/R
Xc3tmObyawj1cEYl5zFzkRtbz77NzpuLJnVPvNmep2DlYeMIQmKdUZeZfNld9ue/
HETv5oief/ny2A9ttxIKWjf07FydMQ==
=ksyq
-----END PGP SIGNATURE-----

--Sig_/MVycaLEgYb5eMOse.wqg9Yv--
