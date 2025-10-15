Return-Path: <linux-next+bounces-8595-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A8BDE072
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 12:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D624811DD
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 10:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECBA2FC00E;
	Wed, 15 Oct 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mz10zjp4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0203D2E8B86;
	Wed, 15 Oct 2025 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524432; cv=none; b=T4gHSTRrhTOt4w7zbPf+nHXF5wvcF1EdDc7un5WHJk6f+s8ll5E6FYzGv99mHh07221BYtQzslDbiuuhfc3cl0o6TGZ0FEnLBt5uSt8GsS8eSpHrCPEsW8ztSiBwo5JSy7Ri2OTvYFW67xqydKXM2n9ZvT4mhJN9WN67Iymu+vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524432; c=relaxed/simple;
	bh=Ydl4pPrb39e/xb1/s3m4UAS3TNFS3uJ2Pw4AKpH6K1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OzePi/0kpSP14XaaQgPy7SkInCnf12069kx8ANw5pJvoHes/zZSN7Fn7yeimEvvyQieXoOrv5mf/IC/p4eCzEJKCrzaGO84xJ9RSG0YEw7NPE2GNAXX/oRr2vPztjK4xKsgxDgv6IaavuWLsyB5r8DDeUKPNQJQHF3xArEUPYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mz10zjp4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049A3C4CEF8;
	Wed, 15 Oct 2025 10:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760524431;
	bh=Ydl4pPrb39e/xb1/s3m4UAS3TNFS3uJ2Pw4AKpH6K1k=;
	h=Date:From:To:Cc:Subject:From;
	b=Mz10zjp4yxPrQeLtBVUpLhGr1wbAXLOJT9+5pzTx5RqHWjAypW8C4y7gHiUpduL+F
	 vp3lkzgXYsV6xCq60vZQzNYFzX/JhVAS58bRjzvp6r1NrE9V7x+jI8F5Trg7IRxBS9
	 cWpG/1p6PjauUiYVWCyEx0b6qkxeeH//EyEDCPwC5CNIUCAE9TL6HnjSQtzhVFfTqj
	 qOYIC7Z8gb5Gh/xth0fJWKv6aQdqPjt65RmsKwb7z6IPtNOLiJ+n40IVao2Ok+anGb
	 DjMNQTiWRuT8R1w1FthCsWrlNYoVcySSmlTZ7gM4zXE+vTgp73Pw+/UFzfFfMq26iz
	 lcauyMMwvUbhA==
Date: Wed, 15 Oct 2025 11:33:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jan Kara <jack@suse.cz>, Keguang Zhang <keguang.zhang@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: linux-next: manual merge of the ext4 tree with the origin tree
Message-ID: <aO94i74VYW6Q9S4T@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oIE0lsMSGkDP1FOH"
Content-Disposition: inline


--oIE0lsMSGkDP1FOH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext4 tree got conflicts in:

  arch/mips/configs/loongson1_defconfig
  arch/mips/configs/loongson1c_defconfig

between commit:

  ad79935dbc227 ("MIPS: configs: Consolidate Loongson1 defconfigs")

=66rom the origin tree and commit:

  acf943e9768ec ("ext4: fix checks for orphan inodes")

=66rom the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/mips/configs/loongson1_defconfig
index 81acae6f61c8b,a64a394479638..0000000000000
--- a/arch/mips/configs/loongson1_defconfig
+++ b/arch/mips/configs/loongson1_defconfig
@@@ -138,20 -86,17 +138,24 @@@ CONFIG_NEW_LEDS=3D
  CONFIG_LEDS_CLASS=3Dy
  CONFIG_LEDS_GPIO=3Dy
  CONFIG_LEDS_TRIGGERS=3Dy
 +CONFIG_LEDS_TRIGGER_MTD=3Dy
  CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
  CONFIG_RTC_CLASS=3Dy
 -CONFIG_RTC_DRV_LOONGSON1=3Dy
 +# CONFIG_RTC_NVMEM is not set
 +CONFIG_RTC_DRV_LOONGSON=3Dy
 +CONFIG_DMADEVICES=3Dy
 +CONFIG_LOONGSON1_APB_DMA=3Dy
 +# CONFIG_VIRTIO_MENU is not set
 +# CONFIG_VHOST_MENU is not set
 +# CONFIG_MIPS_PLATFORM_DEVICES is not set
  # CONFIG_IOMMU_SUPPORT is not set
- # CONFIG_NVMEM is not set
+ CONFIG_EXT2_FS=3Dy
+ CONFIG_EXT2_FS_XATTR=3Dy
+ CONFIG_EXT2_FS_POSIX_ACL=3Dy
+ CONFIG_EXT2_FS_SECURITY=3Dy
  CONFIG_EXT4_FS=3Dy
  CONFIG_EXT4_FS_POSIX_ACL=3Dy
+ CONFIG_EXT4_FS_SECURITY=3Dy
  # CONFIG_DNOTIFY is not set
  CONFIG_VFAT_FS=3Dy
  CONFIG_PROC_KCORE=3Dy

--oIE0lsMSGkDP1FOH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjveIoACgkQJNaLcl1U
h9C/BwgAhJHx2vHjWgbMtKVy8ujsTmygLVEs9062OZGTcYSXhhiLdzA2tJPxQkPq
LdTWR5Gc6h66nDG4wj4N6EOS19ljuulMwupmsfdzCzslZlA0HenM3XfPkPkvJpSj
CbYagvPdiZt00I1gMyXSIf83K9DyQI2FY3vVfdbwf6C+krMiivQqiNIdxu89CDYW
kaPisOGNe4PhTPxwXBtwDTNKEjaA+KwfejSlq5vlXJ6B6gJsytHna2pB4lo4KLUg
jS8cDcUEDHC7gygSrMGhftOQeqiPMUNRDPa/Rju0Q4FfRW7kAaPQYuYIW4I3cLIk
xfM0tdhqQRxh93h+qKEpAewlGTcXJA==
=r6ii
-----END PGP SIGNATURE-----

--oIE0lsMSGkDP1FOH--

