Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3D41989E8
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 04:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbgCaC1B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 22:27:01 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:43667 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729221AbgCaC1B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 22:27:01 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 02V2QjSL013292;
        Tue, 31 Mar 2020 11:26:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 02V2QjSL013292
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585621606;
        bh=tCebsTXhAnDKn6teFbwZutbkna8WI11kFcaUdlfrng4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o6RFLlPwppe9/Md56ib6HPNPixReqgZGYO3p17XA8Ci47hoAuweUXhShx5aOHCsWC
         XGtxS9OHF61E1Cn7qsKZFCyuME8ZYM4jHRfNSZxMmiHKAzpOoTTBpYkr1UQtCMnC5P
         Rf22rVZ6HdotdsSCKurPz9wsfGQZsrjPQUzR3TpI/czQewkAUW4SS1GZ4zerRYVyqn
         9TlAdS3YTCB7NzWghmix2+g2EzYTp1lDAdqieJiF3d3eE+IeK4zkCecgjmuOOV9nYi
         qiVhuyZt77paNRmij6ypmZ5p2WMIZq4oVbpDeVTu1Bd0xwiFoaPLuZz5NfhtyLtxzj
         h9O6wHOpwtffg==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id o15so7142678ual.3;
        Mon, 30 Mar 2020 19:26:45 -0700 (PDT)
X-Gm-Message-State: AGi0PuYNNVRoRymMItDkMXffDf8QUoE36F6KCQeqhRd4H13EzCPiEA8R
        q15S3yPuFVAhpjTXmcbfbxvNB+JSk8tj3vo1x+k=
X-Google-Smtp-Source: APiQypIgfGcDpq2JWmZurLPAfgQMh9+rvh/hgLHvzUwMF+vrMRx5IepHmWb+1rX5JOGlSkzGDI0XR+Tb51LPIidKsCE=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr10228876uad.25.1585621604754;
 Mon, 30 Mar 2020 19:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200327190740.7385d4ff@canb.auug.org.au> <425b6d83-53da-15bb-8e7a-158f7c44ffad@infradead.org>
 <cca9cab0-09a4-bc2f-9322-54b523d04bcf@infradead.org>
In-Reply-To: <cca9cab0-09a4-bc2f-9322-54b523d04bcf@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 31 Mar 2020 11:26:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAScFhU+MYigK89krNt_1mk7-uFfVEroAvZeni1rv+m_vg@mail.gmail.com>
Message-ID: <CAK7LNAScFhU+MYigK89krNt_1mk7-uFfVEroAvZeni1rv+m_vg@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 27 (kbuild)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        richard -rw- weinberger <richard.weinberger@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On Tue, Mar 31, 2020 at 11:10 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 3/27/20 8:52 AM, Randy Dunlap wrote:
> > On 3/27/20 1:07 AM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20200326:
> >>
> >
> > on i386, UML defconfig build fails with: (mostly get_user() variants)
> >
>
> Hi Yamada-san,
>
> Al Viro identified these build errors as due to:
>
> Buggered-by: 1a908babcb144 (x86: replace arch macros from compiler with CONFIG_X86_{32,64})
>
>     If the intention is to check i386/x86_64 excluding UML, testing
>     CONFIG_X86_{32,64} is simpler.
>
> Which is not true, since uml/x86 configs bloody well *do* have CONFIG_X86_{32,64}
> defined.  See arch/x86/um/Kconfig; and yes, it does need those, as well as
> arch/x86/Kconfig.cpu.
>

My bad - I did not notice arch/x86/um/Kconfig defined them.

I will fix them ASAP.





> and they are still happening (on UML on i386 defconfig).
>
>
> >
> >   CC      kernel/signal.o
> > In file included from ../include/linux/kernel.h:15:0,
> >                  from ../include/asm-generic/bug.h:19,
> >                  from ./arch/um/include/generated/asm/bug.h:1,
> >                  from ../include/linux/bug.h:5,
> >                  from ../include/linux/mmdebug.h:5,
> >                  from ../include/linux/gfp.h:5,
> >                  from ../include/linux/slab.h:15,
> >                  from ../kernel/signal.c:14:
> > ../kernel/signal.c: In function 'print_fatal_signal':
> > ../kernel/signal.c:1250:33: error: 'struct pt_regs' has no member named 'ip'
> >   pr_info("code at %08lx: ", regs->ip);
> >                                  ^
> > ../include/linux/printk.h:310:34: note: in definition of macro 'pr_info'
> >   printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> >                                   ^~~~~~~~~~~
> > In file included from ../arch/um/include/asm/uaccess.h:39:0,
> >                  from ../include/linux/uaccess.h:11,
> >                  from ../include/linux/sched/task.h:11,
> >                  from ../kernel/signal.c:20:
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:196:28: note: in definition of macro 'get_user'
> >   const void __user *__p = (ptr);    \
> >                             ^~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:93:66: note: in definition of macro 'access_ok'
> >  #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
> >                                                                   ^~~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:158:19: note: in definition of macro '__get_user'
> >   switch (sizeof(*(ptr))) {    \
> >                    ^~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
> >  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
> >                                                ^~
> > ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
> >    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
> >    ^~~~~~~~~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
> >  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
> >                                                    ^
> > ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
> >    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
> >    ^~~~~~~~~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:163:32: note: in definition of macro '__get_user'
> >    (x) = *(__force __typeof__(*(ptr)) *) &__x; \
> >                                 ^~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
> >  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
> >                                                ^~
> > ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
> >    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
> >    ^~~~~~~~~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
> >  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
> >                                                    ^
> > ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
> >    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
> >    ^~~~~~~~~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:170:32: note: in definition of macro '__get_user'
> >    (x) = *(__force __typeof__(*(ptr)) *) &__x; \
> >                                 ^~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
> >  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
> >                                                ^~
> > ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
> >    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
> >    ^~~~~~~~~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
> >  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
> >                                                    ^
> > ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
> >    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
> >    ^~~~~~~~~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:177:32: note: in definition of macro '__get_user'
> >    (x) = *(__force __typeof__(*(ptr)) *) &__x; \
> >                                 ^~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:209:47: note: in definition of macro '__get_user_fn'
> >  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
> >                                                ^~
> > ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
> >    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
> >    ^~~~~~~~~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:209:51: note: in definition of macro '__get_user_fn'
> >  #define __get_user_fn(sz, u, k) __get_user_fn(sz, u, k)
> >                                                    ^
> > ../include/asm-generic/uaccess.h:199:3: note: in expansion of macro '__get_user'
> >    __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
> >    ^~~~~~~~~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:184:32: note: in definition of macro '__get_user'
> >    (x) = *(__force __typeof__(*(ptr)) *) &__x; \
> >                                 ^~~
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> > ../kernel/signal.c:1256:45: error: 'struct pt_regs' has no member named 'ip'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >                                              ^
> > ../include/asm-generic/uaccess.h:200:24: note: in definition of macro 'get_user'
> >    ((x) = (__typeof__(*(ptr)))0,-EFAULT);  \
> >                         ^~~
> > ../include/asm-generic/uaccess.h:200:31: warning: left-hand operand of comma expression has no effect [-Wunused-value]
> >    ((x) = (__typeof__(*(ptr)))0,-EFAULT);  \
> >                                ^
> > ../kernel/signal.c:1256:8: note: in expansion of macro 'get_user'
> >     if (get_user(insn, (unsigned char *)(regs->ip + i)))
> >         ^~~~~~~~
> >
> >
>
>
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>



-- 
Best Regards
Masahiro Yamada
