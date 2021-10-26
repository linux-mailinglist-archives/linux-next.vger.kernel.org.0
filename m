Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9407443B247
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 14:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbhJZMXf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 08:23:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:42860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234335AbhJZMXe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 08:23:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33BBF60F70;
        Tue, 26 Oct 2021 12:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635250869;
        bh=PcyvQMT8fHJfrCoKuiwPsh4wwqtfBSFdlI1J2BiJH5g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t+2vnFu9JpghR7boOMytyMgKiZFQtOqm7076h9X+mcJSwVIGx70S4P9SOrc6pjDjs
         Mic3FEBmnHvreTcsLe+W9vTfCd5OHXPaJdWVzEYsYpEIcqpN6BGwOydcNBIVQK09Eh
         1HhDHGugkHZefmmRo9U/8r+txcvGeo9yOzpD1dEDTqMc610ByE5IzO2lDuR8AWuvYz
         crCMxYs6exKW4JnzuMKSNYkb1i32/W20jVi3tnsTvksSCypoulYsW2JSxRZKy7vSns
         1QQOnEAqahqGcKki4F2naOZQEbksHTbfaXib+Zzbg1FY5Lt6aUl3ftIdiJSm/8UI9/
         Yw1XzKyc1fQBg==
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] lib/bootconfig: Fix the xbc_get_info kerneldoc
Date:   Tue, 26 Oct 2021 21:21:07 +0900
Message-Id: <163525086738.676803.15352231787913236933.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026103553.46c956db@canb.auug.org.au>
References: <20211026103553.46c956db@canb.auug.org.au>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fix the kernel doc of xbc_get_info() to add '@' to the parameters.

Fixes: e306220cb7b7 ("bootconfig: Add xbc_get_info() for the node information")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 lib/bootconfig.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index 3276675b25e1..a10ab25f6fcc 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -67,8 +67,8 @@ static inline void xbc_free_mem(void *addr, size_t size)
 #endif
 /**
  * xbc_get_info() - Get the information of loaded boot config
- * node_size: A pointer to store the number of nodes.
- * data_size: A pointer to store the size of bootconfig data.
+ * @node_size: A pointer to store the number of nodes.
+ * @data_size: A pointer to store the size of bootconfig data.
  *
  * Get the number of used nodes in @node_size if it is not NULL,
  * and the size of bootconfig data in @data_size if it is not NULL.

