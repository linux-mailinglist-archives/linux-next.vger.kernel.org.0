Return-Path: <linux-next+bounces-6987-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB870AC8971
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 09:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78448189185F
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 07:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3E9211A2A;
	Fri, 30 May 2025 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cgi2AZCl"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97B211460
	for <linux-next@vger.kernel.org>; Fri, 30 May 2025 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591562; cv=none; b=nWCBQYuAhwo80ciW7nl4bd+cj+tzVySs/BsPY2LLomR9xkV8x6IYZMxQKxag/c/oYsfnxp4CBDv1INUS/03VtO/XC2kWanXSIwbnbAaTZUimeZ7EnIjo5hAor6SoEDyqjvRQaewSUydtbfwaALHJugnplX1JCfJ8KHd9KS/tTpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591562; c=relaxed/simple;
	bh=G7T/l+SD9ggtZyaAliggeCOwfSM27hsQMoMmxA00zko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyyivIB1SPHc3Km8oHJIswSEcQz0xxEH+YnRbi6k+Fyee46lh6T4Gbx0RJ0HQQtnjiPyCa2T/ZcR+i/R1BfYPSzA9FUOMLpbiUkeBxcC+c9B6zsP2lCAZbMFKf6C/a9uxHEYeayvHRy4Ov+A3GJxkzzE96zzBQ4F2zAc6DD5VQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cgi2AZCl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748591559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dXme6NLsCN/6JumBzv0W754qfhIz6/enEzzfyphIa0E=;
	b=cgi2AZCl2lBqCQilxK3mZgp9525Sf3BYMVZdWWlo6QFg/aEZbjieAvIpL4Ey1ezy4oMEU1
	5R/zj+DviJaEh4kSBcoP2lQze5SwD3Ui28+FXRSoADuDwqMZMyQ1SmDZyJLjppXL00gGTK
	69a2GCz+ULLk2eANK4MDprHNW0BlDi0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-1kOUNMQ9NUqv_WNqgV0v6A-1; Fri, 30 May 2025 03:52:38 -0400
X-MC-Unique: 1kOUNMQ9NUqv_WNqgV0v6A-1
X-Mimecast-MFC-AGG-ID: 1kOUNMQ9NUqv_WNqgV0v6A_1748591557
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-601a4d2913fso1708959a12.0
        for <linux-next@vger.kernel.org>; Fri, 30 May 2025 00:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748591557; x=1749196357;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXme6NLsCN/6JumBzv0W754qfhIz6/enEzzfyphIa0E=;
        b=vWTxryApL2ko/q6lfgMKaKqO6A4BYdqZWJEeGtUMjLtsNMXDpBVBir/mmd3WavxFEU
         GSMo1MISTJUIBpyuMoAAqOiTYFaw98GbLRgepjKhJKY4/rb5MZE3TPsLi3WsqKotQZ9B
         K3zOrewohvZCgCW6UhW3cnq5I3ChaT5oHIh1VhHq2UeCde35BQyQNQeiX4rEYexmnJT8
         UFGNCsOiXkJJ+2A38eJTFySLLMHK/oW1dPGH+VJK2Ypq2QI8JnvQeTHThNSvpcL12RIi
         2I4BctrIQ8V7CODTleaNhErlCfWn2Dd/wBuyLPNHyvBBz+jOQT0tbs77XEGMJUV5+nI+
         r53g==
X-Forwarded-Encrypted: i=1; AJvYcCWZefXM93iT8zo2axQihMD6X1Z5etHjDci7xwfIyN0gdrfdO/fwDY9JA/Mzq350mgYOnuTuXgYE5F/z@vger.kernel.org
X-Gm-Message-State: AOJu0YzhqCAKG8xzDrfeKl3riVqjwrnIWk+Fi7d2J5NQfeF3U0R3ttxU
	JWDMufwpK+GVWObmHe/R9dlSdhT05epkAGgXDtGk3r7GabYimoyzdfc278a0KIniSkx/9xj/NIU
	adEU4IUraG664UQ36i47+2zpy9nQAAPOvv6G8cdznsAmgAwBrIeH7xr82hii9P7k=
X-Gm-Gg: ASbGncto1rIu0Ndvp4YgNgJz22ss3NGZ34L4A4T9s1f9OyNOBYayAGauAYvf9/V2pnw
	k+3KDWyGVk7hWwAVeqpI2gn7TV2rAnA2lv1DNzLypr8zw5QLAj2QHSwo4U21VfvGOWC0mcwZvbO
	gVAZuZg3ahirfnGlihD9rBwqmM3ULTDEEOIlG5gJvuX4ANYjjZ9t48rtJCOYfN8Hi2mYtoL0xOe
	zs9+xWb66ZWkss2C2+QHY8pxVnutWKsGeOMaQbmoLXtx+ELaQCP4IhAkbYLFXS2DxDVe84sseS0
	G3DGIla/SgyKdQ==
X-Received: by 2002:a05:6402:2813:b0:5fb:87a2:5ef9 with SMTP id 4fb4d7f45d1cf-6057c621ee7mr948146a12.23.1748591556919;
        Fri, 30 May 2025 00:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWrvvdA9UB3dms/gjMEl+Cd773vHH5XoMNH/OJN8Qpd3i0iyiTFpV0kUVwOV/w6O9TdD8GEg==
X-Received: by 2002:a05:6402:2813:b0:5fb:87a2:5ef9 with SMTP id 4fb4d7f45d1cf-6057c621ee7mr948131a12.23.1748591556503;
        Fri, 30 May 2025 00:52:36 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-60566c5c222sm1235068a12.27.2025.05.30.00.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 00:52:35 -0700 (PDT)
Message-ID: <a283a171-7c74-4e05-bdb1-dd28f1fe6a6e@redhat.com>
Date: Fri, 30 May 2025 09:52:34 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 29 (kernel/locking/rtmutex_api.c)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Maxim Levitsky <mlevitsk@redhat.com>
References: <20250529165801.6dcb3fcf@canb.auug.org.au>
 <2d9429d0-e76c-429b-80d4-780052e0907c@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <2d9429d0-e76c-429b-80d4-780052e0907c@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/29/25 19:12, Randy Dunlap wrote:
> 
> 
> On 5/28/25 11:58 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20250528:
>>
> 
> on x86_64 or i386:
> 
> 
> In file included from ../include/uapi/linux/posix_types.h:5,
>                   from ../include/uapi/linux/types.h:14,
>                   from ../include/linux/types.h:6,
>                   from ../include/linux/kasan-checks.h:5,
>                   from ../include/asm-generic/rwonce.h:26,
>                   from ./arch/x86/include/generated/asm/rwonce.h:1,
>                   from ../include/linux/compiler.h:390,
>                   from ../include/linux/export.h:5,
>                   from ../include/linux/linkage.h:7,
>                   from ../include/linux/preempt.h:10,
>                   from ../include/linux/spinlock.h:56,
>                   from ../kernel/locking/rtmutex_api.c:5:
> ../include/linux/stddef.h:8:14: error: expected declaration specifiers or ‘...’ before ‘(’ token
>      8 | #define NULL ((void *)0)
>        |              ^
> ../include/linux/mutex.h:183:46: note: in expansion of macro ‘NULL’
>    183 |         _mutex_lock_killable(lock, subclass, NULL)
>        |                                              ^~~~
> ../kernel/locking/rtmutex_api.c:547:13: note: in expansion of macro ‘mutex_lock_killable_nested’
>    547 | int __sched mutex_lock_killable_nested(struct mutex *lock,
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ../kernel/locking/rtmutex_api.c:552:19: error: ‘mutex_lock_killable_nested’ undeclared here (not in a function); did you mean ‘mutex_lock_io_nested’?
>    552 | EXPORT_SYMBOL_GPL(mutex_lock_killable_nested);
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/export.h:76:23: note: in definition of macro ‘__EXPORT_SYMBOL’
>     76 |         extern typeof(sym) sym;                                 \
>        |                       ^~~
> ../include/linux/export.h:90:41: note: in expansion of macro ‘_EXPORT_SYMBOL’
>     90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
>        |                                         ^~~~~~~~~~~~~~
> ../kernel/locking/rtmutex_api.c:552:1: note: in expansion of macro ‘EXPORT_SYMBOL_GPL’
>    552 | EXPORT_SYMBOL_GPL(mutex_lock_killable_nested);
>        | ^~~~~~~~~~~~~~~~~
> ../include/linux/stddef.h:8:14: error: expected declaration specifiers or ‘...’ before ‘(’ token
>      8 | #define NULL ((void *)0)
>        |              ^
> ../include/linux/mutex.h:215:60: note: in expansion of macro ‘NULL’
>    215 | #define mutex_trylock(lock) _mutex_trylock_nest_lock(lock, NULL)
>        |                                                            ^~~~
> ../kernel/locking/rtmutex_api.c:596:13: note: in expansion of macro ‘mutex_trylock’
>    596 | int __sched mutex_trylock(struct mutex *lock)
>        |             ^~~~~~~~~~~~~
> ../kernel/locking/rtmutex_api.c:609:15: error: ‘mutex_trylock’ undeclared here (not in a function); did you mean ‘ww_mutex_trylock’?
>    609 | EXPORT_SYMBOL(mutex_trylock);
>        |               ^~~~~~~~~~~~~
> ../include/linux/export.h:76:23: note: in definition of macro ‘__EXPORT_SYMBOL’
>     76 |         extern typeof(sym) sym;                                 \
>        |                       ^~~
> ../include/linux/export.h:89:41: note: in expansion of macro ‘_EXPORT_SYMBOL’
>     89 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
>        |                                         ^~~~~~~~~~~~~~
> ../kernel/locking/rtmutex_api.c:609:1: note: in expansion of macro ‘EXPORT_SYMBOL’
>    609 | EXPORT_SYMBOL(mutex_trylock);
>        | ^~~~~~~~~~~~~
> 
> 
> This seems to be due to <linux/mutex.h> containing a #define for mutex_lock_killable_nested()
> when DEBUG_PAGE_ALLOC is set and another for when DEBUG_PAGE_ALLOC is not set.
> But then rtmutex_api.c has a function by that name also... (for the DEBUG_PAGE_ALLOC=y case,
> which is set in my failing randconfig file, which is attached).

Yep, the bad condition is CONFIG_DEBUG_PAGE_ALLOC=y + CONFIG_RT_MUTEXES=y.
Patch at https://lore.kernel.org/r/20250530075136.11842-1-pbonzini@redhat.com.

Thanks for the report!

Paolo


