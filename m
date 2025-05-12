Return-Path: <linux-next+bounces-6698-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447CAB3533
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 12:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35DAB19E0560
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 10:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8312673B6;
	Mon, 12 May 2025 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="o40QAMDo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D030C187872;
	Mon, 12 May 2025 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047064; cv=none; b=BBDOISzqtcE0jdEYW5rYj52ZSSbTbyRDpnJZhAp2QuB63baqVo9Td5y/epSEFVHdzErZertLDblIXFPDuYg2l6FhDjGBCLljOd05W1bTr5gVa0eU1r9h0BvQkbozHt9mDxUr1dhLY/Jxz0fHdXoPaddK6yhvLAE5auVnVV7jOk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047064; c=relaxed/simple;
	bh=whXViowazCv3XNQMOBg/4y9TH5sxVqnaZFvLc/zIBCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=doaNP3+TtJ2AjOhK9axFq/P3uWrHNgYnFcH+IsDO9mYFNIr/vsKdi/mXPZFEyq7zm2LTnjK+1Vj/BAT7T+hJvKqoNS9CzlWxJAnsJmVxL32QIxiq7om/MluAfI1Pqkg7XZLKuOD5tVz3CV57Q7YjUyJXD8YzwkG9WW51LGAUQiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=o40QAMDo; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id F18252FC0048;
	Mon, 12 May 2025 12:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1747047057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xdzJZTR7Eri9frKJzWyUkw4fuzFEd8BsiAy07C/RCOk=;
	b=o40QAMDonSpQN+MLbo+tW5AJbf2tKZaEDJDWJlIjJaOTX7DO4G417cJs5so5YqjMNXVFWv
	Iiycl2jrBNkBW2kYs0FFGr+1Zz4sIWkgXJkKOz8QZBeNyhqLdpygDor4PBZi8LKwBEK1Fa
	Vs/vgEv+QNp96K9jfwPp3zlBVHVAKwc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: rdunlap@infradead.org,
	sfr@canb.auug.org.au,
	linux-next@vger.kernel.org,
	W_Armin@gmx.de,
	Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/tuxedo: Prevent invalid Kconfig state
Date: Mon, 12 May 2025 12:50:10 +0200
Message-ID: <20250512105028.25265-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was possible to create a uncompileable config, because of missing
"Depends on" statements in the new Kconfig of the TUXEDO platform driver.

For reference:
https://lore.kernel.org/all/a1d9134f-0567-4a53-a1e7-a55cd6b189a9@infradead.org/

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/tuxedo/nbxx/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/tuxedo/nbxx/Kconfig b/drivers/platform/x86/tuxedo/nbxx/Kconfig
index 1701374a039d2..9eecbe8127df7 100644
--- a/drivers/platform/x86/tuxedo/nbxx/Kconfig
+++ b/drivers/platform/x86/tuxedo/nbxx/Kconfig
@@ -7,6 +7,8 @@
 
 config TUXEDO_NBXX_ACPI_TUXI
 	tristate "TUXEDO NBxx ACPI TUXI Platform Driver"
+	depends on ACPI_WMI
+	depends on HID
 	help
 	  This driver implements the ACPI TUXI device found on some TUXEDO
 	  notebooks. This enables the control of built-in fans via HWMON.
-- 
2.43.0


