Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F0745A72E
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 17:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236863AbhKWQK1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 11:10:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236886AbhKWQKZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 11:10:25 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246CBC061574;
        Tue, 23 Nov 2021 08:07:16 -0800 (PST)
Date:   Tue, 23 Nov 2021 17:07:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1637683634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OTviq26mvkL4rPATaB+abRymVFXFwD9tRbumEynRgzg=;
        b=YqVUgvYRN0d4r+rQUoFScnuQ9b8XFxDG/UkWUEHnNGaEBa015eqhIT2rcDutN2AQ9Hp9BL
        6wOV5hJcX/KALUlDDdClZ53l9MOZ2E18Z1CioK+LjhRz5ppe9eUDMURr8teYqKnbKzCJpi
        AcmS62Loz7ZSp0jlHjJJHL44MxqY6JxKA6axFbdPT1lA0/Gzwqtkp/SBX11+a2E4mXjUUH
        6/IdizzzRX65pOl1mjZXq+3qWebT7n9Y3KvGpWrPHe34OJBALuKJABlvjGRg7a5bLhEVTQ
        FZkN2iul7Xp5KfqtpTQlImR0UBCZHUuw31nIwjpaTjci4xjA65ObPTxvQn83Gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1637683634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OTviq26mvkL4rPATaB+abRymVFXFwD9tRbumEynRgzg=;
        b=pzTXGZ/HgJ3NxxdWWe2UBAO9DlaEYHvjg5WNesuPexs3u+2aO/Vv3zxI4o47acPyAPSZdH
        CgOmFrVA1BEvmBDg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
Subject: [PATCH] locking: Fixup write_lock_nested() implementation.
Message-ID: <20211123160712.fssioyabln5erx2u@linutronix.de>
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
 <CAMuHMdVuoUAM-6H2BXYtUH++4yXhRCGLAdbzx2GqAJk64FYO=A@mail.gmail.com>
 <20211123145006.bon3usz4ilhw6ymg@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211123145006.bon3usz4ilhw6ymg@linutronix.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Andrew, please merge it into:
  locking/rwlocks: introduce write_lock_nested
  locking-rwlocks-introduce-write_lock_nested.patch

And if someone could test it, I get sh4 defconfig built with and without
lockdep. x86 seems still to build, too. So it can't be that bad.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/rwlock_api_smp.h | 2 +-
 kernel/locking/spinlock.c      | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/rwlock_api_smp.h b/include/linux/rwlock_api_smp.h
index f0c535ec4e654..60049df00532d 100644
--- a/include/linux/rwlock_api_smp.h
+++ b/include/linux/rwlock_api_smp.h
@@ -47,7 +47,7 @@ _raw_write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
 
 #ifdef CONFIG_INLINE_WRITE_LOCK
 #define _raw_write_lock(lock) __raw_write_lock(lock)
-#define _raw_write_lock_nested(lock, subclass) __raw_write_lock_nested(lock, subclass)
+#define _raw_write_lock_nested(lock) __raw_write_lock(lock)
 #endif
 
 #ifdef CONFIG_INLINE_READ_LOCK_BH
diff --git a/kernel/locking/spinlock.c b/kernel/locking/spinlock.c
index 996811efa6d6e..7f49baaa49793 100644
--- a/kernel/locking/spinlock.c
+++ b/kernel/locking/spinlock.c
@@ -301,6 +301,10 @@ void __lockfunc _raw_write_lock(rwlock_t *lock)
 }
 EXPORT_SYMBOL(_raw_write_lock);
 
+#ifndef CONFIG_DEBUG_LOCK_ALLOC
+#define __raw_write_lock_nested(lock, subclass)	__raw_write_lock(((void)(subclass), (lock)))
+#endif
+
 void __lockfunc _raw_write_lock_nested(rwlock_t *lock, int subclass)
 {
 	__raw_write_lock_nested(lock, subclass);
-- 
2.34.0

