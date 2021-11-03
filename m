Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A18844444D
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 16:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhKCPMV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 11:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47570 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231211AbhKCPMU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 11:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635952183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lf/rL2VrnH94S+6IAaf9jCOMsnHQ6nUTh4icLv9YuEo=;
        b=fD0Mielgn7uxA5++yaaTFsdHfrZNzyVbDk2S/LrT1g2WYpQZ7mrkgXYHo2e6Vz3ADbm167
        zyiB/aey43ugRnlSwrHjOecu1+5le0fNFR3w/zZ7RRNZF6t16D0QXbTi/VjKemS/I+iVh6
        UZfE6vMQU/C7JJWFlBiO6mvwfRjM/tQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-2tTowy9AOgOcXgtT_XGEqA-1; Wed, 03 Nov 2021 11:09:40 -0400
X-MC-Unique: 2tTowy9AOgOcXgtT_XGEqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 834CA10A8E00;
        Wed,  3 Nov 2021 15:09:39 +0000 (UTC)
Received: from T590 (ovpn-8-17.pek2.redhat.com [10.72.8.17])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 96D4460C04;
        Wed,  3 Nov 2021 15:09:27 +0000 (UTC)
Date:   Wed, 3 Nov 2021 23:09:22 +0800
From:   Ming Lei <ming.lei@redhat.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Yi Zhang <yi.zhang@redhat.com>,
        Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
Message-ID: <YYKmIgHttlxudYCA@T590>
References: <YYIHXGSb2O5va0vA@T590>
 <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
 <733e1dcd-36a1-903e-709a-5ebe5f491564@kernel.dk>
 <CAHj4cs8U-Tboc-i-ZpK2-7euPZNsHja_6SWs6Ap0ywddStLC_A@mail.gmail.com>
 <YYKjPIoMR04HrcWp@T590>
 <2a3b12f7-ea1b-c843-8370-8086ae2993ec@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a3b12f7-ea1b-c843-8370-8086ae2993ec@kernel.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 03, 2021 at 09:03:02AM -0600, Jens Axboe wrote:
> On 11/3/21 8:57 AM, Ming Lei wrote:
> > On Wed, Nov 03, 2021 at 09:59:02PM +0800, Yi Zhang wrote:
> >> On Wed, Nov 3, 2021 at 7:59 PM Jens Axboe <axboe@kernel.dk> wrote:
> >>>
> >>> On 11/2/21 9:54 PM, Jens Axboe wrote:
> >>>> On Nov 2, 2021, at 9:52 PM, Ming Lei <ming.lei@redhat.com> wrote:
> >>>>>
> >>>>> ﻿On Tue, Nov 02, 2021 at 09:21:10PM -0600, Jens Axboe wrote:
> >>>>>>> On 11/2/21 8:21 PM, Yi Zhang wrote:
> >>>>>>>>>
> >>>>>>>>> Can either one of you try with this patch? Won't fix anything, but it'll
> >>>>>>>>> hopefully shine a bit of light on the issue.
> >>>>>>>>>
> >>>>>>> Hi Jens
> >>>>>>>
> >>>>>>> Here is the full log:
> >>>>>>
> >>>>>> Thanks! I think I see what it could be - can you try this one as well,
> >>>>>> would like to confirm that the condition I think is triggering is what
> >>>>>> is triggering.
> >>>>>>
> >>>>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
> >>>>>> index 07eb1412760b..81dede885231 100644
> >>>>>> --- a/block/blk-mq.c
> >>>>>> +++ b/block/blk-mq.c
> >>>>>> @@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
> >>>>>>    if (plug && plug->cached_rq) {
> >>>>>>        rq = rq_list_pop(&plug->cached_rq);
> >>>>>>        INIT_LIST_HEAD(&rq->queuelist);
> >>>>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
> >>>>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
> >>>>>>    } else {
> >>>>>>        struct blk_mq_alloc_data data = {
> >>>>>>            .q        = q,
> >>>>>> @@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
> >>>>>>                bio_wouldblock_error(bio);
> >>>>>>            goto queue_exit;
> >>>>>>        }
> >>>>>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
> >>>>>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
> >>>>>
> >>>>> Hello Jens,
> >>>>>
> >>>>> I guess the issue could be the following code run without grabbing
> >>>>> ->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request_hctx().
> >>>>>
> >>>>> .rq_flags       = q->elevator ? RQF_ELV : 0,
> >>>>>
> >>>>> then elevator is switched to real one from none, and check on q->elevator
> >>>>> becomes not consistent.
> >>>>
> >>>> Indeed, that’s where I was going with this. I have a patch, testing it
> >>>> locally but it’s getting late. Will send it out tomorrow. The nice
> >>>> benefit is that it allows dropping the weird ref get on plug flush,
> >>>> and batches getting the refs as well.
> >>>
> >>> Yi/Steffen, can you try pulling this into your test kernel:
> >>>
> >>> git://git.kernel.dk/linux-block for-next
> >>>
> >>> and see if it fixes the issue for you. Thanks!
> >>
> >> It still can be reproduced with the latest linux-block/for-next, here is the log
> >>
> >> fab2914e46eb (HEAD, new/for-next) Merge branch 'for-5.16/drivers' into for-next
> > 
> > Hi Yi,
> > 
> > Please try the following change:
> > 
> > 
> > diff --git a/block/blk-mq.c b/block/blk-mq.c
> > index e1e64964a31b..eb634a9c61ff 100644
> > --- a/block/blk-mq.c
> > +++ b/block/blk-mq.c
> > @@ -494,7 +494,6 @@ struct request *blk_mq_alloc_request(struct request_queue *q, unsigned int op,
> >  		.q		= q,
> >  		.flags		= flags,
> >  		.cmd_flags	= op,
> > -		.rq_flags	= q->elevator ? RQF_ELV : 0,
> >  		.nr_tags	= 1,
> >  	};
> >  	struct request *rq;
> > @@ -504,6 +503,7 @@ struct request *blk_mq_alloc_request(struct request_queue *q, unsigned int op,
> >  	if (ret)
> >  		return ERR_PTR(ret);
> >  
> > +	data.rq_flags	= q->elevator ? RQF_ELV : 0,
> >  	rq = __blk_mq_alloc_requests(&data);
> >  	if (!rq)
> >  		goto out_queue_exit;
> > @@ -524,7 +524,6 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
> >  		.q		= q,
> >  		.flags		= flags,
> >  		.cmd_flags	= op,
> > -		.rq_flags	= q->elevator ? RQF_ELV : 0,
> >  		.nr_tags	= 1,
> >  	};
> >  	u64 alloc_time_ns = 0;
> > @@ -551,6 +550,7 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
> >  	ret = blk_queue_enter(q, flags);
> >  	if (ret)
> >  		return ERR_PTR(ret);
> > +	data.rq_flags	= q->elevator ? RQF_ELV : 0,
> 
> Don't think that will compile, but I guess the point is that we can't do

It can compile.

> this assignment before queue enter, in case we're in the midst of
> switching schedulers. Which is indeed a valid concern.

Yeah, for scsi, real io sched is switched when adding disk, before that, the
passthrough command need to see consistent q->elevator.


Thanks,
Ming

