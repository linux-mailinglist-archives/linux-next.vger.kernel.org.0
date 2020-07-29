Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A136231E98
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 14:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgG2MdZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 08:33:25 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:60012 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgG2MdZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 08:33:25 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1k0lGm-0000oL-A6; Wed, 29 Jul 2020 22:33:17 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 29 Jul 2020 22:33:16 +1000
Date:   Wed, 29 Jul 2020 22:33:16 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Waiman Long <longman@redhat.com>
Subject: [PATCH 2/2] locking/qspinlock: Do not include atomic.h from
 qspinlock_types.h
Message-ID: <20200729123316.GC7047@gondor.apana.org.au>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729122807.GA7047@gondor.apana.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This patch breaks a header loop involving qspinlock_types.h.
The issue is that qspinlock_types.h includes atomic.h, which then
eventually includes kernel.h which could lead back to the original
file via spinlock_types.h.

As ATOMIC_INIT is now defined by linux/types.h, there is no longer
any need to include atomic.h from qspinlock_types.h.  This also
allows the CONFIG_PARAVIRT hack to be removed since it was trying
to prevent exactly this loop.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index 38ca14e79a86..4fe7fd0fe834 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -11,6 +11,7 @@
 #define __ASM_GENERIC_QSPINLOCK_H
 
 #include <asm-generic/qspinlock_types.h>
+#include <linux/atomic.h>
 
 #ifndef queued_spin_is_locked
 /**
diff --git a/include/asm-generic/qspinlock_types.h b/include/asm-generic/qspinlock_types.h
index 56d1309d32f8..2fd1fb89ec36 100644
--- a/include/asm-generic/qspinlock_types.h
+++ b/include/asm-generic/qspinlock_types.h
@@ -9,15 +9,7 @@
 #ifndef __ASM_GENERIC_QSPINLOCK_TYPES_H
 #define __ASM_GENERIC_QSPINLOCK_TYPES_H
 
-/*
- * Including atomic.h with PARAVIRT on will cause compilation errors because
- * of recursive header file incluson via paravirt_types.h. So don't include
- * it if PARAVIRT is on.
- */
-#ifndef CONFIG_PARAVIRT
 #include <linux/types.h>
-#include <linux/atomic.h>
-#endif
 
 typedef struct qspinlock {
 	union {
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
