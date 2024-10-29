Return-Path: <linux-next+bounces-4520-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D99B4480
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 09:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A23DB222B5
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 08:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4669820403D;
	Tue, 29 Oct 2024 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D2lLN4XA"
X-Original-To: linux-next@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAF8204010;
	Tue, 29 Oct 2024 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730191429; cv=none; b=aGceawhvVSZOfr0qWlRXe1uz1ze+GjYioHNwjdO6TphjpaTuktixCiFFz6k/5QxL74G6SLYdLlS1mcx5Rzmndl4OpMRbwEhuwrMcJopZClmrMD/R5pjW3vL2Otyfz2ytR44BOiqknJlfsIW66hUhCo7AI05663HSTAMh49yDfPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730191429; c=relaxed/simple;
	bh=HMcBWFfujWBix5ITgC7z0CppRyqxsoeqQ5rZJujM0Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFAlUSUCvPho8udbRpem7/PqRHVjJMDMtFhREkJcbIFam0+Jv6rVeSPttoZxDomtuivI9BZt1YV5NDrrNSOCDabRMZEIAdsh4PK0y9uxJhYjafqTXG9xvWAW3qg6bGAkDy6mL8XnokrCi8rL8GNzKl1dBI5Jhapyl2pfCw0BSvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D2lLN4XA; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id CF05A24000E;
	Tue, 29 Oct 2024 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730191425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEwLQTEOeLx41I6eLhkhYWSRhXIhGZLm/T+Wzn00paw=;
	b=D2lLN4XA84Rvs2AUkW45UW5cjKfvyjYwmN0ZWi5zF0lhl+l4xcFQxmpzrk1zO85L5oXVUd
	wWQcdS7hLNG4bC06yw1tmw45tQDyD6m0WHx+fCp0mfCgJLWC6/yHTCXwczrupF0+NUsGq8
	+4076/8TFOF6k5SE7OTqlFE7t2CBIAvKCXo1Q6q+StcUVJTG2dtdho/OZJWkSvZPMP5F7g
	afIMmlNv5/ZkxRrvMeqaigpNnntv3bh71zZLbBdPV3Dveq0uf2n29lnlXrJBpqF5lllQSz
	JsCr/g+i20ICzNAH3HRRYmNGPCy7ugD6IhnoPy0Ut321vZqQ+ELNIDKUIed+vA==
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
Subject: [PATCH v2 2/2] misc: lan966x_pci: Fix dtc warn 'Missing interrupt-parent'
Date: Tue, 29 Oct 2024 09:43:36 +0100
Message-ID: <20241029084338.194942-3-herve.codina@bootlin.com>
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

dtc generates the following warning when building the LAN966x devicetree
overlay (lan966x_pci.dtso):
  Warning (interrupts_property): /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent

The oic interrupt parent is the PCI device itself. The PCI device node
is the node on which the dtbo will be applied and this node already has
properties needed.

In order to remove the warning, add the missing properties in the
overlay fragment node. Properties in this node will not be added when
the overlay is applied (which is what we expect) but makes dtc happy.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org.au/
Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
The referenced commit is in the reset tree
---
 drivers/misc/lan966x_pci.dtso | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index e9b304c6ced3..7b196b0a0eb6 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -15,6 +15,16 @@
 / {
 	fragment@0 {
 		target-path = "";
+
+		/*
+		 * These properties allow to avoid a dtc warnings.
+		 * The real interrupt controller is the PCI device itself. It
+		 * is the node on which the device tree overlay will be applied.
+		 * This node has those properties.
+		 */
+		#interrupt-cells = <1>;
+		interrupt-controller;
+
 		__overlay__ {
 			#address-cells = <3>;
 			#size-cells = <2>;
-- 
2.46.2


