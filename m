Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6988C479
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 00:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfHMWuI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 18:50:08 -0400
Received: from ozlabs.org ([203.11.71.1]:48515 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbfHMWuI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 18:50:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 467SbJ15qjz9sBF;
        Wed, 14 Aug 2019 08:50:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565736605;
        bh=z8UzHeUAlWaGfTsCQDaIbFrumXsCw0qF+4m8oeFkVbs=;
        h=Date:From:To:Cc:Subject:From;
        b=ez7AmR8IXa7fZfwsYlUqNBZ63TWJtOdyy5sD4t3Bwq3fsw9liQocwP4SWhHJ39VnF
         GkMgcywBrlpl3Np4PL0PSj732LTQFyiS4oFjGqeaN1IU/lheS63uh1JiSejOlzRtGU
         ZxqIuChuWG4lFOiZnUCPnhMAdBi8CW6j7hSXCmN68Y2P43wGI1ynla6rlkzOK8kdTK
         Io+wQhaXC4NXVTmke5FnT8GtsLPB/2ktaCx3Rjs0Whv7FoJZgppVFl/GONgBA/k5CY
         mJr2ngkHEkH4Zc+qbv6Yiv8v27PZV2WWsLftDXsmKN2XX93EqDuUotfO2ZqyLdZhAM
         DfUOtlSE7qMqg==
Date:   Wed, 14 Aug 2019 08:49:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm-soc tree
Message-ID: <20190814084949.70867809@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JMaBuXtewfH4O4vb9TMker2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JMaBuXtewfH4O4vb9TMker2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/Kconfig:720: syntax error
arch/arm/Kconfig:719: invalid statement
arch/arm/Kconfig:720: can't open file "arch/arm/mach-ks8695/Kconfig"

Caused by commit

  eb4f78f8b8cb ("ARM: remove ks8695 platform")

I applied the following patch for today

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 Aug 2019 08:46:39 +1000
Subject: [PATCH] arm-soc: fix up bad rebase?

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1597c542dc4f..769a853c8c6e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -716,12 +716,6 @@ source "arch/arm/mach-ixp4xx/Kconfig"
=20
 source "arch/arm/mach-keystone/Kconfig"
=20
-<<<<<<< HEAD
-source "arch/arm/mach-ks8695/Kconfig"
-=3D=3D=3D=3D=3D=3D=3D
-source "arch/arm/mach-lpc32xx/Kconfig"
->>>>>>> ARM: remove ks8695 platform
-
 source "arch/arm/mach-mediatek/Kconfig"
=20
 source "arch/arm/mach-meson/Kconfig"
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/JMaBuXtewfH4O4vb9TMker2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1TPo0ACgkQAVBC80lX
0GzT3Af/T+r4U6O/x8ljEwRM9bk6+lXhY/23ZKJfdTWGjmPAVblYXDwJV1TyY6qZ
eZtVOYC65rFZfY0tMGhnMaLUqdlsYfyOtaBWFAUh7bQIxBqnG+g7pczQlZ17kFwC
DobBEBnQoF1jO5wKgENxm18U1FJ7NFVijwQBZTqwr3A6MwpwF9xI0G06zpHSWJFh
g9U/CSUJLBNNqCg2tk6veogR89jQfblVZTFyTlUjkHUY/dfVuq8XvPVsniuArzUf
9lBXf6pM3F4tlUGH/kO3XiBdLdcUb8ULCbIWUSWBRh/39hPW45eskV8zfJRoWqKT
BXtjihCCiaClzY8kZonTTqetaUOSTw==
=4xXI
-----END PGP SIGNATURE-----

--Sig_/JMaBuXtewfH4O4vb9TMker2--
