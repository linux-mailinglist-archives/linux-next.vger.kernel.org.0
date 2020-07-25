Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E6722D5D9
	for <lists+linux-next@lfdr.de>; Sat, 25 Jul 2020 09:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGYHkE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 25 Jul 2020 03:40:04 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:39740 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726434AbgGYHkE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 25 Jul 2020 03:40:04 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 6C26CB54E9F1A10EBBCF;
        Sat, 25 Jul 2020 15:39:59 +0800 (CST)
Received: from huawei.com (10.175.100.227) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Sat, 25 Jul 2020
 15:39:51 +0800
From:   Ming Li <limingming.li@huawei.com>
To:     <b.zolnierkie@samsung.com>
CC:     <jslaby@suse.cz>, <gregkh@linuxfoundation.org>,
        <john.wanghui@huawei.com>, <cuibixuan@huawei.com>,
        <linux-next@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-fbdev@vger.kernel.org>
Subject: [PATCH -next] vc: Fix build errors
Date:   Sat, 25 Jul 2020 15:47:43 +0800
Message-ID: <20200725074743.31740-1-limingming.li@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Build errors are seen on MIPS platforms because of
vc state separation and the following build erros
were reported.

../linux/drivers/video/console/newport_con.c: In function ‘newport_clear’:
../linux/drivers/video/console/newport_con.c:365:15: error:
‘struct vc_data’ has no member named ‘vc_color’; did you mean ‘vc_cols’?
          (vc->vc_color & 0xf0) >> 4);
               ^~~~~~~~
               vc_cols
../linux/drivers/video/console/newport_con.c:368:15: error:
‘struct vc_data’ has no member named ‘vc_color’; did you mean ‘vc_cols’?
          (vc->vc_color & 0xf0) >> 4);
               ^~~~~~~~
               vc_cols
../linux/drivers/video/console/newport_con.c:370:15: error:
‘struct vc_data’ has no member named ‘vc_color’; did you mean ‘vc_cols’?
          (vc->vc_color & 0xf0) >> 4);
               ^~~~~~~~
               vc_cols
../linux/drivers/video/console/newport_con.c: In function ‘newport_scroll’:
../linux/drivers/video/console/newport_con.c:594:15: error:
‘struct vc_data’ has no member named ‘vc_color’; did you mean ‘vc_cols’?
          (vc->vc_color & 0xf0) >> 4);
               ^~~~~~~~
               vc_cols
../linux/drivers/video/console/newport_con.c:598:15: error:
‘struct vc_data’ has no member named ‘vc_color’; did you mean ‘vc_cols’?
          (vc->vc_color & 0xf0) >> 4);
               ^~~~~~~~
               vc_cols
make[4]: *** [/scratch/linux/scripts/Makefile.build:280: drivers/video/console/newport_con.o] Error 1
make[3]: *** [/scratch/linux/scripts/Makefile.build:497: drivers/video/console] Error 2
make[3]: *** Waiting for unfinished jobs....

Fixes: 28bc24fc46f9 ("vc: separate state")
Signed-off-by: Ming Li <limingming.li@huawei.com>
Cc: Jiri Slaby <jslaby@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/console/newport_con.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index df3c52d72159..72f146d047d9 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -362,12 +362,12 @@ static void newport_clear(struct vc_data *vc, int sy, int sx, int height,
 
 	if (ystart < yend) {
 		newport_clear_screen(sx << 3, ystart, xend, yend,
-				     (vc->vc_color & 0xf0) >> 4);
+				     (vc->state.color & 0xf0) >> 4);
 	} else {
 		newport_clear_screen(sx << 3, ystart, xend, 1023,
-				     (vc->vc_color & 0xf0) >> 4);
+				     (vc->state.color & 0xf0) >> 4);
 		newport_clear_screen(sx << 3, 0, xend, yend,
-				     (vc->vc_color & 0xf0) >> 4);
+				     (vc->state.color & 0xf0) >> 4);
 	}
 }
 
@@ -591,11 +591,11 @@ static bool newport_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 			topscan = (topscan + (lines << 4)) & 0x3ff;
 			newport_clear_lines(vc->vc_rows - lines,
 					    vc->vc_rows - 1,
-					    (vc->vc_color & 0xf0) >> 4);
+					    (vc->state.color & 0xf0) >> 4);
 		} else {
 			topscan = (topscan + (-lines << 4)) & 0x3ff;
 			newport_clear_lines(0, lines - 1,
-					    (vc->vc_color & 0xf0) >> 4);
+					    (vc->state.color & 0xf0) >> 4);
 		}
 		npregs->cset.topscan = (topscan - 1) & 0x3ff;
 		return false;
-- 
2.17.1

