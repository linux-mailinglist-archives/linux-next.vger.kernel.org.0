Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5DC1138F18
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 11:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgAMKar (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 05:30:47 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:37314 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgAMKaq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 05:30:46 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id pmWi210035USYZQ06mWi1z; Mon, 13 Jan 2020 11:30:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqwzZ-0000aP-SZ; Mon, 13 Jan 2020 11:30:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqwzZ-0006AN-Pz; Mon, 13 Jan 2020 11:30:41 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Amanieu d'Antras <amanieu@gmail.com>,
        Christian Brauner <christian@brauner.io>,
        Kars de Jong <jongk@linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Implement copy_thread_tls()
Date:   Mon, 13 Jan 2020 11:30:40 +0100
Message-Id: <20200113103040.23661-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is required for clone3(), which passes the TLS value through a
struct rather than a register.

As do_fork() is only available if CONFIG_HAVE_COPY_THREAD_TLS is set,
m68k_clone() must be changed to call _do_fork() directly.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
This is a dependency for the combination of commits
e8bb2a2a1d51511e ("m68k: Wire up clone3() syscall") in m68k/for-next,
dd499f7a7e342702 ("clone3: ensure copy_thread_tls is implemented") in
v5.5-rc6.
---
 arch/m68k/Kconfig          |  1 +
 arch/m68k/kernel/process.c | 31 ++++++++++++++++++++++---------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 6663f1741798e83f..6ad6cdac74b3dc42 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -14,6 +14,7 @@ config M68K
 	select HAVE_AOUT if MMU
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_BUGVERBOSE
+	select HAVE_COPY_THREAD_TLS
 	select GENERIC_IRQ_SHOW
 	select GENERIC_ATOMIC64
 	select HAVE_UID16
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index 22e6b8f4f9582aa4..8f0d9140700f09ad 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -108,16 +108,28 @@ void flush_thread(void)
  * on top of pt_regs, which means that sys_clone() arguments would be
  * buried.  We could, of course, copy them, but it's too costly for no
  * good reason - generic clone() would have to copy them *again* for
- * do_fork() anyway.  So in this case it's actually better to pass pt_regs *
- * and extract arguments for do_fork() from there.  Eventually we might
- * go for calling do_fork() directly from the wrapper, but only after we
- * are finished with do_fork() prototype conversion.
+ * _do_fork() anyway.  So in this case it's actually better to pass pt_regs *
+ * and extract arguments for _do_fork() from there.  Eventually we might
+ * go for calling _do_fork() directly from the wrapper, but only after we
+ * are finished with _do_fork() prototype conversion.
  */
 asmlinkage int m68k_clone(struct pt_regs *regs)
 {
 	/* regs will be equal to current_pt_regs() */
-	return do_fork(regs->d1, regs->d2, 0,
-		       (int __user *)regs->d3, (int __user *)regs->d4);
+	struct kernel_clone_args args = {
+		.flags		= regs->d1 & ~CSIGNAL,
+		.pidfd		= (int __user *)regs->d3,
+		.child_tid	= (int __user *)regs->d4,
+		.parent_tid	= (int __user *)regs->d3,
+		.exit_signal	= regs->d1 & CSIGNAL,
+		.stack		= regs->d2,
+		.tls		= regs->d5,
+	};
+
+	if (!legacy_clone_args_valid(&args))
+		return -EINVAL;
+
+	return _do_fork(&args);
 }
 
 /*
@@ -130,8 +142,9 @@ asmlinkage int m68k_clone3(struct pt_regs *regs)
 	return sys_clone3((struct clone_args __user *)regs->d1, regs->d2);
 }
 
-int copy_thread(unsigned long clone_flags, unsigned long usp,
-		 unsigned long arg, struct task_struct *p)
+int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+		    unsigned long arg, struct task_struct *p,
+		    unsigned long tls)
 {
 	struct fork_frame {
 		struct switch_stack sw;
@@ -166,7 +179,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 	p->thread.usp = usp ?: rdusp();
 
 	if (clone_flags & CLONE_SETTLS)
-		task_thread_info(p)->tp_value = frame->regs.d5;
+		task_thread_info(p)->tp_value = tls;
 
 #ifdef CONFIG_FPU
 	if (!FPU_IS_EMU) {
-- 
2.17.1

