Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178E3443BD1
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 04:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhKCDXu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 23:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhKCDXt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 23:23:49 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04209C061203
        for <linux-next@vger.kernel.org>; Tue,  2 Nov 2021 20:21:14 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id i9so1160544ilu.8
        for <linux-next@vger.kernel.org>; Tue, 02 Nov 2021 20:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0nndE3bXje7v1hNIF7AwZXvSEQQyGas46aJLK284tBE=;
        b=j9z7xjNnS5ETYg8Q72T5Xdf6iuSHyqOGf0yU1wJNbbqUezM2apSlpnMP3RHZ2oZm8P
         /WzviMl42aB+xpNu0obC9UpvYGKIDHcEfdEcBYN0HpesuAvPnY9TqxHnty/ltR5xTTxh
         /z/g5LvMy4RYv583LPMF6urmOVXTTu8rSFR8gmz+53+OvUCvSGm9M2k7FpunFsN0M/D/
         rE0UCcgkJy/7DAB3gqL2PQRBXn8ipB+nn2NuDufjeeYS7ieObPR9gyQeVWGzvKOp2/C9
         uTsSFvgi9AlgzH+ho1jbS0TvpSq0C+f83gyzHYfgwlI7vbjp4dKNBRz48mD8aYS7beRE
         htTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0nndE3bXje7v1hNIF7AwZXvSEQQyGas46aJLK284tBE=;
        b=QF1XDE8dqd8MBWxzLFj520tN9ZCD1fOT+NZkR7wPuPok8mnioYltdw+tAOIPFQlRce
         jx03JtMoFSTsd2N0nXQJo9OFW+sH38kNoIF4Q3zUV7FBUEnazuz5MYjMO0j34IWAoS7F
         Rf4sGc5FSMcce508yUeP3pLZZMTZAn3j2TdZqhA7TVN1wycR+mSWy1SDmaB8LddHGbZe
         tdTidUdpi5Pvm5iUfmbwh0ooFzEiv7X22ze539EzVoUxwZmv0ltK10Eu3p7xCw5M6IN5
         +H8sq6XPtKtawvugN+++VNjrf7xAGaerpznIYxjDM6Rhtgn9d4kSmZBPjVrluZOakWsS
         QGLQ==
X-Gm-Message-State: AOAM530vsvknITnoiuK6vEBZkvYUF6/o1YIXyeQbhNceu42Eh8eLgsnV
        1/hSUjTx/zthFukJPJmQ832alQ==
X-Google-Smtp-Source: ABdhPJzGYSHWgG5gxXyAsqg8Tw8gDMfzIc938IuDdh0mkt+a7Zficg5mNUWgA+73MBBxMI6zSTOGtQ==
X-Received: by 2002:a05:6e02:1d9e:: with SMTP id h30mr21815713ila.138.1635909673421;
        Tue, 02 Nov 2021 20:21:13 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id s12sm435613iol.30.2021.11.02.20.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 20:21:13 -0700 (PDT)
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
To:     Yi Zhang <yi.zhang@redhat.com>
Cc:     Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
References: <CAHj4cs-NUKzGj5pgzRhDgdrGGbgPBqUoQ44+xgvk6njH9a_RYQ@mail.gmail.com>
 <1cf57bc2-5283-a2ce-0bbc-db6a62953c8f@linux.ibm.com>
 <e9965a7c-faba-496e-8110-dbe8f7065080@kernel.dk>
 <4f3811f6-88d9-c0c6-055f-1a3220357e22@kernel.dk>
 <CAHj4cs_+ZDe3KVbKYUK0XnupTxU2MqfA6ARxMkhkTwg9hYBiLg@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <cb1c00aa-8d06-ef04-4621-0f7b02f54d93@kernel.dk>
Date:   Tue, 2 Nov 2021 21:21:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHj4cs_+ZDe3KVbKYUK0XnupTxU2MqfA6ARxMkhkTwg9hYBiLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/2/21 8:21 PM, Yi Zhang wrote:
>>
>> Can either one of you try with this patch? Won't fix anything, but it'll
>> hopefully shine a bit of light on the issue.
>>
> Hi Jens
> 
> Here is the full log:

Thanks! I think I see what it could be - can you try this one as well,
would like to confirm that the condition I think is triggering is what
is triggering.

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 07eb1412760b..81dede885231 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
 	if (plug && plug->cached_rq) {
 		rq = rq_list_pop(&plug->cached_rq);
 		INIT_LIST_HEAD(&rq->queuelist);
+		WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
+		WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
 	} else {
 		struct blk_mq_alloc_data data = {
 			.q		= q,
@@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
 				bio_wouldblock_error(bio);
 			goto queue_exit;
 		}
+		WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
+		WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
 	}
 
 	trace_block_getrq(bio);

-- 
Jens Axboe

