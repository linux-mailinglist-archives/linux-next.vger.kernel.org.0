Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A971D1BC0
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 00:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731155AbfJIW3B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Oct 2019 18:29:01 -0400
Received: from ozlabs.org ([203.11.71.1]:35525 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731134AbfJIW3B (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Oct 2019 18:29:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46pTQf5Hygz9sCJ;
        Thu, 10 Oct 2019 09:28:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570660138;
        bh=U7amNAqXaEFVDkVi/kudiYCikX+L8b1+UcbwxDjtYI0=;
        h=Date:From:To:Cc:Subject:From;
        b=SVVHfaabizcruACky9fX2ctnPRzZk4+fE8aQWOUl7ehdBhXBxJGZtTNndgpumz6M7
         X2UyB++tQGTfLeqoXstFUO9gMsQJyF4wJTgZ1NR0su4EDXUjIGqudYJ9dKcgJYjbjL
         f/Y4izcyu1MgsFmruGOIT1lH6rPRO3xuX14fGNdkUTqC4CyroJl9UVKuVhbRhdvyQ1
         HJM8nFu3+/4E6PTQ0uMngQjA/7dy2/1MYUm1946RyN+j6JIX5BYQcgnTiY7zHXJkKW
         RU2dEdOQS6XojLZr8ujNzpOGIqZL4NZPBVSoAyM3UESGzDIdy2NmzsIE1/Ai3lKy3T
         mNEt73Phfti4A==
Date:   Thu, 10 Oct 2019 09:28:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Keerthy <j-keerthy@ti.com>, Olof Johansson <olof@lixom.net>
Subject: linux-next: manual merge of the samsung-krzk tree with Linus' tree
Message-ID: <20191010092843.3c38fa36@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4rmbBEC=jXOMl7Wooy8K1.D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4rmbBEC=jXOMl7Wooy8K1.D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the samsung-krzk tree got a conflict in:

  arch/arm/configs/multi_v7_defconfig

between commit:

  a304c0a60252 ("arm64/ARM: configs: Change CONFIG_REMOTEPROC from m to y")

from Linus' tree and commit:

  00265bee1002 ("ARM: multi_v7_defconfig: Enable options for boards with Ex=
ynos SoC")

from the samsung-krzk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/configs/multi_v7_defconfig
index e4c8def9a0a5,9711c61bd76e..000000000000
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@@ -933,7 -943,8 +943,8 @@@ CONFIG_BCM2835_MBOX=3D
  CONFIG_ROCKCHIP_IOMMU=3Dy
  CONFIG_TEGRA_IOMMU_GART=3Dy
  CONFIG_TEGRA_IOMMU_SMMU=3Dy
+ CONFIG_EXYNOS_IOMMU=3Dy
 -CONFIG_REMOTEPROC=3Dm
 +CONFIG_REMOTEPROC=3Dy
  CONFIG_ST_REMOTEPROC=3Dm
  CONFIG_RPMSG_VIRTIO=3Dm
  CONFIG_ASPEED_LPC_CTRL=3Dm

--Sig_/4rmbBEC=jXOMl7Wooy8K1.D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2eXxsACgkQAVBC80lX
0Gw4yAf9FelTMg2BDjMr7wGI0IqtNBbbBwGMYFJmfI6yNAh57I3fM9O2ZyaC2MbU
PWORzrYopkbM0vASImocXAhwRBfjhFxS/EtG85QWCUF5tk2gS9NdAHkEwG8aI9pr
DndOWt+zACCNz3MhOGl1K4yYrvsq/GjICnVZgqLI0mvFK82K8a5gvjktqA+sMfY5
ylhlY+42Qm8YoQFRm8UZqKNfPKIU00DI1TcNVsGVw0nn7d31pLyRoDAxzg/2mTIl
SfDHV8JpRugvukK7EUOm6YYPX+LIRv4ubEjK9ky2arbcgV9rEHKjlWikf5MWxd4Q
LIpgfbbNIxuSSV1Q7c4CHbkkpY5hNg==
=ypwT
-----END PGP SIGNATURE-----

--Sig_/4rmbBEC=jXOMl7Wooy8K1.D--
