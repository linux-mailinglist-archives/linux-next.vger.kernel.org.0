Return-Path: <linux-next+bounces-9213-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB3C85957
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 15:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D35A93B106B
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 14:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359A53271E8;
	Tue, 25 Nov 2025 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aol7RiiM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724CB3271EB
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764082472; cv=none; b=KJzJquCHMh/L51g6Iqtm5D4hrLY/F3NKXusW8gaKZwNb2/f3pvw27r0BF61c2vUWdr7XgUUc81z++1m6HNBS1fR8fBG6N8Q6c1SOQmE7z8bghB8WPPIyszNVuABgSnKopfRN0BcKJ8e+BoK02ljyP/WNjNm0sVlfi4mZjOZORfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764082472; c=relaxed/simple;
	bh=SY3h2OiAfeF8gvDTCa2KyNN2joU8OiMB4qj8UaoZZOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIKjwMBxOzigMayYxVu2f1w65PNomIrKwgjTueDnypyBTLi/GgTSY2OR1Nm8Q/qYHrOa5GxEqtaY7++HLMlnROQeGSmXQT0lxKy4iLnoEQH6coPhxp787jy/+x3y1h9NpRV23iH8PtcmveHIsjuWG/kmv2z48zbKnrGQxpcVJ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aol7RiiM; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b2d6df99c5so721279485a.1
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 06:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764082469; x=1764687269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DPIrzW6iTbtfPk+JpxES9ORQpB2Xp4/r12xmpy14FPg=;
        b=aol7RiiM8ee4fRlhPjR6diNPdyL/MVo4kjr/jRsUYK7EilW/ruB8E7JlY9dL29Mh5l
         Qla3pKhlQwYIJ9cclphsvk9OalHRrX5P0K4MisL2+QjEIyy9bvXhcpoepFldi74OvhtX
         Uk6WwVG5RWags/bF7Qt3FmSIpSJgRZSemabb1ntshopGpcMidM6/gIkFeK+ZvWTcemzF
         pwQ/sjfEwR8qlQkhN2ft1OOR/HPDXKoSUBe0LysnL1n6eCjgeBqLnRWV5l1m39pHWhin
         qWwc22w59BmckYx85RLaVqkvPLtFjUUTAbgckRGENhIfZqmAXHv/0J7vhtr7aUmnW0ms
         qn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764082469; x=1764687269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPIrzW6iTbtfPk+JpxES9ORQpB2Xp4/r12xmpy14FPg=;
        b=BhBz1JzT5shR5Ui/xuXqe0z5FOD6n5bbzCh6cM1MaDWDG+py/EgQ6LWKQHTFnS5BDt
         wW0x5nkkw5gdldps5XmNRfzUcSjr4n2Sec16zl8CXieX71Gr679PtdLJ+Cfyaxr/39aP
         C8U2mQ+SNgJPMpl6kkFQfvaV43uA/pyjxlAEM+lvEUwuvWsfi2khkcAeaTFFPdtR1dFi
         GzuXWQgEOCzgSrnhDdrM8bdXPvG8Qtir8Vry1z4Y07LguZhIvGz+pI9BIL5a+LLamPU4
         1wXD4KfgOVVs3dNmgq9MXgqBzuRhNXCygYkZbeW5XWJ0nEofTcA5TH78i3yRjUMG7DN9
         uqAA==
X-Forwarded-Encrypted: i=1; AJvYcCVnLo2Bvjw6yvbK4Lppf3/yDIIZ18L50HgutBmyUeh44oBJgJCnw3V1qJNTr26kExhiN2XMnjXRSeg4@vger.kernel.org
X-Gm-Message-State: AOJu0YwgyPPJl2q++WSLmrG3YvTRlJK+NEiBKZK0+1kruheiYg5EhsvN
	M+VECSGAep/nX8qecoVBXWzxwihNiudJaXa6K+eP6wPCL7TjAAylI9Yu
X-Gm-Gg: ASbGncv+X3qHbhJwlKSS8CaMEdZUNA/zScOhX8+OPMnTTFK3DCk/Yh9Fhtm+77IwLJL
	f71bnHza5kADqUXMTpi84ly1dX0r3p8BNMvFlfIFvNY77KVlHGmOU7TWWygJcc/J3WoxTT0evUN
	WmTft+rbX50srHTPDuPpfOnSqOb4p1SDQuO8x/BRKSGFVy4iUD3dchxIXKTB7bUGcNgFVR50AbE
	a1kTBxpMwI5NGYsrThQs8HXZOFxPj3+ninxrGZKbBuHQAnlpQTvnf0tJBKKxgPeOZjzhNXazs5C
	BFUVTL/pFRZxn316Ad3jtcYqJqEFZqsW0zhWcTT/5Tu9zX5d+woSfGY0KX2oWtc9aZ3Ak2UxuFF
	eCeo97mmQ5/SPR6MuuOPJQISRhPpRq8uu2arTNa1/F28gATBybRjHMiTGpr88z5IhCJAFdzgt6X
	KNdrh3JCdAAC0WQSfzjYadJzFY5NZhpwjQm7Ps5ji6f1Uvmovp6dy062h1nL4Sv4CFisJTBBOop
	80MpyRrM7rS46Y=
X-Google-Smtp-Source: AGHT+IHli/HwnKXw7BqPcW2CE37T0dBCJTzUIBxElCd67FpsvIJJFlJ8tKftnDmRJhXWGNHY8/BkHA==
X-Received: by 2002:a05:620a:1a07:b0:84b:7b84:4ec with SMTP id af79cd13be357-8b33bdcb246mr1906196085a.22.1764082469215;
        Tue, 25 Nov 2025 06:54:29 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295d9dc2sm1216179485a.39.2025.11.25.06.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:54:28 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4C05DF4006A;
	Tue, 25 Nov 2025 09:54:28 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 25 Nov 2025 09:54:28 -0500
X-ME-Sender: <xms:JMMlaYCyIjzjP9A48STl6OkRItOCCB9xGQN4oBmUZF_FyDpDVR-uQA>
    <xme:JMMlaWVrVhJwwkAjEEwG-P72DmKmBtOywf687U1Waob4arOqlnNWllgONh8w7hP1b
    MyIqyZV0D0F3RmYdO-QF6huT0UVfl0viJ88WK0Sv0-qiITDqLk0Yg>
X-ME-Received: <xmr:JMMlaW-xtdIFrrkqeVz5XX-H5thnExrE85VFAyHSwCqAyeSi0wJV6NaPhJ1Qd0EFxQUo3Dq9bYVjszDJseeadzx5PXdGr48C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedujeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefghfffvefhhfdvgfejgfekvdelgfekgeevueehlefhiedvgeffjefgteeugfeh
    ieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgiht
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurght
    ihhonhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomh
    dprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthho
    pehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhonhhgmhgrnhesrh
    gvughhrghtrdgtohhmpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:JMMlaYSDyPuam2VvGeLpvsPPZBX3Qtlats-8x_l6GSiG9U17htiCPQ>
    <xmx:JMMlabQtw1Z7b1I6RwRZ33xX4r7pYMoXwIR_GZzVdr28DvEFub_UXQ>
    <xmx:JMMlaU7_GLGQg5D5NGc6szFd6W_B_-dtSDYUCSDDQL2zeLhPjjQ14Q>
    <xmx:JMMlaQXWhaYPoburc9zcIDrm8Syzbitk_2FFFEqwan8uHSr-5gGpWQ>
    <xmx:JMMlaa8cSxrzSEJsBjNJ_Qxjvoode1iHVegiqqDAdI6MR7oGYcQmV9IL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Nov 2025 09:54:27 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	peterz@infradead.org
Cc: akpm@linux-foundation.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] locking/mutex: Initialize mutex::magic even when LOCKDEP=n
Date: Tue, 25 Nov 2025 06:54:21 -0800
Message-ID: <20251125145425.68319-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aSDoquGlA55Ge100@tardis.local>
References: <aSDoquGlA55Ge100@tardis.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When DEBUG_MUTEXES=y and LOCKDEP=n, mutex_lock() still checks on
->magic, hence debug_mutex_init() should be called in
mutex_init_generic() as well. While we are at it, decouple LOCKDEP
logic from debug_mutex_init(), because in this way debug_mutex_init()
only needs one parameter, and we now have mutex_init_lockep() for
LOCKDEP=y scenarios.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/lkml/20251117202214.4f710f02@canb.auug.org.au/
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/lkml/20251121215819.GA1374726@ax162/
Fixes: 3572e2edc7b6 ("locking/mutex: Redo __mutex_init()")
Reviewed-by: Waiman Long <longman@redhat.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
Peter,

Feel free to fold it into commit 3572e2edc7b6 ("locking/mutex: Redo
__mutex_init()"), just resend it properly so it won't fall off your
radar ;-)

 kernel/locking/mutex-debug.c | 10 +---------
 kernel/locking/mutex.c       |  8 +++++++-
 kernel/locking/mutex.h       |  5 ++---
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
index 949103fd8e9b..2c6b02d4699b 100644
--- a/kernel/locking/mutex-debug.c
+++ b/kernel/locking/mutex-debug.c
@@ -78,16 +78,8 @@ void debug_mutex_unlock(struct mutex *lock)
 	}
 }
 
-void debug_mutex_init(struct mutex *lock, const char *name,
-		      struct lock_class_key *key)
+void debug_mutex_init(struct mutex *lock)
 {
-#ifdef CONFIG_DEBUG_LOCK_ALLOC
-	/*
-	 * Make sure we are not reinitializing a held lock:
-	 */
-	debug_check_no_locks_freed((void *)lock, sizeof(*lock));
-	lockdep_init_map_wait(&lock->dep_map, name, key, 0, LD_WAIT_SLEEP);
-#endif
 	lock->magic = lock;
 }
 
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index f3bb352a368d..2a1d165b3167 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -51,6 +51,7 @@ static void __mutex_init_generic(struct mutex *lock)
 #ifdef CONFIG_MUTEX_SPIN_ON_OWNER
 	osq_lock_init(&lock->osq);
 #endif
+	debug_mutex_init(lock);
 }
 
 static inline struct task_struct *__owner_task(unsigned long owner)
@@ -173,7 +174,12 @@ static __always_inline bool __mutex_unlock_fast(struct mutex *lock)
 void mutex_init_lockep(struct mutex *lock, const char *name, struct lock_class_key *key)
 {
 	__mutex_init_generic(lock);
-	debug_mutex_init(lock, name, key);
+
+	/*
+	 * Make sure we are not reinitializing a held lock:
+	 */
+	debug_check_no_locks_freed((void *)lock, sizeof(*lock));
+	lockdep_init_map_wait(&lock->dep_map, name, key, 0, LD_WAIT_SLEEP);
 }
 EXPORT_SYMBOL(mutex_init_lockep);
 #endif /* !CONFIG_DEBUG_LOCK_ALLOC */
diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
index 2e8080a9bee3..9ad4da8cea00 100644
--- a/kernel/locking/mutex.h
+++ b/kernel/locking/mutex.h
@@ -59,8 +59,7 @@ extern void debug_mutex_add_waiter(struct mutex *lock,
 extern void debug_mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 				      struct task_struct *task);
 extern void debug_mutex_unlock(struct mutex *lock);
-extern void debug_mutex_init(struct mutex *lock, const char *name,
-			     struct lock_class_key *key);
+extern void debug_mutex_init(struct mutex *lock);
 #else /* CONFIG_DEBUG_MUTEXES */
 # define debug_mutex_lock_common(lock, waiter)		do { } while (0)
 # define debug_mutex_wake_waiter(lock, waiter)		do { } while (0)
@@ -68,6 +67,6 @@ extern void debug_mutex_init(struct mutex *lock, const char *name,
 # define debug_mutex_add_waiter(lock, waiter, ti)	do { } while (0)
 # define debug_mutex_remove_waiter(lock, waiter, ti)	do { } while (0)
 # define debug_mutex_unlock(lock)			do { } while (0)
-# define debug_mutex_init(lock, name, key)		do { } while (0)
+# define debug_mutex_init(lock)				do { } while (0)
 #endif /* !CONFIG_DEBUG_MUTEXES */
 #endif /* CONFIG_PREEMPT_RT */
-- 
2.50.1 (Apple Git-155)


