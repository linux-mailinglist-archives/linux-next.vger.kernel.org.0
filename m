Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321E11C2BB1
	for <lists+linux-next@lfdr.de>; Sun,  3 May 2020 13:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgECL3y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 May 2020 07:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726948AbgECL3x (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 May 2020 07:29:53 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B0FC061A0C;
        Sun,  3 May 2020 04:29:53 -0700 (PDT)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1jVCoT-0002eh-My; Sun, 03 May 2020 13:29:37 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id D976A1C0051;
        Sun,  3 May 2020 13:29:36 +0200 (CEST)
Date:   Sun, 03 May 2020 11:29:36 -0000
From:   "tip-bot2 for Josh Poimboeuf" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/unwind/orc: Move ORC sorting variables under
 !CONFIG_MODULES
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, x86 <x86@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20200428071640.psn5m7eh3zt2in4v@treble>
References: <20200428071640.psn5m7eh3zt2in4v@treble>
MIME-Version: 1.0
Message-ID: <158850537679.8414.4225325348852609624.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     fb9cbbc895eb6e986dc90c928a35c793d75f435a
Gitweb:        https://git.kernel.org/tip/fb9cbbc895eb6e986dc90c928a35c793d75f435a
Author:        Josh Poimboeuf <jpoimboe@redhat.com>
AuthorDate:    Tue, 28 Apr 2020 02:16:40 -05:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Sun, 03 May 2020 13:23:28 +02:00

x86/unwind/orc: Move ORC sorting variables under !CONFIG_MODULES

Fix the following warnings seen with !CONFIG_MODULES:

  arch/x86/kernel/unwind_orc.c:29:26: warning: 'cur_orc_table' defined but not used [-Wunused-variable]
     29 | static struct orc_entry *cur_orc_table = __start_orc_unwind;
        |                          ^~~~~~~~~~~~~
  arch/x86/kernel/unwind_orc.c:28:13: warning: 'cur_orc_ip_table' defined but not used [-Wunused-variable]
     28 | static int *cur_orc_ip_table = __start_orc_unwind_ip;
        |             ^~~~~~~~~~~~~~~~

Fixes: 153eb2223c79 ("x86/unwind/orc: Convert global variables to static")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/r/20200428071640.psn5m7eh3zt2in4v@treble
---
 arch/x86/kernel/unwind_orc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 0ebc11a..5b0bd85 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -24,10 +24,6 @@ extern struct orc_entry __stop_orc_unwind[];
 static bool orc_init __ro_after_init;
 static unsigned int lookup_num_blocks __ro_after_init;
 
-static DEFINE_MUTEX(sort_mutex);
-static int *cur_orc_ip_table = __start_orc_unwind_ip;
-static struct orc_entry *cur_orc_table = __start_orc_unwind;
-
 static inline unsigned long orc_ip(const int *ip)
 {
 	return (unsigned long)ip + *ip;
@@ -192,6 +188,10 @@ static struct orc_entry *orc_find(unsigned long ip)
 
 #ifdef CONFIG_MODULES
 
+static DEFINE_MUTEX(sort_mutex);
+static int *cur_orc_ip_table = __start_orc_unwind_ip;
+static struct orc_entry *cur_orc_table = __start_orc_unwind;
+
 static void orc_sort_swap(void *_a, void *_b, int size)
 {
 	struct orc_entry *orc_a, *orc_b;
