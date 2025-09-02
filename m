Return-Path: <linux-next+bounces-8166-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0686B3F84A
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 10:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F534189B1A5
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 08:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD81347C7;
	Tue,  2 Sep 2025 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CUc0iy5u"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F12E3376
	for <linux-next@vger.kernel.org>; Tue,  2 Sep 2025 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756801587; cv=none; b=f4FuCTUxxD2xqqpqAcL2Tutmv9IVjh4QYYdCNyV8PNQjZxrGyFWUtJc+4e7bIvQW2OgqAzqapDeW6SIYmIGWBSo+0bU+GIrbdt+OyPFKYeDjo/glZBXi8+9BMP/pTU5y3Tejld24Ac/4Xtvypi0N609JZaboo2JNEbIiM0fGxss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756801587; c=relaxed/simple;
	bh=nb7V0tsR3Qr0YM1MZMNH0+O9OjgpxX9v6LXASsDvpbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kzQ2usaBsnCP2RtCEPOe/0BSbTCUMRBVdncLWElvxr7COVVtUQ/9cI2zor1ifanuxtQriKuwqT/a4NG1iEaSxvTeqjRaLg0uBSE9sx/ngXQ5j6lSjtmQmv1Rb4scdJiVzS33uAeBDjMHQp8BF0FcI6rPtmYx8CTiBAoOkZuEeRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CUc0iy5u; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7062C8EC73;
	Tue,  2 Sep 2025 08:26:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A70D60695;
	Tue,  2 Sep 2025 08:26:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D29791C22C4CE;
	Tue,  2 Sep 2025 10:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756801575; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=kej/Dvuj8F6ZW/XZqCCMcwThaak/2iYLiscSHnSvxdA=;
	b=CUc0iy5u7iZ7fBtsYuY3oOpioKpQLRLTJea3OtNFgd9xKjEddXyRPK3psl0B/lXkzv4+bK
	c4uWlUNrHkrrx0V/bNQmEpTiV0MadXPwX2oGZoKRL8QNV2Ia5/HEK2JsB+k05ZN/YdYctE
	RRtYKHb3g+uWDjF/CBvdSxSinJriuaHfvR7SRnTHtCfnWKjcdU3L54zYQkM1Ro8vz0dGXO
	f+S11mvxtWBK4jsPYjSFlyi6Z7akcBrDfAZ/3Q64oazi8lzr5S1EryxMvQd6rEVrFsrvxx
	iMhcROAxhDjmajCwQMHk/kNCnthDc67ReL5Zoj5h0KMtL+F+GV0eV33U8yA3qg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Mahapatra@web.codeaurora.org,
	Amit Kumar <amit.kumar-mahapatra@amd.com>,
	linux-next@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] mtd: concat: Set virtual concatenation to tristate
Date: Tue,  2 Sep 2025 10:25:38 +0200
Message-ID: <20250902082539.126099-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

There is a circular dependency where the MTD core calls a function from
this driver and this driver calls a function from the MTD
core (add/del_mtd_device()).

One solution could have been to extend mtd-y with this Kconfig symbol,
but at the same time there is not reason to force =y on this driver, so
just turn it into a tristate which solves the situation.

As a consequence, we also need to export to modules the two helpers
mentioned above.

Fixes: fa47dc829519 ("mtd: Add driver for concatenating devices")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/IA0PR12MB76998C672B82567715227485DC06A@IA0PR12MB7699.namprd12.prod.outlook.com/
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/Kconfig   | 2 +-
 drivers/mtd/mtdcore.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index b91c3026ac7c..bf63197ec38b 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -207,7 +207,7 @@ config MTD_PARTITIONED_MASTER
 	  what lies behind the master.
 
 config MTD_VIRT_CONCAT
-	bool "Virtual concatenated MTD devices"
+	tristate "Virtual concatenated MTD devices"
 	default n
 	depends on MTD_PARTITIONED_MASTER
 	help
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e98aaa15eac2..a786353d5367 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -849,6 +849,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	mutex_unlock(&mtd_table_mutex);
 	return error;
 }
+EXPORT_SYMBOL_GPL(add_mtd_device);
 
 /**
  *	del_mtd_device - unregister an MTD device
@@ -884,6 +885,7 @@ int del_mtd_device(struct mtd_info *mtd)
 	mutex_unlock(&mtd_table_mutex);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(del_mtd_device);
 
 /*
  * Set a few defaults based on the parent devices, if not provided by the
-- 
2.51.0


