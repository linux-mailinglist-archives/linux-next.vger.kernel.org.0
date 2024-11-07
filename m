Return-Path: <linux-next+bounces-4683-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C188A9C0BBC
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 17:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 527FA1F21B92
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 16:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B315D20FA88;
	Thu,  7 Nov 2024 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CI/ZjVfZ"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0072920CCE5
	for <linux-next@vger.kernel.org>; Thu,  7 Nov 2024 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730997202; cv=none; b=N+grnHztAsJxv1rJ7K7eZ6pekwFT9zg++Y2mWcjPjzoPu2U66IxT3hMkWxQvA1WVSwn4BzT6j0KNI9dkngZ9nxsDfmlm9K23kDEg8Tu9g4gr+vaS4Pna6MHBuVpMkqpyRmqawmEwclrERyNwwEK+XxGb4YSF3YS2rv5ILNXr7ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730997202; c=relaxed/simple;
	bh=U23oG9a9FMHgGinXV3X6twp/WZMdaEXj+2yeviv2RE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SncUekfi3KzjQqLtbvPBl3dqL1PwJKO0H2A/YAlRSAWZw46ed7mR6YgX/BTBit7FkksliMLa6gRtP9FzZcGlltZBhG0javeXA9xLqrEV+UlKxSulKYT7GOLcoLgHgBwZQI1Z2QWb8l6uD5F2lceAi6/xWCYpftd3saotj5aj1FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CI/ZjVfZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730997200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKaXCt87SZrJE1ltfcmTlkoLHVbc4XM9O+Be2Kjn8qg=;
	b=CI/ZjVfZmupzR58uwbid+tfSGlu2+WGFncWnw8YkC5IheeGeInkpGVbf3aUtWkxpLCT5L/
	JgxJ64ONWog/rKi1c8i05DP60nyipPdffdb7bczp960jPaE2APF+JjMX1A4HfgKj03QTGx
	HcZXNvWgisixKZSfOkT7EFeu4xnPTtk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-457-fjVDyrNOO_eu_8GNli65Uw-1; Thu,
 07 Nov 2024 11:33:16 -0500
X-MC-Unique: fjVDyrNOO_eu_8GNli65Uw-1
X-Mimecast-MFC-AGG-ID: fjVDyrNOO_eu_8GNli65Uw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD07B19560AB;
	Thu,  7 Nov 2024 16:33:11 +0000 (UTC)
Received: from f39.redhat.com (unknown [10.39.192.153])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DEB141953880;
	Thu,  7 Nov 2024 16:33:04 +0000 (UTC)
From: Eder Zulian <ezulian@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	tglx@linutronix.de,
	williams@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	jlelli@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	bigeasy@linutronix.de,
	sfr@canb.auug.org.au,
	hpa@zytor.com
Subject: [PATCH v3 1/1] rust: helpers: Avoid raw_spin_lock initialization for PREEMPT_RT
Date: Thu,  7 Nov 2024 17:32:23 +0100
Message-ID: <20241107163223.2092690-2-ezulian@redhat.com>
In-Reply-To: <20241107163223.2092690-1-ezulian@redhat.com>
References: <20241107163223.2092690-1-ezulian@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

When PREEMPT_RT=y, spin locks are mapped to rt_mutex types, so using
spinlock_check() + __raw_spin_lock_init() to initialize spin locks is
incorrect, and would cause build errors.

Introduce __spin_lock_init() to initialize a spin lock with lockdep
rquired information for PREEMPT_RT builds, and use it in the Rust
helper.

Fixes: d2d6422f8bd1 ("x86: Allow to enable PREEMPT_RT.")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409251238.vetlgXE9-lkp@intel.com/
Signed-off-by: Eder Zulian <ezulian@redhat.com>
---
V1 -> V2: Cleaned up style and addressed review comments
V2 -> V3: Improved commit title and description and corrected the 'Fixed:'
tag as per reviewer's suggestion

 include/linux/spinlock_rt.h | 15 +++++++--------
 rust/helpers/spinlock.c     |  8 ++++++--
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
index f9f14e135be7..f6499c37157d 100644
--- a/include/linux/spinlock_rt.h
+++ b/include/linux/spinlock_rt.h
@@ -16,22 +16,21 @@ static inline void __rt_spin_lock_init(spinlock_t *lock, const char *name,
 }
 #endif
 
-#define spin_lock_init(slock)					\
+#define __spin_lock_init(slock, name, key, percpu)		\
 do {								\
-	static struct lock_class_key __key;			\
-								\
 	rt_mutex_base_init(&(slock)->lock);			\
-	__rt_spin_lock_init(slock, #slock, &__key, false);	\
+	__rt_spin_lock_init(slock, name, key, percpu);		\
 } while (0)
 
-#define local_spin_lock_init(slock)				\
+#define _spin_lock_init(slock, percpu)				\
 do {								\
 	static struct lock_class_key __key;			\
-								\
-	rt_mutex_base_init(&(slock)->lock);			\
-	__rt_spin_lock_init(slock, #slock, &__key, true);	\
+	__spin_lock_init(slock, #slock, &__key, percpu);	\
 } while (0)
 
+#define spin_lock_init(slock)		_spin_lock_init(slock, false)
+#define local_spin_lock_init(slock)	_spin_lock_init(slock, true)
+
 extern void rt_spin_lock(spinlock_t *lock) __acquires(lock);
 extern void rt_spin_lock_nested(spinlock_t *lock, int subclass)	__acquires(lock);
 extern void rt_spin_lock_nest_lock(spinlock_t *lock, struct lockdep_map *nest_lock) __acquires(lock);
diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index b7b0945e8b3c..5971fdf6f755 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -6,10 +6,14 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
 				  struct lock_class_key *key)
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
+# if defined(CONFIG_PREEMPT_RT)
+	__spin_lock_init(lock, name, key, false);
+# else /*!CONFIG_PREEMPT_RT */
 	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
-#else
+# endif /* CONFIG_PREEMPT_RT */
+#else /* !CONFIG_DEBUG_SPINLOCK */
 	spin_lock_init(lock);
-#endif
+#endif /* CONFIG_DEBUG_SPINLOCK */
 }
 
 void rust_helper_spin_lock(spinlock_t *lock)
-- 
2.47.0


