Return-Path: <linux-next+bounces-9583-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 088C8CFF9CD
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 20:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C8DC33B5A0A
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 18:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D1135C184;
	Wed,  7 Jan 2026 18:26:57 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8B35B13F;
	Wed,  7 Jan 2026 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810416; cv=none; b=bhgKh9dYIF/l2jAgLkX3/FB5xgH2EEMrH6+N23I/SAm5RcuRnMzsu0ag+D1TaIMReTuPl2Zp25/N42ff7GD8Csp1pHDR5J3DJqQWSf/wksoTMcZG4fULjU9gJwlQTIWeiD0Cks6JLkctN5rdmpbVBp76KbotBihcr4EOhOKrFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810416; c=relaxed/simple;
	bh=qxCddJs6VFrJE4PQolecJMOvvT4YHafsISGSeJkS1jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTlXcWfmq7+y7hE3J02PXy9d2YN9d4zLA3O+neS9ZDjms9SyApHsfZTyiP49pYXCqPIAFz+pg8sx76v0vrzdBYU6UIepEgBwdgX11F+xyUOqqFrM3b6BUXO5W2CVjc7A6ALFUIFT71NS5NANhaFKqaURJmOrIQsIeS4QdMWqg6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from localhost.localdomain (unknown [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 38A1349027;
	Wed,  7 Jan 2026 19:26:46 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Cc: Simon Richter <Simon.Richter@hogyros.de>,
	"Usyskin, Alexander" <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 4/4] misc/mei: gsc_proxy: add dependency on Xe driver
Date: Thu,  8 Jan 2026 03:26:05 +0900
Message-ID: <20260107182615.488194-5-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107182615.488194-1-Simon.Richter@hogyros.de>
References: <20260107174646.GA1230850@psionic12.psi5.com>
 <20260107182615.488194-1-Simon.Richter@hogyros.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver is useful if at least one DRM driver registers an auxiliary device
for the ME interface. With the addition of Xe, this is no longer just i915.

Cc: Usyskin, Alexander <alexander.usyskin@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/misc/mei/gsc_proxy/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/gsc_proxy/Kconfig b/drivers/misc/mei/gsc_proxy/Kconfig
index b80024c5189b..bd8f955f548e 100644
--- a/drivers/misc/mei/gsc_proxy/Kconfig
+++ b/drivers/misc/mei/gsc_proxy/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_GSC_PROXY
 	tristate "Intel GSC Proxy services of ME Interface"
 	depends on INTEL_MEI_ME
-	depends on DRM_I915!=n || COMPILE_TEST
+	depends on DRM_I915!=n || DRM_XE!=n || COMPILE_TEST
 	help
          MEI Support for GSC Proxy Services on Intel platforms.
 
-- 
2.47.3


