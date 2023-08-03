Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C87876E00A
	for <lists+linux-next@lfdr.de>; Thu,  3 Aug 2023 08:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbjHCGH0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Aug 2023 02:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232682AbjHCGHS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2023 02:07:18 -0400
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CED230DB
        for <linux-next@vger.kernel.org>; Wed,  2 Aug 2023 23:07:13 -0700 (PDT)
X-QQ-mid: bizesmtp65t1691042745tpdiic3r
Received: from localhost ( [202.85.220.39])
        by bizesmtp.qq.com (ESMTP) with SMTP id 0
        for <linux-next@vger.kernel.org>; Thu, 03 Aug 2023 14:05:44 +0800 (CST)
X-QQ-SSF: 01400000000000109000000A0000000
X-QQ-FEAT: +ynUkgUhZJkR1+2Xpbw3pVKBU7f6sUMuy+nz0BXiw7c2S9qUPuJm+HPU0uoeH
        cVJaXSo5jeRUvnXqziSaRI1RazXAaUYWm0mxjfV/Ueu5Pj5IIXC9FE21e/iyXcPSDwXQY9H
        sdi6fUZJX9xfsZLgfv8e8Ftm1sI8BCuDbXKmj/6py6RUY4WMcBqxLHQirBgQbNm8jOZxIfS
        MMbCRTtYTOh+9v7UxpyQrydXWDWzYiMLaNL2rd2Kd2KAi0ZGL5keXGJSNAmw3o6197Neb/p
        zRj6dknYsoxnjd1SYseyhzV+pr+yVIhocT9k0qrS31D8JQXIQ0rsphswFokozjz5VRLxNyB
        Wm9VmvKsjAGrIBTw4n29M0qqmvdc+Y0+Lg8pi8e1HLpv+Fuq1M=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 8927637587683148526
Date:   Thu, 3 Aug 2023 14:05:44 +0800
From:   GuokaiXu <xuguokai@ucas.com.cn>
To:     linux-next@vger.kernel.org
Subject: [PATCH 1/2] include/linux/mtd:Fixed spelling errors in comments
Message-ID: <4F79DF19D95CDB4F+20230803060544.GA6638@xgk8823>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:ucas.com.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From 56ec0a45e1a20011ae5fa9987f621e1022e2f3bb Mon Sep 17 00:00:00 2001
From: GuokaiXu <xuguokai@ucas.com.cn>
Date: Thu, 3 Aug 2023 13:24:48 +0800
Subject: [PATCH 1/2] Fix the spelling errors in comments

Signed-off-by: GuokaiXu <xuguokai@ucas.com.cn>
---
 include/linux/mtd/pfow.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/pfow.h b/include/linux/mtd/pfow.h
index 146413d4bdb7..d6cf66fc623e 100644
--- a/include/linux/mtd/pfow.h
+++ b/include/linux/mtd/pfow.h
@@ -90,7 +90,7 @@
 					* 11-attempt to program invalid half
 					* with 0x41 command */
 #define DSR_AOS			(1<<12) /* RC; 1- AO related failure */
-#define DSR_AVAILABLE		(1<<15) /* R; Device availbility
+#define DSR_AVAILABLE		(1<<15) /* R; Device availability
 					* 1 - Device available
 					* 0 - not available */
 
-- 
2.25.1

