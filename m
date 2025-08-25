Return-Path: <linux-next+bounces-8092-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC847B33D66
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 12:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45E86205826
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 10:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFC522DF86;
	Mon, 25 Aug 2025 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="UEk8ubCz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E18B2DCF4B
	for <linux-next@vger.kernel.org>; Mon, 25 Aug 2025 10:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756119553; cv=none; b=CnewDRF7rfn6pXUlBzOnjhofnBUc/sZPJGvNEvixMM9cKs1PPy2saPzFvWup3pWyRznKNXUdXnuH3OtfWPlg4obi7Xz4wnUub1XxkvGXybMifYtBBH5cTEqO1/No0uaoF/+/THSPdoHFszwN9Paq0dUkJcmy8PrEOgB9e7Er/t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756119553; c=relaxed/simple;
	bh=Gx52qitB3Ab8piMlwcadgA6LPmcWmcKTkLTQqSbKmK0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=CgKwauS6rAFiu8DiBh8rgtMyUPpgz5HcfVbzyY2u06/dXpDcr8wj5fkrnGUMpTwp0cU4wbjzk8Qe9U46H6DZKKmcOZs/YdTzV3UJL8+b5v8JbRO66gAIUqcO2yvQ12Zy2Eslq2dtcAlOmTnP0Kkhr87FYHnzqDUcUYkhjt/4JY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=UEk8ubCz; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-771e15ce64eso548539b3a.0
        for <linux-next@vger.kernel.org>; Mon, 25 Aug 2025 03:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1756119546; x=1756724346; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXcUqjFrGSEky98QaupaFOqGVdp5/rC5MJZKAWYv3B4=;
        b=UEk8ubCzKmcFVFQmeBKlRGUHH4B62pMApuHH/3Df9rDIqhsxPTVVkzdNRyrIfwzxCc
         27mjYerRlGtClnxPAIC9YLvNpyUMzh90Sb+6CeSOZLGvqNa1Zkpd7wCIcclQloIQVBXj
         fXhDWajh9JGGncjt9TJDG2QJSCnSFadqcBiunM1qB9k8xpCqMjodJvLkZv89rEtElZhd
         ROE8vshQWQKkgIDF0KmjpPISGHl8zx5SVSZmwUcBz7kt/np7ejJXz4QP8f5WdzjFsu+Q
         MnP2kEEOhw5YEQMNEIlcRS031b3RxFP3fiArHZQNNfGf918jTbFkuARM9WAPaRGcUfYZ
         s+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756119546; x=1756724346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vXcUqjFrGSEky98QaupaFOqGVdp5/rC5MJZKAWYv3B4=;
        b=FCphNggMOS0SND60ynz+rkNAcDXs66J42DdEW8bLniGqOSmXJtztdNhU9AQ/L/TxIK
         DU7hHJjUhoVpyqzCE4maQ18ZZriWXLwlnwFUSxBNfsQlONu0zxoKxuNuW4h6DuBIvhW9
         C84TW0OSlTCxLQKAvRtEGSYfgOYaBD1nT5BNdxOF3abOlphbAoKuF19ikwVE0vJM7cU2
         qgoJgr72qbdpif+kljAU/3Xz86MKgAEpE2nkIAmxyMRHyfE+6H2BBqBjIr0skoFS/uyG
         HHgRzXLuUiE48efeuj9o3JogZTGbFMMggpgOP9YlZF7YDoxEv60JF4LbkwUaXJzvFdtf
         M+cw==
X-Forwarded-Encrypted: i=1; AJvYcCU3t7lJHhJMC4mwzBYPNhcbpC9v1xaLaOPoLJ76WWAxPXV6YBGZnQxWP5UiUyd83ONfX9gLGOYRaesk@vger.kernel.org
X-Gm-Message-State: AOJu0YyNafktB+znC4mqgoNPVXslROj1kNHdbfpHN1XklXcUn50hW5/7
	oC2DkSi7nGKSzhsvjOM3rQ5IGrQgvd4RlXgAI6N0i4AIpGhLMhQc9h77Bu195MDZ2SY=
X-Gm-Gg: ASbGncs30TmXUnir4oIIUog1T5lthOImTf36Tq9ZxO4rsLdJKHPGk/gHiOg23Dh7TFa
	h4XZR+jtnMc89NKX+YBivp2H55oL8P9p4o1LA+PUgcS5KZ6ma9N3SrasJm3ADzsHhh04j996KfN
	Cng+4QTqYVR7cDLFA2Uf833fVrmuZN5ewUkj7eCnB2IEh/mhX7pKZ3r2IOKrlWkgfs2MWcrRZXC
	aRkKT1kGl0LpgOrbsuG7er6+TGbf8NLcoNRbjfg1I9PwJAjrSjdKQMQTLDLPZqAZ7CWNlqfAeQ5
	KVb7rE6nrQG7uDh7SQ2w4CcNpxSNn0BN1HFgTKusPYmAU579x7cGjQGq0vZ1RVs/WenpdGhbuaw
	sgxhNXv6reLWkdCr7
X-Google-Smtp-Source: AGHT+IH3VtY635ljeX7f/6XYuQ2G2aFpfTGUFNJGYWyUAh8S45epsjAG6kWp6PIoNT01jOT0ZoM6qA==
X-Received: by 2002:a05:6a21:2722:b0:243:7e4e:3cd7 with SMTP id adf61e73a8af0-2437e4e4226mr1727491637.36.1756119545865;
        Mon, 25 Aug 2025 03:59:05 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbb9ce58sm6282710a12.40.2025.08.25.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) ./include/linux/seqlock.h:876:9:
 error:
 implicit declaration of fu...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 25 Aug 2025 10:59:04 -0000
Message-ID: <175611954420.746.11542698911809026684@16ad3c994827>





Hello,

New build issue found on next/master:

---
 ./include/linux/seqlock.h:876:9: error: implicit declaration of function 'spin_lock' [-Werror=implicit-function-declaration] in arch/arc/kernel/asm-offsets.s (arch/arc/kernel/asm-offsets.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:77f9f128f5960f71dace74e7d3745d41f54a026c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  6c68f4c0a147c025ae0b25fab688c7c47964a02f
- tags: next-20250825


Log excerpt:
=====================================================
                 from arch/arc/kernel/asm-offsets.c:6:
./include/linux/seqlock.h: In function 'write_seqlock':
./include/linux/seqlock.h:876:9: error: implicit declaration of function 'spin_lock' [-Werror=implicit-function-declaration]
  876 |         spin_lock(&sl->lock);
      |         ^~~~~~~~~
./include/linux/seqlock.h: In function 'write_sequnlock':
./include/linux/seqlock.h:890:9: error: implicit declaration of function 'spin_unlock' [-Werror=implicit-function-declaration]
  890 |         spin_unlock(&sl->lock);
      |         ^~~~~~~~~~~
./include/linux/seqlock.h: In function 'write_seqlock_bh':
./include/linux/seqlock.h:902:9: error: implicit declaration of function 'spin_lock_bh' [-Werror=implicit-function-declaration]
  902 |         spin_lock_bh(&sl->lock);
      |         ^~~~~~~~~~~~
./include/linux/seqlock.h: In function 'write_sequnlock_bh':
./include/linux/seqlock.h:917:9: error: implicit declaration of function 'spin_unlock_bh' [-Werror=implicit-function-declaration]
  917 |         spin_unlock_bh(&sl->lock);
      |         ^~~~~~~~~~~~~~
./include/linux/seqlock.h: In function 'write_seqlock_irq':
./include/linux/seqlock.h:929:9: error: implicit declaration of function 'spin_lock_irq' [-Werror=implicit-function-declaration]
  929 |         spin_lock_irq(&sl->lock);
      |         ^~~~~~~~~~~~~
./include/linux/seqlock.h: In function 'write_sequnlock_irq':
./include/linux/seqlock.h:943:9: error: implicit declaration of function 'spin_unlock_irq'; did you mean 'write_sequnlock_irq'? [-Werror=implicit-function-declaration]
  943 |         spin_unlock_irq(&sl->lock);
      |         ^~~~~~~~~~~~~~~
      |         write_sequnlock_irq
./include/linux/seqlock.h: In function '__write_seqlock_irqsave':
./include/linux/seqlock.h:950:9: error: implicit declaration of function 'spin_lock_irqsave' [-Werror=implicit-function-declaration]
  950 |         spin_lock_irqsave(&sl->lock, flags);
      |         ^~~~~~~~~~~~~~~~~
./include/linux/seqlock.h: In function 'write_sequnlock_irqrestore':
./include/linux/seqlock.h:981:9: error: implicit declaration of function 'spin_unlock_irqrestore'; did you mean 'write_sequnlock_irqrestore'? [-Werror=implicit-function-declaration]
  981 |         spin_unlock_irqrestore(&sl->lock, flags);
      |         ^~~~~~~~~~~~~~~~~~~~~~
      |         write_sequnlock_irqrestore
In file included from ./include/linux/sched.h:15:
./include/linux/rcupdate.h: In function 'rcu_read_lock_sched_held':
./include/linux/preempt.h:227:51: error: implicit declaration of function 'irqs_disabled' [-Werror=implicit-function-declaration]
  227 | #define preemptible()   (preempt_count() == 0 && !irqs_disabled())
      |                                                   ^~~~~~~~~~~~~
./include/linux/rcupdate.h:368:17: note: in expansion of macro 'preemptible'
  368 |         return !preemptible();
      |                 ^~~~~~~~~~~
In file included from ./include/linux/mm_types.h:12,
                 from ./include/linux/mmzone.h:22:
./include/linux/maple_tree.h: In function 'mt_init_flags':
./include/linux/maple_tree.h:808:17: error: implicit declaration of function 'spin_lock_init'; did you mean 'osq_lock_init'? [-Werror=implicit-function-declaration]
  808 |                 spin_lock_init(&mt->ma_lock);
      |                 ^~~~~~~~~~~~~~
      |                 osq_lock_init
In file included from ./include/linux/preempt.h:11:
./include/linux/local_lock.h: In function 'class_local_lock_irq_destructor':
./include/linux/local_lock_internal.h:190:17: error: implicit declaration of function 'local_irq_enable'; did you mean 'local_bh_enable'? [-Werror=implicit-function-declaration]
  190 |                 local_irq_enable();                             \
      |                 ^~~~~~~~~~~~~~~~
./include/linux/cleanup.h:278:18: note: in definition of macro 'DEFINE_CLASS'
  278 | { _type _T = *p; _exit; }                                               \
      |                  ^~~~~
./include/linux/local_lock.h:85:1: note: in expansion of macro 'DEFINE_GUARD'
   85 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
      | ^~~~~~~~~~~~
./include/linux/local_lock.h:43:41: note: in expansion of macro '__local_unlock_irq'
   43 | #define local_unlock_irq(lock)          __local_unlock_irq(this_cpu_ptr(lock))
      |                                         ^~~~~~~~~~~~~~~~~~
./include/linux/local_lock.h:87:14: note: in expansion of macro 'local_unlock_irq'
   87 |              local_unlock_irq(_T))
      |              ^~~~~~~~~~~~~~~~
./include/linux/local_lock.h: In function 'class_local_lock_irq_constructor':
./include/linux/local_lock_internal.h:121:17: error: implicit declaration of function 'local_irq_disable'; did you mean 'local_bh_disable'? [-Werror=implicit-function-declaration]
  121 |                 local_irq_disable();                            \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/cleanup.h:280:13: note: in definition of macro 'DEFINE_CLASS'
  280 | { _type t = _init; return t; }
      |             ^~~~~
./include/linux/local_lock.h:85:1: note: in expansion of macro 'DEFINE_GUARD'
   85 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
      | ^~~~~~~~~~~~
./include/linux/local_lock.h:22:41: note: in expansion of macro '__local_lock_irq'
   22 | #define local_lock_irq(lock)            __local_lock_irq(this_cpu_ptr(lock))
      |                                         ^~~~~~~~~~~~~~~~
./include/linux/local_lock.h:86:14: note: in expansion of macro 'local_lock_irq'
   86 |              local_lock_irq(_T),
      |              ^~~~~~~~~~~~~~
./include/linux/local_lock.h: In function 'class_local_lock_irqsave_destructor':
./include/linux/local_lock_internal.h:196:17: error: implicit declaration of function 'local_irq_restore' [-Werror=implicit-function-declaration]
  196 |                 local_irq_restore(flags);                       \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/cleanup.h:471:42: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
  471 |         if (!__GUARD_IS_ERR(_T->lock)) { _unlock; }                     \
      |                                          ^~~~~~~
./include/linux/local_lock.h:88:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
   88 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
      | ^~~~~~~~~~~~~~~~~~~
./include/linux/local_lock.h:52:9: note: in expansion of macro '__local_unlock_irqrestore'
   52 |         __local_unlock_irqrestore(this_cpu_ptr(lock), flags)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/local_lock.h:90:21: note: in expansion of macro 'local_unlock_irqrestore'
   90 |                     local_unlock_irqrestore(_T->lock, _T->flags),
      |                     ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/local_lock.h: In function 'class_local_lock_irqsave_constructor':
./include/linux/local_lock_internal.h:127:17: error: implicit declaration of function 'local_irq_save'; did you mean 'local_lock_irqsave'? [-Werror=implicit-function-declaration]
  127 |                 local_irq_save(flags);                          \
      |                 ^~~~~~~~~~~~~~
./include/linux/cleanup.h:480:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
  480 |         _lock;                                                          \
      |         ^~~~~
./include/linux/local_lock.h:88:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
   88 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
      | ^~~~~~~~~~~~~~~~~~~
./include/linux/local_lock.h:31:9: note: in expansion of macro '__local_lock_irqsave'
   31 |         __local_lock_irqsave(this_cpu_ptr(lock), flags)
      |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/local_lock.h:89:21: note: in expansion of macro 'local_lock_irqsave'
   89 |                     local_lock_irqsave(_T->lock, _T->flags),
      |                     ^~~~~~~~~~~~~~~~~~
In file included from ./arch/arc/include/generated/asm/percpu.h:1,
                 from ./include/linux/lockdep.h:15,
                 from ./include/linux/seqlock.h:18:
./include/linux/srcutree.h: In function '__srcu_read_lock_fast':
./include/asm-generic/percpu.h:168:9: error: implicit declaration of function 'raw_local_irq_save' [-Werror=implicit-function-declaration]
  168 |         raw_local_irq_save(__flags);                                    \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/percpu.h:414:41: note: in expansion of macro 'this_cpu_generic_to_op'
  414 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
      |                                         ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_add_1'
  369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
      |                         ^~~~
./include/linux/percpu-defs.h:501:41: note: in expansion of macro '__pcpu_size_call'
  501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
      |                                         ^~~~~~~~~~~~~~~~
./include/linux/percpu-defs.h:511:41: note: in expansion of macro 'this_cpu_add'
  511 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
      |                                         ^~~~~~~~~~~~
./include/linux/srcutree.h:248:17: note: in expansion of macro 'this_cpu_inc'
  248 |                 this_cpu_inc(scp->srcu_locks.counter); /* Y */
      |                 ^~~~~~~~~~~~
./include/asm-generic/percpu.h:170:9: error: implicit declaration of function 'raw_local_irq_restore' [-Werror=implicit-function-declaration]
  170 |         raw_local_irq_restore(__flags);                                 \
      |         ^~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/percpu.h:414:41: note: in expansion of macro 'this_cpu_generic_to_op'
  414 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
      |                                         ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_add_1'
  369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
      |                         ^~~~
./include/linux/percpu-defs.h:501:41: note: in expansion of macro '__pcpu_size_call'
  501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
      |                                         ^~~~~~~~~~~~~~~~
./include/linux/percpu-defs.h:511:41: note: in expansion of macro 'this_cpu_add'
  511 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
      |                                         ^~~~~~~~~~~~
./include/linux/srcutree.h:248:17: note: in expansion of macro 'this_cpu_inc'
  248 |                 this_cpu_inc(scp->srcu_locks.counter); /* Y */
      |                 ^~~~~~~~~~~~
In file included from ./include/linux/mmap_lock.h:15,
                 from ./include/linux/mm.h:17:
./include/linux/sched/mm.h: In function 'in_vfork':
./include/linux/sched/mm.h:237:18: error: invalid use of undefined type 'struct task_struct'
  237 |         ret = tsk->vfork_done &&
      |                  ^~
In file included from ./include/linux/rbtree.h:24,
                 from ./include/linux/mm_types.h:11:
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
./include/linux/rcupdate.h:532:17: note: in definition of macro '__rcu_dereference_check'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                 ^
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
./include/linux/rcupdate.h:532:38: note: in definition of macro '__rcu_dereference_check'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                      ^
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
In file included from <command-line>:
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
././include/linux/compiler_types.h:522:27: note: in definition of macro '__unqual_scalar_typeof'
  522 |                 _Generic((x),                                           \
      |                           ^
./include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
In file included from ./arch/arc/include/generated/asm/rwonce.h:1,
                 from ./include/linux/compiler.h:382,
                 from ./arch/arc/include/asm/ptrace.h:11,
                 from ./arch/arc/include/asm/processor.h:16,
                 from ./include/linux/sched.h:13:
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
./include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                         ^
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:44: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                            ^~
./include/linux/rcupdate.h:535:19: note: in definition of macro '__rcu_dereference_check'
  535 |         ((typeof(*p) __force __kernel *)(local)); \
      |                   ^
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:25: note: in expansion of macro 'rcu_dereference'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                         ^~~~~~~~~~~~~~~
./include/linux/sched/mm.h:238:69: error: invalid use of undefined type 'struct task_struct'
  238 |                         rcu_dereference(tsk->real_parent)->mm == tsk->mm;
      |                                                                     ^~
./include/linux/sched/mm.h: In function 'current_gfp_context':
./include/linux/sched/mm.h:252:48: error: invalid use of undefined type 'struct task_struct'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                                                ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:252:31: note: in expansion of macro 'READ_ONCE'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                               ^~~~~~~~~
./include/linux/sched/mm.h:252:48: error: invalid use of undefined type 'struct task_struct'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                                                ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:252:31: note: in expansion of macro 'READ_ONCE'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                               ^~~~~~~~~
./include/linux/sched/mm.h:252:48: error: invalid use of undefined type 'struct task_struct'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                                                ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:252:31: note: in expansion of macro 'READ_ONCE'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                               ^~~~~~~~~
./include/linux/sched/mm.h:252:48: error: invalid use of undefined type 'struct task_struct'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                                                ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:252:31: note: in expansion of macro 'READ_ONCE'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                               ^~~~~~~~~
./include/linux/sched/mm.h:252:48: error: invalid use of undefined type 'struct task_struct'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                                                ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:252:31: note: in expansion of macro 'READ_ONCE'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                               ^~~~~~~~~
./include/linux/sched/mm.h:252:48: error: invalid use of undefined type 'struct task_struct'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                                                ^~
././include/linux/compiler_types.h:522:27: note: in definition of macro '__unqual_scalar_typeof'
  522 |                 _Generic((x),                                           \
      |                           ^
./include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
./include/linux/sched/mm.h:252:31: note: in expansion of macro 'READ_ONCE'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                               ^~~~~~~~~
./include/linux/sched/mm.h:252:48: error: invalid use of undefined type 'struct task_struct'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                                                ^~
./include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                         ^
./include/linux/sched/mm.h:252:31: note: in expansion of macro 'READ_ONCE'
  252 |         unsigned int pflags = READ_ONCE(current->flags);
      |                               ^~~~~~~~~
./include/linux/sched/mm.h:254:32: error: 'PF_MEMALLOC_NOIO' undeclared (first use in this function)
  254 |         if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS | PF_MEMALLOC_PIN))) {
      |                                ^~~~~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
   77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
./include/linux/sched/mm.h:254:32: note: each undeclared identifier is reported only once for each function it appears in
  254 |         if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS | PF_MEMALLOC_PIN))) {
      |                                ^~~~~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
   77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
./include/linux/sched/mm.h:254:51: error: 'PF_MEMALLOC_NOFS' undeclared (first use in this function)
  254 |         if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS | PF_MEMALLOC_PIN))) {
      |                                                   ^~~~~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
   77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
./include/linux/sched/mm.h:254:70: error: 'PF_MEMALLOC_PIN' undeclared (first use in this function)
  254 |         if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS | PF_MEMALLOC_PIN))) {
      |                                                                      ^~~~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
   77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
./include/linux/sched/mm.h: In function 'memalloc_retry_wait':
./include/linux/sched/mm.h:295:9: error: implicit declaration of function '__set_current_state' [-Werror=implicit-function-declaration]
  295 |         __set_current_state(TASK_UNINTERRUPTIBLE);
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:295:29: error: 'TASK_UNINTERRUPTIBLE' undeclared (first use in this function); did you mean 'FOLL_INTERRUPTIBLE'?
  295 |         __set_current_state(TASK_UNINTERRUPTIBLE);
      |                             ^~~~~~~~~~~~~~~~~~~~
      |                             FOLL_INTERRUPTIBLE
./include/linux/sched/mm.h:300:17: error: implicit declaration of function 'io_schedule_timeout' [-Werror=implicit-function-declaration]
  300 |                 io_schedule_timeout(1);
      |                 ^~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h: In function 'memalloc_flags_save':
./include/linux/sched/mm.h:332:37: error: invalid use of undefined type 'struct task_struct'
  332 |         unsigned oldflags = ~current->flags & flags;
      |                                     ^~
./include/linux/sched/mm.h:333:16: error: invalid use of undefined type 'struct task_struct'
  333 |         current->flags |= flags;
      |                ^~
./include/linux/sched/mm.h: In function 'memalloc_flags_restore':
./include/linux/sched/mm.h:339:16: error: invalid use of undefined type 'struct task_struct'
  339 |         current->flags &= ~flags;
      |                ^~
./include/linux/sched/mm.h: In function 'memalloc_noio_save':
./include/linux/sched/mm.h:356:36: error: 'PF_MEMALLOC_NOIO' undeclared (first use in this function)
  356 |         return memalloc_flags_save(PF_MEMALLOC_NOIO);
      |                                    ^~~~~~~~~~~~~~~~
./include/linux/sched/mm.h: In function 'memalloc_nofs_save':
./include/linux/sched/mm.h:386:36: error: 'PF_MEMALLOC_NOFS' undeclared (first use in this function)
  386 |         return memalloc_flags_save(PF_MEMALLOC_NOFS);
      |                                    ^~~~~~~~~~~~~~~~
./include/linux/sched/mm.h: In function 'memalloc_noreclaim_save':
./include/linux/sched/mm.h:427:36: error: 'PF_MEMALLOC' undeclared (first use in this function)
  427 |         return memalloc_flags_save(PF_MEMALLOC);
      |                                    ^~~~~~~~~~~
./include/linux/sched/mm.h: In function 'memalloc_pin_save':
./include/linux/sched/mm.h:455:36: error: 'PF_MEMALLOC_PIN' undeclared (first use in this function)
  455 |         return memalloc_flags_save(PF_MEMALLOC_PIN);
      |                                    ^~~~~~~~~~~~~~~
./include/linux/sched/mm.h: In function 'membarrier_mm_sync_core_before_usermode':
./include/linux/sched/mm.h:541:20: error: invalid use of undefined type 'struct task_struct'
  541 |         if (current->mm != mm)
      |                    ^~
In file included from ./include/linux/sched/task.h:13,
                 from ./include/linux/sched/signal.h:9,
                 from ./include/linux/rcuwait.h:6,
                 from ./include/linux/mm.h:36:
./include/linux/uaccess.h: In function 'pagefault_disabled_inc':
./include/linux/uaccess.h:244:16: error: invalid use of undefined type 'struct task_struct'
  244 |         current->pagefault_disabled++;
      |                ^~
./include/linux/uaccess.h: In function 'pagefault_disabled_dec':
./include/linux/uaccess.h:249:16: error: invalid use of undefined type 'struct task_struct'
  249 |         current->pagefault_disabled--;
      |                ^~
./include/linux/uaccess.h: In function 'pagefault_disabled':
./include/linux/uaccess.h:284:23: error: invalid use of undefined type 'struct task_struct'
  284 |         return current->pagefault_disabled != 0;
      |                       ^~
./include/linux/sched/task.h: At top level:
./include/linux/sched/task.h:99:41: warning: 'struct pid' declared inside parameter list will not be visible outside of this definition or declaration
   99 | struct task_struct *copy_process(struct pid *pid, int trace, int node,
      |                                         ^~~
./include/linux/sched/task.h: In function 'get_task_struct':
./include/linux/sched/task.h:116:24: error: invalid use of undefined type 'struct task_struct'
  116 |         refcount_inc(&t->usage);
      |                        ^~
./include/linux/sched/task.h: In function 'tryget_task_struct':
./include/linux/sched/task.h:122:40: error: invalid use of undefined type 'struct task_struct'
  122 |         return refcount_inc_not_zero(&t->usage) ? t : NULL;
      |                                        ^~
./include/linux/sched/task.h: In function 'put_task_struct':
./include/linux/sched/task.h:130:38: error: invalid use of undefined type 'struct task_struct'
  130 |         if (!refcount_dec_and_test(&t->usage))
      |                                      ^~
./include/linux/sched/task.h:159:20: error: invalid use of undefined type 'struct task_struct'
  159 |         call_rcu(&t->rcu, __put_task_struct_rcu_cb);
      |                    ^~
./include/linux/sched/task.h: In function 'put_task_struct_many':
./include/linux/sched/task.h:166:41: error: invalid use of undefined type 'struct task_struct'
  166 |         if (refcount_sub_and_test(nr, &t->usage))
      |                                         ^~
./include/linux/sched/task.h: In function 'arch_thread_struct_whitelist':
./include/linux/sched/task.h:178:40: error: invalid application of 'sizeof' to incomplete type 'struct task_struct'
  178 | # define arch_task_struct_size (sizeof(struct task_struct))
      |                                        ^~~~~~
./include/linux/sched/task.h:191:17: note: in expansion of macro 'arch_task_struct_size'
  191 |         *size = arch_task_struct_size - offsetof(struct task_struct, thread);
      |                 ^~~~~~~~~~~~~~~~~~~~~
In file included from ./include/uapi/linux/posix_types.h:5,
                 from ./include/uapi/linux/types.h:14,
                 from ./include/linux/types.h:6,
                 from ./include/uapi/linux/sched.h:5,
                 from ./include/linux/sched.h:10:
./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct task_struct'
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
./include/linux/sched/task.h:191:41: note: in expansion of macro 'offsetof'
  191 |         *size = arch_task_struct_size - offsetof(struct task_struct, thread);
      |                                         ^~~~~~~~
./include/linux/sched/task.h: In function 'task_lock':
./include/linux/sched/task.h:219:21: error: invalid use of undefined type 'struct task_struct'
  219 |         spin_lock(&p->alloc_lock);
      |                     ^~
./include/linux/sched/task.h: In function 'task_unlock':
./include/linux/sched/task.h:224:23: error: invalid use of undefined type 'struct task_struct'
  224 |         spin_unlock(&p->alloc_lock);
      |                       ^~
In file included from ./include/linux/sched/user.h:9,
                 from ./include/linux/cred.h:18,
                 from ./include/linux/sched/signal.h:10:
./include/linux/ratelimit.h: In function 'ratelimit_state_init':
./include/linux/ratelimit.h:14:9: error: implicit declaration of function 'raw_spin_lock_init' [-Werror=implicit-function-declaration]
   14 |         raw_spin_lock_init(&rs->lock);
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/ratelimit.h: In function 'ratelimit_state_reset_interval':
./include/linux/ratelimit.h:44:9: error: implicit declaration of function 'raw_spin_lock_irqsave'; did you mean 'read_seqbegin_or_lock_irqsave'? [-Werror=implicit-function-declaration]
   44 |         raw_spin_lock_irqsave(&rs->lock, flags);
      |         ^~~~~~~~~~~~~~~~~~~~~
      |         read_seqbegin_or_lock_irqsave
./include/linux/ratelimit.h:49:9: error: implicit declaration of function 'raw_spin_unlock_irqrestore'; did you mean 'write_sequnlock_irqrestore'? [-Werror=implicit-function-declaration]
   49 |         raw_spin_unlock_irqrestore(&rs->lock, flags);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |         write_sequnlock_irqrestore
In file included from ./include/asm-generic/bug.h:28,
                 from ./arch/arc/include/asm/bug.h:30,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/thread_info.h:13,
                 from ./include/linux/sched.h:14:
./include/linux/ratelimit.h: In function 'ratelimit_state_exit':
./include/linux/ratelimit.h:61:88: error: invalid use of undefined type 'struct task_struct'
   61 |                 pr_warn("%s: %d output lines suppressed due to ratelimiting\n", current->comm, m);
      |                                                                                        ^~
./include/linux/printk.h:486:33: note: in definition of macro 'printk_index_wrap'
  486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                                 ^~~~~~~~~~~
./include/linux/printk.h:567:9: note: in expansion of macro 'printk'
  567 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
./include/linux/ratelimit.h:61:17: note: in expansion of macro 'pr_warn'
   61 |                 pr_warn("%s: %d output lines suppressed due to ratelimiting\n", current->comm, m);
      |                 ^~~~~~~
./include/linux/cred.h: In function 'override_creds':
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
./include/linux/rcupdate.h:541:19: note: in definition of macro '__rcu_dereference_protected'
  541 |         ((typeof(*p) __force __kernel *)(p)); \
      |                   ^
./include/linux/rcupdate.h:612:29: note: in expansion of macro 'rcu_dereference_protected'
  612 |         typeof(ptr) __tmp = rcu_dereference_protected((rcu_ptr), (c));  \
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
./include/linux/rcupdate.h:541:42: note: in definition of macro '__rcu_dereference_protected'
  541 |         ((typeof(*p) __force __kernel *)(p)); \
      |                                          ^
./include/linux/rcupdate.h:612:29: note: in expansion of macro 'rcu_dereference_protected'
  612 |         typeof(ptr) __tmp = rcu_dereference_protected((rcu_ptr), (c));  \
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                           ^
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                  ^
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                        ^~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:9: note: in expansion of macro 'compiletime_assert'
  575 |         compiletime_assert(__native_word(t),                            \
      |         ^~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:28: note: in expansion of macro '__native_word'
  575 |         compiletime_assert(__native_word(t),                            \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
  141 |         compiletime_assert_atomic_type(*p);                             \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:9: note: in expansion of macro 'compiletime_assert'
  575 |         compiletime_assert(__native_word(t),                            \
      |         ^~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:28: note: in expansion of macro '__native_word'
  575 |         compiletime_assert(__native_word(t),                            \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
  141 |         compiletime_assert_atomic_type(*p);                             \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:9: note: in expansion of macro 'compiletime_assert'
  575 |         compiletime_assert(__native_word(t),                            \
      |         ^~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:28: note: in expansion of macro '__native_word'
  575 |         compiletime_assert(__native_word(t),                            \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
  141 |         compiletime_assert_atomic_type(*p);                             \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:9: note: in expansion of macro 'compiletime_assert'
  575 |         compiletime_assert(__native_word(t),                            \
      |         ^~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:28: note: in expansion of macro '__native_word'
  575 |         compiletime_assert(__native_word(t),                            \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
  141 |         compiletime_assert_atomic_type(*p);                             \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                           ^
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                  ^
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                        ^~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:39: note: in expansion of macro 'RCU_INITIALIZER'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                                       ^~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:43: error: invalid use of undefined type 'struct task_struct'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                        ^~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:39: note: in expansion of macro 'RCU_INITIALIZER'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                                       ^~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:175:16: note: in expansion of macro 'rcu_replace_pointer'
  175 |         return rcu_replace_pointer(current->cred, override_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h: In function 'revert_creds':
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
./include/linux/rcupdate.h:541:19: note: in definition of macro '__rcu_dereference_protected'
  541 |         ((typeof(*p) __force __kernel *)(p)); \
      |                   ^
./include/linux/rcupdate.h:612:29: note: in expansion of macro 'rcu_dereference_protected'
  612 |         typeof(ptr) __tmp = rcu_dereference_protected((rcu_ptr), (c));  \
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
./include/linux/rcupdate.h:541:42: note: in definition of macro '__rcu_dereference_protected'
  541 |         ((typeof(*p) __force __kernel *)(p)); \
      |                                          ^
./include/linux/rcupdate.h:612:29: note: in expansion of macro 'rcu_dereference_protected'
  612 |         typeof(ptr) __tmp = rcu_dereference_protected((rcu_ptr), (c));  \
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                           ^
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                  ^
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                        ^~~
./include/linux/rcupdate.h:594:17: note: in expansion of macro 'WRITE_ONCE'
  594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
      |                 ^~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:9: note: in expansion of macro 'compiletime_assert'
  575 |         compiletime_assert(__native_word(t),                            \
      |         ^~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:28: note: in expansion of macro '__native_word'
  575 |         compiletime_assert(__native_word(t),                            \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
  141 |         compiletime_assert_atomic_type(*p);                             \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:9: note: in expansion of macro 'compiletime_assert'
  575 |         compiletime_assert(__native_word(t),                            \
      |         ^~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:28: note: in expansion of macro '__native_word'
  575 |         compiletime_assert(__native_word(t),                            \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
  141 |         compiletime_assert_atomic_type(*p);                             \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:9: note: in expansion of macro 'compiletime_assert'
  575 |         compiletime_assert(__native_word(t),                            \
      |         ^~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:28: note: in expansion of macro '__native_word'
  575 |         compiletime_assert(__native_word(t),                            \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
  141 |         compiletime_assert_atomic_type(*p);                             \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:9: note: in expansion of macro 'compiletime_assert'
  575 |         compiletime_assert(__native_word(t),                            \
      |         ^~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:575:28: note: in expansion of macro '__native_word'
  575 |         compiletime_assert(__native_word(t),                            \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
  141 |         compiletime_assert_atomic_type(*p);                             \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   60 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                           ^
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                  ^
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                        ^~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:39: note: in expansion of macro 'RCU_INITIALIZER'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                                       ^~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:43: error: invalid use of undefined type 'struct task_struct'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                                           ^~
./include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
   55 |         *(volatile typeof(x) *)&(x) = (val);                            \
      |                                        ^~~
./include/asm-generic/barrier.h:143:9: note: in expansion of macro 'WRITE_ONCE'
  143 |         WRITE_ONCE(*p, v);                                              \
      |         ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:17: note: in expansion of macro 'smp_store_release'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:596:39: note: in expansion of macro 'RCU_INITIALIZER'
  596 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                                       ^~~~~~~~~~~~~~~
./include/linux/rcupdate.h:613:9: note: in expansion of macro 'rcu_assign_pointer'
  613 |         rcu_assign_pointer((rcu_ptr), (ptr));                           \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/cred.h:180:16: note: in expansion of macro 'rcu_replace_pointer'
  180 |         return rcu_replace_pointer(current->cred, revert_cred, 1);
      |                ^~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/sched/signal.h:12:
./include/linux/pid.h: In function 'task_pid':
./include/linux/pid.h:218:20: error: invalid use of undefined type 'struct task_struct'
  218 |         return task->thread_pid;
      |                    ^~
./include/linux/pid.h: In function 'task_pid_nr':
./include/linux/pid.h:236:19: error: invalid use of undefined type 'struct task_struct'
  236 |         return tsk->pid;
      |                   ^~
./include/linux/pid.h: In function 'task_tgid_nr':
./include/linux/pid.h:252:19: error: invalid use of undefined type 'struct task_struct'
  252 |         return tsk->tgid;
      |                   ^~
./include/linux/pid.h: In function 'pid_alive':
./include/linux/pid.h:267:17: error: invalid use of undefined type 'const struct task_struct'
  267 |         return p->thread_pid != NULL;
      |                 ^~
./include/linux/pid.h: In function 'task_ppid_nr_ns':
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
./include/linux/rcupdate.h:532:17: note: in definition of macro '__rcu_dereference_check'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                 ^
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
./include/linux/rcupdate.h:532:38: note: in definition of macro '__rcu_dereference_check'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                      ^
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
././include/linux/compiler_types.h:522:27: note: in definition of macro '__unqual_scalar_typeof'
  522 |                 _Generic((x),                                           \
      |                           ^
./include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
./include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                         ^
./include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
  532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
      |                                                  ^~~~~~~~~
./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
  680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
      |         ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/pid.h:307:58: error: invalid use of undefined type 'const struct task_struct'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                                          ^~
./include/linux/rcupdate.h:535:19: note: in definition of macro '__rcu_dereference_check'
  535 |         ((typeof(*p) __force __kernel *)(local)); \
      |                   ^
./include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
  752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
      |                            ^~~~~~~~~~~~~~~~~~~~~
./include/linux/pid.h:307:39: note: in expansion of macro 'rcu_dereference'
  307 |                 pid = task_tgid_nr_ns(rcu_dereference(tsk->real_parent), ns);
      |                                       ^~~~~~~~~~~~~~~
./include/linux/sched/signal.h: At top level:
./include/linux/sched/signal.h:192:29: error: field 'prev_cputime' has incomplete type
  192 |         struct prev_cputime prev_cputime;
      |                             ^~~~~~~~~~~~
./include/linux/sched/signal.h:197:35: error: field 'ioac' has incomplete type
  197 |         struct task_io_accounting ioac;
      |                                   ^~~~
./include/linux/sched/signal.h: In function 'kernel_dequeue_signal':
./include/linux/sched/signal.h:290:28: error: invalid use of undefined type 'struct task_struct'
  290 |         spin_lock_irq(&task->sighand->siglock);
      |                            ^~
./include/linux/sched/signal.h:291:35: error: invalid use of undefined type 'struct task_struct'
  291 |         ret = dequeue_signal(&task->blocked, &__info, &__type);
      |                                   ^~
./include/linux/sched/signal.h:292:30: error: invalid use of undefined type 'struct task_struct'
  292 |         spin_unlock_irq(&task->sighand->siglock);
      |                              ^~
./include/linux/sched/signal.h: In function 'kernel_signal_stop':
./include/linux/sched/signal.h:299:31: error: invalid use of undefined type 'struct task_struct'
  299 |         spin_lock_irq(&current->sighand->siglock);
      |                               ^~
./include/linux/sched/signal.h:300:20: error: invalid use of undefined type 'struct task_struct'
  300 |         if (current->jobctl & JOBCTL_STOP_DEQUEUED) {
      |                    ^~
./include/linux/sched/signal.h:301:24: error: invalid use of undefined type 'struct task_struct'
  301 |                 current->jobctl |= JOBCTL_STOPPED;
      |                        ^~
./include/linux/sched/signal.h:302:17: error: implicit declaration of function 'set_special_state' [-Werror=implicit-function-declaration]
  302 |                 set_special_state(TASK_STOPPED);
      |                 ^~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:302:35: error: 'TASK_STOPPED' undeclared (first use in this function); did you mean 'CLD_STOPPED'?
  302 |                 set_special_state(TASK_STOPPED);
      |                                   ^~~~~~~~~~~~
      |                                   CLD_STOPPED
./include/linux/sched/signal.h:304:33: error: invalid use of undefined type 'struct task_struct'
  304 |         spin_unlock_irq(&current->sighand->siglock);
      |                                 ^~
./include/linux/sched/signal.h:306:9: error: implicit declaration of function 'schedule'; did you mean 'sched_exec'? [-Werror=implicit-function-declaration]
  306 |         schedule();
      |         ^~~~~~~~
      |         sched_exec
./include/linux/sched/signal.h: In function '__set_notify_signal':
./include/linux/sched/signal.h:357:17: error: implicit declaration of function 'test_and_set_tsk_thread_flag'; did you mean 'test_and_set_ti_thread_flag'? [-Werror=implicit-function-declaration]
  357 |         return !test_and_set_tsk_thread_flag(task, TIF_NOTIFY_SIGNAL) &&
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                 test_and_set_ti_thread_flag
./include/linux/sched/signal.h:358:17: error: implicit declaration of function 'wake_up_state'; did you mean 'wake_up_sync'? [-Werror=implicit-function-declaration]
  358 |                !wake_up_state(task, TASK_INTERRUPTIBLE);
      |                 ^~~~~~~~~~~~~
      |                 wake_up_sync
./include/linux/sched/signal.h:358:37: error: 'TASK_INTERRUPTIBLE' undeclared (first use in this function); did you mean 'FOLL_INTERRUPTIBLE'?
  358 |                !wake_up_state(task, TASK_INTERRUPTIBLE);
      |                                     ^~~~~~~~~~~~~~~~~~
      |                                     FOLL_INTERRUPTIBLE
./include/linux/sched/signal.h: In function 'set_notify_signal':
./include/linux/sched/signal.h:368:17: error: implicit declaration of function 'kick_process'; did you mean 'copy_process'? [-Werror=implicit-function-declaration]
  368 |                 kick_process(task);
      |                 ^~~~~~~~~~~~
      |                 copy_process
./include/linux/sched/signal.h: In function 'restart_syscall':
./include/linux/sched/signal.h:373:9: error: implicit declaration of function 'set_tsk_thread_flag'; did you mean 'set_ti_thread_flag'? [-Werror=implicit-function-declaration]
  373 |         set_tsk_thread_flag(current, TIF_SIGPENDING);
      |         ^~~~~~~~~~~~~~~~~~~
      |         set_ti_thread_flag
./include/linux/sched/signal.h: In function 'task_sigpending':
./include/linux/sched/signal.h:379:25: error: implicit declaration of function 'test_tsk_thread_flag'; did you mean 'test_ti_thread_flag'? [-Werror=implicit-function-declaration]
  379 |         return unlikely(test_tsk_thread_flag(p,TIF_SIGPENDING));
      |                         ^~~~~~~~~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
   77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
./include/linux/sched/signal.h: In function '__fatal_signal_pending':
./include/linux/sched/signal.h:396:39: error: invalid use of undefined type 'struct task_struct'
  396 |         return unlikely(sigismember(&p->pending.signal, SIGKILL));
      |                                       ^~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
   77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
./include/linux/sched/signal.h: In function 'signal_pending_state':
./include/linux/sched/signal.h:406:24: error: 'TASK_INTERRUPTIBLE' undeclared (first use in this function); did you mean 'FOLL_INTERRUPTIBLE'?
  406 |         if (!(state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
      |                        ^~~~~~~~~~~~~~~~~~
      |                        FOLL_INTERRUPTIBLE
./include/linux/sched/signal.h:406:45: error: 'TASK_WAKEKILL' undeclared (first use in this function)
  406 |         if (!(state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
      |                                             ^~~~~~~~~~~~~
./include/linux/sched/signal.h: In function 'signal_wake_up':
./include/linux/sched/signal.h:442:25: error: invalid use of undefined type 'struct task_struct'
  442 |         if (fatal && !(t->jobctl & JOBCTL_PTRACE_FROZEN)) {
      |                         ^~
./include/linux/sched/signal.h:443:18: error: invalid use of undefined type 'struct task_struct'
  443 |                 t->jobctl &= ~(JOBCTL_STOPPED | JOBCTL_TRACED);
      |                  ^~
./include/linux/sched/signal.h:444:25: error: 'TASK_WAKEKILL' undeclared (first use in this function)
  444 |                 state = TASK_WAKEKILL | __TASK_TRACED;
      |                         ^~~~~~~~~~~~~
./include/linux/sched/signal.h:444:41: error: '__TASK_TRACED' undeclared (first use in this function); did you mean '_SLAB_TRACE'?
  444 |                 state = TASK_WAKEKILL | __TASK_TRACED;
      |                                         ^~~~~~~~~~~~~
      |                                         _SLAB_TRACE
./include/linux/sched/signal.h: In function 'ptrace_signal_wake_up':
./include/linux/sched/signal.h:452:18: error: invalid use of undefined type 'struct task_struct'
  452 |                 t->jobctl &= ~JOBCTL_TRACED;
      |                  ^~
./include/linux/sched/signal.h:453:25: error: '__TASK_TRACED' undeclared (first use in this function); did you mean '_SLAB_TRACE'?
  453 |                 state = __TASK_TRACED;
      |                         ^~~~~~~~~~~~~
      |                         _SLAB_TRACE
./include/linux/sched/signal.h: In function 'clear_tsk_restore_sigmask':
./include/linux/sched/signal.h:484:9: error: implicit declaration of function 'clear_tsk_thread_flag'; did you mean 'clear_ti_thread_flag'? [-Werror=implicit-function-declaration]
  484 |         clear_tsk_thread_flag(task, TIF_RESTORE_SIGMASK);
      |         ^~~~~~~~~~~~~~~~~~~~~
      |         clear_ti_thread_flag
./include/linux/sched/signal.h: In function 'restore_saved_sigmask':
./include/linux/sched/signal.h:539:47: error: invalid use of undefined type 'struct task_struct'
  539 |                 __set_current_blocked(&current->saved_sigmask);
      |                                               ^~
./include/linux/sched/signal.h: In function 'sigmask_to_save':
./include/linux/sched/signal.h:554:33: error: invalid use of undefined type 'struct task_struct'
  554 |         sigset_t *res = &current->blocked;
      |                                 ^~
./include/linux/sched/signal.h:556:31: error: invalid use of undefined type 'struct task_struct'
  556 |                 res = &current->saved_sigmask;
      |                               ^~
./include/linux/sched/signal.h: In function 'kill_cad_pid':
./include/linux/sched/signal.h:562:25: error: 'cad_pid' undeclared (first use in this function)
  562 |         return kill_pid(cad_pid, sig, priv);
      |                         ^~~~~~~
./include/linux/sched/signal.h: In function '__on_sig_stack':
./include/linux/sched/signal.h:575:28: error: invalid use of undefined type 'struct task_struct'
  575 |         return sp > current->sas_ss_sp &&
      |                            ^~
./include/linux/sched/signal.h:576:29: error: invalid use of undefined type 'struct task_struct'
  576 |                 sp - current->sas_ss_sp <= current->sas_ss_size;
      |                             ^~
./include/linux/sched/signal.h:576:51: error: invalid use of undefined type 'struct task_struct'
  576 |                 sp - current->sas_ss_sp <= current->sas_ss_size;
      |                                                   ^~
./include/linux/sched/signal.h: In function 'on_sig_stack':
./include/linux/sched/signal.h:594:20: error: invalid use of undefined type 'struct task_struct'
  594 |         if (current->sas_ss_flags & SS_AUTODISARM)
      |                    ^~
./include/linux/sched/signal.h: In function 'sas_ss_flags':
./include/linux/sched/signal.h:602:21: error: invalid use of undefined type 'struct task_struct'
  602 |         if (!current->sas_ss_size)
      |                     ^~
./include/linux/sched/signal.h: In function 'sas_ss_reset':
./include/linux/sched/signal.h:610:10: error: invalid use of undefined type 'struct task_struct'
  610 |         p->sas_ss_sp = 0;
      |          ^~
./include/linux/sched/signal.h:611:10: error: invalid use of undefined type 'struct task_struct'
  611 |         p->sas_ss_size = 0;
      |          ^~
./include/linux/sched/signal.h:612:10: error: invalid use of undefined type 'struct task_struct'
  612 |         p->sas_ss_flags = SS_DISABLE;
      |          ^~
./include/linux/sched/signal.h: In function 'sigsp':
./include/linux/sched/signal.h:621:31: error: invalid use of undefined type 'struct task_struct'
  621 |                 return current->sas_ss_sp + current->sas_ss_size;
      |                               ^~
./include/linux/sched/signal.h:621:52: error: invalid use of undefined type 'struct task_struct'
  621 |                 return current->sas_ss_sp + current->sas_ss_size;
      |                                                    ^~
./include/linux/sched/signal.h: In function 'task_pid_type':
./include/linux/sched/signal.h:671:27: error: invalid use of undefined type 'struct task_struct'
  671 |                 pid = task->signal->pids[type];
      |                           ^~
./include/linux/sched/signal.h: In function 'task_tgid':
./include/linux/sched/signal.h:677:20: error: invalid use of undefined type 'struct task_struct'
  677 |         return task->signal->pids[PIDTYPE_TGID];
      |                    ^~
./include/linux/sched/signal.h: In function 'task_pgrp':
./include/linux/sched/signal.h:687:20: error: invalid use of undefined type 'struct task_struct'
  687 |         return task->signal->pids[PIDTYPE_PGID];
      |                    ^~
./include/linux/sched/signal.h: In function 'task_session':
./include/linux/sched/signal.h:692:20: error: invalid use of undefined type 'struct task_struct'
  692 |         return task->signal->pids[PIDTYPE_SID];
      |                    ^~
./include/linux/sched/signal.h: In function 'get_nr_threads':
./include/linux/sched/signal.h:697:20: error: invalid use of undefined type 'struct task_struct'
  697 |         return task->signal->nr_threads;
      |                    ^~
./include/linux/sched/signal.h: In function 'thread_group_leader':
./include/linux/sched/signal.h:702:17: error: invalid use of undefined type 'struct task_struct'
  702 |         return p->exit_signal >= 0;
      |                 ^~
./include/linux/sched/signal.h: In function 'same_thread_group':
./include/linux/sched/signal.h:708:18: error: invalid use of undefined type 'struct task_struct'
  708 |         return p1->signal == p2->signal;
      |                  ^~
./include/linux/sched/signal.h:708:32: error: invalid use of undefined type 'struct task_struct'
  708 |         return p1->signal == p2->signal;
      |                                ^~
In file included from ./include/linux/sched/signal.h:5:
./include/linux/sched/signal.h: In function '__next_thread':
./include/linux/sched/signal.h:716:40: error: invalid use of undefined type 'struct task_struct'
  716 |         return list_next_or_null_rcu(&p->signal->thread_head,
      |                                        ^~
./include/linux/rculist.h:428:37: note: in definition of macro 'list_next_or_null_rcu'
  428 |         struct list_head *__head = (head); \
      |                                     ^~~~
./include/linux/sched/signal.h:717:43: error: invalid use of undefined type 'struct task_struct'
  717 |                                         &p->thread_node,
      |                                           ^~
./include/linux/rculist.h:429:36: note: in definition of macro 'list_next_or_null_rcu'
  429 |         struct list_head *__ptr = (ptr); \
      |                                    ^~~
In file included from ./include/linux/init.h:5,
                 from ./include/linux/printk.h:6:
./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct task_struct'
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
./include/linux/rculist.h:364:9: note: in expansion of macro 'container_of'
  364 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./include/linux/rculist.h:431:36: note: in expansion of macro 'list_entry_rcu'
  431 |         likely(__next != __head) ? list_entry_rcu(__next, type, \
      |                                    ^~~~~~~~~~~~~~
./include/linux/sched/signal.h:716:16: note: in expansion of macro 'list_next_or_null_rcu'
  716 |         return list_next_or_null_rcu(&p->signal->thread_head,
      |                ^~~~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:507:27: error: expression in static assertion is not an integer
  507 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
   21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
./include/linux/rculist.h:364:9: note: in expansion of macro 'container_of'
  364 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./include/linux/rculist.h:431:36: note: in expansion of macro 'list_entry_rcu'
  431 |         likely(__next != __head) ? list_entry_rcu(__next, type, \
      |                                    ^~~~~~~~~~~~~~
./include/linux/sched/signal.h:716:16: note: in expansion of macro 'list_next_or_null_rcu'
  716 |         return list_next_or_null_rcu(&p->signal->thread_head,
      |                ^~~~~~~~~~~~~~~~~~~~~
./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct task_struct'
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
   24 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
./include/linux/rculist.h:364:9: note: in expansion of macro 'container_of'
  364 |         container_of(READ_ONCE(ptr), type, member)
      |         ^~~~~~~~~~~~
./include/linux/rculist.h:431:36: note: in expansion of macro 'list_entry_rcu'
  431 |         likely(__next != __head) ? list_entry_rcu(__next, type, \
      |                                    ^~~~~~~~~~~~~~
./include/linux/sched/signal.h:716:16: note: in expansion of macro 'list_next_or_null_rcu'
  716 |         return list_next_or_null_rcu(&p->signal->thread_head,
      |                ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h: In function 'next_thread':
./include/linux/sched/signal.h:724:37: error: invalid use of undefined type 'struct task_struct'
  724 |         return __next_thread(p) ?: p->group_leader;
      |                                     ^~
./include/linux/sched/signal.h: In function 'thread_group_empty':
./include/linux/sched/signal.h:730:31: error: invalid use of undefined type 'struct task_struct'
  730 |                list_is_last(&p->thread_node, &p->signal->thread_head);
      |                               ^~
./include/linux/sched/signal.h:730:48: error: invalid use of undefined type 'struct task_struct'
  730 |                list_is_last(&p->thread_node, &p->signal->thread_head);
      |                                                ^~
./include/linux/sched/signal.h: In function 'unlock_task_sighand':
./include/linux/sched/signal.h:752:37: error: invalid use of undefined type 'struct task_struct'
  752 |         spin_unlock_irqrestore(&task->sighand->siglock, *flags);
      |                                     ^~
./include/linux/sched/signal.h: In function 'task_rlimit':
./include/linux/sched/signal.h:764:30: error: invalid use of undefined type 'const struct task_struct'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:764:16: note: in expansion of macro 'READ_ONCE'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:764:30: error: invalid use of undefined type 'const struct task_struct'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:764:16: note: in expansion of macro 'READ_ONCE'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:764:30: error: invalid use of undefined type 'const struct task_struct'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:764:16: note: in expansion of macro 'READ_ONCE'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:764:30: error: invalid use of undefined type 'const struct task_struct'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:764:16: note: in expansion of macro 'READ_ONCE'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:764:30: error: invalid use of undefined type 'const struct task_struct'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:764:16: note: in expansion of macro 'READ_ONCE'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:764:30: error: invalid use of undefined type 'const struct task_struct'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                              ^~
././include/linux/compiler_types.h:522:27: note: in definition of macro '__unqual_scalar_typeof'
  522 |                 _Generic((x),                                           \
      |                           ^
./include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
./include/linux/sched/signal.h:764:16: note: in expansion of macro 'READ_ONCE'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:764:30: error: invalid use of undefined type 'const struct task_struct'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                              ^~
./include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                         ^
./include/linux/sched/signal.h:764:16: note: in expansion of macro 'READ_ONCE'
  764 |         return READ_ONCE(task->signal->rlim[limit].rlim_cur);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:762:30: warning: parameter 'limit' set but not used [-Wunused-but-set-parameter]
  762 |                 unsigned int limit)
      |                 ~~~~~~~~~~~~~^~~~~
./include/linux/sched/signal.h: In function 'task_rlimit_max':
./include/linux/sched/signal.h:770:30: error: invalid use of undefined type 'const struct task_struct'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:770:16: note: in expansion of macro 'READ_ONCE'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:770:30: error: invalid use of undefined type 'const struct task_struct'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:770:16: note: in expansion of macro 'READ_ONCE'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:770:30: error: invalid use of undefined type 'const struct task_struct'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:770:16: note: in expansion of macro 'READ_ONCE'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:770:30: error: invalid use of undefined type 'const struct task_struct'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:770:16: note: in expansion of macro 'READ_ONCE'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:770:30: error: invalid use of undefined type 'const struct task_struct'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                              ^~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:770:16: note: in expansion of macro 'READ_ONCE'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:770:30: error: invalid use of undefined type 'const struct task_struct'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                              ^~
././include/linux/compiler_types.h:522:27: note: in definition of macro '__unqual_scalar_typeof'
  522 |                 _Generic((x),                                           \
      |                           ^
./include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
./include/linux/sched/signal.h:770:16: note: in expansion of macro 'READ_ONCE'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:770:30: error: invalid use of undefined type 'const struct task_struct'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                              ^~
./include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                         ^
./include/linux/sched/signal.h:770:16: note: in expansion of macro 'READ_ONCE'
  770 |         return READ_ONCE(task->signal->rlim[limit].rlim_max);
      |                ^~~~~~~~~
./include/linux/sched/signal.h:768:30: warning: parameter 'limit' set but not used [-Wunused-but-set-parameter]
  768 |                 unsigned int limit)
      |                 ~~~~~~~~~~~~~^~~~~
./include/linux/mm.h: In function 'vma_is_foreign':
./include/linux/mm.h:878:21: error: invalid use of undefined type 'struct task_struct'
  878 |         if (!current->mm)
      |                     ^~
./include/linux/mm.h:881:20: error: invalid use of undefined type 'struct task_struct'
  881 |         if (current->mm != vma->vm_mm)
      |                    ^~
In file included from ./include/linux/ioprio.h:6,
                 from ./include/linux/fs.h:39,
                 from ./include/linux/huge_mm.h:7,
                 from ./include/linux/mm.h:1065:
./include/linux/sched/rt.h: In function 'rt_task':
./include/linux/sched/rt.h:25:25: error: invalid use of undefined type 'struct task_struct'
   25 |         return rt_prio(p->prio);
      |                         ^~
./include/linux/sched/rt.h: In function 'rt_or_dl_task':
./include/linux/sched/rt.h:35:31: error: invalid use of undefined type 'struct task_struct'
   35 |         return rt_or_dl_prio(p->prio);
      |                               ^~
./include/linux/sched/rt.h: In function 'rt_or_dl_task_policy':
./include/linux/sched/rt.h:44:25: error: invalid use of undefined type 'struct task_struct'
   44 |         int policy = tsk->policy;
      |                         ^~
./include/linux/sched/rt.h: In function 'rt_mutex_get_top_task':
./include/linux/sched/rt.h:63:17: error: invalid use of undefined type 'struct task_struct'
   63 |         return p->pi_top_task;
      |                 ^~
In file included from ./include/linux/ioprio.h:7:
./include/linux/iocontext.h: In function 'copy_io':
./include/linux/iocontext.h:124:21: error: invalid use of undefined type 'struct task_struct'
  124 |         if (!current->io_context)
      |                     ^~
./include/linux/ioprio.h: In function 'task_nice_ioprio':
./include/linux/ioprio.h:32:17: error: implicit declaration of function 'task_nice'; did you mean 'task_pid'? [-Werror=implicit-function-declaration]
   32 |         return (task_nice(task) + 20) / 5;
      |                 ^~~~~~~~~
      |                 task_pid
./include/linux/ioprio.h: In function 'task_nice_ioclass':
./include/linux/ioprio.h:41:17: error: invalid use of undefined type 'struct task_struct'
   41 |         if (task->policy == SCHED_IDLE)
      |                 ^~
./include/linux/ioprio.h: In function '__get_task_ioprio':
./include/linux/ioprio.h:59:35: error: invalid use of undefined type 'struct task_struct'
   59 |         struct io_context *ioc = p->io_context;
      |                                   ^~
./include/linux/ioprio.h:67:39: error: invalid use of undefined type 'struct task_struct'
   67 |                 lockdep_assert_held(&p->alloc_lock);
      |                                       ^~
./include/linux/lockdep.h:392:61: note: in definition of macro 'lockdep_assert_held'
  392 | #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
      |                                                             ^
In file included from ./include/linux/fs.h:45:
./include/linux/mnt_idmapping.h: In function 'mapped_fsuid':
./include/linux/cred.h:275:42: error: invalid use of undefined type 'struct task_struct'
  275 |         rcu_dereference_protected(current->cred, 1)
      |                                          ^~
./include/linux/mnt_idmapping.h:109:50: note: in definition of macro 'VFSUIDT_INIT'
  109 | #define VFSUIDT_INIT(val) (vfsuid_t){ __kuid_val(val) }
      |                                                  ^~~
./include/linux/rcupdate.h:743:9: note: in expansion of macro '__rcu_dereference_protected'
  743 |         __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:275:9: note: in expansion of macro 'rcu_dereference_protected'
  275 |         rcu_dereference_protected(current->cred, 1)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:354:9: note: in expansion of macro 'current_cred'
  354 |         current_cred()->xxx;                    \
      |         ^~~~~~~~~~~~
./include/linux/cred.h:363:34: note: in expansion of macro 'current_cred_xxx'
  363 | #define current_fsuid()         (current_cred_xxx(fsuid))
      |                                  ^~~~~~~~~~~~~~~~
./include/linux/mnt_idmapping.h:231:59: note: in expansion of macro 'current_fsuid'
  231 |         return from_vfsuid(idmap, fs_userns, VFSUIDT_INIT(current_fsuid()));
      |                                                           ^~~~~~~~~~~~~
./include/linux/cred.h:275:42: error: invalid use of undefined type 'struct task_struct'
  275 |         rcu_dereference_protected(current->cred, 1)
      |                                          ^~
./include/linux/mnt_idmapping.h:109:50: note: in definition of macro 'VFSUIDT_INIT'
  109 | #define VFSUIDT_INIT(val) (vfsuid_t){ __kuid_val(val) }
      |                                                  ^~~
./include/linux/rcupdate.h:743:9: note: in expansion of macro '__rcu_dereference_protected'
  743 |         __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:275:9: note: in expansion of macro 'rcu_dereference_protected'
  275 |         rcu_dereference_protected(current->cred, 1)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:354:9: note: in expansion of macro 'current_cred'
  354 |         current_cred()->xxx;                    \
      |         ^~~~~~~~~~~~
./include/linux/cred.h:363:34: note: in expansion of macro 'current_cred_xxx'
  363 | #define current_fsuid()         (current_cred_xxx(fsuid))
      |                                  ^~~~~~~~~~~~~~~~
./include/linux/mnt_idmapping.h:231:59: note: in expansion of macro 'current_fsuid'
  231 |         return from_vfsuid(idmap, fs_userns, VFSUIDT_INIT(current_fsuid()));
      |                                                           ^~~~~~~~~~~~~
./include/linux/mnt_idmapping.h: In function 'mapped_fsgid':
./include/linux/cred.h:275:42: error: invalid use of undefined type 'struct task_struct'
  275 |         rcu_dereference_protected(current->cred, 1)
      |                                          ^~
./include/linux/mnt_idmapping.h:110:50: note: in definition of macro 'VFSGIDT_INIT'
  110 | #define VFSGIDT_INIT(val) (vfsgid_t){ __kgid_val(val) }
      |                                                  ^~~
./include/linux/rcupdate.h:743:9: note: in expansion of macro '__rcu_dereference_protected'
  743 |         __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:275:9: note: in expansion of macro 'rcu_dereference_protected'
  275 |         rcu_dereference_protected(current->cred, 1)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:354:9: note: in expansion of macro 'current_cred'
  354 |         current_cred()->xxx;                    \
      |         ^~~~~~~~~~~~
./include/linux/cred.h:364:34: note: in expansion of macro 'current_cred_xxx'
  364 | #define current_fsgid()         (current_cred_xxx(fsgid))
      |                                  ^~~~~~~~~~~~~~~~
./include/linux/mnt_idmapping.h:250:59: note: in expansion of macro 'current_fsgid'
  250 |         return from_vfsgid(idmap, fs_userns, VFSGIDT_INIT(current_fsgid()));
      |                                                           ^~~~~~~~~~~~~
./include/linux/cred.h:275:42: error: invalid use of undefined type 'struct task_struct'
  275 |         rcu_dereference_protected(current->cred, 1)
      |                                          ^~
./include/linux/mnt_idmapping.h:110:50: note: in definition of macro 'VFSGIDT_INIT'
  110 | #define VFSGIDT_INIT(val) (vfsgid_t){ __kgid_val(val) }
      |                                                  ^~~
./include/linux/rcupdate.h:743:9: note: in expansion of macro '__rcu_dereference_protected'
  743 |         __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:275:9: note: in expansion of macro 'rcu_dereference_protected'
  275 |         rcu_dereference_protected(current->cred, 1)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/cred.h:354:9: note: in expansion of macro 'current_cred'
  354 |         current_cred()->xxx;                    \
      |         ^~~~~~~~~~~~
./include/linux/cred.h:364:34: note: in expansion of macro 'current_cred_xxx'
  364 | #define current_fsgid()         (current_cred_xxx(fsgid))
      |                                  ^~~~~~~~~~~~~~~~
./include/linux/mnt_idmapping.h:250:59: note: in expansion of macro 'current_fsgid'
  250 |         return from_vfsgid(idmap, fs_userns, VFSGIDT_INIT(current_fsgid()));
      |                                                           ^~~~~~~~~~~~~
./include/linux/spinlock.h: At top level:
./include/linux/spinlock.h:349:29: warning: conflicting types for 'spin_lock'; have 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  349 | static __always_inline void spin_lock(spinlock_t *lock)
      |                             ^~~~~~~~~
./include/linux/spinlock.h:349:29: error: static declaration of 'spin_lock' follows non-static declaration
./include/linux/seqlock.h:876:9: note: previous implicit declaration of 'spin_lock' with type 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  876 |         spin_lock(&sl->lock);
      |         ^~~~~~~~~
./include/linux/spinlock.h:354:29: warning: conflicting types for 'spin_lock_bh'; have 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  354 | static __always_inline void spin_lock_bh(spinlock_t *lock)
      |                             ^~~~~~~~~~~~
./include/linux/spinlock.h:354:29: error: static declaration of 'spin_lock_bh' follows non-static declaration
./include/linux/seqlock.h:902:9: note: previous implicit declaration of 'spin_lock_bh' with type 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  902 |         spin_lock_bh(&sl->lock);
      |         ^~~~~~~~~~~~
./include/linux/spinlock.h:374:29: warning: conflicting types for 'spin_lock_irq'; have 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  374 | static __always_inline void spin_lock_irq(spinlock_t *lock)
      |                             ^~~~~~~~~~~~~
./include/linux/spinlock.h:374:29: error: static declaration of 'spin_lock_irq' follows non-static declaration
./include/linux/seqlock.h:929:9: note: previous implicit declaration of 'spin_lock_irq' with type 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  929 |         spin_lock_irq(&sl->lock);
      |         ^~~~~~~~~~~~~
./include/linux/spinlock.h:389:29: warning: conflicting types for 'spin_unlock'; have 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  389 | static __always_inline void spin_unlock(spinlock_t *lock)
      |                             ^~~~~~~~~~~
./include/linux/spinlock.h:389:29: error: static declaration of 'spin_unlock' follows non-static declaration
./include/linux/seqlock.h:890:9: note: previous implicit declaration of 'spin_unlock' with type 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  890 |         spin_unlock(&sl->lock);
      |         ^~~~~~~~~~~
./include/linux/spinlock.h:394:29: warning: conflicting types for 'spin_unlock_bh'; have 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  394 | static __always_inline void spin_unlock_bh(spinlock_t *lock)
      |                             ^~~~~~~~~~~~~~
./include/linux/spinlock.h:394:29: error: static declaration of 'spin_unlock_bh' follows non-static declaration
./include/linux/seqlock.h:917:9: note: previous implicit declaration of 'spin_unlock_bh' with type 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  917 |         spin_unlock_bh(&sl->lock);
      |         ^~~~~~~~~~~~~~
./include/linux/spinlock.h:399:29: warning: conflicting types for 'spin_unlock_irq'; have 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  399 | static __always_inline void spin_unlock_irq(spinlock_t *lock)
      |                             ^~~~~~~~~~~~~~~
./include/linux/spinlock.h:399:29: error: static declaration of 'spin_unlock_irq' follows non-static declaration
./include/linux/seqlock.h:943:9: note: previous implicit declaration of 'spin_unlock_irq' with type 'void(spinlock_t *)' {aka 'void(struct spinlock *)'}
  943 |         spin_unlock_irq(&sl->lock);
      |         ^~~~~~~~~~~~~~~
./include/linux/spinlock.h:404:29: warning: conflicting types for 'spin_unlock_irqrestore'; have 'void(spinlock_t *, long unsigned int)' {aka 'void(struct spinlock *, long unsigned int)'}
  404 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
      |                             ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/spinlock.h:404:29: error: static declaration of 'spin_unlock_irqrestore' follows non-static declaration
./include/linux/seqlock.h:981:9: note: previous implicit declaration of 'spin_unlock_irqrestore' with type 'void(spinlock_t *, long unsigned int)' {aka 'void(struct spinlock *, long unsigned int)'}
  981 |         spin_unlock_irqrestore(&sl->lock, flags);
      |         ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched.h:332:17: warning: conflicting types for 'schedule'; have 'void(void)'
  332 | asmlinkage void schedule(void);
      |                 ^~~~~~~~
./include/linux/sched/signal.h:306:9: note: previous implicit declaration of 'schedule' with type 'void(void)'
  306 |         schedule();
      |         ^~~~~~~~
./include/linux/sched.h:341:13: error: conflicting types for 'io_schedule_timeout'; have 'long int(long int)'
  341 | extern long io_schedule_timeout(long timeout);
      |             ^~~~~~~~~~~~~~~~~~~
./include/linux/sched/mm.h:300:17: note: previous implicit declaration of 'io_schedule_timeout' with type 'int()'
  300 |                 io_schedule_timeout(1);
      |                 ^~~~~~~~~~~~~~~~~~~
./include/linux/sched.h:1885:19: error: static declaration of 'task_nice' follows non-static declaration
 1885 | static inline int task_nice(const struct task_struct *p)
      |                   ^~~~~~~~~
./include/linux/ioprio.h:32:17: note: previous implicit declaration of 'task_nice' with type 'int()'
   32 |         return (task_nice(task) + 20) / 5;
      |                 ^~~~~~~~~
./include/linux/sched.h:1962:13: warning: conflicting types for 'kick_process'; have 'void(struct task_struct *)'
 1962 | extern void kick_process(struct task_struct *tsk);
      |             ^~~~~~~~~~~~
./include/linux/sched/signal.h:368:17: note: previous implicit declaration of 'kick_process' with type 'void(struct task_struct *)'
  368 |                 kick_process(task);
      |                 ^~~~~~~~~~~~
./include/linux/sched.h:2005:20: warning: conflicting types for 'set_tsk_thread_flag'; have 'void(struct task_struct *, int)'
 2005 | static inline void set_tsk_thread_flag(struct task_struct *tsk, int flag)
      |                    ^~~~~~~~~~~~~~~~~~~
./include/linux/sched.h:2005:20: error: static declaration of 'set_tsk_thread_flag' follows non-static declaration
./include/linux/sched/signal.h:373:9: note: previous implicit declaration of 'set_tsk_thread_flag' with type 'void(struct task_struct *, int)'
  373 |         set_tsk_thread_flag(current, TIF_SIGPENDING);
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/sched.h:2010:20: warning: conflicting types for 'clear_tsk_thread_flag'; have 'void(struct task_struct *, int)'
 2010 | static inline void clear_tsk_thread_flag(struct task_struct *tsk, int flag)
      |                    ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched.h:2010:20: error: static declaration of 'clear_tsk_thread_flag' follows non-static declaration
./include/linux/sched/signal.h:484:9: note: previous implicit declaration of 'clear_tsk_thread_flag' with type 'void(struct task_struct *, int)'
  484 |         clear_tsk_thread_flag(task, TIF_RESTORE_SIGMASK);
      |         ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched.h:2021:19: error: static declaration of 'test_and_set_tsk_thread_flag' follows non-static declaration
 2021 | static inline int test_and_set_tsk_thread_flag(struct task_struct *tsk, int flag)
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:357:17: note: previous implicit declaration of 'test_and_set_tsk_thread_flag' with type 'int()'
  357 |         return !test_and_set_tsk_thread_flag(task, TIF_NOTIFY_SIGNAL) &&
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/sched.h:2031:19: error: static declaration of 'test_tsk_thread_flag' follows non-static declaration
 2031 | static inline int test_tsk_thread_flag(struct task_struct *tsk, int flag)
      |                   ^~~~~~~~~~~~~~~~~~~~
./include/linux/sched/signal.h:379:25: note: previous implicit declaration of 'test_tsk_thread_flag' with type 'int()'
  379 |         return unlikely(test_tsk_thread_flag(p,TIF_SIGPENDING));
      |                         ^~~~~~~~~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
   77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
cc1: some warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## haps_hs_smp_defconfig on (arc):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68ac20b9233e484a3faf3f31


#kernelci issue maestro:77f9f128f5960f71dace74e7d3745d41f54a026c

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

