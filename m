Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8848B444371
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 15:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhKCO31 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 10:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbhKCO31 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 10:29:27 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0673FC061714
        for <linux-next@vger.kernel.org>; Wed,  3 Nov 2021 07:26:51 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso1026173otg.9
        for <linux-next@vger.kernel.org>; Wed, 03 Nov 2021 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=exiSlzVIncQIxFBUT8HCr0towS1NwDCfsCiYPfWjIV4=;
        b=5zZnZN0IwmGLGcc1nkWXBld+SdMjKgun/CfnAwspWkUGwnO2+/3QeF6MyRa1oFdet9
         GyBLxYdoKLDD7QPhj20+i/AuECXLF1RftDB0pcJkIdH4D7CScNAvWPBXCoURJ0X4IHcK
         0jO77q4cff3GIJ9qCZNVfVFEbfvsLRvWFt+ziY6XQdbD++A+3hGb55tO30ENWR7z0+hm
         7chiWgLLM+cWbA6TT6aeqelQ1qtgnu+Qj0BKUg3z3LWNsxpMtvnkA93W/zf+kmkFvggl
         s/6rWWJ2/auQb3TPfcNkKipxU0mxHxzibLaW4KiU3F6ykfkwUGnTTt8VszpnOb/l+yoL
         JOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=exiSlzVIncQIxFBUT8HCr0towS1NwDCfsCiYPfWjIV4=;
        b=ZUXnhJtRAcIkbEWnR9675Fsc/Jcm2NXe6520k9ZZ4yBLilIisvYdcGr2pgJTqXhQg2
         +kUVNdOMPlb7eso8Jf87vRSSlEaSJzwaYCkeYKFfviG2R0G43V/lN++t1CGfsi0uEn+t
         gmos520OzwFXp2dVXe2nWCSqCKArFjgAFbvrP4eJFa3ji9OM8xiH0VtpXhimwrxoM4RG
         sJoibynRns3hZHRCkDD2dPBRCbUbFVVMqOiszsZZN+bjwZeBTW9nIfnFYYISdxN6OPBY
         4TPnNvHGdsXH+0nN1HfiyJgMyU44km3QoQqUcPBd9bTzss8iiZmMPIp+k2rpKYUF5IVw
         MPxA==
X-Gm-Message-State: AOAM531QHuYRGj+kKz3rps5I7WzHnzqXzPiYaxDkKXSedpyWxyGzZoTq
        d9iduClx7Ouw3L66YvJPjlQRZQ==
X-Google-Smtp-Source: ABdhPJxbSPPeaPKn3z/FwQEVmXU2PePgeamR1u/tq03bE12VQT3O1DlMtDzlZtvDZX2o9hDHIlldQg==
X-Received: by 2002:a9d:6a4d:: with SMTP id h13mr17879177otn.293.1635949610229;
        Wed, 03 Nov 2021 07:26:50 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id a8sm567130otr.3.2021.11.03.07.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 07:26:49 -0700 (PDT)
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
To:     Yi Zhang <yi.zhang@redhat.com>
Cc:     Ming Lei <ming.lei@redhat.com>,
        Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
References: <YYIHXGSb2O5va0vA@T590>
 <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
 <733e1dcd-36a1-903e-709a-5ebe5f491564@kernel.dk>
 <CAHj4cs8U-Tboc-i-ZpK2-7euPZNsHja_6SWs6Ap0ywddStLC_A@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <8fc1ed4c-457e-19f8-50ac-328067644e21@kernel.dk>
Date:   Wed, 3 Nov 2021 08:26:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHj4cs8U-Tboc-i-ZpK2-7euPZNsHja_6SWs6Ap0ywddStLC_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/3/21 7:59 AM, Yi Zhang wrote:
> On Wed, Nov 3, 2021 at 7:59 PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 11/2/21 9:54 PM, Jens Axboe wrote:
>>> On Nov 2, 2021, at 9:52 PM, Ming Lei <ming.lei@redhat.com> wrote:
>>>>
>>>> ﻿On Tue, Nov 02, 2021 at 09:21:10PM -0600, Jens Axboe wrote:
>>>>>> On 11/2/21 8:21 PM, Yi Zhang wrote:
>>>>>>>>
>>>>>>>> Can either one of you try with this patch? Won't fix anything, but it'll
>>>>>>>> hopefully shine a bit of light on the issue.
>>>>>>>>
>>>>>> Hi Jens
>>>>>>
>>>>>> Here is the full log:
>>>>>
>>>>> Thanks! I think I see what it could be - can you try this one as well,
>>>>> would like to confirm that the condition I think is triggering is what
>>>>> is triggering.
>>>>>
>>>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>>>> index 07eb1412760b..81dede885231 100644
>>>>> --- a/block/blk-mq.c
>>>>> +++ b/block/blk-mq.c
>>>>> @@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>>>>    if (plug && plug->cached_rq) {
>>>>>        rq = rq_list_pop(&plug->cached_rq);
>>>>>        INIT_LIST_HEAD(&rq->queuelist);
>>>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>>>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>>>>>    } else {
>>>>>        struct blk_mq_alloc_data data = {
>>>>>            .q        = q,
>>>>> @@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
>>>>>                bio_wouldblock_error(bio);
>>>>>            goto queue_exit;
>>>>>        }
>>>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>>>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>>>>
>>>> Hello Jens,
>>>>
>>>> I guess the issue could be the following code run without grabbing
>>>> ->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request_hctx().
>>>>
>>>> .rq_flags       = q->elevator ? RQF_ELV : 0,
>>>>
>>>> then elevator is switched to real one from none, and check on q->elevator
>>>> becomes not consistent.
>>>
>>> Indeed, that’s where I was going with this. I have a patch, testing it
>>> locally but it’s getting late. Will send it out tomorrow. The nice
>>> benefit is that it allows dropping the weird ref get on plug flush,
>>> and batches getting the refs as well.
>>
>> Yi/Steffen, can you try pulling this into your test kernel:
>>
>> git://git.kernel.dk/linux-block for-next
>>
>> and see if it fixes the issue for you. Thanks!
> 
> It still can be reproduced with the latest linux-block/for-next, here
> is the log
> 
> fab2914e46eb (HEAD, new/for-next) Merge branch 'for-5.16/drivers' into
> for-next

Funky! Thanks for re-testing, I guess I need to think even harder about
this. Can't seem to reproduce it here at all, which makes it a bit
harder to poke at.

-- 
Jens Axboe

