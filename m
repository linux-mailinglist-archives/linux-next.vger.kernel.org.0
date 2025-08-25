Return-Path: <linux-next+bounces-8091-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3160B33D65
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 12:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD27B205780
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 10:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECEE2DC34A;
	Mon, 25 Aug 2025 10:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xP+NiJNf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612E2DF3D1
	for <linux-next@vger.kernel.org>; Mon, 25 Aug 2025 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756119550; cv=none; b=Tg2002EUsXIKTjaGMdopauFaMTAl2DzzacnmEG1DTP3jea9T55ETSdFPmENwSPwg1v73rt7495gH3BvTnfdFuS4z9+w+i3Pa7ky177WP0iAQQl/hYdhNHXu5yP0Ji7KpEp/Lvbh65SJAaJ7TypJNzdeCLSwjGwoIz0Y1om2uasg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756119550; c=relaxed/simple;
	bh=ZAPQqdfElumZx93djh+a1RPX1/41EgHkA5Cbly2pd+8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MZzrkatJmOONWh1uu8FVdqZOU0syRr2AeBHv3hNLJWh8T2gjvZ2vsQwB0k+ccdk1t5ShN0f5hqQGN8d8hKvDYMx9Xu+Dy0SnkJu3WR2kypixZwSJ9MUHhYt4zDpeOEdyMYF051xJxKLl+5S0aqUyjD/1EWA41mrPYk6CVmI2OUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xP+NiJNf; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e39ec6f30so3971020b3a.2
        for <linux-next@vger.kernel.org>; Mon, 25 Aug 2025 03:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1756119548; x=1756724348; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aBFsQdctMbfTsLlG90EZnaYggdtmj787Hnpx1sHfo4=;
        b=xP+NiJNf4e8dZ7O01CJIO8FpQKKPOTchSlCMf64P3CAy5jEtXb46VrWi3a5qfN1OK0
         +HCZhznwTjE48kewGk1KrDsflLdsBENPCspYI67bMctyjvY59o6/IbHptGH1scMMNGpD
         ghoE7EzSkgIZAbZdkoJzBUa48ChSoERzcooBCDCzYwrXtv11wLMUJVBYsfQD9qcKVvPN
         FCxXWvxJUG4G1BFXdpZ5hDPblEcSyZLfhDcCyV5/0RT3MJzfOis6NH6qd1AokpTVWA8I
         2y/CIY0rt/E0LVSFGLP34y2Bmb5hQRZUt7/rtm7CO74W6RvZmILWtdU+Beg9HYjn1Jcw
         b8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756119548; x=1756724348;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/aBFsQdctMbfTsLlG90EZnaYggdtmj787Hnpx1sHfo4=;
        b=ZygbCkHY2ykubMiBOSJo45MkzJW1xYqpGCZK4r2AnGlqMy30oLtZMJkjclNPGNhWqy
         BTuFahcqYfAG2zIdtp1CHrzEwrTnQHxfj+BNFcKl0NY3xAaaKF491GfhajdU4i6Vgg8w
         27+xOTGE2aALlchi/Wqfe7xTnUinN6dewwNuAGHWBZ/iL0KKG5YGSJisNIkncT3ndvog
         5HAvSAh8L/DS784CNabGOfkNPz6aMA9mTE/XkcxTdNWXfeoaykirJJ80NpEVRzBHt7Pa
         D8QGhGac6nSqOsDAfWkWelebX8hT8d5LEfuvOyTj4reGgK1vCugHKr7y1YyUJJOaLOMU
         YJJA==
X-Forwarded-Encrypted: i=1; AJvYcCVjXalSerX9dsEriagsRs76LToZMAdxatTUPjS8+YQ/VrikGyxzc+hnh+oOdNiAlglbm7YY9Xc4UOMW@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTpFRZ+IhorGskG71HUdfQAhKbuLXTW0qXf4RsNBM3qvUVbg0
	3BIRuARpRKIQRkJQIePZWRrSo7kERtz3qrW8tBhwsX8XLIaC/b6svslZZk9+28IShAc=
X-Gm-Gg: ASbGncsBcRBzZfgzft+ocJkQMiYBY0h9C/DY97QFE3i2xl+xYdYJNvjZlD3qx+DkHp0
	bkW8YjlU+wJmJBMEqsbQoOrFgJmlOh1mLcIoYpQUMu57uG1nKAXYR2Ib1QX/EKJm3FsbzWLO8l1
	KXkIsNm01oUCW1QpjdGM5AM9KpHuikvlN+SL9v2y9NsTOMjG0ianbcsIN/UqWRqTwxLMMGsPSGF
	mL01Q1unqFfNMz9u7/YU5ch+fdRW5eIZ5U+NIsC4jLWN31VVlZNLEwPakfciuxx858W9G0Ekw+O
	g5ROFjjatWxXmW3qKFPrfK/+WKQZeGEl8894ArAq3pDV1pXzr4kBHdZEpNnR0ITp5IWVB8LXV8F
	Qx3v+9rfyTe6UFDYv
X-Google-Smtp-Source: AGHT+IFT+ZhxNDNOEePjMYqhSAyglAqQHLeZiJje34Doj/7KRgqmzGNoq/itohm8jZedlpsIvg3m5w==
X-Received: by 2002:a05:6a20:2448:b0:243:78a:829a with SMTP id adf61e73a8af0-24340e06a0cmr16214773637.51.1756119547562;
        Mon, 25 Aug 2025 03:59:07 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254ae770b8sm6795330a91.6.2025.08.25.03.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:59:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) ./include/linux/random.h:79:36:
 error:
 implicit declaration of fun...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 25 Aug 2025 10:59:06 -0000
Message-ID: <175611954620.746.16750392527027435774@16ad3c994827>





Hello,

New build issue found on next/master:

---
 ./include/linux/random.h:79:36: error: implicit declaration of function 'is_power_of_2' [-Werror=implicit-function-declaration] in kernel/bounds.s (kernel/bounds.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:03520bb99ae60b90afb1b08e7d2febc7fc068615
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  6c68f4c0a147c025ae0b25fab688c7c47964a02f
- tags: next-20250825


Log excerpt:
=====================================================
                 from kernel/bounds.c:10:
./include/linux/random.h: In function 'get_random_u32_below':
./include/linux/random.h:79:36: error: implicit declaration of function 'is_power_of_2' [-Werror=implicit-function-declaration]
   79 |                         if (likely(is_power_of_2(ceil) || (u8)mult >= (1U << 8) % ceil))
      |                                    ^~~~~~~~~~~~~
./include/linux/compiler.h:76:45: note: in definition of macro 'likely'
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
In file included from ./include/linux/smp_types.h:5,
                 from ./include/linux/smp.h:15,
                 from ./include/linux/alloc_tag.h:14:
./include/linux/llist.h: In function 'llist_add_batch':
./include/linux/llist.h:242:19: error: implicit declaration of function 'try_cmpxchg' [-Werror=implicit-function-declaration]
  242 |         } while (!try_cmpxchg(&head->first, &first, new_first));
      |                   ^~~~~~~~~~~
./include/linux/llist.h: In function 'llist_del_all':
./include/linux/llist.h:283:16: error: implicit declaration of function 'xchg' [-Werror=implicit-function-declaration]
  283 |         return xchg(&head->first, NULL);
      |                ^~~~
./include/linux/llist.h:283:16: warning: returning 'int' from a function with return type 'struct llist_node *' makes pointer from integer without a cast [-Wint-conversion]
  283 |         return xchg(&head->first, NULL);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/static_key.h:1,
                 from ./include/linux/alloc_tag.h:15:
./include/linux/jump_label.h: In function 'static_key_count':
./include/linux/jump_label.h:262:16: error: implicit declaration of function 'raw_atomic_read' [-Werror=implicit-function-declaration]
  262 |         return raw_atomic_read(&key->enabled);
      |                ^~~~~~~~~~~~~~~
./include/linux/jump_label.h: In function 'static_key_fast_inc_not_disabled':
./include/linux/jump_label.h:295:13: error: implicit declaration of function 'atomic_read' [-Werror=implicit-function-declaration]
  295 |         v = atomic_read(&key->enabled);
      |             ^~~~~~~~~~~
./include/linux/jump_label.h:299:26: error: implicit declaration of function 'atomic_try_cmpxchg'; did you mean 'raw_cpu_try_cmpxchg'? [-Werror=implicit-function-declaration]
  299 |         } while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v + 1)));
      |                          ^~~~~~~~~~~~~~~~~~
./include/linux/compiler.h:76:45: note: in definition of macro 'likely'
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
./include/linux/jump_label.h: In function 'static_key_slow_dec':
./include/linux/jump_label.h:307:9: error: implicit declaration of function 'atomic_dec' [-Werror=implicit-function-declaration]
  307 |         atomic_dec(&key->enabled);
      |         ^~~~~~~~~~
./include/linux/jump_label.h: In function 'static_key_enable':
./include/linux/jump_label.h:329:9: error: implicit declaration of function 'atomic_set' [-Werror=implicit-function-declaration]
  329 |         atomic_set(&key->enabled, 1);
      |         ^~~~~~~~~~
In file included from ./include/linux/sched.h:25,
                 from ./include/linux/percpu.h:12:
./include/linux/mutex_types.h: At top level:
./include/linux/mutex_types.h:42:9: error: unknown type name 'atomic_long_t'
   42 |         atomic_long_t           owner;
      |         ^~~~~~~~~~~~~
In file included from ./include/linux/spinlock.h:314,
                 from ./include/linux/sched.h:37:
./include/linux/spinlock.h: In function 'spin_lock_irq':
./include/linux/spinlock_api_up.h:37:8: error: implicit declaration of function 'local_irq_disable'; did you mean 'local_bh_disable'? [-Werror=implicit-function-declaration]
   37 |   do { local_irq_disable(); __LOCK(lock); } while (0)
      |        ^~~~~~~~~~~~~~~~~
./include/linux/spinlock_api_up.h:66:49: note: in expansion of macro '__LOCK_IRQ'
   66 | #define _raw_spin_lock_irq(lock)                __LOCK_IRQ(lock)
      |                                                 ^~~~~~~~~~
./include/linux/spinlock.h:274:41: note: in expansion of macro '_raw_spin_lock_irq'
  274 | #define raw_spin_lock_irq(lock)         _raw_spin_lock_irq(lock)
      |                                         ^~~~~~~~~~~~~~~~~~
./include/linux/spinlock.h:376:9: note: in expansion of macro 'raw_spin_lock_irq'
  376 |         raw_spin_lock_irq(&lock->rlock);
      |         ^~~~~~~~~~~~~~~~~
./include/linux/spinlock.h: In function 'spin_unlock_irq':
./include/linux/spinlock_api_up.h:53:8: error: implicit declaration of function 'local_irq_enable'; did you mean 'local_bh_enable'? [-Werror=implicit-function-declaration]
   53 |   do { local_irq_enable(); __UNLOCK(lock); } while (0)
      |        ^~~~~~~~~~~~~~~~
./include/linux/spinlock_api_up.h:82:49: note: in expansion of macro '__UNLOCK_IRQ'
   82 | #define _raw_spin_unlock_irq(lock)              __UNLOCK_IRQ(lock)
      |                                                 ^~~~~~~~~~~~
./include/linux/spinlock.h:277:41: note: in expansion of macro '_raw_spin_unlock_irq'
  277 | #define raw_spin_unlock_irq(lock)       _raw_spin_unlock_irq(lock)
      |                                         ^~~~~~~~~~~~~~~~~~~~
./include/linux/spinlock.h:401:9: note: in expansion of macro 'raw_spin_unlock_irq'
  401 |         raw_spin_unlock_irq(&lock->rlock);
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/spinlock.h: In function 'spin_unlock_irqrestore':
./include/linux/spinlock_api_up.h:56:8: error: implicit declaration of function 'local_irq_restore' [-Werror=implicit-function-declaration]
   56 |   do { local_irq_restore(flags); __UNLOCK(lock); } while (0)
      |        ^~~~~~~~~~~~~~~~~
./include/linux/spinlock_api_up.h:86:41: note: in expansion of macro '__UNLOCK_IRQRESTORE'
   86 |                                         __UNLOCK_IRQRESTORE(lock, flags)
      |                                         ^~~~~~~~~~~~~~~~~~~
./include/linux/spinlock.h:282:17: note: in expansion of macro '_raw_spin_unlock_irqrestore'
  282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
  406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/irqflags.h:17:
./include/linux/spinlock.h: In function 'class_raw_spinlock_irqsave_constructor':
./include/linux/spinlock_api_up.h:40:8: error: implicit declaration of function 'local_irq_save' [-Werror=implicit-function-declaration]
   40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
      |        ^~~~~~~~~~~~~~
./include/linux/cleanup.h:480:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
  480 |         _lock;                                                          \
      |         ^~~~~
./include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
  557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
      | ^~~~~~~~~~~~~~~~~~~
./include/linux/spinlock_api_up.h:69:49: note: in expansion of macro '__LOCK_IRQSAVE'
   69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
      |                                                 ^~~~~~~~~~~~~~
./include/linux/spinlock.h:266:17: note: in expansion of macro '_raw_spin_lock_irqsave'
  266 |                 _raw_spin_lock_irqsave(lock, flags);    \
      |                 ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/spinlock.h:558:21: note: in expansion of macro 'raw_spin_lock_irqsave'
  558 |                     raw_spin_lock_irqsave(_T->lock, _T->flags),
      |                     ^~~~~~~~~~~~~~~~~~~~~
./include/linux/sched.h: In function 'clear_tsk_need_resched':
./include/linux/sched.h:2046:9: error: implicit declaration of function 'atomic_long_andnot' [-Werror=implicit-function-declaration]
 2046 |         atomic_long_andnot(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY,
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/sched.h:2047:29: error: 'atomic_long_t' undeclared (first use in this function); did you mean 'atomic_t'?
 2047 |                            (atomic_long_t *)&task_thread_info(tsk)->flags);
      |                             ^~~~~~~~~~~~~
      |                             atomic_t
./include/linux/sched.h:2047:29: note: each undeclared identifier is reported only once for each function it appears in
./include/linux/sched.h:2047:44: error: expected expression before ')' token
 2047 |                            (atomic_long_t *)&task_thread_info(tsk)->flags);
      |                                            ^
In file included from <command-line>:
./include/linux/gfp.h: In function 'gfp_migratetype':
./include/linux/gfp.h:23:63: error: 'MIGRATE_MOVABLE' undeclared (first use in this function)
   23 |         BUILD_BUG_ON((___GFP_MOVABLE >> GFP_MOVABLE_SHIFT) != MIGRATE_MOVABLE);
      |                                                               ^~~~~~~~~~~~~~~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |         ^~~~~~~~~~~~~~~~
./include/linux/gfp.h:23:9: note: in expansion of macro 'BUILD_BUG_ON'
   23 |         BUILD_BUG_ON((___GFP_MOVABLE >> GFP_MOVABLE_SHIFT) != MIGRATE_MOVABLE);
      |         ^~~~~~~~~~~~
./include/linux/gfp.h:24:67: error: 'MIGRATE_RECLAIMABLE' undeclared (first use in this function)
   24 |         BUILD_BUG_ON((___GFP_RECLAIMABLE >> GFP_MOVABLE_SHIFT) != MIGRATE_RECLAIMABLE);
      |                                                                   ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |         ^~~~~~~~~~~~~~~~
./include/linux/gfp.h:24:9: note: in expansion of macro 'BUILD_BUG_ON'
   24 |         BUILD_BUG_ON((___GFP_RECLAIMABLE >> GFP_MOVABLE_SHIFT) != MIGRATE_RECLAIMABLE);
      |         ^~~~~~~~~~~~
./include/linux/gfp.h:26:45: error: 'MIGRATE_HIGHATOMIC' undeclared (first use in this function)
   26 |                       GFP_MOVABLE_SHIFT) != MIGRATE_HIGHATOMIC);
      |                                             ^~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
  552 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
././include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
  572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |         ^~~~~~~~~~~~~~~~
./include/linux/gfp.h:25:9: note: in expansion of macro 'BUILD_BUG_ON'
   25 |         BUILD_BUG_ON(((___GFP_MOVABLE | ___GFP_RECLAIMABLE) >>
      |         ^~~~~~~~~~~~
./include/linux/gfp.h:28:22: error: 'page_group_by_mobility_disabled' undeclared (first use in this function)
   28 |         if (unlikely(page_group_by_mobility_disabled))
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
   77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
./include/linux/gfp.h:29:24: error: 'MIGRATE_UNMOVABLE' undeclared (first use in this function)
   29 |                 return MIGRATE_UNMOVABLE;
      |                        ^~~~~~~~~~~~~~~~~
./include/linux/gfp.h: At top level:
./include/linux/gfp.h:116:25: warning: "ZONES_SHIFT" is not defined, evaluates to 0 [-Wundef]
  116 | #define GFP_ZONES_SHIFT ZONES_SHIFT
      |                         ^~~~~~~~~~~
./include/linux/gfp.h:119:10: note: in expansion of macro 'GFP_ZONES_SHIFT'
  119 | #if 16 * GFP_ZONES_SHIFT > BITS_PER_LONG
      |          ^~~~~~~~~~~~~~~
./include/linux/gfp.h: In function 'gfp_zone':
./include/linux/gfp.h:116:25: error: 'ZONES_SHIFT' undeclared (first use in this function); did you mean 'NODES_SHIFT'?
  116 | #define GFP_ZONES_SHIFT ZONES_SHIFT
      |                         ^~~~~~~~~~~
./include/linux/gfp.h:124:29: note: in expansion of macro 'GFP_ZONES_SHIFT'
  124 |         (ZONE_NORMAL << 0 * GFP_ZONES_SHIFT)                                   \
      |                             ^~~~~~~~~~~~~~~
./include/linux/gfp.h:156:14: note: in expansion of macro 'GFP_ZONE_TABLE'
  156 |         z = (GFP_ZONE_TABLE >> (bit * GFP_ZONES_SHIFT)) &
      |              ^~~~~~~~~~~~~~
./include/linux/gfp.h: In function 'gfp_zonelist':
./include/linux/gfp.h:175:16: error: 'ZONELIST_FALLBACK' undeclared (first use in this function)
  175 |         return ZONELIST_FALLBACK;
      |                ^~~~~~~~~~~~~~~~~
./include/linux/gfp.h: In function 'node_zonelist':
./include/linux/gfp.h:214:16: error: implicit declaration of function 'NODE_DATA' [-Werror=implicit-function-declaration]
  214 |         return NODE_DATA(nid)->node_zonelists + gfp_zonelist(flags);
      |                ^~~~~~~~~
./include/linux/gfp.h:214:30: error: invalid type argument of '->' (have 'int')
  214 |         return NODE_DATA(nid)->node_zonelists + gfp_zonelist(flags);
      |                              ^~
./include/linux/gfp.h: In function 'alloc_page_vma_noprof':
./include/linux/gfp.h:353:22: error: invalid use of undefined type 'struct folio'
  353 |         return &folio->page;
      |                      ^~
./include/linux/gfp.h: At top level:
./include/linux/gfp.h:389:46: warning: 'struct per_cpu_pages' declared inside parameter list will not be visible outside of this definition or declaration
  389 | int decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp);
      |                                              ^~~~~~~~~~~~~
./include/linux/gfp.h:389:27: warning: 'struct zone' declared inside parameter list will not be visible outside of this definition or declaration
  389 | int decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp);
      |                           ^~~~
./include/linux/gfp.h:390:49: warning: 'struct per_cpu_pages' declared inside parameter list will not be visible outside of this definition or declaration
  390 | void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp);
      |                                                 ^~~~~~~~~~~~~
./include/linux/gfp.h:390:30: warning: 'struct zone' declared inside parameter list will not be visible outside of this definition or declaration
  390 | void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp);
      |                              ^~~~
./include/linux/gfp.h:391:29: warning: 'struct zone' declared inside parameter list will not be visible outside of this definition or declaration
  391 | void drain_all_pages(struct zone *zone);
      |                             ^~~~
./include/linux/gfp.h:392:31: warning: 'struct zone' declared inside parameter list will not be visible outside of this definition or declaration
  392 | void drain_local_pages(struct zone *zone);
      |                               ^~~~
In file included from ./include/linux/kref.h:17,
                 from ./include/linux/mm_types.h:8,
                 from ./include/linux/mm.h:16:
./include/linux/refcount.h: In function 'refcount_set_release':
./include/linux/refcount.h:159:9: error: implicit declaration of function 'atomic_set_release'; did you mean 'refcount_set_release'? [-Werror=implicit-function-declaration]
  159 |         atomic_set_release(&r->refs, n);
      |         ^~~~~~~~~~~~~~~~~~
      |         refcount_set_release
./include/linux/refcount.h: In function '__refcount_add_not_zero':
./include/linux/refcount.h:181:19: error: implicit declaration of function 'atomic_try_cmpxchg_relaxed' [-Werror=implicit-function-declaration]
  181 |         } while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/refcount.h: In function '__refcount_add_not_zero_limited_acquire':
./include/linux/refcount.h:230:19: error: implicit declaration of function 'atomic_try_cmpxchg_acquire' [-Werror=implicit-function-declaration]
  230 |         } while (!atomic_try_cmpxchg_acquire(&r->refs, &old, old + i));
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/refcount.h: In function '__refcount_add':
./include/linux/refcount.h:283:19: error: implicit declaration of function 'atomic_fetch_add_relaxed' [-Werror=implicit-function-declaration]
  283 |         int old = atomic_fetch_add_relaxed(i, &r->refs);
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/refcount.h: In function '__refcount_sub_and_test':
./include/linux/refcount.h:389:19: error: implicit declaration of function 'atomic_fetch_sub_release' [-Werror=implicit-function-declaration]
  389 |         int old = atomic_fetch_sub_release(i, &r->refs);
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/mm_types.h:13:
./include/linux/rwsem.h: At top level:
./include/linux/rwsem.h:49:9: error: unknown type name 'atomic_long_t'
   49 |         atomic_long_t count;
      |         ^~~~~~~~~~~~~
./include/linux/rwsem.h:55:9: error: unknown type name 'atomic_long_t'
   55 |         atomic_long_t owner;
      |         ^~~~~~~~~~~~~
./include/linux/rwsem.h: In function 'rwsem_is_locked':
./include/linux/rwsem.h:75:16: error: implicit declaration of function 'atomic_long_read' [-Werror=implicit-function-declaration]
   75 |         return atomic_long_read(&sem->count) != RWSEM_UNLOCKED_VALUE;
      |                ^~~~~~~~~~~~~~~~
In file included from ./include/linux/mm_types.h:18:
./include/linux/page-flags-layout.h: At top level:
./include/linux/page-flags-layout.h:6:10: fatal error: generated/bounds.h: No such file or directory
    6 | #include <generated/bounds.h>
      |          ^~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
compilation terminated.

=====================================================


# Builds where the incident occurred:

## haps_hs_smp_defconfig+allnoconfig on (arc):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68ac20bc233e484a3faf3f34


#kernelci issue maestro:03520bb99ae60b90afb1b08e7d2febc7fc068615

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

