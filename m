Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E5C4445FF
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 17:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbhKCQiu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 12:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhKCQiu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 12:38:50 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60413C061714
        for <linux-next@vger.kernel.org>; Wed,  3 Nov 2021 09:36:13 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id s19-20020a056830125300b0055ad9673606so3033627otp.0
        for <linux-next@vger.kernel.org>; Wed, 03 Nov 2021 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e4yF2eGQahCe4lMOp7SwjM9VwcuDiHW6yfRGi+HRK00=;
        b=yDNz5wkHGiJfNBMBeXdGGbl3n4ipYfQkZeVc3VURfVenismBG4gTHHSfPUHCYq5G+5
         P2pwF4/xT//4k/KPKE9TE1liGp5x+lsBhhYPCF8iNijdyRtF07ufv9MUikB/m5LsyZHm
         kRPkTxg34NIGne/l/86bsWwRgnQdlozuszwGJlQBB/zYlzQV1kv4uG8IprrxLUthCZN5
         XrEDHa2p0hA+xHQ5HidRRUKNz5K0hwM/5p6avJ+Q0wClp1swLY3df9J3Ubj+ynharYBV
         2erAfG833nLG1Fk0mNmx5gkpK+NqcDk9ssGG4kayOKg+4DedMmuY1iXBT33m4d5qQUIR
         pDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e4yF2eGQahCe4lMOp7SwjM9VwcuDiHW6yfRGi+HRK00=;
        b=XSqbUJVbcZvFlbEhSg2FzxbL4OEn53gOXMwuYzChjnAcg56NpvjbmRNdxVdU+nV+Pl
         Kmoe06TZC0LR22CJo6Ozbq9tbtR2OA4zfm6Q/+Va/khG9I5rHGjx/LiwWMhbz8Or02Pn
         lF2+2fjQhcMg9f3jRDvM3tSHidKqEXCveQKILzaWv1mOoFT571AS5yOwaG9xiWvttbNg
         2am8GPPklDBU8AofpeN9JxctBMctS0bONMSo94HbS16KDR0rxL/WCz/tWKxdyUXczE2F
         jaYRtlMTKueBuAYeUgjoQ2Zk/yvb4ClwcrQCUxU2MF7YriyOPlENgqB2hMJh9Yb4ecKD
         0uDg==
X-Gm-Message-State: AOAM5305bDehQ6gCZimK2vvOojV81EBQOxYb/OFiWSiM+M4DpTwxfkfT
        Qvi060JON1xMYwxLekN2tyXLaw==
X-Google-Smtp-Source: ABdhPJyHFoXqxLA9umUAMoyUFKsI26lCNCxC3oOHc7Hco4i+YbHlUGLSsgFxhwsiNT92a+uHD+tFPA==
X-Received: by 2002:a05:6830:2242:: with SMTP id t2mr29418530otd.72.1635957372644;
        Wed, 03 Nov 2021 09:36:12 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id m13sm678896ooj.43.2021.11.03.09.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 09:36:12 -0700 (PDT)
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
To:     Ming Lei <ming.lei@redhat.com>
Cc:     Yi Zhang <yi.zhang@redhat.com>,
        Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
References: <YYIHXGSb2O5va0vA@T590>
 <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
 <733e1dcd-36a1-903e-709a-5ebe5f491564@kernel.dk>
 <CAHj4cs8U-Tboc-i-ZpK2-7euPZNsHja_6SWs6Ap0ywddStLC_A@mail.gmail.com>
 <YYKjPIoMR04HrcWp@T590> <2a3b12f7-ea1b-c843-8370-8086ae2993ec@kernel.dk>
 <9d38a844-233b-26e4-ed36-f6a3f453bb92@kernel.dk> <YYKnv9VNR7NgdU5p@T590>
 <30e8f85a-bc43-675f-6594-93c2c60ebd18@kernel.dk>
 <44d88e28-9e06-3b2b-e6e3-7acb96df7d83@kernel.dk> <YYK0TR4mZlBt4xcj@T590>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <253b3f73-e952-379f-64c5-cb64321410c7@kernel.dk>
Date:   Wed, 3 Nov 2021 10:36:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YYK0TR4mZlBt4xcj@T590>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/3/21 10:09 AM, Ming Lei wrote:
> On Wed, Nov 03, 2021 at 09:49:20AM -0600, Jens Axboe wrote:
>> On 11/3/21 9:41 AM, Jens Axboe wrote:
>>> On 11/3/21 9:16 AM, Ming Lei wrote:
>>>> On Wed, Nov 03, 2021 at 09:10:17AM -0600, Jens Axboe wrote:
>>>>> On 11/3/21 9:03 AM, Jens Axboe wrote:
>>>>>> On 11/3/21 8:57 AM, Ming Lei wrote:
>>>>>>> On Wed, Nov 03, 2021 at 09:59:02PM +0800, Yi Zhang wrote:
>>>>>>>> On Wed, Nov 3, 2021 at 7:59 PM Jens Axboe <axboe@kernel.dk> wrote:
>>>>>>>>>
>>>>>>>>> On 11/2/21 9:54 PM, Jens Axboe wrote:
>>>>>>>>>> On Nov 2, 2021, at 9:52 PM, Ming Lei <ming.lei@redhat.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> ﻿On Tue, Nov 02, 2021 at 09:21:10PM -0600, Jens Axboe wrote:
>>>>>>>>>>>>> On 11/2/21 8:21 PM, Yi Zhang wrote:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Can either one of you try with this patch? Won't fix anything, but it'll
>>>>>>>>>>>>>>> hopefully shine a bit of light on the issue.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>> Hi Jens
>>>>>>>>>>>>>
>>>>>>>>>>>>> Here is the full log:
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks! I think I see what it could be - can you try this one as well,
>>>>>>>>>>>> would like to confirm that the condition I think is triggering is what
>>>>>>>>>>>> is triggering.
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>>>>>>>>>>> index 07eb1412760b..81dede885231 100644
>>>>>>>>>>>> --- a/block/blk-mq.c
>>>>>>>>>>>> +++ b/block/blk-mq.c
>>>>>>>>>>>> @@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>>>>>>>>>>>    if (plug && plug->cached_rq) {
>>>>>>>>>>>>        rq = rq_list_pop(&plug->cached_rq);
>>>>>>>>>>>>        INIT_LIST_HEAD(&rq->queuelist);
>>>>>>>>>>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>>>>>>>>>>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>>>>>>>>>>>>    } else {
>>>>>>>>>>>>        struct blk_mq_alloc_data data = {
>>>>>>>>>>>>            .q        = q,
>>>>>>>>>>>> @@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>>>>>>>>>>>                bio_wouldblock_error(bio);
>>>>>>>>>>>>            goto queue_exit;
>>>>>>>>>>>>        }
>>>>>>>>>>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>>>>>>>>>>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>>>>>>>>>>>
>>>>>>>>>>> Hello Jens,
>>>>>>>>>>>
>>>>>>>>>>> I guess the issue could be the following code run without grabbing
>>>>>>>>>>> ->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request_hctx().
>>>>>>>>>>>
>>>>>>>>>>> .rq_flags       = q->elevator ? RQF_ELV : 0,
>>>>>>>>>>>
>>>>>>>>>>> then elevator is switched to real one from none, and check on q->elevator
>>>>>>>>>>> becomes not consistent.
>>>>>>>>>>
>>>>>>>>>> Indeed, that’s where I was going with this. I have a patch, testing it
>>>>>>>>>> locally but it’s getting late. Will send it out tomorrow. The nice
>>>>>>>>>> benefit is that it allows dropping the weird ref get on plug flush,
>>>>>>>>>> and batches getting the refs as well.
>>>>>>>>>
>>>>>>>>> Yi/Steffen, can you try pulling this into your test kernel:
>>>>>>>>>
>>>>>>>>> git://git.kernel.dk/linux-block for-next
>>>>>>>>>
>>>>>>>>> and see if it fixes the issue for you. Thanks!
>>>>>>>>
>>>>>>>> It still can be reproduced with the latest linux-block/for-next, here is the log
>>>>>>>>
>>>>>>>> fab2914e46eb (HEAD, new/for-next) Merge branch 'for-5.16/drivers' into for-next
>>>>>>>
>>>>>>> Hi Yi,
>>>>>>>
>>>>>>> Please try the following change:
>>>>>>>
>>>>>>>
>>>>>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>>>>>> index e1e64964a31b..eb634a9c61ff 100644
>>>>>>> --- a/block/blk-mq.c
>>>>>>> +++ b/block/blk-mq.c
>>>>>>> @@ -494,7 +494,6 @@ struct request *blk_mq_alloc_request(struct request_queue *q, unsigned int op,
>>>>>>>  		.q		= q,
>>>>>>>  		.flags		= flags,
>>>>>>>  		.cmd_flags	= op,
>>>>>>> -		.rq_flags	= q->elevator ? RQF_ELV : 0,
>>>>>>>  		.nr_tags	= 1,
>>>>>>>  	};
>>>>>>>  	struct request *rq;
>>>>>>> @@ -504,6 +503,7 @@ struct request *blk_mq_alloc_request(struct request_queue *q, unsigned int op,
>>>>>>>  	if (ret)
>>>>>>>  		return ERR_PTR(ret);
>>>>>>>  
>>>>>>> +	data.rq_flags	= q->elevator ? RQF_ELV : 0,
>>>>>>>  	rq = __blk_mq_alloc_requests(&data);
>>>>>>>  	if (!rq)
>>>>>>>  		goto out_queue_exit;
>>>>>>> @@ -524,7 +524,6 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
>>>>>>>  		.q		= q,
>>>>>>>  		.flags		= flags,
>>>>>>>  		.cmd_flags	= op,
>>>>>>> -		.rq_flags	= q->elevator ? RQF_ELV : 0,
>>>>>>>  		.nr_tags	= 1,
>>>>>>>  	};
>>>>>>>  	u64 alloc_time_ns = 0;
>>>>>>> @@ -551,6 +550,7 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
>>>>>>>  	ret = blk_queue_enter(q, flags);
>>>>>>>  	if (ret)
>>>>>>>  		return ERR_PTR(ret);
>>>>>>> +	data.rq_flags	= q->elevator ? RQF_ELV : 0,
>>>>>>
>>>>>> Don't think that will compile, but I guess the point is that we can't do
>>>>>> this assignment before queue enter, in case we're in the midst of
>>>>>> switching schedulers. Which is indeed a valid concern.
>>>>>
>>>>> Something like the below. Maybe? On top of the for-next that was already
>>>>> pulled in.
>>>>>
>>>>>
>>>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>>>> index b01e05e02277..121f1898d529 100644
>>>>> --- a/block/blk-mq.c
>>>>> +++ b/block/blk-mq.c
>>>>> @@ -433,9 +433,11 @@ static struct request *__blk_mq_alloc_requests(struct blk_mq_alloc_data *data)
>>>>>  	if (data->cmd_flags & REQ_NOWAIT)
>>>>>  		data->flags |= BLK_MQ_REQ_NOWAIT;
>>>>>  
>>>>> -	if (data->rq_flags & RQF_ELV) {
>>>>> +	if (q->elevator) {
>>>>>  		struct elevator_queue *e = q->elevator;
>>>>>  
>>>>> +		data->rq_flags |= RQF_ELV;
>>>>> +
>>>>>  		/*
>>>>>  		 * Flush/passthrough requests are special and go directly to the
>>>>>  		 * dispatch list. Don't include reserved tags in the
>>>>> @@ -494,7 +496,6 @@ struct request *blk_mq_alloc_request(struct request_queue *q, unsigned int op,
>>>>>  		.q		= q,
>>>>>  		.flags		= flags,
>>>>>  		.cmd_flags	= op,
>>>>> -		.rq_flags	= q->elevator ? RQF_ELV : 0,
>>>>>  		.nr_tags	= 1,
>>>>>  	};
>>>>>  	struct request *rq;
>>>>> @@ -524,7 +525,6 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
>>>>>  		.q		= q,
>>>>>  		.flags		= flags,
>>>>>  		.cmd_flags	= op,
>>>>> -		.rq_flags	= q->elevator ? RQF_ELV : 0,
>>>>>  		.nr_tags	= 1,
>>>>>  	};
>>>>>  	u64 alloc_time_ns = 0;
>>>>> @@ -565,6 +565,8 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
>>>>>  
>>>>>  	if (!q->elevator)
>>>>>  		blk_mq_tag_busy(data.hctx);
>>>>> +	else
>>>>> +		data.rq_flags |= RQF_ELV;
>>>>>  
>>>>>  	ret = -EWOULDBLOCK;
>>>>>  	tag = blk_mq_get_tag(&data);
>>>>> @@ -2560,7 +2562,6 @@ void blk_mq_submit_bio(struct bio *bio)
>>>>>  			.q		= q,
>>>>>  			.nr_tags	= 1,
>>>>>  			.cmd_flags	= bio->bi_opf,
>>>>> -			.rq_flags	= q->elevator ? RQF_ELV : 0,
>>>>>  		};
>>>>
>>>> The above patch looks fine.
>>>>
>>>> BTW, 9ede85cb670c ("block: move queue enter logic into
>>>> blk_mq_submit_bio()") moves the queue enter into blk_mq_submit_bio(),
>>>> which seems dangerous, especially blk_mq_sched_bio_merge() needs
>>>> hctx/ctx which requires q_usage_counter to be grabbed.
>>>
>>> I think the best solution is to enter just for that as well, and just
>>> retain that enter state. I'll update the patch, there's some real fixes
>>> in there too for the batched alloc. Will post them later today.
>>
>> Is it needed, though? As far as I can tell, it's only needed
>> persistently for having the IO inflight, otherwise if the premise is
>> that the queue can just go away, we're in trouble before that too. And I
>> don't think that's the case.
> 
> inflight bio just means that bdev is opened, and request queue won't
> go away.
> 
> But a lot things still can happen: elevator switch, update nr_hw_queues,
> clean up request queue, so looks blk_mq_sched_bio_merge() not safe
> without grabbing .q_usage_counter?

Yes good point, we need a consistent sched/queue view at that point.
I'll update it.

-- 
Jens Axboe

