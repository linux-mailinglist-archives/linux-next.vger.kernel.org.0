Return-Path: <linux-next+bounces-4487-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B66E9B3015
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 13:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 207781F2147D
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 12:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6271F1D966A;
	Mon, 28 Oct 2024 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L2OYBALM"
X-Original-To: linux-next@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874CD1D8E16;
	Mon, 28 Oct 2024 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730118259; cv=none; b=D698LqGQgkAhOQ95taUkfHf+68r8V1meL2A1DQ8VOtQ4j2ed3pBOe0rIjw6byRX3rxsIo2DP3swVPw7AEz5tknHMDk0y+AOB7a38qUMbL/2Cjgj2xLXQge1J2s5xX2I6k870cak8dGk92Y0LuYLbscW/f2upMLN5qF6Ll5nmToY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730118259; c=relaxed/simple;
	bh=1QQFXIFtYXCd/IDNHUvV2OQeN9upSO4tLfSsgRJYoYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHIR96waK2XeqPAwdX2FWw11tFsSBj89CVcxhBpfocuWtusMM/VzFGL2RPCwadxzHzQk8H1E19KgAuL1052Tr1LFt75j2nwZoQ05GsCfI9fzHK0sghuOZ2vELhTIY7L1QalD23xDecMLcb/h8CileB1XnCycgz//+sj6MX06bu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L2OYBALM; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 27CD4FF802;
	Mon, 28 Oct 2024 12:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730118254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sc8SZsyupK2o8wIqwHXOLpJ1B9KuxF5WMhr5Nm6KHq0=;
	b=L2OYBALMRomPTAX4iyyzLqstg130bjFfRkIzLTxBrC0Y8USWUUy1d+13Z+6oyQ51RkWVfT
	qdz7rMuZVEosKo+dhL1pmifbP2qqu2nxvHFTvhJAcOfWDLr0D5v9CeVncXdBUKmzAUiGcV
	945No4ndsR1sfb2VKWnRUph2QAmuyy18FyTgQ17yMNL2zpFzOI+B/Ea7CRyBCZDecwHk9k
	vmQxjZ/iTrP0NPgztM0SU9fCfxVM2J32DFOWVQnB8aSXBbljuM0FSCUd/khbHKfw0Beech
	zfPL6ONXinZW1CcT258PA1t9IEPNGwcCdLXCQ9g3ZJcEuyj5p5Ozk7hrsjb6PQ==
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
Subject: [PATCH 1/2] misc: lan966x_pci: Fix dtc warns 'missing or empty reg/ranges property'
Date: Mon, 28 Oct 2024 13:24:02 +0100
Message-ID: <20241028122405.27090-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241028122405.27090-1-herve.codina@bootlin.com>
References: <20241028122405.27090-1-herve.codina@bootlin.com>
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
index 7282687df25f..5466d013da7d 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -19,6 +19,24 @@ __overlay__ {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
+			cpu_clk: cpu_clk {
+				compatible = "fixed-clock";
+				#clock-cells = <0>;
+				clock-frequency = <600000000>;  // CPU clock = 600MHz
+			};
+
+			ddr_clk: ddr_clk {
+				compatible = "fixed-clock";
+				#clock-cells = <0>;
+				clock-frequency = <30000000>;  // Fabric clock = 30MHz
+			};
+
+			sys_clk: sys_clk {
+				compatible = "fixed-clock";
+				#clock-cells = <0>;
+				clock-frequency = <15625000>;  // System clock = 15.625MHz
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


