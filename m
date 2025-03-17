Return-Path: <linux-next+bounces-5843-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB48A66264
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 00:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 130A116FF4E
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 23:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36CA20468F;
	Mon, 17 Mar 2025 23:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="bIQ9ynzE"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97227376;
	Mon, 17 Mar 2025 23:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742252852; cv=none; b=C8fnTwutRIwjN2aLExmfF7n0Q1+ESWyh0AjurEKGXw8gDmAv0q+etGd9nL/7oTJ1t9CY9ffRuBBQ/AeTg9dNAXCQspL3oBl9LPJsc/YdFhN7V8s/e6b0DMkJoiCPbbUq3h6wgoFFopGSfiMTTWGYsXBbBlotL2HkEMZpxIhfB2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742252852; c=relaxed/simple;
	bh=z9R9hc0v3ovkgjVlV/L1Byzo1B5CW8zgtYacgZBV1nM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mq9oUxPCHozdFHIcgF4nzEp/hPMVV38UGKfWXgIAAUAC6w/6WzUL/mlWUW8Xv3mFxxXPJglbaRu/wxWT+pqUGsGsQY7eVTLcSwSwpWM5qwcDz7IVlnFPpXgICvPrcX2yjy4dbm+DRaaMpBREq2fKJDKQx66GhA5KqJot3nmp0Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=bIQ9ynzE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=nmukJGEcFv9r/hN8K3jj6fx3Zft2B1RO5TKA4ICgHAU=; b=bIQ9ynzE2K9UrrP3fcqe2KqcGh
	91/ngfyX2g+k9cxa5GOcQPrppAalXXZE9huISMNPCVnFwu/WuwtOkwC+iKiF7mJWb+MXhOYOpWVOf
	GIXgy0izXRNlxtC1y4HZhMV52mnCw9HTtVh3PtQbEQIfdeuiPyCBSa5QsZhYtnF56ssVWiiu2hU+P
	0xRseFW9Su+t+cluilyZ/VyQxgnaqAxmJC1GKErRCcqR3Kl8IKH0SmVU15urwK826V8NmuDEEnbS2
	4CL/n3DSXeLm/gKiIaasL2PeY8uS3SRut4XayPS1K/L34MelxgcbjTGlP4gMD/ZILbysE3Cf24taG
	Kwlo/i2Q==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tuJYG-0001ae-JL; Tue, 18 Mar 2025 00:07:20 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: lee@kernel.org,
	sfr@canb.auug.org.au,
	linux-next@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible"
Date: Tue, 18 Mar 2025 00:07:05 +0100
Message-ID: <20250317230705.932808-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 19a634195c1abe498798b564cd6b81e6dd4533f7.

The dt-binding addition adds the compatible to a syscon (a mfd) and should
go through the mfd tree. And it did, and is part of the mfd tree for 6.15
as commit 7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register
compatible"), with all the correct Signed-off-by lines.

But of course having a commit present in two trees creates new problems.

So to prevent issues during the merge-window, revert the variant I
accidentially applied.

Fixes: 19a634195c1a ("dt-bindings: mfd: syscon: Add rk3528 QoS register compatible")
Closes: https://lore.kernel.org/lkml/20250317144507.0938757b@canb.auug.org.au/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
This removes the change from the Rockchip tree, so that only the one in the
mfd tree remains.

 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 2836e4793afc9..4d67ff26d4450 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -103,7 +103,6 @@ select:
           - rockchip,rk3288-qos
           - rockchip,rk3368-qos
           - rockchip,rk3399-qos
-          - rockchip,rk3528-qos
           - rockchip,rk3562-qos
           - rockchip,rk3568-qos
           - rockchip,rk3576-qos
@@ -203,7 +202,6 @@ properties:
           - rockchip,rk3288-qos
           - rockchip,rk3368-qos
           - rockchip,rk3399-qos
-          - rockchip,rk3528-qos
           - rockchip,rk3562-qos
           - rockchip,rk3568-qos
           - rockchip,rk3576-qos
-- 
2.47.2


