Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B91195A4F
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 16:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbgC0Pwv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 11:52:51 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49534 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgC0Pwu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2020 11:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=ACvsZf1sb/ZPbsmrhFL30kdimae4anZCMRz8z9bhNVQ=; b=iJ+kBl4DZBZqxM7kQw5hFMF4iw
        xTmDVObuAgEyG7SWN8Y/GFOZvqpQ0IluClbjKRit9dK4ajQtgned6I9Pos0tdhk32SdwSc+R4jKa0
        jjlbGsos7djdIp/txBVC14GWQuCy607sgymWwVjcRwUi638NVD1YtQRul2YiDrusnci1+cyTR/CcI
        jLgWzJphvFMf3HVVNAfg1VnBueFL2yaSjxZCDWNmUUw95OvflJTZjuBECzoyoiDE2Hr8G+QTusTR3
        T/+kvvfmZgw+KyanAI/MyTEQcyIuek9/0wifq8fjM0x2sWhMQuUe/+h8BXbg46DmDHrQnEIt5BH1c
        LJaDCyYw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jHrHs-0004L8-C6; Fri, 27 Mar 2020 15:52:48 +0000
Subject: Re: linux-next: Tree for Mar 27
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        richard -rw- weinberger <richard.weinberger@gmail.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
References: <20200327190740.7385d4ff@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <425b6d83-53da-15bb-8e7a-158f7c44ffad@infradead.org>
Date:   Fri, 27 Mar 2020 08:52:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327190740.7385d4ff@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/27/20 1:07 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200326:
> 

on i386, UML defconfig build fails with: (mostly get_user() variants)


  CC      kernel/signal.o
In file included from ../include/linux/kernel.h:15:0,
                 from ../include/asm-generic/bug.h:19,
                 from ./arch/um/include/generated/asm/bug.h:1,
                 from ../include/linux/bug.h:5,
                 from ../include/linux/mmdebug.h:5,
                 from ../include/linux/gfp.h:5,
                 from ../include/linux/slab.h:15,
                 from ../kernel/signal.c:14:
../kernel/signal.c: In function 'print_fatal_signal':
../kernel/signal.c:1250:33: error: 'struct pt_regs' has no member named 'ip'
  pr_info("code at %08lx: ", regs->ip);
                                 ^
../include/linux/printk.h:310:34: note: in definition of macro 'pr_info'
  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                  ^~~~~~~~~~~
In file included from ../arch/um/include/asm/uaccess.h:39:0,
                 from ../include/linux/uaccess.h:11,
                 from ../include/linux/sched/task.h:11,
                 from ../kernel/signal.c:20:
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:196:28: note: in definition of macro 'get_user'
  const void __user *__p = (ptr);    \
                            ^~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:93:66: note: in definition of macro 'access_ok'
 #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
                                                                  ^~~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:158:19: note: in definition of macro '__get_user'
  switch (sizeof(*(ptr))) {    \
                   ^~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
 #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
                                               ^~
../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
   ^~~~~~~~~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
 #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
                                                   ^
../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
   ^~~~~~~~~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:163:32: note: in definition of macro '__get_user'
   (x) = *(__force __typeof__(*(ptr)) *) &__x; \
                                ^~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
 #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
                                               ^~
../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
   ^~~~~~~~~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
 #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
                                                   ^
../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
   ^~~~~~~~~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:170:32: note: in definition of macro '__get_user'
   (x) = *(__force __typeof__(*(ptr)) *) &__x; \
                                ^~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
 #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
                                               ^~
../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
   ^~~~~~~~~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
 #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
                                                   ^
../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
   ^~~~~~~~~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:177:32: note: in definition of macro '__get_user'
   (x) = *(__force __typeof__(*(ptr)) *) &__x; \
                                ^~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
 #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
                                               ^~
../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
   ^~~~~~~~~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
 #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
                                                   ^
../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
   ^~~~~~~~~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:184:32: note: in definition of macro '__get_user'
   (x) = *(__force __typeof__(*(ptr)) *) &__x; \
                                ^~~
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~
../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
                                             ^
../include/asm-generic/uaccess.h:200:24: note: in definition of macro 'get_user'
   ((x) = (__typeof__(*(ptr)))0,-EFAULT);  \
                        ^~~
../include/asm-generic/uaccess.h:200:31: warning: left-hand operand of comma expression has no effect [-Wunused-value]
   ((x) = (__typeof__(*(ptr)))0,-EFAULT);  \
                               ^
../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
    if (get_user(insn, (unsigned char *)(regs->ip + i)))
        ^~~~~~~~


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
