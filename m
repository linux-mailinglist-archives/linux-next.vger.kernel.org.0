Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588FA2CDA85
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 16:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387880AbgLCP6m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 10:58:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731085AbgLCP6l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 10:58:41 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E89FC061A52
        for <linux-next@vger.kernel.org>; Thu,  3 Dec 2020 07:58:01 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id w6so1573069pfu.1
        for <linux-next@vger.kernel.org>; Thu, 03 Dec 2020 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LvgUdjvKhTgEmbR96saiQbXiMEKKGZO1Yra/8ik4nsg=;
        b=hCtqNIT7+vOjRc9P3r35rSSirYGzaEVY+vXwcQHD85+7S1aXs6mkVGlt7ifDfn/H6N
         nYKekPtUjZDr0XO3FiUCrx9YEjHtgql2gfgD0xpEKai5xc0ZH9p0DSJyakLl/gdyUw08
         HFTOJ6bJRMSGx8wbAhLcEkgcIvQHAvB5ppgO4rfzibQRiHohca+spoAVrfq202jBTmyD
         YANyLUXndcH6v4xwIdNMk9HUqux163jLPf11K1YeobELeV77qgMq8vOYGiVakZ9G62Bv
         fsv2a8qJwzUaVRGG/d0pHJWRbdK3F7FNgPVeqZFEp8oGJfJ7Th1jI5oJGyZor1cKWE5I
         H8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LvgUdjvKhTgEmbR96saiQbXiMEKKGZO1Yra/8ik4nsg=;
        b=O/B4MqI5QOkn/cKdT5LwoD5XIcu+flwilaiTmoYYtR/zXP429A8722NGyeDoJt8JXz
         3QO2eC3NTecB8fD3ZwU/TvNCobjc8Ug0WRZTRdHxLmeTbrAMomzJnY3/yxcZnElE2rq6
         MhRWH8vdSmIkHbddHZO/kYEapJ9APQCgTBSX8W6ORJd8V2nBHuDz9HafQeYtjM7Se3Tw
         56irPFMZbAeMKvKByZ9G2BPFTNI0VSyaVu+HO7pvje0935lRY8b9dl9Qte2f4SKpj7qc
         i0eNOfHl6saQk5uqB2kCui5tyqqu8ZS0q2GSsW0TKTqVwVZvPC16yo5CIGf5tb4C0nl6
         CHnQ==
X-Gm-Message-State: AOAM533QP7QfEZNT+ZlIz0Vo/x3fnBURE5PBtJoKRfzZf8fLMU7oK2Lo
        e2ku290tyImEQe7J8xOcy4Lbpg==
X-Google-Smtp-Source: ABdhPJxLT5q/O3TiH6M6tsnszW/NzpamyVvmGiZ6heumzEUDZrfNeBqaW3RKLiIelRMkKuMWZ5bq9Q==
X-Received: by 2002:a63:2045:: with SMTP id r5mr3641085pgm.6.1607011081077;
        Thu, 03 Dec 2020 07:58:01 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id d25sm2180530pfo.172.2020.12.03.07.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 07:58:00 -0800 (PST)
Subject: Re: linux-next: manual merge of the block tree with the arm64 tree
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20201203142530.4d962ea5@canb.auug.org.au>
 <20201203110122.GC2224@gaia> <52116588-c870-27e2-4b8f-873d3393553c@kernel.dk>
 <20201203150502.GC2830@gaia>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d6978349-ffde-9fbc-bd27-37eee935442d@kernel.dk>
Date:   Thu, 3 Dec 2020 08:58:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203150502.GC2830@gaia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/3/20 8:05 AM, Catalin Marinas wrote:
> On Thu, Dec 03, 2020 at 07:36:10AM -0700, Jens Axboe wrote:
>> On 12/3/20 4:01 AM, Catalin Marinas wrote:
>>> On Thu, Dec 03, 2020 at 02:25:30PM +1100, Stephen Rothwell wrote:
>>>> diff --cc arch/arm64/include/asm/thread_info.h
>>>> index 015beafe58f5,cdcf307764aa..000000000000
>>>> --- a/arch/arm64/include/asm/thread_info.h
>>>> +++ b/arch/arm64/include/asm/thread_info.h
>>>> @@@ -63,7 -66,9 +63,8 @@@ void arch_release_task_struct(struct ta
>>>>   #define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
>>>>   #define TIF_FOREIGN_FPSTATE	3	/* CPU's FP state is not current's */
>>>>   #define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
>>>> - #define TIF_MTE_ASYNC_FAULT	5	/* MTE Asynchronous Tag Check Fault */
>>>>  -#define TIF_FSCHECK		5	/* Check FS is USER_DS on return */
>>>> ++#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
>>>> + #define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
>>>>  -#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>>>>   #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
>>>>   #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
>>>>   #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
>>>> @@@ -96,7 -103,8 +98,8 @@@
>>>>   
>>>>   #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
>>>>   				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
>>>> - 				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT)
>>>>  -				 _TIF_UPROBE | _TIF_FSCHECK | _TIF_MTE_ASYNC_FAULT | \
>>>> ++				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
>>>> + 				 _TIF_NOTIFY_SIGNAL)
>>>
>>> Thanks Stephen. It looks alright to me.
>>
>> Agree - I'll rebase my tree when -rc7 is out so we won't have this issue once
>> the 5.11 merge window opens.
> 
> I don't think rebasing on -rc7 will help since the arm64 commit
> b5a5a01d8e9a is queued for 5.11 (so not in -rc7).

Ah indeed, I saw some changes come in yesterday for mainline and assumed
it was those.

> It shouldn't matter much, Linus likes the occasional conflict ;).
> Anyway, I can wait for your pull request to go in if you'd prefer (and
> if it happens in the first week of the merging window).

Right, not an issue, it's a trivial resolve anyway. That branch is
dependent on an x86/core branch, so I'll push it out when that goes in.
But Linus usually pulls those early, so don't think we'll have much of
an issue there.

-- 
Jens Axboe

