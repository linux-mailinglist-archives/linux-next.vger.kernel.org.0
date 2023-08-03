Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 712A676E007
	for <lists+linux-next@lfdr.de>; Thu,  3 Aug 2023 08:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjHCGHT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Aug 2023 02:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbjHCGHQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2023 02:07:16 -0400
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B45DE6F
        for <linux-next@vger.kernel.org>; Wed,  2 Aug 2023 23:07:09 -0700 (PDT)
X-QQ-mid: bizesmtp83t1691042759tew5pqdl
Received: from localhost ( [202.85.220.39])
        by bizesmtp.qq.com (ESMTP) with SMTP id 0
        for <linux-next@vger.kernel.org>; Thu, 03 Aug 2023 14:05:57 +0800 (CST)
X-QQ-SSF: 01400000000000109000000A0000000
X-QQ-FEAT: zW5H9jc4KG7JDYRdPw3v3MnEdsjgxyOiEN9mNGDk+LdtZgpaxGuv9GcbJNvVP
        JzAnYjtmj0VhS/Quagf9Uw0qZ7L7LkTJeasB4fGsbhQVMMiLjRhF1rcTx8f1up9SQRFMGgC
        /itTKRWNrUKuoG0nuOABFcXwG0DvGmVCf7ksIkx2AGIw1dvjmN+Zp0e/WD5dCGdGCdKE7mb
        P+NI4gnIRGMRsyMYTUiFQeLkizIAN6mrwR/MPdt4zCMMFz8BSrGXrF1ZLgMjTXnb6KblxcA
        grT71w51Xw3Pb1QoecbW9NbtNaFzdYsxGffScsWDDwn28Qk6GwDHjojWKfPVA4ApI6pR91T
        XM753qZZvKJHsJJ0xLDdjZbdoWfBefFfep/omc6I+WwUie5GxyboPXZc6ZfHv0xbuaN0JRv
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 6270210211280154834
Date:   Thu, 3 Aug 2023 14:05:57 +0800
From:   GuokaiXu <xuguokai@ucas.com.cn>
To:     linux-next@vger.kernel.org
Subject: [PATCH 2/2] tools/testing/selftests:Fixed spelling errors in
 comments 
Message-ID: <803778AC500E556D+20230803060557.GA6671@xgk8823>
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

From 844784381c30373524346d342003952aeec73a16 Mon Sep 17 00:00:00 2001
From: GuokaiXu <xuguokai@ucas.com.cn>
Date: Thu, 3 Aug 2023 13:26:59 +0800
Subject: [PATCH 2/2] Fixed some spelling errors in comments.

Signed-off-by: GuokaiXu <xuguokai@ucas.com.cn>
---
 tools/testing/selftests/arm64/pauth/pac.c              | 2 +-
 tools/testing/selftests/bpf/progs/test_subprogs.c      | 2 +-
 tools/testing/selftests/sync/sync_stress_parallelism.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/pauth/pac.c b/tools/testing/selftests/arm64/pauth/pac.c
index b743daa772f5..b236d181feef 100644
--- a/tools/testing/selftests/arm64/pauth/pac.c
+++ b/tools/testing/selftests/arm64/pauth/pac.c
@@ -289,7 +289,7 @@ TEST(single_thread_different_keys)
 
 /*
  * fork() does not change keys. Only exec() does so call a worker program.
- * Its only job is to sign a value and report back the resutls
+ * Its only job is to sign a value and report back the results
  */
 TEST(exec_changed_keys)
 {
diff --git a/tools/testing/selftests/bpf/progs/test_subprogs.c b/tools/testing/selftests/bpf/progs/test_subprogs.c
index a8d602d7c88a..ad68697c3c91 100644
--- a/tools/testing/selftests/bpf/progs/test_subprogs.c
+++ b/tools/testing/selftests/bpf/progs/test_subprogs.c
@@ -39,7 +39,7 @@ static __noinline int sub4(int w)
 	return w + sub3(5) + sub1(6);
 }
 
-/* sub5() is an identitify function, just to test weirder functions layout and
+/* sub5() is an identify function, just to test weirder functions layout and
  * call patterns
  */
 static __noinline int sub5(int v)
diff --git a/tools/testing/selftests/sync/sync_stress_parallelism.c b/tools/testing/selftests/sync/sync_stress_parallelism.c
index e6c9be671dfc..6ce56ca204c4 100644
--- a/tools/testing/selftests/sync/sync_stress_parallelism.c
+++ b/tools/testing/selftests/sync/sync_stress_parallelism.c
@@ -87,7 +87,7 @@ int test_stress_two_threads_shared_timeline(void)
 
 	/*
 	 * Use a single timeline to synchronize two threads
-	 * hammmering on the same counter.
+	 * hammering on the same counter.
 	 */
 
 	pthread_create(&a, NULL, (void *(*)(void *))
-- 
2.25.1

