Return-Path: <linux-next+bounces-9582-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D37CFFC24
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 20:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4039A33BB7C8
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 18:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A07435BDB3;
	Wed,  7 Jan 2026 18:26:55 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779EE35A94E;
	Wed,  7 Jan 2026 18:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810414; cv=none; b=tBIOVsGFfOB8r0YGfTPpaCfPafGOsXvfSpNLNgEkTqq5BqQoMMtidUI78ZBnE/QuOX7F5X1A16bUleN5KSB9ciynqFs4Uyq+Yv57vomZI06xLm63f0MqgIb9Y11tcBx4SSRlvkmN9/0vtdPSMjukIdlmO+ppVnmpi6LTYiIJpe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810414; c=relaxed/simple;
	bh=/bGRPjNcj+2MkJ94ED+Qip/2QDPLPn5+jQvVqTwdF/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a69HyVlfsKFO/ipBVteS9OjVR3C7bGJ3i3cT4NG+UbFfq5JMzcMh8QNGNf0h5uFX7Voteb83L+RGq2UWGwX74PdZ0JDRwhS9eJeUBtVlcG+IhctWZlKx4QTcHgvwQagv0HpObuBm+lr5p7wWi4CUDjvrV3dFuZcfcIyZJPGjf5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from localhost.localdomain (unknown [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 0DD403F9B3;
	Wed,  7 Jan 2026 19:26:44 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Cc: Simon Richter <Simon.Richter@hogyros.de>,
	"Usyskin, Alexander" <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 3/4] misc/mei: Allow building standalone for compile testing
Date: Thu,  8 Jan 2026 03:26:04 +0900
Message-ID: <20260107182615.488194-4-Simon.Richter@hogyros.de>
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

While this is not a particularly useful configuration, the MEI code should
compile even when no drivers for a GPU containing a management engine are
built.

Cc: Usyskin, Alexander <alexander.usyskin@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/misc/mei/Kconfig           | 4 ++--
 drivers/misc/mei/gsc_proxy/Kconfig | 2 +-
 drivers/misc/mei/hdcp/Kconfig      | 2 +-
 drivers/misc/mei/pxp/Kconfig       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index a62992909f85..5902dd1ee44b 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -49,7 +49,7 @@ config INTEL_MEI_TXE
 config INTEL_MEI_GSC
 	tristate "Intel MEI GSC embedded device"
 	depends on INTEL_MEI_ME
-	depends on DRM_I915!=n || DRM_XE!=n
+	depends on DRM_I915!=n || DRM_XE!=n || COMPILE_TEST
 	help
 	  Intel auxiliary driver for GSC devices embedded in Intel graphics devices.
 
@@ -84,7 +84,7 @@ config INTEL_MEI_VSC
 config INTEL_MEI_LB
 	tristate "Intel Late Binding (LB) support on ME Interface"
 	depends on INTEL_MEI_ME
-	depends on DRM_XE!=n
+	depends on DRM_XE!=n || COMPILE_TEST
 	help
 	  Enable support for Intel Late Binding (LB) via the MEI interface.
 
diff --git a/drivers/misc/mei/gsc_proxy/Kconfig b/drivers/misc/mei/gsc_proxy/Kconfig
index 30811117fc65..b80024c5189b 100644
--- a/drivers/misc/mei/gsc_proxy/Kconfig
+++ b/drivers/misc/mei/gsc_proxy/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_GSC_PROXY
 	tristate "Intel GSC Proxy services of ME Interface"
 	depends on INTEL_MEI_ME
-	depends on DRM_I915!=n
+	depends on DRM_I915!=n || COMPILE_TEST
 	help
          MEI Support for GSC Proxy Services on Intel platforms.
 
diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
index a9af4918e5b2..b9d5205c5b1a 100644
--- a/drivers/misc/mei/hdcp/Kconfig
+++ b/drivers/misc/mei/hdcp/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_HDCP
 	tristate "Intel HDCP2.2 services of ME Interface"
 	depends on INTEL_MEI_ME
-	depends on DRM_I915!=n || DRM_XE!=n
+	depends on DRM_I915!=n || DRM_XE!=n || COMPILE_TEST
 	help
 	  MEI Support for HDCP2.2 Services on Intel platforms.
 
diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
index d0f8bb6aa2de..2c5c00dc4b6f 100644
--- a/drivers/misc/mei/pxp/Kconfig
+++ b/drivers/misc/mei/pxp/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_PXP
 	tristate "Intel PXP services of ME Interface"
 	depends on INTEL_MEI_ME
-	depends on DRM_I915!=n || DRM_XE!=n
+	depends on DRM_I915!=n || DRM_XE!=n || COMPILE_TEST
 	help
 	  MEI Support for PXP Services on Intel platforms.
 
-- 
2.47.3


