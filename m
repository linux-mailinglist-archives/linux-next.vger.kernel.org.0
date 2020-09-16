Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7EE26CBB0
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 22:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgIPUaS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 16:30:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24851 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726908AbgIPRM4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Sep 2020 13:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600276345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a/uZkMaSEplobPhH3Wu4dvyo0GT39VR4zdw/7XiMvVw=;
        b=ZiE+NtZuwdyh9U0jywF1VKeOEexm6kdBRlA/UwoSE6uxNiMQnqmZigbELB3Qbg+cnmURw/
        JF+3XZ4rwtigX3VvL/rslDzWQTUYwHod6xEfW0dgH06hVaF75BSYPco8bhnnkVyhhnIbJI
        x1U8xUFMIsqIr371YutQDT/kKsssElI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-kB-txecbN0iMh4mpTFJjtg-1; Wed, 16 Sep 2020 08:52:19 -0400
X-MC-Unique: kB-txecbN0iMh4mpTFJjtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C20C80F059;
        Wed, 16 Sep 2020 12:52:17 +0000 (UTC)
Received: from ovpn-66-86.rdu2.redhat.com (ovpn-66-86.rdu2.redhat.com [10.10.66.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFBBD1002D54;
        Wed, 16 Sep 2020 12:52:07 +0000 (UTC)
Message-ID: <32bfdec1ad4e11cfecd840e1b83d95ba2bab1abc.camel@redhat.com>
Subject: Re: [PATCH v2 0/5] seqlock: Introduce PREEMPT_RT support
From:   Qian Cai <cai@redhat.com>
To:     peterz@infradead.org, Boqun Feng <boqun.feng@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
        Waiman Long <longman@redhat.com>
Date:   Wed, 16 Sep 2020 08:52:07 -0400
In-Reply-To: <20200915143028.GB2674@hirez.programming.kicks-ass.net>
References: <20200904153231.11994-1-a.darwish@linutronix.de>
         <224bd11b533dd2acff3f6cce51ab4ca676eb4f9f.camel@redhat.com>
         <20200915124817.GA127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
         <20200915143028.GB2674@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2020-09-15 at 16:30 +0200, peterz@infradead.org wrote:
> On Tue, Sep 15, 2020 at 08:48:17PM +0800, Boqun Feng wrote:
> > I think this happened because seqcount_##lockname##_init() is defined at
> > function rather than macro, so when the seqcount_init() gets expand in
> 
> Bah! I hate all this :/
> 
> I suspect the below, while more verbose than I'd like is the best
> option.

Stephen, can you add this patch for now until Peter beats you to it?

> 
> ---
>  include/linux/seqlock.h | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
> index f73c7eb68f27..76e44e6c0100 100644
> --- a/include/linux/seqlock.h
> +++ b/include/linux/seqlock.h
> @@ -173,6 +173,19 @@ static inline void seqcount_lockdep_reader_access(const
> seqcount_t *s)
>   * @lock:	Pointer to the associated lock
>   */
>  
> +#define seqcount_LOCKNAME_init(s, _lock, lockname)			\
> +	do {								\
> +		seqcount_##lockname##_t *____s = (s);			\
> +		seqcount_init(&____s->seqcount);			\
> +		__SEQ_LOCK(____s->lock = (_lock));			\
> +	} while (0)
> +
> +#define seqcount_raw_spinlock_init(s, lock)	seqcount_LOCKNAME_init(s, lock,
> raw_spinlock)
> +#define seqcount_spinlock_init(s, lock)		seqcount_LOCKNAME_init(s
> , lock, spinlock)
> +#define seqcount_rwlock_init(s, lock)		seqcount_LOCKNAME_init(s
> , lock, rwlock);
> +#define seqcount_mutex_init(s, lock)		seqcount_LOCKNAME_init(s, lock,
> mutex);
> +#define seqcount_ww_mutex_init(s, lock)		seqcount_LOCKNAME_init(s
> , lock, ww_mutex);
> +
>  /*
>   * SEQCOUNT_LOCKNAME()	- Instantiate seqcount_LOCKNAME_t and helpers
>   * seqprop_LOCKNAME_*()	- Property accessors for seqcount_LOCKNAME_t
> @@ -190,13 +203,6 @@ typedef struct seqcount_##lockname {				
> 	\
>  	__SEQ_LOCK(locktype	*lock);					\
>  } seqcount_##lockname##_t;						\
>  									\
> -static __always_inline void						\
> -seqcount_##lockname##_init(seqcount_##lockname##_t *s, locktype *lock)	
> \
> -{									\
> -	seqcount_init(&s->seqcount);					\
> -	__SEQ_LOCK(s->lock = lock);					\
> -}									\
> -									\
>  static __always_inline seqcount_t *					\
>  __seqprop_##lockname##_ptr(seqcount_##lockname##_t *s)			
> \
>  {									\
> @@ -284,8 +290,8 @@ SEQCOUNT_LOCKNAME(ww_mutex,     struct ww_mutex,
> true,     &s->lock->base, ww_mu
>  	__SEQ_LOCK(.lock	= (assoc_lock))				\
>  }
>  
> -#define SEQCNT_SPINLOCK_ZERO(name, lock)	SEQCOUNT_LOCKNAME_ZERO(name,
> lock)
>  #define SEQCNT_RAW_SPINLOCK_ZERO(name, lock)	SEQCOUNT_LOCKNAME_ZERO(name,
> lock)
> +#define SEQCNT_SPINLOCK_ZERO(name, lock)	SEQCOUNT_LOCKNAME_ZERO(name,
> lock)
>  #define SEQCNT_RWLOCK_ZERO(name, lock)		SEQCOUNT_LOCKNAME_ZERO(n
> ame, lock)
>  #define SEQCNT_MUTEX_ZERO(name, lock)		SEQCOUNT_LOCKNAME_ZERO(n
> ame, lock)
>  #define SEQCNT_WW_MUTEX_ZERO(name, lock) 	SEQCOUNT_LOCKNAME_ZERO(name,
> lock)
> 

