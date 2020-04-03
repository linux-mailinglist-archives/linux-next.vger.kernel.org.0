Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BADE19E102
	for <lists+linux-next@lfdr.de>; Sat,  4 Apr 2020 00:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgDCWTW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 18:19:22 -0400
Received: from ozlabs.org ([203.11.71.1]:49457 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727842AbgDCWTW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Apr 2020 18:19:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48vDqn6z3dz9sQt;
        Sat,  4 Apr 2020 09:19:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585952360;
        bh=bpnSIVGUOGvlQ9OKsv+LUvTdUTlg77hbCbEp5DBwlR8=;
        h=Date:From:To:Cc:Subject:From;
        b=Qm3sw3WX2RavWZVqPkTzX5jlmdH0ayRN/4oCLm4hYhXHwIRkLTxkJN9WcN+36F3RB
         RxVZTo2rlow9DyadwjR8FrYnQzfKq4mOh8FtWNagfSdEExpIRfosYxYByl0U2aScIm
         euyLhIxJQfjoGhbfA/uAGPeHe960FgIujUP5N4767YOJgobjokjhmDWZoarZnG5bGD
         iUt2Uv0vL7yBfSaVckkruXaxC6zeM61L/iwXyUNhleEW8bHkNehqFXOXG3pR4UCulS
         jFPP9f+prbgdY7bbaVHln+bXYHu5ovuAxoMAiXAVByaNsKF5lhJWBorpAyIk0vuWrV
         bxp5tKnDic0gA==
Date:   Sat, 4 Apr 2020 09:19:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warnings in Linus' tree
Message-ID: <20200404091916.6f00a24d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N15WC4V=V+Xcj.TK9WcaFkn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/N15WC4V=V+Xcj.TK9WcaFkn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build of Linus' tree (arm multi_v7_defconfig) produced
these warnings:

arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)
arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /s=
oc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells =
(2) differs from /soc (1)

I have no idea what caused this :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/N15WC4V=V+Xcj.TK9WcaFkn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6HtmQACgkQAVBC80lX
0GyuEAf+JJuWfL67B12foXMFHBP2YTF96Tm6mFz46aVbbspK90yGzunYyiHnBx2a
bzFvKKvY5xiFauxbZUCmkwWl9v++SgfG+5dulRYf2NbyRfy+T07uYBAUkS7K4Yri
iscP8oZhcBgosoyfWJf8liKFexZRHAk+1Fp93inMNxqmKTUiN7WoFX8egacCi7H+
KdeB1kewDVbe8VIWQBRXFHIa10gW3PbGJBY68vmEhTgXKzB/acs18ZYGMStyVM3j
BoNZqU2VAgggvdZaDJJPOL+QCdxA44XGwsQZhntJBG2oInY7wN+zume1ZWiyWcQ3
IzFzZoO1mT7kygOqHD5ttJrUTAXOoQ==
=TqoX
-----END PGP SIGNATURE-----

--Sig_/N15WC4V=V+Xcj.TK9WcaFkn--
