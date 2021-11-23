Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1631645A989
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 18:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhKWREq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 12:04:46 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:39342 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236804AbhKWREq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 12:04:46 -0500
Date:   Tue, 23 Nov 2021 18:01:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1637686896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5jFMme/04un1MC+akjG19ft3gjyZIh6NNG67wIsGBMo=;
        b=DWS4D674L2kcCxpVr2gQnGTSt089zQTRUODvs710sbsaPBVwWxmkwNuKrbOy4wEJK0FWXr
        viw6gpMlbmrxzNVhr93KpKqgAvWb8TX1jnwVSG1DvDw+aesfYj/H+PY/PmHS04sttfAb7R
        /pVrAtYs5SX5tJxLDjYlft9xh4yE5RzAdIJUJ7uNZg2l4A1Ku8YSHmTImfr4ZstCAWq551
        3hHZH54+sfMEERCJRTLCS2u7YgK6YlUrxSU70yDE/iWEGvguh2OEJDXwxor5KulIF9X3/V
        v/tHoKbLPgJyYH1eT+tnSRW2155Wdz1aLrRPJ8NIfylnH/5XZD0IXOP4mOVP5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1637686896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5jFMme/04un1MC+akjG19ft3gjyZIh6NNG67wIsGBMo=;
        b=5NQ/WwFssLtEYCocJv/AX/sNqGciWZW0BXPldn61pNctmEPKDPC4pRCTVR21gg89alilv0
        ZVHPUVGpYAMa7bBg==
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
Subject: [PATCH v2] locking: Fixup write_lock_nested() implementation.
Message-ID: <20211123170134.y6xb7pmpgdn4m3bn@linutronix.de>
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
 <CAMuHMdVuoUAM-6H2BXYtUH++4yXhRCGLAdbzx2GqAJk64FYO=A@mail.gmail.com>
 <20211123145006.bon3usz4ilhw6ymg@linutronix.de>
 <20211123160712.fssioyabln5erx2u@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211123160712.fssioyabln5erx2u@linutronix.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Andrew, please merge it into:
  locking/rwlocks: introduce write_lock_nested
  locking-rwlocks-introduce-write_lock_nested.patch

And if someone could test it, I get sh4 defconfig built with and without
lockdep. x86 seems still to build, too. So it can't be that bad.

v1=E2=80=A6v2: I noticed a typo in _raw_write_lock_nested() and decided tha=
t it
is no needed so now it is removed for !CONFIG_INLINE_WRITE_LOCK.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/rwlock_api_smp.h | 1 -
 kernel/locking/spinlock.c      | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/rwlock_api_smp.h b/include/linux/rwlock_api_smp.h
index f0c535ec4e654..dceb0a59b6927 100644
--- a/include/linux/rwlock_api_smp.h
+++ b/include/linux/rwlock_api_smp.h
@@ -47,7 +47,6 @@ _raw_write_unlock_irqrestore(rwlock_t *lock, unsigned lon=
g flags)
=20
 #ifdef CONFIG_INLINE_WRITE_LOCK
 #define _raw_write_lock(lock) __raw_write_lock(lock)
-#define _raw_write_lock_nested(lock, subclass) __raw_write_lock_nested(loc=
k, subclass)
 #endif
=20
 #ifdef CONFIG_INLINE_READ_LOCK_BH
diff --git a/kernel/locking/spinlock.c b/kernel/locking/spinlock.c
index 996811efa6d6e..7f49baaa49793 100644
--- a/kernel/locking/spinlock.c
+++ b/kernel/locking/spinlock.c
@@ -301,6 +301,10 @@ void __lockfunc _raw_write_lock(rwlock_t *lock)
 }
 EXPORT_SYMBOL(_raw_write_lock);
=20
+#ifndef CONFIG_DEBUG_LOCK_ALLOC
+#define __raw_write_lock_nested(lock, subclass)	__raw_write_lock(((void)(s=
ubclass), (lock)))
+#endif
+
 void __lockfunc _raw_write_lock_nested(rwlock_t *lock, int subclass)
 {
 	__raw_write_lock_nested(lock, subclass);
--=20
2.34.0

