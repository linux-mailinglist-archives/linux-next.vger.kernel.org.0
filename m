Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD371444451
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 16:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhKCPNA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 11:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbhKCPM6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 11:12:58 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D35C061205
        for <linux-next@vger.kernel.org>; Wed,  3 Nov 2021 08:10:20 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o83so4147413oif.4
        for <linux-next@vger.kernel.org>; Wed, 03 Nov 2021 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8Ia4rcqvq++s91loF/MszxTF+pNCekPuT6xLbfYsHs0=;
        b=g4fMqQCEfBYBj9MwBl16PT5SI3PBpwyNUAhBZxoOkMz3RlU3T3jbS+Ld7wvoN2qWw9
         qVZ7/Qd4cbeOZ7eLsX7etk0Bk2c53w2XuPSl/pscYZnjdCB2PgOV9QpY/tH8ejdvici7
         QWfVy2rqjT07hJBVwjQcsAPy4OqfeWEXpUYD4f3AKr8aqbx93KDl0X+Sws4MU3rfpM7A
         QIPj45PnK1XP69VZO/coW37JNCrSC9xssJUMlhZfp6kW0wDgMA4aTIZSMt0k9dLyH37S
         pmDiowl53Yeir8ehtxQslHkcynKmjVRhYnEY2rxLjvdQ4NDbxfYnIB53MLtrkrCWjs4Y
         Cwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8Ia4rcqvq++s91loF/MszxTF+pNCekPuT6xLbfYsHs0=;
        b=nku+jEYSOPbL25evDb0BtHhtRQCACLARFTdXBbcOlvp4hetMm5cGWbOurTeG/ELeSR
         4scpwZsEgwYoRJsqFT5Prbvtxh0MAVpCAGT41FUfLGJnNwJ/7Z1+mLGINOacb9uaWQwl
         gN6eKkt9NJ4g6g9Ch3UBtIIeAOSnozwhNeMqYZ9SSdFMtcsAhB6A2lnMUZT1WES1NkXo
         qSjXRdUTyj+5WkWxLy6uS5Eb+p0c2szJ9fqBAb9F95xl414DgRGIEFX+aKGF598B7b0D
         hdwZj6cr7n9tAAP0I11kb66f1DdRf7X5H1AQ2/kU7XhhaZ/IpiaS2hFxvgojylOOsYYz
         Banw==
X-Gm-Message-State: AOAM5336h98EN/ZirkM1GLRBl8jDMCBAZVWQ0ZcPH0ObJ5JBTB1/AJSW
        umnkCeBaXwzIlA/YFr7TtOX0Fw==
X-Google-Smtp-Source: ABdhPJzK5egbCo/FQM2QObiMLZExSZhoavvk4IY/3OT0aw0EgLtHPC1ZsY56QKqORZmtRHjva0f6tQ==
X-Received: by 2002:aca:42c5:: with SMTP id p188mr11637028oia.125.1635952218650;
        Wed, 03 Nov 2021 08:10:18 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id a9sm210879oic.4.2021.11.03.08.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 08:10:18 -0700 (PDT)
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
From:   Jens Axboe <axboe@kernel.dk>
To:     Ming Lei <ming.lei@redhat.com>, Yi Zhang <yi.zhang@redhat.com>
Cc:     Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
References: <YYIHXGSb2O5va0vA@T590>
 <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
 <733e1dcd-36a1-903e-709a-5ebe5f491564@kernel.dk>
 <CAHj4cs8U-Tboc-i-ZpK2-7euPZNsHja_6SWs6Ap0ywddStLC_A@mail.gmail.com>
 <YYKjPIoMR04HrcWp@T590> <2a3b12f7-ea1b-c843-8370-8086ae2993ec@kernel.dk>
Message-ID: <9d38a844-233b-26e4-ed36-f6a3f453bb92@kernel.dk>
Date:   Wed, 3 Nov 2021 09:10:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a3b12f7-ea1b-c843-8370-8086ae2993ec@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/3/21 9:03 AM, Jens Axboe wrote:
> On 11/3/21 8:57 AM, Ming Lei wrote:
>> On Wed, Nov 03, 2021 at 09:59:02PM +0800, Yi Zhang wrote:
>>> On Wed, Nov 3, 2021 at 7:59 PM Jens Axboe <axboe@kernel.dk> wrote:
>>>>
>>>> On 11/2/21 9:54 PM, Jens Axboe wrote:
>>>>> On Nov 2, 2021, at 9:52 PM, Ming Lei <ming.lei@redhat.com> wrote:
>>>>>>
>>>>>> ﻿On Tue, Nov 02, 2021 at 09:21:10PM -0600, Jens Axboe wrote:
>>>>>>>> On 11/2/21 8:21 PM, Yi Zhang wrote:
>>>>>>>>>>
>>>>>>>>>> Can either one of you try with this patch? Won't fix anything, but it'll
>>>>>>>>>> hopefully shine a bit of light on the issue.
>>>>>>>>>>
>>>>>>>> Hi Jens
>>>>>>>>
>>>>>>>> Here is the full log:
>>>>>>>
>>>>>>> Thanks! I think I see what it could be - can you try this one as well,
>>>>>>> would like to confirm that the condition I think is triggering is what
>>>>>>> is triggering.
>>>>>>>
>>>>>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>>>>>> index 07eb1412760b..81dede885231 100644
>>>>>>> --- a/block/blk-mq.c
>>>>>>> +++ b/block/blk-mq.c
>>>>>>> @@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>>>>>>    if (plug && plug->cached_rq) {
>>>>>>>        rq = rq_list_pop(&plug->cached_rq);
>>>>>>>        INIT_LIST_HEAD(&rq->queuelist);
>>>>>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>>>>>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>>>>>>>    } else {
>>>>>>>        struct blk_mq_alloc_data data = {
>>>>>>>            .q        = q,
>>>>>>> @@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>>>>>>                bio_wouldblock_error(bio);
>>>>>>>            goto queue_exit;
>>>>>>>        }
>>>>>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>>>>>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>>>>>>
>>>>>> Hello Jens,
>>>>>>
>>>>>> I guess the issue could be the following code run without grabbing
>>>>>> ->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request_hctx().
>>>>>>
>>>>>> .rq_flags       = q->elevator ? RQF_ELV : 0,
>>>>>>
>>>>>> then elevator is switched to real one from none, and check on q->elevator
>>>>>> becomes not consistent.
>>>>>
>>>>> Indeed, that’s where I was going with this. I have a patch, testing it
>>>>> locally but it’s getting late. Will send it out tomorrow. The nice
>>>>> benefit is that it allows dropping the weird ref get on plug flush,
>>>>> and batches getting the refs as well.
>>>>
>>>> Yi/Steffen, can you try pulling this into your test kernel:
>>>>
>>>> git://git.kernel.dk/linux-block for-next
>>>>
>>>> and see if it fixes the issue for you. Thanks!
>>>
>>> It still can be reproduced with the latest linux-block/for-next, here is the log
>>>
>>> fab2914e46eb (HEAD, new/for-next) Merge branch 'for-5.16/drivers' into for-next
>>
>> Hi Yi,
>>
>> Please try the following change:
>>
>>
>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>> index e1e64964a31b..eb634a9c61ff 100644
>> --- a/block/blk-mq.c
>> +++ b/block/blk-mq.c
>> @@ -494,7 +494,6 @@ struct request *blk_mq_alloc_request(struct request_queue *q, unsigned int op,
>>  		.q		= q,
>>  		.flags		= flags,
>>  		.cmd_flags	= op,
>> -		.rq_flags	= q->elevator ? RQF_ELV : 0,
>>  		.nr_tags	= 1,
>>  	};
>>  	struct request *rq;
>> @@ -504,6 +503,7 @@ struct request *blk_mq_alloc_request(struct request_queue *q, unsigned int op,
>>  	if (ret)
>>  		return ERR_PTR(ret);
>>  
>> +	data.rq_flags	= q->elevator ? RQF_ELV : 0,
>>  	rq = __blk_mq_alloc_requests(&data);
>>  	if (!rq)
>>  		goto out_queue_exit;
>> @@ -524,7 +524,6 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
>>  		.q		= q,
>>  		.flags		= flags,
>>  		.cmd_flags	= op,
>> -		.rq_flags	= q->elevator ? RQF_ELV : 0,
>>  		.nr_tags	= 1,
>>  	};
>>  	u64 alloc_time_ns = 0;
>> @@ -551,6 +550,7 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
>>  	ret = blk_queue_enter(q, flags);
>>  	if (ret)
>>  		return ERR_PTR(ret);
>> +	data.rq_flags	= q->elevator ? RQF_ELV : 0,
> 
> Don't think that will compile, but I guess the point is that we can't do
> this assignment before queue enter, in case we're in the midst of
> switching schedulers. Which is indeed a valid concern.

Something like the below. Maybe? On top of the for-next that was already
pulled in.


diff --git a/block/blk-mq.c b/block/blk-mq.c
index b01e05e02277..121f1898d529 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -433,9 +433,11 @@ static struct request *__blk_mq_alloc_requests(struct blk_mq_alloc_data *data)
 	if (data->cmd_flags & REQ_NOWAIT)
 		data->flags |= BLK_MQ_REQ_NOWAIT;
 
-	if (data->rq_flags & RQF_ELV) {
+	if (q->elevator) {
 		struct elevator_queue *e = q->elevator;
 
+		data->rq_flags |= RQF_ELV;
+
 		/*
 		 * Flush/passthrough requests are special and go directly to the
 		 * dispatch list. Don't include reserved tags in the
@@ -494,7 +496,6 @@ struct request *blk_mq_alloc_request(struct request_queue *q, unsigned int op,
 		.q		= q,
 		.flags		= flags,
 		.cmd_flags	= op,
-		.rq_flags	= q->elevator ? RQF_ELV : 0,
 		.nr_tags	= 1,
 	};
 	struct request *rq;
@@ -524,7 +525,6 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
 		.q		= q,
 		.flags		= flags,
 		.cmd_flags	= op,
-		.rq_flags	= q->elevator ? RQF_ELV : 0,
 		.nr_tags	= 1,
 	};
 	u64 alloc_time_ns = 0;
@@ -565,6 +565,8 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
 
 	if (!q->elevator)
 		blk_mq_tag_busy(data.hctx);
+	else
+		data.rq_flags |= RQF_ELV;
 
 	ret = -EWOULDBLOCK;
 	tag = blk_mq_get_tag(&data);
@@ -2560,7 +2562,6 @@ void blk_mq_submit_bio(struct bio *bio)
 			.q		= q,
 			.nr_tags	= 1,
 			.cmd_flags	= bio->bi_opf,
-			.rq_flags	= q->elevator ? RQF_ELV : 0,
 		};
 
 		if (unlikely(!blk_try_enter_queue(q, false) &&

-- 
Jens Axboe

