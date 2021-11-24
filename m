Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A0445D14F
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 00:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235005AbhKXXlQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 18:41:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbhKXXlP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 18:41:15 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29286C061574
        for <linux-next@vger.kernel.org>; Wed, 24 Nov 2021 15:38:05 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so6732246otl.8
        for <linux-next@vger.kernel.org>; Wed, 24 Nov 2021 15:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B8djMvr5C1RUpidUre9QOVwQnxy1dQwhg3YPD/0MqFM=;
        b=3QF7kW2JIT/4nSNZtRDjMKbGYaNpcX3T1kpPpMDTuC+q9LgPlx9s3kdhJgwLjn2/Uz
         G9AELgSDXu+BxkAcBwUUTMyNM9Onapnsuk/EdWxjlYYXYBoXzTx9k93R4cCn9K3Kw0Aw
         8VSK9qvs2eIuNU+W1H3i9R002vmSdMji0dXDkD3WmuYUH/YyxVUPx0bcFxJ/t32Wvvqo
         5+q1gByCF6H2aahvfU59lNSzhQddCuWz0OhGgjoMThhtlr05C4wGt55Ix5HcXD1LoL3k
         QyQjvUx9LVlA3AiJxaICQVzPirxZYzsr8NqSY7MljJVX84+lY3b+xcSQogNsF7rmsCjs
         FJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B8djMvr5C1RUpidUre9QOVwQnxy1dQwhg3YPD/0MqFM=;
        b=d+hSczVFdSI2GpCYubb0Cxjv9SYX/rqMqnblsNBOoJnUqmhXRMWeSaxWEm6torvJKo
         micI4HIkxNV921y9f3Dpfr9yhMYCZ/YnPpmrLdVwKrTKnPv3wMZOHpTx6d37GnNy+M+p
         B+u9dWBqdcMWwwQH3C5HPjfRTaTlrI8w8xZn3bnfMLhcw9FF4ffPIKhnP67ic1Z9QLIv
         ijAIo4a8zZ5xsg1gT6omDwc3Qp9RKWWI/7JaVGALdewHCqFB3f8u9V/fqpebTz/B99Wy
         J+gqJGgsGX+sB2GPEZmeCT3badtWoyzlR3rQj3yjs+u4EgXnUAvP8xu3CRJca8eWsoos
         eCYg==
X-Gm-Message-State: AOAM532hZvkNgVRYebMtpxn5bCmfcJdEZlJLzb9iDzOPGfVSQF2i+/wS
        NVg4gKkYNM/ZdA6l/p50fZb7IA==
X-Google-Smtp-Source: ABdhPJy9ywL4FWZwv0YFYMa2Trkll/m+Oz7OoPrI9cYJiel4kv5HfOir4I2teqkK3Fw/4dNiPPgdOQ==
X-Received: by 2002:a9d:4f0b:: with SMTP id d11mr17210189otl.227.1637797084457;
        Wed, 24 Nov 2021 15:38:04 -0800 (PST)
Received: from ?IPv6:2607:fb90:c2d2:892e:8ae:f6ff:fe37:f28b? ([2607:fb90:c2d2:892e:8ae:f6ff:fe37:f28b])
        by smtp.gmail.com with ESMTPSA id j20sm218283ota.76.2021.11.24.15.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 15:38:04 -0800 (PST)
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
From:   Rob Landley <rob@landley.net>
Message-ID: <7d5a5249-40ee-9a42-c6a0-a5defa3703c1@landley.net>
Date:   Wed, 24 Nov 2021 17:38:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/24/21 1:49 AM, Arnd Bergmann wrote:
> On Wed, Nov 24, 2021 at 8:31 AM Rob Landley <rob@landley.net> wrote:
>> On 11/23/21 5:38 AM, Naresh Kamboju wrote:
>>
>> diff --git a/arch/sh/kernel/syscalls/syscall.tbl
>> b/arch/sh/kernel/syscalls/syscall.tbl
>> index 208f131659c5..65c3a94bff48 100644
>> --- a/arch/sh/kernel/syscalls/syscall.tbl
>> +++ b/arch/sh/kernel/syscalls/syscall.tbl
>> @@ -437,7 +437,7 @@
>>  432    common  fsmount                         sys_fsmount
>>  433    common  fspick                          sys_fspick
>>  434    common  pidfd_open                      sys_pidfd_open
>> -# 435 reserved for clone3
>> +435    common  clone3                          sys_clone3
>>  436    common  close_range                     sys_close_range
>>  437    common  openat2                         sys_openat2
>>  438    common  pidfd_getfd                     sys_pidfd_getfd
> 
> Did you test clone3?

Haven't got anything that's using it (musl-libc doesn't know about it yet) but
it looked straightforward? (Unlike the #ifdef stack around the previous clone...)

I can try building tools/testing/selftests/clone3 if you like, but for some
reason the clone3 tests want -lcap which isn't in my cross compiler. (Because to
test a clone system call, you need to manipulate capability bits. Of course.)
Right, comment out the LDLIBS line in the makefile and the first 3 built, let's
try those... Hmmm, it's saying the syscall isn't supported, because it's using
syscall.h out of the cross compiler headers (not THIS kernel's #includes) which
of course doesn't have it, and then clone3_selftests.h falls back to:

#ifndef __NR_clone3
#define __NR_clone3 -1
#endif

Right, stick a 435 in there and... it's still skipping it. Why is it still
skipping it... because the RUNTIME syscall is returning ENOSYS. Ok, I have to go
stick printk() calls into the kernel. (Do I have to #define those
#YES_I_WANT_THIS_SYSCALL_WHY_WOULDNT_I macros? Hmmm...)

But yeah, you're right: the naive patch doesn't look like it actually works.
Just shuts up the #warnings.

> This needs a custom wrapper on most architectures
> to have sensible calling conventions.

Define "sensible" in this context? It's a new 2 argument syscall? (Do you mean a
libc wrapper?)

> If sh doesn't need it, that should
> be explained in the changelog text.

I'm happy to try to fix stuff up, but I don't understand the objection. Does it
do something other than what the old clone did, except without the need to pass
more arguments than we necessarily have registers defined for? (Calls the same
clone plumbing, which should call back into arch/sh/kernel/process_32.c already...?)

The most recent clone3 arch addition was commit 59a4e0d5511b which also just
pulled in the generic version. (Via #define NO_REALLY_I_WANT_THIS_SYSCALL rather
than editing the tbl file? Looks like I've got some reading to do...)

>> @@ -451,3 +451,4 @@
>>  446    common  landlock_restrict_self          sys_landlock_restrict_self
>>  # 447 reserved for memfd_secret
>>  448    common  process_mrelease                sys_process_mrelease
>> +449    common  futex_waitv                     sys_futex_waitv
> 
> I don't know what's going on with this one, I don't actually see
> a reason why it isn't already wired up on all architectures.

Me neither, I'm just trying to stay ahead of warnings due to the encroaching
-Werror culture going on within the kernel clique.

> If we add
> this, it should probably be done for all architectures at once as a
> bugfix, but it's possible that this is intentionally only used on
> x86 and arm.
> 
> André, can you comment on this?

I see elsethread the second syscall got handled and is going in through another
tree, I'll leave off on that part...

Rob
