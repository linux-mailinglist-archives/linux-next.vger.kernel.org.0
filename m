Return-Path: <linux-next+bounces-189-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 233E0801560
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 22:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF80E1F20FE6
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 21:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CAE59157;
	Fri,  1 Dec 2023 21:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="mfy+ovjX"
X-Original-To: linux-next@vger.kernel.org
X-Greylist: delayed 344 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Dec 2023 13:30:37 PST
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp09.broadcom.com [192.19.166.228])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B16210DB
	for <linux-next@vger.kernel.org>; Fri,  1 Dec 2023 13:30:37 -0800 (PST)
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1F4DFC0026F7;
	Fri,  1 Dec 2023 13:24:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1F4DFC0026F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1701465893;
	bh=vrVkTfIsWsT8Eahag1TdS0Wt98iSbiCsHD0P4PcYheg=;
	h=From:To:Subject:Date:From;
	b=mfy+ovjXTbcYsnjF66uv7gotQKR7IeIFXWg/HwaDebtRzMYRl1lnXxxBPBje7HyOE
	 5zLANU4AhEk2UeCoRsHkASAjSzGDWVtv0vKzGPu5VY1ebpHkR5uwGVujV62kLXBrGP
	 RptI+77X8FoexGaX4hndVzSFkXMfTNSoMeohJxbk=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.75.138.105])
	by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id 0F1F318728D;
	Fri,  1 Dec 2023 13:24:53 -0800 (PST)
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
Subject: [PATCH v2 1/1] mtd: rawnand: Add deassert_wp comment
Date: Fri,  1 Dec 2023 13:24:46 -0800
Message-Id: <20231201212446.189491-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Regan <dregan@broadcom.com>

Add deassert_wp description comment

Signed-off-by: David Regan <dregan@broadcom.com>
---
Changes in v2: removed Boris Brezillon as author and SOB
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


