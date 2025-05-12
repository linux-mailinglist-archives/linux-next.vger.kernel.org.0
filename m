Return-Path: <linux-next+bounces-6702-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA6AB37E6
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 14:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B05CC3B55BD
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 12:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096DB293B6D;
	Mon, 12 May 2025 12:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ULb2b1Gb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EABA293B40;
	Mon, 12 May 2025 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054501; cv=none; b=HO+tOqJPwZ1sxMoULrW8jbxi7/3XocnbsR9dql6hRyDnhajMP2NXUIdSLLVf3DQxKQtA/SOzJzBkzpiw13Rs5OmeO39GUx0wR1IGpGCh+hkYWIWlDangbNH9V8XcDRnJLp4MN+/34t3Pjf33Sqi000xpbrhoxVGDqY/a1LfR6/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054501; c=relaxed/simple;
	bh=DAHAC7+cSS89asssiM8NMoB8wPBdb24VsZMMRhGsp2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hKusq9mRqgTaqqoCbRE8uvwfuGwbyVN3ej0na0hGsifuKLn4ndj4XmP8DzRW6MEHNxx5f4gL9o2DIjYNHYBxNLfT2bwaik7YQ/dd0s1yCyL2G9HXREw9oxXQ8GqW6f0iYf49ynKYki+T4omlWhaIre+mOdCPVYZHMpw4Vpw0Rb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ULb2b1Gb; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 04FCE2FC0059;
	Mon, 12 May 2025 14:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1747054494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MgQsyycv4ZImZTEg7/Y0AKPIQxZdhZfZk1U9Bevxy10=;
	b=ULb2b1GbnwoN4CR6jHksvLgeuDPMy+tyv0zRlF72qvnR2JX5nR0B1l9Hzp4cuxk1Nv9o1o
	UTsM00zYyDdK6CrEFOG7lHP3FWqfbRUApOvbrKJ2M7dR/1AGvvA0pGjJPC19HwK/kaLFaT
	s+SGMp/5XQtJ2xq9b1VmwIqvckBFxjQ=
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
Subject: [PATCH v2] platform/x86/tuxedo: Prevent invalid Kconfig state
Date: Mon, 12 May 2025 14:54:32 +0200
Message-ID: <20250512125450.31072-1-wse@tuxedocomputers.com>
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

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/all/a1d9134f-0567-4a53-a1e7-a55cd6b189a9@infradead.org/
---
 drivers/platform/x86/tuxedo/nb04/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/tuxedo/nb04/Kconfig b/drivers/platform/x86/tuxedo/nb04/Kconfig
index 411c46c9a1cf0..9e7a9f9230d1c 100644
--- a/drivers/platform/x86/tuxedo/nb04/Kconfig
+++ b/drivers/platform/x86/tuxedo/nb04/Kconfig
@@ -7,6 +7,8 @@
 
 config TUXEDO_NB04_WMI_AB
 	tristate "TUXEDO NB04 WMI AB Platform Driver"
+	depends on ACPI_WMI
+	depends on HID
 	help
 	  This driver implements the WMI AB device found on TUXEDO notebooks
 	  with board vendor NB04. This enables keyboard backlight control via a
-- 
2.43.0


