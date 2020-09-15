Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0E626B625
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 01:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgIOX6I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 19:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgIOOav (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 10:30:51 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E9DC061788;
        Tue, 15 Sep 2020 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=1PhetADaRTH1Pb3SkJkOEJ3TkqsqPCLZoONy5F8Svwc=; b=dbPsgUDO/cdWuS45BgxVgrrChg
        maBpBLHqbXsiBVKBDOlrEu4MRyV2hXYmseP1R0cdPvQ6RBnThW2oXsSNxxvGeU4B1APr+LrvtuIeZ
        BJfYPgphp32t8Bl8FbPItYWbjG3RPlDIVu0yZ+7QR1Lm03nUOu8sPa2XqtjewXN5UvWcEz2cCbsjz
        zywkAXwSXGqoyGOyTL3xftNU7Xh9zAJyDr/Cu5W1BqnYpc+wYO004oK30FhPeu2Bciz9vi7945fDx
        Phow4fEFc/dOHomNtQZDlVyzEMF6pycm187zPPR+7ciWovsJQ5A0f2ISOIIH0jRhOM4qziiJ+AKMO
        tyZOd0zg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIByZ-0007zX-HD; Tue, 15 Sep 2020 14:30:31 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8DC833019CE;
        Tue, 15 Sep 2020 16:30:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 1B0CB203EB173; Tue, 15 Sep 2020 16:30:28 +0200 (CEST)
Date:   Tue, 15 Sep 2020 16:30:28 +0200
From:   peterz@infradead.org
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Qian Cai <cai@redhat.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 0/5] seqlock: Introduce PREEMPT_RT support
Message-ID: <20200915143028.GB2674@hirez.programming.kicks-ass.net>
References: <20200904153231.11994-1-a.darwish@linutronix.de>
 <224bd11b533dd2acff3f6cce51ab4ca676eb4f9f.camel@redhat.com>
 <20200915124817.GA127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915124817.GA127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 15, 2020 at 08:48:17PM +0800, Boqun Feng wrote:
> I think this happened because seqcount_##lockname##_init() is defined at
> function rather than macro, so when the seqcount_init() gets expand in

Bah! I hate all this :/

I suspect the below, while more verbose than I'd like is the best
option.

---
 include/linux/seqlock.h | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index f73c7eb68f27..76e44e6c0100 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -173,6 +173,19 @@ static inline void seqcount_lockdep_reader_access(const seqcount_t *s)
  * @lock:	Pointer to the associated lock
  */
 
+#define seqcount_LOCKNAME_init(s, _lock, lockname)			\
+	do {								\
+		seqcount_##lockname##_t *____s = (s);			\
+		seqcount_init(&____s->seqcount);			\
+		__SEQ_LOCK(____s->lock = (_lock));			\
+	} while (0)
+
+#define seqcount_raw_spinlock_init(s, lock)	seqcount_LOCKNAME_init(s, lock, raw_spinlock)
+#define seqcount_spinlock_init(s, lock)		seqcount_LOCKNAME_init(s, lock, spinlock)
+#define seqcount_rwlock_init(s, lock)		seqcount_LOCKNAME_init(s, lock, rwlock);
+#define seqcount_mutex_init(s, lock)		seqcount_LOCKNAME_init(s, lock, mutex);
+#define seqcount_ww_mutex_init(s, lock)		seqcount_LOCKNAME_init(s, lock, ww_mutex);
+
 /*
  * SEQCOUNT_LOCKNAME()	- Instantiate seqcount_LOCKNAME_t and helpers
  * seqprop_LOCKNAME_*()	- Property accessors for seqcount_LOCKNAME_t
@@ -190,13 +203,6 @@ typedef struct seqcount_##lockname {					\
 	__SEQ_LOCK(locktype	*lock);					\
 } seqcount_##lockname##_t;						\
 									\
-static __always_inline void						\
-seqcount_##lockname##_init(seqcount_##lockname##_t *s, locktype *lock)	\
-{									\
-	seqcount_init(&s->seqcount);					\
-	__SEQ_LOCK(s->lock = lock);					\
-}									\
-									\
 static __always_inline seqcount_t *					\
 __seqprop_##lockname##_ptr(seqcount_##lockname##_t *s)			\
 {									\
@@ -284,8 +290,8 @@ SEQCOUNT_LOCKNAME(ww_mutex,     struct ww_mutex, true,     &s->lock->base, ww_mu
 	__SEQ_LOCK(.lock	= (assoc_lock))				\
 }
 
-#define SEQCNT_SPINLOCK_ZERO(name, lock)	SEQCOUNT_LOCKNAME_ZERO(name, lock)
 #define SEQCNT_RAW_SPINLOCK_ZERO(name, lock)	SEQCOUNT_LOCKNAME_ZERO(name, lock)
+#define SEQCNT_SPINLOCK_ZERO(name, lock)	SEQCOUNT_LOCKNAME_ZERO(name, lock)
 #define SEQCNT_RWLOCK_ZERO(name, lock)		SEQCOUNT_LOCKNAME_ZERO(name, lock)
 #define SEQCNT_MUTEX_ZERO(name, lock)		SEQCOUNT_LOCKNAME_ZERO(name, lock)
 #define SEQCNT_WW_MUTEX_ZERO(name, lock) 	SEQCOUNT_LOCKNAME_ZERO(name, lock)
