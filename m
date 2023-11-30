Return-Path: <linux-next+bounces-144-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7E7FED72
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 12:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55C6DB2116C
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 11:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525A12BAF5;
	Thu, 30 Nov 2023 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-next@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2080B10D9
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 03:01:28 -0800 (PST)
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SgtSp3pQzz1P91J;
	Thu, 30 Nov 2023 18:57:46 +0800 (CST)
Received: from huawei.com (10.67.174.93) by kwepemm000004.china.huawei.com
 (7.193.23.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 Nov
 2023 19:01:25 +0800
From: Wenyu Huang <huangwenyu5@huawei.com>
To: <pmladek@suse.com>, <rostedt@goodmis.org>
CC: <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
	<senozhatsky@chromium.org>, <akpm@linux-foundation.org>,
	<linux-next@vger.kernel.org>, <gustavoars@kernel.org>
Subject: [PATCH next] Fix the build failed caused by -Wstringop-overflow
Date: Thu, 30 Nov 2023 10:57:41 +0000
Message-ID: <20231130105741.2849670-1-huangwenyu5@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000004.china.huawei.com (7.193.23.18)
X-CFilter-Loop: Reflected

gcc version: gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0

I use this version of gcc to compile, and the compilation fails. It said
that "error: writing 1 byte into a region of size 0
[-Werror=stringop-overflow=]".

This patch is to fix it to build successfully.

Fixes: 89741e7e42f6 ("Makefile: Enable -Wstringop-overflow globally")
Signed-off-by: Wenyu Huang <huangwenyu5@huawei.com>
---
 lib/vsprintf.c | 4 ++++
 mm/mempolicy.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 3e3733a7084f..7a247cfecd61 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2887,12 +2887,14 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
 	}
 
 out:
+#pragma GCC diagnostic ignored "-Wstringop-overflow"
 	if (size > 0) {
 		if (str < end)
 			*str = '\0';
 		else
 			end[-1] = '\0';
 	}
+#pragma GCC diagnostic pop
 
 	/* the trailing null byte doesn't count towards the total */
 	return str-buf;
@@ -3385,12 +3387,14 @@ int bstr_printf(char *buf, size_t size, const char *fmt, const u32 *bin_buf)
 	} /* while(*fmt) */
 
 out:
+#pragma GCC diagnostic ignored "-Wstringop-overflow"
 	if (size > 0) {
 		if (str < end)
 			*str = '\0';
 		else
 			end[-1] = '\0';
 	}
+#pragma GCC diagnostic pop
 
 #undef get_arg
 
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 10a590ee1c89..6c8433228c71 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3000,6 +3000,7 @@ int mpol_parse_str(char *str, struct mempolicy **mpol)
 	err = 0;
 
 out:
+#pragma GCC diagnostic ignored "-Wstringop-overflow"
 	/* Restore string for error message */
 	if (nodelist)
 		*--nodelist = ':';
@@ -3008,6 +3009,7 @@ int mpol_parse_str(char *str, struct mempolicy **mpol)
 	if (!err)
 		*mpol = new;
 	return err;
+#pragma GCC diagnostic pop
 }
 #endif /* CONFIG_TMPFS */
 
-- 
2.34.1


