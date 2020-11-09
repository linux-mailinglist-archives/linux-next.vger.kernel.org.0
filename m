Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245552ABE4D
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 15:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730556AbgKIONx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 09:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730510AbgKIONx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 09:13:53 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8912AC0613CF
        for <linux-next@vger.kernel.org>; Mon,  9 Nov 2020 06:13:51 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id r9so9896602ioo.7
        for <linux-next@vger.kernel.org>; Mon, 09 Nov 2020 06:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dW3iaMNRaK29PFwXsdN2BpW3nrFRdjVd9RZvzmco9OQ=;
        b=mOSQ8eXb8EWF51GfkbaMjtB9cy5675N6ueGCBtvgX1tvlPheBO+5kJq9y46H20QJ1w
         8P7Gqjb88nW0PLQwCitwLY9o6PzqZnaDq1hIgVLzyXM6FHKY9HKRHvHKsh6WpoVje5YC
         rdXTTmZXpZyDp8YWDdvEIU4WMx22yYN0yLp6N0lGO4k7RAD2qPHnkVFVm0H7iDevOC82
         WfL4Pnq1ebUGOxhKXCNQsMKKGv8TLGae6wYZH7kdy8amPwKQesfUl1k+ECO8SJC0wF/4
         GIlvtjTPB6KMgxapZ6aW9u2loV4rPqvWLHL0ICsFAC3DNModFwSFPyzjellsJknxB78/
         MWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dW3iaMNRaK29PFwXsdN2BpW3nrFRdjVd9RZvzmco9OQ=;
        b=Axji5CxYepbmS0YbOCuBFQ4EOaE9BAAATLwuIUf4bI6TliR/02zX0OZphBrh6mQmqn
         T9/bGDH3WEhcj+zy2aLLXkKIRtmp+ugJW7n7v11vPJ3oCgzPiQ4zfhOuMDF4fNx9oWwe
         E+OYhCmVfs9viVkRSzipXMgTCfZdODSoRi7zrk1m8Y97GUqltYFK0zOt6vLcK/s97TZU
         AkjQJrt2i/2Y98Zp4azDfewAGUZvYMuAtDT+0ohptx/E+WuU0peIvIgvYdP7srYs2Z3G
         //u4HdRZTgZuMPTYYyavU6dxN/qkMiQLL1agxr6fDx9vpw4bkuDTApQFwLPtfTg61Nc9
         8h0A==
X-Gm-Message-State: AOAM533ODhQya9ZXm7GTeb/QSLOy+1DDR15QV2j9emYJGV54bSQaG9Du
        THikVRf0QCxw/W45n3eTtP29B02HMarL+A==
X-Google-Smtp-Source: ABdhPJzjnR2tsju5hVZt+y1dI1ErLnSX344xymJetu9VL8AcwF1hO7ULykTAQ+OeDx+LGGFXWHci6g==
X-Received: by 2002:a92:ab04:: with SMTP id v4mr9184739ilh.18.1604930816707;
        Mon, 09 Nov 2020 06:06:56 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id c66sm7504741ilg.46.2020.11.09.06.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 06:06:55 -0800 (PST)
Subject: Re: linux-next: manual merge of the tip tree with the block tree
To:     Thomas Gleixner <tglx@linutronix.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201109141446.3370914b@canb.auug.org.au>
 <871rh2k5jq.fsf@nanos.tec.linutronix.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <02e6aad7-dbea-6820-df01-76263080b169@kernel.dk>
Date:   Mon, 9 Nov 2020 07:06:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <871rh2k5jq.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/9/20 6:45 AM, Thomas Gleixner wrote:
> On Mon, Nov 09 2020 at 14:14, Stephen Rothwell wrote:
>> Today's linux-next merge of the tip tree got a conflict in:
>>
>>   include/linux/sched/signal.h
>>   include/linux/tracehook.h
>>   kernel/signal.c
>>   kernel/task_work.c
>>
>> between commits:
>>
>>   fdb5f027ce66 ("task_work: use TIF_NOTIFY_SIGNAL if available")
>>   bf6996650675 ("task_work: remove legacy TWA_SIGNAL path")
>>   ceb39b7c17b7 ("kernel: remove checking for TIF_NOTIFY_SIGNAL")
>>
>> from the block tree and commit:
>>
>>   114518eb6430 ("task_work: Use TIF_NOTIFY_SIGNAL if available")
>>   12db8b690010 ("entry: Add support for TIF_NOTIFY_SIGNAL")
>>
>> from the tip tree.
> 
> Jens, how is that supposed to work?
> 
> You need to merge the 'core-entry-notify-signal' tag from the tip tree
> into your next branch to make the follow up changes actually work.

I just haven't rebased with that pulled in yet, will do that this
morning.

> Ideally you send the whole arch + core cleanup muck my way once the
> architecture people are happy.

Crossing fingers that I'll be able to collect all of the reviews in
time, some of them have been picked up in arch trees though. So probably
the easiest if we keep the setup as it is, which should work fine as
soon as I pull in your core branch.

-- 
Jens Axboe

