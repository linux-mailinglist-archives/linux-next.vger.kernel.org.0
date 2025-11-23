Return-Path: <linux-next+bounces-9155-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F9C7DA42
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 01:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9678F4E044B
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 00:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88737132117;
	Sun, 23 Nov 2025 00:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEI8iW30";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iz5Ng3WA"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED014A91
	for <linux-next@vger.kernel.org>; Sun, 23 Nov 2025 00:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763859011; cv=none; b=sMrVmOrWs96pAyu62lfIvwnfGwp39bDBgNEGPt9LaKVhTZuLhiyYgstq0po+TOuJ2FWai1uZq8MyztSFjyzhB7ndRsgQ354hV1rtsGWq6CSN3e2j2O2A74yZf4Geo63rNsmIy+8zMte03ghrTui1DsSmDWi5xCXVjGo7C4fG4QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763859011; c=relaxed/simple;
	bh=5Ak56U/W12KLe8t0XM+P57Ty4rSUk5uO1O6NwpIDJp0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t5EjfS1JYAymXshecr3173y/zw3vZlJP3oEJ+XtWjlnXP3389iao2zUPahNFiZql16C8SmPf+kz84ROh3Pi3Ug9chEbc3grtHQx+ko6SZ4EAcPTkKU6UkKmeYzv7fUxQcZE3wT2Ye5HsxfA0d3ydi6g70G4chdYevvN0GGvFS8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEI8iW30; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iz5Ng3WA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763859008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1VsleZbl4kap2AIyOOAu7UweZ8JL1Y3owLUudYj/vWk=;
	b=JEI8iW30EW9+ZFXJ7/mKfhXVzr1s//Z4BY4+MN2RK0M8sK7c6YJf2XUSy9xHkxEIomImlq
	TC1kWUHk0h5MdcET/Te9ly+m7BlD42uegHhvhvylr3aB5hIHpHh5M6yHFTfeVZvFdPeyzm
	JfGtZTG7+KZOzouc9gZ2eaL904xHfO0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-7cIMPcn4NYilooPJ-m_cOg-1; Sat, 22 Nov 2025 19:50:06 -0500
X-MC-Unique: 7cIMPcn4NYilooPJ-m_cOg-1
X-Mimecast-MFC-AGG-ID: 7cIMPcn4NYilooPJ-m_cOg_1763859006
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6466f2baso99457961cf.0
        for <linux-next@vger.kernel.org>; Sat, 22 Nov 2025 16:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763859006; x=1764463806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1VsleZbl4kap2AIyOOAu7UweZ8JL1Y3owLUudYj/vWk=;
        b=Iz5Ng3WAQwiyNsQo8asBkCGO4KoLxatcxfCp/roqodPw/Gp5NQZ/jWsXiMaXD3wIQ6
         maXuwF+xAvtERsYDrP01Intej/SLLJZfmQPJSr9m6IucJqw7S1qeoxa2PIxyG8rtHKwe
         NR1lvD23WuH+duwLm0ZiDz0Va5AhFkR+09qQg2Wf/pQ6zO1TVD05xoxPRLsosZ58J9hk
         bfpRhD1mva0PvBsYMj//xx3KkWvjozmoN/ZaS+FDu1zWONxA2PYRE8Bn0Fk90Z5XXeIY
         5PRN3JST/Gi+rKWJuCXNfXoHDa+y5g0ipDQalqS+d31SO+Ec8aTKxmYFfeF0XvCJ88ax
         6EkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763859006; x=1764463806;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1VsleZbl4kap2AIyOOAu7UweZ8JL1Y3owLUudYj/vWk=;
        b=UHrPXMX0NrsSYADbdg0WY3VsOs58Ue786t5RSxEGVgZtnAT8I1Dgq0gxh2CPxEkvEK
         jaVSQ4uyZV+kloiHeoVB4hzEtVsRmotyGPR4fLigacVtFsI0IjAV6AdyddtL6jXJB5kt
         TKjzMITWldU7+QUnEgaTGecpARjGrUfyPXNU+qdoyuB6CoHuvvP5wtYl9AiuHwMwjFZR
         AkYOV1sViRUYxlfBLtyufQy0aCjtZBo6IAIjuZY1HODfm7ji/Qrcvc47KMLedgdbUSEN
         aHCRIezG+t86yihgVSdrCJn++ZRW4+1xNLyTNAXBtkI9T+Ktf/Hj50Xh65FcEF9aXbCH
         r48g==
X-Forwarded-Encrypted: i=1; AJvYcCXKL9n3o6of+5FSv9p0t/70ctuNLSME/mSzkMGPZ1zX2f8QEuolm/MjVM4OSh7icWtZ+IqWTGEF6PpW@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpEyrF2wZWLpluAfCaWJTbrpBGB3hN3KohS2ysDu2JFzgYRbq
	iALJDxe9rVdKZCpUbEEiazc5aZ2r+fcarUlSb5I4f0iIkEyUppOL22HAkM24blnO6WN1lFU0BSf
	QqBMgJbbxDJVMYXuwKx0S2dgY8SQLdUBoaGeDV8i5F3Nt+5zi/NfoghHahCOrd7A=
X-Gm-Gg: ASbGncsgLF2ugHRMN4/dviSTui8t3A0fjUqBb/T1VAOWJVbi1QDubFYYdFjHQy+bp00
	BTphr0ttJNl/BufIHVk5zaDSVW5G4euDWuSh+oQG9NiEOeREL3co78+MlsjdzNN6t2vBsgjbD5L
	NlDA/rL2yvh/hL2DJp+BSvFAeGbW3Cxlxl05HcaGei77nzfAYOOjz67igrCLRGDx1r5ERoTiH4b
	w94L/XNTo09y5Mhsb1RSKTu1UmomLFfuJ0F8as/MFQkIvRR18WYeYRBVkM3oETShfk+AQ8Nbl1P
	SG3YphpJwZFtHwoNVw/7C3W1P3v7Eqq8DhyzytnxZ89sZ3pd0r88MALCFIIUxMk+pucu/nAc4eP
	aENivyiKaE5RkaStNuF5AzJatygLV1wIrWHnIsLq6j/fqG6L5HQylBYla
X-Received: by 2002:ac8:7f8e:0:b0:4ee:13a1:93bb with SMTP id d75a77b69052e-4ee58aadbc3mr101619261cf.25.1763859006303;
        Sat, 22 Nov 2025 16:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF81MVycptLQspq8BNB9tQoyOBFYqZ7QSfYTpXeLPOdkHm+mzeU2HZgn9In8pS37ZaHU7d7JQ==
X-Received: by 2002:ac8:7f8e:0:b0:4ee:13a1:93bb with SMTP id d75a77b69052e-4ee58aadbc3mr101619051cf.25.1763859005833;
        Sat, 22 Nov 2025 16:50:05 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e575439sm69378166d6.47.2025.11.22.16.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 16:50:05 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <aa36e8b8-5e78-4329-9813-75ae46d3417a@redhat.com>
Date: Sat, 22 Nov 2025 19:50:03 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: boot warning from the final tree
To: Boqun Feng <boqun.feng@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Waiman Long <llong@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
References: <20251117202214.4f710f02@canb.auug.org.au>
 <20251121215819.GA1374726@ax162> <aSDoquGlA55Ge100@tardis.local>
Content-Language: en-US
In-Reply-To: <aSDoquGlA55Ge100@tardis.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/25 5:33 PM, Boqun Feng wrote:
> Subject: [PATCH] locking/mutex: Initialize mutex::magic even when LOCKDEP=n
>
> When DEBUG_MUTEXES=y and LOCKDEP=n, mutex_lock() still checks on
> ->magic, hence debug_mutex_init() should be called in
> mutex_init_generic() as well. While we are at it, decouple LOCKDEP
> logic from debug_mutex_init(), because in this way debug_mutex_init()
> only needs one parameter, and we now have mutex_init_lockep() for
> LOCKDEP=y scenarios.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20251117202214.4f710f02@canb.auug.org.au/
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/lkml/20251121215819.GA1374726@ax162/
> Fixes: 3572e2edc7b6 ("locking/mutex: Redo __mutex_init()")
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>   kernel/locking/mutex-debug.c | 10 +---------
>   kernel/locking/mutex.c       |  8 +++++++-
>   kernel/locking/mutex.h       |  5 ++---
>   3 files changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
> index 949103fd8e9b..2c6b02d4699b 100644
> --- a/kernel/locking/mutex-debug.c
> +++ b/kernel/locking/mutex-debug.c
> @@ -78,16 +78,8 @@ void debug_mutex_unlock(struct mutex *lock)
>   	}
>   }
>   
> -void debug_mutex_init(struct mutex *lock, const char *name,
> -		      struct lock_class_key *key)
> +void debug_mutex_init(struct mutex *lock)
>   {
> -#ifdef CONFIG_DEBUG_LOCK_ALLOC
> -	/*
> -	 * Make sure we are not reinitializing a held lock:
> -	 */
> -	debug_check_no_locks_freed((void *)lock, sizeof(*lock));
> -	lockdep_init_map_wait(&lock->dep_map, name, key, 0, LD_WAIT_SLEEP);
> -#endif
>   	lock->magic = lock;
>   }
>   
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index f3bb352a368d..2a1d165b3167 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -51,6 +51,7 @@ static void __mutex_init_generic(struct mutex *lock)
>   #ifdef CONFIG_MUTEX_SPIN_ON_OWNER
>   	osq_lock_init(&lock->osq);
>   #endif
> +	debug_mutex_init(lock);
>   }
>   
>   static inline struct task_struct *__owner_task(unsigned long owner)
> @@ -173,7 +174,12 @@ static __always_inline bool __mutex_unlock_fast(struct mutex *lock)
>   void mutex_init_lockep(struct mutex *lock, const char *name, struct lock_class_key *key)
>   {
>   	__mutex_init_generic(lock);
> -	debug_mutex_init(lock, name, key);
> +
> +	/*
> +	 * Make sure we are not reinitializing a held lock:
> +	 */
> +	debug_check_no_locks_freed((void *)lock, sizeof(*lock));
> +	lockdep_init_map_wait(&lock->dep_map, name, key, 0, LD_WAIT_SLEEP);
>   }
>   EXPORT_SYMBOL(mutex_init_lockep);
>   #endif /* !CONFIG_DEBUG_LOCK_ALLOC */
> diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
> index 2e8080a9bee3..9ad4da8cea00 100644
> --- a/kernel/locking/mutex.h
> +++ b/kernel/locking/mutex.h
> @@ -59,8 +59,7 @@ extern void debug_mutex_add_waiter(struct mutex *lock,
>   extern void debug_mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter,
>   				      struct task_struct *task);
>   extern void debug_mutex_unlock(struct mutex *lock);
> -extern void debug_mutex_init(struct mutex *lock, const char *name,
> -			     struct lock_class_key *key);
> +extern void debug_mutex_init(struct mutex *lock);
>   #else /* CONFIG_DEBUG_MUTEXES */
>   # define debug_mutex_lock_common(lock, waiter)		do { } while (0)
>   # define debug_mutex_wake_waiter(lock, waiter)		do { } while (0)
> @@ -68,6 +67,6 @@ extern void debug_mutex_init(struct mutex *lock, const char *name,
>   # define debug_mutex_add_waiter(lock, waiter, ti)	do { } while (0)
>   # define debug_mutex_remove_waiter(lock, waiter, ti)	do { } while (0)
>   # define debug_mutex_unlock(lock)			do { } while (0)
> -# define debug_mutex_init(lock, name, key)		do { } while (0)
> +# define debug_mutex_init(lock)				do { } while (0)
>   #endif /* !CONFIG_DEBUG_MUTEXES */
>   #endif /* CONFIG_PREEMPT_RT */
Reviewed-by: Waiman Long <longman@redhat.com>


