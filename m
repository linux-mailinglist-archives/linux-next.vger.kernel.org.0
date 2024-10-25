Return-Path: <linux-next+bounces-4443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A6C9B09A1
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 18:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633E71F214A9
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 16:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757E1188708;
	Fri, 25 Oct 2024 16:17:53 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9F070830
	for <linux-next@vger.kernel.org>; Fri, 25 Oct 2024 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729873073; cv=none; b=UVehsGlenkcl5E6aZaPRSAgn1NXiOcFTrkp84WOp7I/5QePTA0//7ssNrQ+NH4hmt++hMpEqMGQJa2htx68K8Ev5n079YfVNnadBlB82ll+qtpZRA55j48+R/E+sTLXKZHmAigZDji0cXyGbYKwQW55EtQFc0vvE/BPlktubdTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729873073; c=relaxed/simple;
	bh=XRWM9Q9oHyB0+6EdcuJj+cQIF/yPqjovpdPt+wCJ5Tk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cLNfeVsX9atMtOjkioMsZ+ZR+zoRGh+tlnwMOquykmIti64TE28TTW+dgPijKS4ooYX9ahtywk1SMIt8K9iqhXR4kEhFxcbqtxGLURuZYkD/mFo7Z5XbjV26tI+WGXW8ug9H+4i79aHGbqiJWmLNWyKSYbMgIzVfUA1mqnX8BDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4N0T-0000aN-5F; Fri, 25 Oct 2024 18:17:45 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] misc: Silence warning when building the LAN966x device tree overlay
Date: Fri, 25 Oct 2024 18:17:39 +0200
Message-Id: <20241025161739.3643796-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org

Silence the following warning when building the LAN966x device tree overlay:

drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property): /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org.au/
Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
The referenced commit is in the reset tree.
Changes in v2:
- Do not handle W=1 warnings.
- Link to v1: https://lore.kernel.org/all/20241025145353.1620806-1-p.zabel@pengutronix.de/
---
 drivers/misc/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 885b22989580..196fb730817e 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
 obj-$(CONFIG_MARVELL_CN10K_DPI)	+= mrvl_cn10k_dpi.o
 lan966x-pci-objs		:= lan966x_pci.o
+DTC_FLAGS_lan966x_pci		:= -Wno-interrupts_property
 lan966x-pci-objs		+= lan966x_pci.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
-- 
2.39.5


