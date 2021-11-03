Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5814440F1
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 12:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhKCMCU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 08:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbhKCMCT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 08:02:19 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4B6C061714
        for <linux-next@vger.kernel.org>; Wed,  3 Nov 2021 04:59:43 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id x9so2214186ilu.6
        for <linux-next@vger.kernel.org>; Wed, 03 Nov 2021 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hkrFrHqgVjTg6gXAk46b2nB4I3hOJoyqjtnsKka5lB8=;
        b=rv/7YguhQ5xBR8sowInwgWwdHzfXevYwJpyg74fiFDU7k69rXKsrtBDU8IEhE7xIFs
         N5s3La3DdGdg60IqxM9Zub+nFho93frOhPywBgDqAYQGLMBhKuJU/N0D7oJ0traCyrX9
         cPN2GswZQB026KeOOoUhpyA+A7Nup+4hNof/JrLOh8TiRuUjMzXx1giVTxm9A3qxdkw4
         U/Q/aTrVHf6idf0JxGXLZTzUjVy38QZHy2Ax0ALViqXNa3tweQRmMenv68BsflqsoidP
         wXprWPprxbjTw4xUk4IfqvEdK85UrR4LLuzn7ahrGgHDpDq2lwVCFm5esbbPyUGEHPri
         Jz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hkrFrHqgVjTg6gXAk46b2nB4I3hOJoyqjtnsKka5lB8=;
        b=gjGdd3NtAaOg8RKvLFw+QZqk7ZiK3mf9gCE8IIKEAmuz5M7w3yttDEsQq7EiMmWV9a
         HMEBmGnbgmuOdLFlCHrFwqFnL9QRoazx5muWAnsNPLjOOL4hA9OkEmbpND/+Qavjs3R9
         d4wiCI8NzlV5Q5QBnktD8/74FJR7fuF/AcVCQUoxWV0tOpIYF9m3Rar6J/O1sLrfX+J4
         WFmQhPa+r7d9cFhvUqCn4BQfKuXOiWPsHIim+InxwkgGBBnXWiwqT9UiaV2JbyqE8Jzl
         WhX15L4kT5d1o47DeOuZd8nfzBWrFsY2sf0ZnOBDd0rq7VFrjvZsbh07F3VcuSb7HcpV
         JuTQ==
X-Gm-Message-State: AOAM532M7okGrQTLrTAAR4EJJV4rg0JZFRNA/J0ew/u5apvRvfK01hkZ
        MFLecJE1K9uJCOevtFjBlCuJaUS14XgkiQ==
X-Google-Smtp-Source: ABdhPJy6WvG8mT6V+42crfbNqxw0Q0w5U1A/P6SFWQCA078btj3A6hsLgxKYpxVTCyi6ehu2VO/d3w==
X-Received: by 2002:a05:6e02:1526:: with SMTP id i6mr5548414ilu.3.1635940782450;
        Wed, 03 Nov 2021 04:59:42 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id d10sm1037520iog.25.2021.11.03.04.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 04:59:42 -0700 (PDT)
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
From:   Jens Axboe <axboe@kernel.dk>
To:     Ming Lei <ming.lei@redhat.com>
Cc:     Yi Zhang <yi.zhang@redhat.com>,
        Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
References: <YYIHXGSb2O5va0vA@T590>
 <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
Message-ID: <733e1dcd-36a1-903e-709a-5ebe5f491564@kernel.dk>
Date:   Wed, 3 Nov 2021 05:59:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/2/21 9:54 PM, Jens Axboe wrote:
> On Nov 2, 2021, at 9:52 PM, Ming Lei <ming.lei@redhat.com> wrote:
>>
>> ﻿On Tue, Nov 02, 2021 at 09:21:10PM -0600, Jens Axboe wrote:
>>>> On 11/2/21 8:21 PM, Yi Zhang wrote:
>>>>>>
>>>>>> Can either one of you try with this patch? Won't fix anything, but it'll
>>>>>> hopefully shine a bit of light on the issue.
>>>>>>
>>>> Hi Jens
>>>>
>>>> Here is the full log:
>>>
>>> Thanks! I think I see what it could be - can you try this one as well,
>>> would like to confirm that the condition I think is triggering is what
>>> is triggering.
>>>
>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>> index 07eb1412760b..81dede885231 100644
>>> --- a/block/blk-mq.c
>>> +++ b/block/blk-mq.c
>>> @@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>>    if (plug && plug->cached_rq) {
>>>        rq = rq_list_pop(&plug->cached_rq);
>>>        INIT_LIST_HEAD(&rq->queuelist);
>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>>>    } else {
>>>        struct blk_mq_alloc_data data = {
>>>            .q        = q,
>>> @@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>>                bio_wouldblock_error(bio);
>>>            goto queue_exit;
>>>        }
>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>>
>> Hello Jens,
>>
>> I guess the issue could be the following code run without grabbing
>> ->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request_hctx().
>>
>> .rq_flags       = q->elevator ? RQF_ELV : 0,
>>
>> then elevator is switched to real one from none, and check on q->elevator
>> becomes not consistent.
> 
> Indeed, that’s where I was going with this. I have a patch, testing it
> locally but it’s getting late. Will send it out tomorrow. The nice
> benefit is that it allows dropping the weird ref get on plug flush,
> and batches getting the refs as well. 

Yi/Steffen, can you try pulling this into your test kernel:

git://git.kernel.dk/linux-block for-next

and see if it fixes the issue for you. Thanks!

-- 
Jens Axboe

