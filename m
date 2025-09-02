Return-Path: <linux-next+bounces-8167-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EA7B3F84C
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 10:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94EEF3B9CB2
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 08:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC5E2E613A;
	Tue,  2 Sep 2025 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QGTqW+Xw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBF72E7BAE
	for <linux-next@vger.kernel.org>; Tue,  2 Sep 2025 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756801592; cv=none; b=pl6rBaFUXBwN9pMiejCOGQQc3JJdvT4upPe6CDD+PyPCt5NqbTDKhSezuIVwD0gilif7uK3rxCH0ERGTWhkBv80g27D8WJDoz9zrY7fk1PB2UNRO+UQP21b5n7UTvTPYMsNIPTLm5XaGXgJK6hnWReIfV2/Bhxj/o5pC50OiQhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756801592; c=relaxed/simple;
	bh=ZwZkRDRn4rz3wkJpIZUI1IgJv7gY+/wtrD1n5S5kpaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkGkKH1OGV8ZglKs/3IEYm0ZcCABjRkIdPH1OuPyy4gS4w3Q9tkgsP6A11XAG1QSumaBIHLXN8E9yW7dQ4xIO/GavlQxi5cGGowCOVfsX0M1ObHjwGV4A6/zzsRVhb6Rbsi/fWCGeWe0z+F/6UUXZH0x9jCgmaIw6KPDbd1Ow98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QGTqW+Xw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E24A94E40C6E;
	Tue,  2 Sep 2025 08:26:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B999B60695;
	Tue,  2 Sep 2025 08:26:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30A0E1C22C67B;
	Tue,  2 Sep 2025 10:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756801582; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=owuss31FMQiAGL9Sv/EXoIDlww8b8CltCk/V02/g1oI=;
	b=QGTqW+Xwz7K/WhnCr7cZTXR9pfk00ThUbN6kVWB7nXBG7msn9szzALSojiOc2J+oT+W9t9
	C4+bBQvJGNZLUtL0JQyNwG56j/M5Nd9gaDJoj6MkTcJ35O0qxnhnHV6rFZR2izjhEpBpiM
	rnveEr3p6S3cSSqoK4pmpj7HianNqYitY37AwP+mXxJbYen6mpHSnLt6gCZvhXybBOzEgB
	yhrsDcBupUoDqDA044Ls3rTUxz50OCH7fLJdVAS9nJ8aw+v2T9xXh+zmoXcCArCh8NlHOS
	NwALCg5VKIsmgo1g6dLaP6x3QFJGZhk8w5XXVNLHcPFQP3XgFxMIWNcgngZrhw==
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
Subject: [PATCH 2/2] mtd: concat: Fix Kconfig typos
Date: Tue,  2 Sep 2025 10:25:39 +0200
Message-ID: <20250902082539.126099-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902082539.126099-1-miquel.raynal@bootlin.com>
References: <20250902082539.126099-1-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Enhance the prompt a bit and fix two little typos in the Kconfig
description.

Fixes: fa47dc829519 ("mtd: Add driver for concatenating devices")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index bf63197ec38b..c095421c86a5 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -207,11 +207,11 @@ config MTD_PARTITIONED_MASTER
 	  what lies behind the master.
 
 config MTD_VIRT_CONCAT
-	tristate "Virtual concatenated MTD devices"
+	tristate "Virtually concatenate MTD devices"
 	default n
 	depends on MTD_PARTITIONED_MASTER
 	help
-	  The driver enables the creation of virtual MTD device by
+	  This driver enables the creation of virtual MTD devices by
 	  concatenating multiple physical MTD devices into a single
 	  entity. This allows for the creation of partitions larger than
 	  the individual physical chips, extending across chip boundaries.
-- 
2.51.0


