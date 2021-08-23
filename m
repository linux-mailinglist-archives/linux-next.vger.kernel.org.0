Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195303F53C3
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 01:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbhHWXtu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 19:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233093AbhHWXtu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 19:49:50 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50C1C061575;
        Mon, 23 Aug 2021 16:49:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtpqL1QmBz9sXV;
        Tue, 24 Aug 2021 09:49:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629762543;
        bh=TrsJgQa9hwO4ggw8pgCHQBL4dYbbuKchT5MLHj8hJIU=;
        h=Date:From:To:Cc:Subject:From;
        b=jYzj6tmI9OZ4+0JgutoBvOFSqG7S1JmI/VJQW6oLB+Cd5qH5tDIKLg4NUGK4XtVBl
         qRf+k/8SukRvery57QIRkQf0SOsht6YdpA8EDkuCozZBiJ1iznPGkrDAlkOhBc4BUe
         qPjmRGXFxd7BB3DzUHazLUS5R1HgH26H0kr5MlsRqbNtvKDEC58qzOLoFZgSq3J2ae
         xjEZiwRWZ1XsLeqLQQBlNxpaOHPHOZBpeOaLQ0rScRwOG/FSyRWxYa0tNrROSeQytV
         /4BMzsnu4/abF74nNPXf860flruC6nKPDGkUabiXLNFto0YHvkVqxXXL3+qZkHi8Fo
         6OEblMnBneP6w==
Date:   Tue, 24 Aug 2021 09:49:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Konstantin Porotchkin <kostap@marvell.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the arm-soc tree with the arm-soc-fixes
 tree
Message-ID: <20210824094901.57a3ab0c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VipmKIGCrEvxuIB0B0kpfH2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VipmKIGCrEvxuIB0B0kpfH2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm64/boot/dts/marvell/cn9130-db.dts

between commit:

  054bc6a105d7 ("arm/arm64: dts: Fix remaining dtc 'unit_address_format' wa=
rnings")

from the arm-soc-fixes tree and commit:

  4c43a41e5b8c ("arm64: dts: cn913x: add device trees for topology B boards=
")

from the arm-soc tree.

I fixed it up (used this file from the latter and applied the following
merge resolution patch) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 24 Aug 2021 09:44:25 +1000
Subject: [PATCH] arm64: dts: cn913x: fixup for ("arm/arm64: dts: Fix remain=
ing dtc 'unit_address_format' warnings"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot/d=
ts/marvell/cn9130-db.dtsi
index 2cd4bb09e8ff..c00b69b88bd2 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
@@ -25,7 +25,7 @@ aliases {
 		spi2 =3D &cp0_spi1;
 	};
=20
-	memory@00000000 {
+	memory@0 {
 		device_type =3D "memory";
 		reg =3D <0x0 0x0 0x0 0x80000000>;
 	};
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/VipmKIGCrEvxuIB0B0kpfH2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkM+0ACgkQAVBC80lX
0GxnXgf/WhBhVb/t7TUBIz/fCyFdpqoAamfZaGeMuOHthj+G7W5w+sMcCCZHa4AO
uMiZLvkiw2h8sa1uUe4rJbjFGiHC0+36RrgDZZGpzRK3DGI3oX5Ugi+Et5A7/EdQ
YOuDCGWDzqtTJT7dw0izJBEDtOClbsrvTRlcO2knYuA2QiQxU9A9/qIepaP0Ud9U
uZSI9vrh6Wjxc2NqFUb8gHQi9jwXH4OtkMCTfAyWT6vjgnyZbG5a1U9NsMJUT7rm
kE9c52jcAmw9J1nzOzDhPxjwFfNN+MVibzxKXgTtYN91Qh/c7fbaW09lB6xRVD/z
mZ7OF8ytajIl/qvw0gO+a53ayWcT9A==
=XzVW
-----END PGP SIGNATURE-----

--Sig_/VipmKIGCrEvxuIB0B0kpfH2--
