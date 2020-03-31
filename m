Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D436B1989CD
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 04:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbgCaCKK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 22:10:10 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35872 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729142AbgCaCKK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 22:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=iWasv2IidE4pDe81OROR0kw+D5K1ZVDt6FPbLRpCQUY=; b=hmhg7437v7qmz8/o8AFWkksuJ1
        gcmX0IgWzV9UrU0DC3+8MyRuweV750PjjTSjxJHNEyNKv2C90uoVhh7YkKfFSCqx3GnBHAmMRNPfb
        rNKD3gcduU29XkUsucDudKuoDDmfEof7MuIBYK7YIqmJnUwM14G80Kvvuqnw8Hjmvo4DUh7+8FvfL
        P+J0ezJTBSBXN/3+4SWxXsv+w4BnBK9mM4kpKfRuWadbbv49y08TgS2NxLs+Pnpx8rE+6cbgv11Oe
        KCOX8qNOZXhZ8Ob1L8yhOJR+rCVtxUp1z+t1S2TDfGesh0rTFUMk31Y6ZvZ4RgX2KOOZ1nPEVdcRc
        G7onbnRg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jJ6Lt-0006Ku-L5; Tue, 31 Mar 2020 02:10:06 +0000
Subject: Re: linux-next: Tree for Mar 27 (kbuild)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        richard -rw- weinberger <richard.weinberger@gmail.com>,
        Al Viro <viro@ZenIV.linux.org.uk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20200327190740.7385d4ff@canb.auug.org.au>
 <425b6d83-53da-15bb-8e7a-158f7c44ffad@infradead.org>
Message-ID: <cca9cab0-09a4-bc2f-9322-54b523d04bcf@infradead.org>
Date:   Mon, 30 Mar 2020 19:10:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <425b6d83-53da-15bb-8e7a-158f7c44ffad@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/27/20 8:52 AM, Randy Dunlap wrote:
> On 3/27/20 1:07 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200326:
>>
> 
> on i386, UML defconfig build fails with: (mostly get_user() variants)
> 

Hi Yamada-san,

Al Viro identified these build errors as due to:

Buggered-by: 1a908babcb144 (x86: replace arch macros from compiler with CONFIG_X86_{32,64})

    If the intention is to check i386/x86_64 excluding UML, testing
    CONFIG_X86_{32,64} is simpler.

Which is not true, since uml/x86 configs bloody well *do* have CONFIG_X86_{32,64}
defined.  See arch/x86/um/Kconfig; and yes, it does need those, as well as
arch/x86/Kconfig.cpu.


and they are still happening (on UML on i386 defconfig).


> 
>   CC      kernel/signal.o
> In file included from ../include/linux/kernel.h:15:0,
>                  from ../include/asm-generic/bug.h:19,
>                  from ./arch/um/include/generated/asm/bug.h:1,
>                  from ../include/linux/bug.h:5,
>                  from ../include/linux/mmdebug.h:5,
>                  from ../include/linux/gfp.h:5,
>                  from ../include/linux/slab.h:15,
>                  from ../kernel/signal.c:14:
> ../kernel/signal.c: In function 'print_fatal_signal':
> ../kernel/signal.c:1250:33: error: 'struct pt_regs' has no member named 'ip'
>   pr_info("code at %08lx: ", regs->ip);
>                                  ^
> ../include/linux/printk.h:310:34: note: in definition of macro 'pr_info'
>   printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
>                                   ^~~~~~~~~~~
> In file included from ../arch/um/include/asm/uaccess.h:39:0,
>                  from ../include/linux/uaccess.h:11,
>                  from ../include/linux/sched/task.h:11,
>                  from ../kernel/signal.c:20:
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:196:28: note: in definition of macro 'get_user'
>   const void __user *__p = (ptr);    \
>                             ^~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:93:66: note: in definition of macro 'access_ok'
>  #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
>                                                                   ^~~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:158:19: note: in definition of macro '__get_user'
>   switch (sizeof(*(ptr))) {    \
>                    ^~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
>  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
>                                                ^~
> ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
>    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
>    ^~~~~~~~~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
>  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
>                                                    ^
> ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
>    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
>    ^~~~~~~~~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:163:32: note: in definition of macro '__get_user'
>    (x) = *(__force __typeof__(*(ptr)) *) &__x; \
>                                 ^~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
>  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
>                                                ^~
> ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
>    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
>    ^~~~~~~~~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
>  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
>                                                    ^
> ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
>    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
>    ^~~~~~~~~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:170:32: note: in definition of macro '__get_user'
>    (x) = *(__force __typeof__(*(ptr)) *) &__x; \
>                                 ^~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
>  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
>                                                ^~
> ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
>    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
>    ^~~~~~~~~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
>  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
>                                                    ^
> ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
>    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
>    ^~~~~~~~~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:177:32: note: in definition of macro '__get_user'
>    (x) = *(__force __typeof__(*(ptr)) *) &__x; \
>                                 ^~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
>  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
>                                                ^~
> ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
>    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
>    ^~~~~~~~~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
>  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
>                                                    ^
> ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
>    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
>    ^~~~~~~~~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:184:32: note: in definition of macro '__get_user'
>    (x) = *(__force __typeof__(*(ptr)) *) &__x; \
>                                 ^~~
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>                                              ^
> ../include/asm-generic/uaccess.h:200:24: note: in definition of macro 'get_user'
>    ((x) = (__typeof__(*(ptr)))0,-EFAULT);  \
>                         ^~~
> ../include/asm-generic/uaccess.h:200:31: warning: left-hand operand of comma expression has no effect [-Wunused-value]
>    ((x) = (__typeof__(*(ptr)))0,-EFAULT);  \
>                                ^
> ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
>     if (get_user(insn, (unsigned char *)(regs->ip + i)))
>         ^~~~~~~~
> 
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
