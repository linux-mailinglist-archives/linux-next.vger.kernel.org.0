Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B059D2CD94D
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 15:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388581AbgLCOgt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 09:36:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388322AbgLCOgt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 09:36:49 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F14C061A4F
        for <linux-next@vger.kernel.org>; Thu,  3 Dec 2020 06:36:09 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id i18so2281343ioa.1
        for <linux-next@vger.kernel.org>; Thu, 03 Dec 2020 06:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JyvzNnLMbSa402JBvFFeTEuz0eTIabBQCYJuSpd62Ow=;
        b=lYan3A+omyGreZAMmL9AsH1jVEB8m7lti+wXlnM0x7YLcs2eUKp4Bsd+JWZQ6VYa6z
         XkpYhXpFiR91p8bmIuiRBO1w7Po/Y/W6l2mot5/0fDqs7AlkgYofEKiPvvz6PBen6H02
         +b8J5hj7EgY/X4sRyQYjOudtp34Hc2CAipZLxGEk7pyqbboeWgiSWPlWbCEvH53ynep8
         rJnnnosqVzrGwwk5aTTYLZU4zBZQ1ZkkgXX2w1heSmR41OxoTuNEAie7sXfnYbCJlyQY
         uh3/4uepiPop2IUNGv/cEcmzef7pKzbn6QgiyAlEaugpuCFVedQxfRFdXu4Uns5srYxA
         akvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JyvzNnLMbSa402JBvFFeTEuz0eTIabBQCYJuSpd62Ow=;
        b=tQ+rpwI4yUEY/lvrxTOGxxdrecoVMlw3Po4tTrSfKkAHBzj0zloxjDjNi+R2SkWhDh
         17ruWhb01FjttGnu7xcY5EIPqLcqU4kASTd4b8oy26etngPpHznUqEVPPTWEwSbs02dv
         xdwXuCFEEaYhG7qHQ1sLsuKLu6c2+Z9bZ7eqQiTvABMKY5/V+n2KpZZCa+650/6prPFn
         jyM0EMsjceh9tQgzq4HCW8wDG8xEKAEVYMGqNk/CxqK9mhZwICxKHVL7rG+Rv14cHRvR
         QHOnbE/fdlqL4ayZBjPA0evV27M2nBnDXST53ZTdf4ajzAbp6c5DSjZ1CObP4PByCCaI
         JOZg==
X-Gm-Message-State: AOAM5312iyvcvA8so75Iyk/HWSl/g3IyPpBCzUDcPFOwUyHWLGpUs766
        PQ03FIhoJnNT5aO8n2prbAS3xg==
X-Google-Smtp-Source: ABdhPJxDh0Nfxa328ZTcvmeNQ1UDAXH44OKFtpufmW+k1nPA824XDv6p1iBtLl+dtM76mgwYsj3+wg==
X-Received: by 2002:a05:6638:526:: with SMTP id j6mr3633465jar.1.1607006168254;
        Thu, 03 Dec 2020 06:36:08 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id 130sm961689ilb.72.2020.12.03.06.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 06:36:07 -0800 (PST)
Subject: Re: linux-next: manual merge of the block tree with the arm64 tree
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20201203142530.4d962ea5@canb.auug.org.au>
 <20201203110122.GC2224@gaia>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <52116588-c870-27e2-4b8f-873d3393553c@kernel.dk>
Date:   Thu, 3 Dec 2020 07:36:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203110122.GC2224@gaia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/3/20 4:01 AM, Catalin Marinas wrote:
> On Thu, Dec 03, 2020 at 02:25:30PM +1100, Stephen Rothwell wrote:
>> diff --cc arch/arm64/include/asm/thread_info.h
>> index 015beafe58f5,cdcf307764aa..000000000000
>> --- a/arch/arm64/include/asm/thread_info.h
>> +++ b/arch/arm64/include/asm/thread_info.h
>> @@@ -63,7 -66,9 +63,8 @@@ void arch_release_task_struct(struct ta
>>   #define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
>>   #define TIF_FOREIGN_FPSTATE	3	/* CPU's FP state is not current's */
>>   #define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
>> - #define TIF_MTE_ASYNC_FAULT	5	/* MTE Asynchronous Tag Check Fault */
>>  -#define TIF_FSCHECK		5	/* Check FS is USER_DS on return */
>> ++#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
>> + #define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
>>  -#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>>   #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
>>   #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
>>   #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
>> @@@ -96,7 -103,8 +98,8 @@@
>>   
>>   #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
>>   				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
>> - 				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT)
>>  -				 _TIF_UPROBE | _TIF_FSCHECK | _TIF_MTE_ASYNC_FAULT | \
>> ++				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
>> + 				 _TIF_NOTIFY_SIGNAL)
> 
> Thanks Stephen. It looks alright to me.

Agree - I'll rebase my tree when -rc7 is out so we won't have this issue once
the 5.11 merge window opens.

-- 
Jens Axboe

