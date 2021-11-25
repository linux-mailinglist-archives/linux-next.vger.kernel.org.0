Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6447D45D9CF
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 13:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347064AbhKYMPw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 07:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348333AbhKYMNw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 07:13:52 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9364C06175F
        for <linux-next@vger.kernel.org>; Thu, 25 Nov 2021 04:10:40 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id s139so12080915oie.13
        for <linux-next@vger.kernel.org>; Thu, 25 Nov 2021 04:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TvO93ObMgTYHjDl6zNqxFkX4IbiTkta5TxuIJ9/0KE0=;
        b=uj6zTQLmvsacomfu4ja02b3+QGGKnR2VvOCjQU6GDqQ3tSfWyLurrZmiVooaYsYVzv
         91noICmFahhM2vJXHUdCdTC86dC4J0O0xLYX4HIAwgPJ6ltgW4iNqa0B8NnE/WGJ/pyv
         RcIQxqyNbQpST93lIaay+4v6cWXmlUDW1XMsoPw0v5MFoABHU5D6lIglCa6why1vMTKG
         ghUkK4/sBk0AAFtwPgDTot1oh+N0ceGiI7fYmvR8pB3rI5st37sHO9UrlT3yTBbTzF9v
         l6/R9Z6Cf57Si1tdLTZKp+N/SWdeuHs9eEu34sG7jl2pePNKba83A453HTwSGfj4ZIta
         jAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TvO93ObMgTYHjDl6zNqxFkX4IbiTkta5TxuIJ9/0KE0=;
        b=FS2OjQ3ZrUXelRUbTKGXyR0l/OsY4cSIft1F5tJPyHeYCgsUBquzDujeygJ0XPle+4
         xIYJQ6BkXR8RN8Ekd3CesjDgK5UWO6F7FgOj0wDYy9hFjR4FXhWhEQ67dstTMKEGGiIA
         KI9XXmnjkI88WzRvP4Jz1xxIFQvevFdIWg7PwtEHNuRmcBt2ZZl6EQipJRROW24gMze4
         XEigVlDG6QVO2Wv7btUXMsTosp+EB2wWifYhmZRZAAMpEneJ6uy9+dzfiT99VPvmPfBf
         FjL2caEDkC0AQQdrgyeKuGlkYlYZTqtX+9A9Q7zwWGqkYAPXDzVMAqbCC55ICqkfUpRW
         MkdA==
X-Gm-Message-State: AOAM531dyXO/8u3/+xNk2n4Gbn5e1xDw+hrCcugDwWDIAJstCU7KolOz
        7wQij7KIGfEWJSPAx6Y3UF8JWg==
X-Google-Smtp-Source: ABdhPJwfIBTpcnLWlUhrZerKtW/NA0YMhumz3pqkLqPb4YSPTm3bW+wCISbyS5i+PNkBiKGPcdXqkg==
X-Received: by 2002:a05:6808:14c3:: with SMTP id f3mr14791412oiw.162.1637842240252;
        Thu, 25 Nov 2021 04:10:40 -0800 (PST)
Received: from ?IPv6:2607:fb90:c2ea:cdb4:6680:99ff:fe6f:cb54? ([2607:fb90:c2ea:cdb4:6680:99ff:fe6f:cb54])
        by smtp.gmail.com with ESMTPSA id a16sm486384otj.79.2021.11.25.04.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 04:10:39 -0800 (PST)
Subject: Re: spinlock.c:306:9: error: implicit declaration of function
 '__raw_write_lock_nested'
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <41206fc7-f8ce-98aa-3718-ba3e1431e320@landley.net>
 <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <7d5a5249-40ee-9a42-c6a0-a5defa3703c1@landley.net>
 <CAK8P3a0XGz=F0nPAW8T-VvfH5bPuGTNiPZ18N+Z6Sj_M_6TrPA@mail.gmail.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <eef6670c-1fb7-2d01-72ed-258d49227de1@landley.net>
Date:   Thu, 25 Nov 2021 06:10:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0XGz=F0nPAW8T-VvfH5bPuGTNiPZ18N+Z6Sj_M_6TrPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/25/21 1:25 AM, Arnd Bergmann wrote:
> On Thu, Nov 25, 2021 at 12:38 AM Rob Landley <rob@landley.net> wrote:
>> On 11/24/21 1:49 AM, Arnd Bergmann wrote:
>> > On Wed, Nov 24, 2021 at 8:31 AM Rob Landley <rob@landley.net> wrote:
> 
>> > Did you test clone3?
>>
>> Haven't got anything that's using it (musl-libc doesn't know about it yet) but
>> it looked straightforward? (Unlike the #ifdef stack around the previous clone...)
>>
>> I can try building tools/testing/selftests/clone3 if you like, but for some
>> reason the clone3 tests want -lcap which isn't in my cross compiler. (Because to
>> test a clone system call, you need to manipulate capability bits. Of course.)
>> Right, comment out the LDLIBS line in the makefile and the first 3 built, let's
>> try those... Hmmm, it's saying the syscall isn't supported, because it's using
>> syscall.h out of the cross compiler headers (not THIS kernel's #includes) which
>> of course doesn't have it, and then clone3_selftests.h falls back to:
>>
>> #ifndef __NR_clone3
>> #define __NR_clone3 -1
>> #endif
>>
>> Right, stick a 435 in there and... it's still skipping it. Why is it still
>> skipping it... because the RUNTIME syscall is returning ENOSYS. Ok, I have to go
>> stick printk() calls into the kernel. (Do I have to #define those
>> #YES_I_WANT_THIS_SYSCALL_WHY_WOULDNT_I macros? Hmmm...)
> 
> This specific syscall is protected by a macro so it doesn't get implicitly
> enabled without architecture specific review for those architectures using
> include/uapi/asm-generic/unistd.h.

Sigh.

>> > This needs a custom wrapper on most architectures
>> > to have sensible calling conventions.
>>
>> Define "sensible" in this context? It's a new 2 argument syscall? (Do you mean a
>> libc wrapper?)
>>
>> > If sh doesn't need it, that should
>> > be explained in the changelog text.
>>
>> I'm happy to try to fix stuff up, but I don't understand the objection. Does it
>> do something other than what the old clone did, except without the need to pass
>> more arguments than we necessarily have registers defined for? (Calls the same
>> clone plumbing, which should call back into arch/sh/kernel/process_32.c already...?)
>>
>> The most recent clone3 arch addition was commit 59a4e0d5511b which also just
>> pulled in the generic version. (Via #define NO_REALLY_I_WANT_THIS_SYSCALL rather
>> than editing the tbl file? Looks like I've got some reading to do...)
> 
> The best reference I could find is:
> 
> https://lore.kernel.org/linux-api/20190604160944.4058-2-christian@brauner.io/

Does not say what the special handling is. Does not provide an example of said
special handling. Implied that only three do NOT need special handling, two of
which are x86 and arm, which seems... convenient.

Right, let's see what "grep -r clone arch/" says:

m68k/kernel/process.c is obviously overriding
arc/include/syscalls.h has sys_clone_wrapper()
nios2/kernel/process.c has nios2_clone()
openrisc/kernel/entry.S has __sys_clone()
sparc/kernel/process.c has sparce_clone()
h8300/kernel/process.c has its own sys_clone()
ia64/kernel/process.c has ia64_clone()
user mode linux is just weird.

So the architectures that wrap clone are m68k, arc, nios2, openrisc, sparc,
h8300, and ia64.

Implying that the ones that DON'T are alpha, arm64, hexagon, nds32, parisc,
s390, csky, microblaze, powerpc, sh, x86, arm, mips, riscv, and xtensa.

Which would mean 2/3 of architectures don't wrap clone, and thus arch/sh not
doing so isn't unusual.

> If fork() and clone() don't need special handling on arch/sh, then
> clone3 shouldn't
> need it either, unless the existing ones are also wrong. It looks like
> some architectures
> override these to avoid leaking register state from the kernel to the
> child process.

$ cd arch/sh

$ grep -r clone
tools/Makefile:# Shamelessly cloned from ARM.
kernel/process_32.c:int copy_thread(unsigned long clone_flags, unsigned long
usp, unsigned long arg,
kernel/process_32.c:	if (clone_flags & CLONE_SETTLS)
kernel/syscalls/syscall.tbl:120	common	clone				sys_clone
kernel/syscalls/syscall.tbl:435	common	clone3				sys_clone3

$ grep -r fork
include/asm/cacheflush.h: *  - flush_cache_dup mm(mm) handles cache flushing
when forking
kernel/entry-common.S:	.globl	ret_from_fork
kernel/entry-common.S:ret_from_fork:
kernel/cpu/init.c: * state prior to hand forking the idle loop.
kernel/process_32.c:asmlinkage void ret_from_fork(void);
kernel/process_32.c:	p->thread.pc = (unsigned long) ret_from_fork;
kernel/syscalls/syscall.tbl:2	common	fork				sys_fork
kernel/syscalls/syscall.tbl:190	common	vfork				sys_vfork

Hard to prove a negative, but I'm not seeing any wrappers. It's got some
callbacks, but I think the existing plumbing is calling them already?

>        Arnd

Rob
