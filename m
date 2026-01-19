Return-Path: <linux-next+bounces-9700-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E59D3AEA4
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0846630056E3
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 15:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5107E36164A;
	Mon, 19 Jan 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAAp24qQ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73B339857;
	Mon, 19 Jan 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835697; cv=none; b=gGF8Bm+fG2yFZncizgcilixuiMMPpa+v+ifriAv8/TXdgPGEQXUENeSy/52fxlLt8jx38UHxl4wfq4xavREQ99GNExejmfZ2NFrsRZp34/SQqlUIJVcrDz2oxmcXoa6LAPDdGAKBSQyhKlC0MrZfQzQl7+OiGGAyGdqAqLKMNOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835697; c=relaxed/simple;
	bh=A7Zfxc+qW6Yu/Am58sC5ef7oIFVZy420omyar72MKSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oI8jKIXZTbtVA7KMJRZkyqEDtXYVdAdGzzrNITnvQbEfzBmMk9RF9KBlKd0oLs/mF6dhwWIyS3KnYWIm2CWpIptbiI8CCNvc8asoeQajPkdNOIfdhsv6tM4CIGdbI8zaP3hzc5yWTbdq33BSHCeQFcG9xhkj8Ql6iI5Mu/zj6hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAAp24qQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1181C19424;
	Mon, 19 Jan 2026 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835697;
	bh=A7Zfxc+qW6Yu/Am58sC5ef7oIFVZy420omyar72MKSs=;
	h=Date:From:To:Cc:Subject:From;
	b=gAAp24qQ9hbZsk4TPslJDs4Jr1YieqO8VW9ZWxygfsqynwbtsYw5WXMZnIPTVa5Rx
	 PNuG83kGeVL/XogAMupXJDxS46J4z+2dVsDkIRRiDHur+nCFDdD7GS3Dwu4kHddas8
	 ybspQYt7cdiEcelTCgChqp6mJktNqJ/Hq0/oiEI3SQ97/r54UUo/fOK3EScqsWzO6X
	 i5kMk2KDrxX+9h5UymXcP6zCxAOC4uQZDK2fUaUKWezYewfTzSLpnrMZ+XE4RMGxU2
	 iMN2gyBxVheyf0i0naB3S7ZJwB9lWA/v9CX393hBziliXtZblxr9okGQQDBMFUAvoj
	 lf5tjJifKGp0Q==
Date: Mon, 19 Jan 2026 15:14:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Nishanth Menon <nm@ti.com>
Subject: linux-next: manual merge of the xilinx tree with the ti tree
Message-ID: <aW5KbYimWKx7obE9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the xilinx tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  f69f88211c84d ("arm64: defconfig: Enable the J721E PCI host driver")

from the ti tree and commit:

  41de0de8033e7 ("arm64: defconfig: Enable missing AMD/Xilinx drivers")

from the xilinx tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/configs/defconfig
index c46c678c8f6c2,cdb7d69e3b248..0000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -233,10 -231,12 +233,14 @@@ CONFIG_PCIE_MEDIATEK_GEN3=
  CONFIG_PCI_TEGRA=y
  CONFIG_PCIE_RCAR_HOST=y
  CONFIG_PCIE_RCAR_EP=y
 +CONFIG_PCIE_RENESAS_RZG3S_HOST=y
  CONFIG_PCIE_ROCKCHIP_HOST=m
  CONFIG_PCI_XGENE=y
 +CONFIG_PCI_J721E_HOST=m
+ CONFIG_PCIE_XILINX=y
+ CONFIG_PCIE_XILINX_DMA_PL=y
+ CONFIG_PCIE_XILINX_NWL=y
+ CONFIG_PCIE_XILINX_CPM=y
  CONFIG_PCI_IMX6_HOST=y
  CONFIG_PCI_LAYERSCAPE=y
  CONFIG_PCI_HISI=y
@@@ -608,11 -609,11 +618,13 @@@ CONFIG_SPI_STM32_OSPI=
  CONFIG_SPI_SUN6I=y
  CONFIG_SPI_TEGRA210_QUAD=m
  CONFIG_SPI_TEGRA114=m
+ CONFIG_SPI_XILINX=m
+ CONFIG_SPI_ZYNQMP_GQSPI=m
  CONFIG_SPI_SPIDEV=m
  CONFIG_SPMI=y
 +CONFIG_SPMI_APPLE=m
  CONFIG_SPMI_MTK_PMIF=m
 +CONFIG_PINCTRL_APPLE_GPIO=m
  CONFIG_PINCTRL_BRCMSTB=y
  CONFIG_PINCTRL_BCM2712=y
  CONFIG_PINCTRL_DA9062=m

