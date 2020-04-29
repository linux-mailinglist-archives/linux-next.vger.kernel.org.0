Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE801BD1B4
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 03:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgD2BY0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 21:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726181AbgD2BYZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 21:24:25 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E97C03C1AC;
        Tue, 28 Apr 2020 18:24:25 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d24so211840pll.8;
        Tue, 28 Apr 2020 18:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bBzDQl4qD8bxSoY/96t713Q4nmrK7ZcwMLgMhq/t8G8=;
        b=pYgYL5klsgZgOVwCUUAFeinL0mWGNi0hZI+R5RLD6AWiFxSqfa6kjSew/d9y+7/F4I
         E16T6V/y96TRn2qomTvXbJZkMAmm3l9b6AXlobjB/MyxDOWBUF92I8/ocgDaUqz+cPOO
         Wri6ryXHvhYpNGVLMZIdOuQ3AYYFsWmOYJSdfOmNVOF2QKOmQ4nUH05STAfR0A0KwOA8
         l7nBOetPBu0BFqoyeNB/i56CjAU6tC0N9wV0CL4r0Ge0HD0HZFqYAEYt5u6XijpdccZX
         u1bxRXGAnKRp6pyv0ssUA6njQg3qUAb+NBf/KKKtOX/oIqGPh5kgjY7ity5yq5B4/Kl5
         NZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=bBzDQl4qD8bxSoY/96t713Q4nmrK7ZcwMLgMhq/t8G8=;
        b=KBAvOOrkZU50b85pbUwY9O+py9YxRTROQl0vxLmdDThPasWvLOBWy85EqHxkbLefrM
         D4YBdu52ddR49kohDrB/+mh60mJ7BnakRjs5YfUCQRrO/Hsc2R7zrc2veghazQXQ+OR/
         BH9sIf+4BmjL+1Gy0qr/eNJ6voY6114WbyZaeC7KknNq6pyQ0V0R6jpchGn9uKpaABui
         /rcBd9OsgpSH+LH+hbPiHWvR87S5l2Tj6wu0MSclpkN2YLRrVY1PNK3brp8sKXB5jobA
         zcIX6QjeI9DkY/ElwmnC0YqSGCKWBF8YZDRNInD0dgTtIZKdWhiqP53zlmH90SR0b0I2
         +Vhw==
X-Gm-Message-State: AGi0PuapLWMu0qnPI4VTgIywcftCIyweU1DpfBxb6JZOA4LOcaPj3F6S
        A0x1ic6kDZo9VjTZfloZfAt+FmE4
X-Google-Smtp-Source: APiQypKYJt0Qt3nKeC6xpacQxM5sXq5XRcgjZzsDRGTC5QdiiQGNMGuNZ4hACXWLGXIuE9Q9/i5exg==
X-Received: by 2002:a17:902:a98a:: with SMTP id bh10mr30444818plb.340.1588123464804;
        Tue, 28 Apr 2020 18:24:24 -0700 (PDT)
Received: from google.com ([2620:15c:211:1:3e01:2939:5992:52da])
        by smtp.gmail.com with ESMTPSA id c80sm15973690pfb.82.2020.04.28.18.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 18:24:23 -0700 (PDT)
Date:   Tue, 28 Apr 2020 18:24:21 -0700
From:   Minchan Kim <minchan@kernel.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-s390@vger.kernel.org
Subject: Re: linux-next: Tree for Apr 28
Message-ID: <20200429012421.GA132200@google.com>
References: <20200428181006.06b4e3bc@canb.auug.org.au>
 <20200428190459.GA2299615@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428190459.GA2299615@ubuntu-s3-xlarge-x86>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

On Tue, Apr 28, 2020 at 12:04:59PM -0700, Nathan Chancellor wrote:
> On Tue, Apr 28, 2020 at 06:10:06PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200424:
> > 
> > The qcom tree still had its build failure for which I reverted a commit.
> > 
> > The hwmon-staging tree gained a build failure for which I reverted
> > a commit.
> > 
> > The mac80211-next tree gained a build failure so I used the version
> > from next-20200424.
> > 
> > The drm-misc tree still had its build failure for which I disabled a
> > COMPILE_TEST setting.
> > 
> > The akpm-current tree gained a conflict against the risc-v tree.
> > 
> > The akpm tree lost a patch that turned up elsewhere.
> > 
> > Non-merge commits (relative to Linus' tree): 4451
> >  5474 files changed, 151275 insertions(+), 63274 deletions(-)
> 
> I am seeing the following build error on s390 defconfig, caused by
> commit 743f242d65ec ("mm: support compat_sys_process_madvise").
> Apologies if it has already been reported, I did a search of lore and
> found nothing.
> 
> Cheers,
> Nathan
> 
> $ make -j$(nproc) -s ARCH=s390 CROSS_COMPILE=s390x-linux- defconfig all
> ...
> mm/madvise.c: In function '__se_compat_sys_process_madvise':
> ./include/linux/compiler.h:394:38: error: call to '__compiletime_assert_162' declared with attribute error: BUILD_BUG_ON failed: sizeof(unsigned long) > 4 && !__TYPE_IS_PTR(unsigned long)
>   394 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                      ^
> ./include/linux/compiler.h:375:4: note: in definition of macro '__compiletime_assert'
>   375 |    prefix ## suffix();    \
>       |    ^~~~~~
> ./include/linux/compiler.h:394:2: note: in expansion of macro '_compiletime_assert'
>   394 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |  ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>       |  ^~~~~~~~~~~~~~~~
> ./arch/s390/include/asm/compat.h:18:2: note: in expansion of macro 'BUILD_BUG_ON'
>    18 |  BUILD_BUG_ON(sizeof(t) > 4 && !__TYPE_IS_PTR(t)); \
>       |  ^~~~~~~~~~~~
> ./include/linux/syscalls.h:110:27: note: in expansion of macro '__SC_DELOUSE'
>   110 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
>       |                           ^
> ./include/linux/syscalls.h:111:35: note: in expansion of macro '__MAP3'
>   111 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
>       |                                   ^~~~~~
> ./include/linux/syscalls.h:112:35: note: in expansion of macro '__MAP4'
>   112 | #define __MAP5(m,t,a,...) m(t,a), __MAP4(m,__VA_ARGS__)
>       |                                   ^~~~~~
> ./include/linux/syscalls.h:113:35: note: in expansion of macro '__MAP5'
>   113 | #define __MAP6(m,t,a,...) m(t,a), __MAP5(m,__VA_ARGS__)
>       |                                   ^~~~~~
> ./include/linux/syscalls.h:114:22: note: in expansion of macro '__MAP6'
>   114 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
>       |                      ^~~~~
> ./arch/s390/include/asm/syscall_wrapper.h:80:36: note: in expansion of macro '__MAP'
>    80 |   long ret = __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));\
>       |                                    ^~~~~
> ./include/linux/compat.h:66:2: note: in expansion of macro 'COMPAT_SYSCALL_DEFINEx'
>    66 |  COMPAT_SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
>       |  ^~~~~~~~~~~~~~~~~~~~~~
> mm/madvise.c:1314:1: note: in expansion of macro 'COMPAT_SYSCALL_DEFINE6'
>  1314 | COMPAT_SYSCALL_DEFINE6(process_madvise, int, which, compat_pid_t, upid,
>       | ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/compiler.h:394:38: error: call to '__compiletime_assert_164' declared with attribute error: BUILD_BUG_ON failed: sizeof(unsigned long) > 4 && !__TYPE_IS_PTR(unsigned long)
>   394 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                      ^
> ./include/linux/compiler.h:375:4: note: in definition of macro '__compiletime_assert'
>   375 |    prefix ## suffix();    \
>       |    ^~~~~~
> ./include/linux/compiler.h:394:2: note: in expansion of macro '_compiletime_assert'
>   394 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |  ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>       |  ^~~~~~~~~~~~~~~~
> ./arch/s390/include/asm/compat.h:18:2: note: in expansion of macro 'BUILD_BUG_ON'
>    18 |  BUILD_BUG_ON(sizeof(t) > 4 && !__TYPE_IS_PTR(t)); \
>       |  ^~~~~~~~~~~~
> ./include/linux/syscalls.h:108:27: note: in expansion of macro '__SC_DELOUSE'
>   108 | #define __MAP1(m,t,a,...) m(t,a)
>       |                           ^
> ./include/linux/syscalls.h:109:35: note: in expansion of macro '__MAP1'
>   109 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
>       |                                   ^~~~~~
> ./include/linux/syscalls.h:110:35: note: in expansion of macro '__MAP2'
>   110 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
>       |                                   ^~~~~~
> ./include/linux/syscalls.h:111:35: note: in expansion of macro '__MAP3'
>   111 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
>       |                                   ^~~~~~
> ./include/linux/syscalls.h:112:35: note: in expansion of macro '__MAP4'
>   112 | #define __MAP5(m,t,a,...) m(t,a), __MAP4(m,__VA_ARGS__)
>       |                                   ^~~~~~
> ./include/linux/syscalls.h:113:35: note: in expansion of macro '__MAP5'
>   113 | #define __MAP6(m,t,a,...) m(t,a), __MAP5(m,__VA_ARGS__)
>       |                                   ^~~~~~
> ./include/linux/syscalls.h:114:22: note: in expansion of macro '__MAP6'
>   114 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
>       |                      ^~~~~
> ./arch/s390/include/asm/syscall_wrapper.h:80:36: note: in expansion of macro '__MAP'
>    80 |   long ret = __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));\
>       |                                    ^~~~~
> ./include/linux/compat.h:66:2: note: in expansion of macro 'COMPAT_SYSCALL_DEFINEx'
>    66 |  COMPAT_SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
>       |  ^~~~~~~~~~~~~~~~~~~~~~
> mm/madvise.c:1314:1: note: in expansion of macro 'COMPAT_SYSCALL_DEFINE6'
>  1314 | COMPAT_SYSCALL_DEFINE6(process_madvise, int, which, compat_pid_t, upid,
>       | ^~~~~~~~~~~~~~~~~~~~~~
> make[2]: *** [scripts/Makefile.build:266: mm/madvise.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [Makefile:1723: mm] Error 2
> make[1]: *** Waiting for unfinished jobs....
> ...

Could you try this patch? I think it should fix it.

From 3f993353c310a027f138d822a79ce49770fe6e50 Mon Sep 17 00:00:00 2001
From: Minchan Kim <minchan@kernel.org>
Date: Tue, 28 Apr 2020 18:20:24 -0700
Subject: [PATCH] mm: fix s390 compat build error

Nathan reported build error with sys_compat_process_madvise.
This patch should fix it.

Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 include/linux/compat.h | 5 +++--
 mm/madvise.c           | 9 ++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/compat.h b/include/linux/compat.h
index 1134ba3e61d0..19c524513cbb 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -820,9 +820,10 @@ asmlinkage long compat_sys_pwritev64v2(unsigned long fd,
 		unsigned long vlen, loff_t pos, rwf_t flags);
 #endif
 
-asmlinkage ssize_t compat_sys_process_madvise(int which,
+asmlinkage ssize_t compat_sys_process_madvise(compat_int_t which,
 		compat_pid_t upid, const struct compat_iovec __user *vec,
-		unsigned long vlen, int behavior, unsigned long flags);
+		compat_ulong_t vlen, compat_int_t behavior,
+		compat_ulong_t flags);
 
 /*
  * Deprecated system calls which are still defined in
diff --git a/mm/madvise.c b/mm/madvise.c
index 8fec261457a6..99c06d5f0785 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1311,9 +1311,12 @@ SYSCALL_DEFINE6(process_madvise, int, which, pid_t, upid,
 }
 
 #ifdef CONFIG_COMPAT
-COMPAT_SYSCALL_DEFINE6(process_madvise, int, which, compat_pid_t, upid,
-		const struct compat_iovec __user *, vec, unsigned long, vlen,
-		int, behavior, unsigned long, flags)
+COMPAT_SYSCALL_DEFINE6(process_madvise, compat_int_t, which,
+			compat_pid_t, upid,
+			const struct compat_iovec __user *, vec,
+			compat_ulong_t, vlen,
+			compat_int_t, behavior,
+			compat_ulong_t, flags)
 
 {
 	ssize_t ret;
-- 
2.26.2.303.gf8c07b1a785-goog


