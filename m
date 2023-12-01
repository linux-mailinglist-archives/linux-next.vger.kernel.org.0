Return-Path: <linux-next+bounces-185-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C329801295
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 19:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8B72281470
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 18:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533D84F5EC;
	Fri,  1 Dec 2023 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C4tDQY8E"
X-Original-To: linux-next@vger.kernel.org
X-Greylist: delayed 577 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Dec 2023 10:25:43 PST
Received: from relay.smtp-ext.broadcom.com (saphodev.broadcom.com [192.19.144.205])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA11F9A
	for <linux-next@vger.kernel.org>; Fri,  1 Dec 2023 10:25:43 -0800 (PST)
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A6970C0000D4;
	Fri,  1 Dec 2023 10:16:05 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A6970C0000D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1701454565;
	bh=oOit/4rL2wvddJb+2fxKmDWbNk0f7jYnHz9/Hr/bK+c=;
	h=From:To:Subject:Date:From;
	b=C4tDQY8EKcPwDOkiiufmRVq8/AV+fmjWbbxXz9rWjYHsRquZSCpJtqNOXCJpwi7gO
	 /LztMBDdDSpGUScW6K3X0vre14j350zSWmAK2+ukeBiZrMV67+1Jtmx/PwuKpUy0LZ
	 GX+49kybcRVrRovdTPAh0ufSlwFx07Hbr/K6F+/8=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.75.138.105])
	by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id 6C42F18728D;
	Fri,  1 Dec 2023 10:16:05 -0800 (PST)
From: dregan <dregan@broadcom.com>
To: dregan <dregan@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 1/1] mtd: rawnand: Add deassert_wp comment
Date: Fri,  1 Dec 2023 10:15:42 -0800
Message-Id: <20231201181542.421077-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Boris Brezillon <bbrezillon@kernel.org>

Add deassert_wp description comment

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: David Regan <dregan@broadcom.com>
---
 include/linux/mtd/rawnand.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index fcad94aa0515..3049b05d8a20 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1001,6 +1001,8 @@ struct nand_op_parser {
 /**
  * struct nand_operation - NAND operation descriptor
  * @cs: the CS line to select for this NAND operation
+ * @deassert_wp: set to true when the operation requires the WP pin to be
+ *		 de-asserted (ERASE, PROG, ...)
  * @instrs: array of instructions to execute
  * @ninstrs: length of the @instrs array
  *
-- 
2.37.3


