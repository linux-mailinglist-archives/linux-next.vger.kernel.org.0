Return-Path: <linux-next+bounces-4519-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BFC9B447E
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 09:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19A441C223C0
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 08:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE7220402B;
	Tue, 29 Oct 2024 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EOrml9Ge"
X-Original-To: linux-next@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1142038D5;
	Tue, 29 Oct 2024 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730191428; cv=none; b=MRYwE0UTyt/wrHtOMvHSQ913R6d6t9oR6Nvg/7vjx/ACk/vKruI+83HeVQifuyNYV/cy3DUPzCJkiMLoM3Ce7rlnf5Es61vsvhsSOGET22x6yMe8ktGx8R/1w/dHs+9nsGZAvDX7TsVBRGS1Wl9Zlrhrv7DaYevMc4im9Aaz8Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730191428; c=relaxed/simple;
	bh=2NPTcLzosjlG2WPk5zm2GqcFUGGwRN1nqa58VDYz+p4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDsA4wuS5LOeYNV/FrD6+7iOik26vsuFaIhHPKiplyjJ9Gw3MCsOznlJp9GHwt4knDk7C7u+Sms5AChV3Fisd/M0+mPINVCNSqjQ0M5Fw5ngiHqHempxc023vtm2yzVRRjubfksAgrjAdmSvSQ6w8yE8GqXsB9yZb1XxyN3XlKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EOrml9Ge; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 5737B240007;
	Tue, 29 Oct 2024 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730191424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SF2CF/mYzu+f+El79p7kcj4eITCPHgWzeq/9zQhGDbI=;
	b=EOrml9GeqClhFgrerplkL+YSEHChSF9HUZU5TnrOEk/2nBffFq1BSGicFRVBVhDtP7d7HX
	j0GsExMQmGHNb8yLz7vSlaFFqDhmsTSOm4ywDTxEAtzKkKR0Qs0bQmCBQ0rl6BdtnMNAk8
	oAYr/HGDuWBz+u2c4a7RaKJFVIqPfzu/m/5YzL4EqayN5ziQqHVc8H7uPB1ES2nqfM6yy3
	rjsjtgwZYw8F1I943+37ptWzmOH/3pcz3jNsAy2+tVYRATGCqqsjCCqDXAkaPpoanW8IdW
	7ZF75NKlUX6cbGAwkKZm3DYjuVuO4ckjRbxSpsrcDvi1k8XidGGQY/9en+hEeA==
From: Herve Codina <herve.codina@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 1/2] misc: lan966x_pci: Fix dtc warns 'missing or empty reg/ranges property'
Date: Tue, 29 Oct 2024 09:43:35 +0100
Message-ID: <20241029084338.194942-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241029084338.194942-1-herve.codina@bootlin.com>
References: <20241029084338.194942-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

dtc generates the following warnings when building the LAN966x device
tree overlay (lan966x_pci.dtso):
  Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/cpu_clk: missing or empty reg/ranges property
  Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/ddr_clk: missing or empty reg/ranges property
  Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/sys_clk: missing or empty reg/ranges property

Indeed, related nodes are under the pci-ep-bus (simple-bus) which is not
correct.

Put them outside this node.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org.au/
Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
The referenced commit is in the reset tree
---
 drivers/misc/lan966x_pci.dtso | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 7282687df25f..e9b304c6ced3 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -19,6 +19,24 @@ __overlay__ {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
+			cpu_clk: clock-600000000 {
+				compatible = "fixed-clock";
+				#clock-cells = <0>;
+				clock-frequency = <600000000>;  /* CPU clock = 600MHz */
+			};
+
+			ddr_clk: clock-30000000 {
+				compatible = "fixed-clock";
+				#clock-cells = <0>;
+				clock-frequency = <30000000>;  /* Fabric clock = 30MHz */
+			};
+
+			sys_clk: clock-15625000 {
+				compatible = "fixed-clock";
+				#clock-cells = <0>;
+				clock-frequency = <15625000>;  /* System clock = 15.625MHz */
+			};
+
 			pci-ep-bus@0 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
@@ -39,24 +57,6 @@ oic: oic@e00c0120 {
 					reg = <0xe00c0120 0x190>;
 				};
 
-				cpu_clk: cpu_clk {
-					compatible = "fixed-clock";
-					#clock-cells = <0>;
-					clock-frequency = <600000000>;  // CPU clock = 600MHz
-				};
-
-				ddr_clk: ddr_clk {
-					compatible = "fixed-clock";
-					#clock-cells = <0>;
-					clock-frequency = <30000000>;  // Fabric clock = 30MHz
-				};
-
-				sys_clk: sys_clk {
-					compatible = "fixed-clock";
-					#clock-cells = <0>;
-					clock-frequency = <15625000>;  // System clock = 15.625MHz
-				};
-
 				cpu_ctrl: syscon@e00c0000 {
 					compatible = "microchip,lan966x-cpu-syscon", "syscon";
 					reg = <0xe00c0000 0xa8>;
-- 
2.46.2


