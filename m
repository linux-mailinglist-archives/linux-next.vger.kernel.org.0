Return-Path: <linux-next+bounces-9580-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AACCFF9DA
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 20:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8F3D3194CF5
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 18:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF1435B123;
	Wed,  7 Jan 2026 18:26:51 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1020735B127;
	Wed,  7 Jan 2026 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810410; cv=none; b=JQK0jMDipUaJmBIFLA07XGhAs/WvfKyIn/pC4PTmw8iK7tpkKP+Cz/Yg0Oh/EQrMYYeIFJQ79c47ddIogGr2W8OSv7IGrceoGml8Vzjq8oi79hScMXeFEQNgZWwyJ2kUbRT5aXXxrWmF2Ov7rhGTqFzRgX7H6F1Ez95+AW3g9IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810410; c=relaxed/simple;
	bh=+eR5DNFAwCMIGhxJsGKIcXZLHsOkx4zZ61IWFuEcRJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VP10E8YwP0cUrrQYC6O/dJHCQ07jjvI5RJ0nzEgvMS3qs+UK1p+2FS3G+JZuJ0oo0bqfm4o5PhJJkJcf0opRwGqI/1XJozasl69+yXIfYmZkBrfTj08zjoMy39KKz+Nwr679pk2tYMHesL6HvBK+/r8VfxfROGq5VIX6hWXTztc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from localhost.localdomain (unknown [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id ACB4B3F984;
	Wed,  7 Jan 2026 19:26:40 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Cc: Simon Richter <Simon.Richter@hogyros.de>,
	"Usyskin, Alexander" <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/4] misc/mei: Allow building Intel ME interface on non-x86
Date: Thu,  8 Jan 2026 03:26:02 +0900
Message-ID: <20260107182615.488194-2-Simon.Richter@hogyros.de>
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

The xe driver supports dGPUs which can be plugged into non-x86 machines,
and exposes a MEI GSC interface, so this driver is no longer x86 only.

Cc: Usyskin, Alexander <alexander.usyskin@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/misc/mei/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index f4eb307cd35e..6da518f3b73c 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -2,7 +2,7 @@
 # Copyright (c) 2003-2019, Intel Corporation. All rights reserved.
 config INTEL_MEI
 	tristate "Intel Management Engine Interface"
-	depends on X86 && PCI
+	depends on PCI
 	default X86_64 || MATOM
 	help
 	  The Intel Management Engine (Intel ME) provides Manageability,
-- 
2.47.3


