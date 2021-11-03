Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F05443C09
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 04:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhKCDyw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 23:54:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34054 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230049AbhKCDyw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 23:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635911536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=btZBySpD/F355O736TWNWheizZK9zBMnM7eMleVbiwo=;
        b=RPOgWwCqxM2Ue1gTDmz1cNezskRlXurtej1mEjKHHbGlB9wdcUxCXNI8hNbdQcghbP//Fa
        4D9optgM8Wv2hUNuQjPXk7R6t0UtRxdgqsWTG5DI+uwuZ+H9JNZAeB6gryktiSDNhayHmx
        ZCSsNT8Qa0cw+ZBjLNY4CArRKPbBR7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-lE8006GEO6SWf66I2vGkTw-1; Tue, 02 Nov 2021 23:52:15 -0400
X-MC-Unique: lE8006GEO6SWf66I2vGkTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D59241006AA4;
        Wed,  3 Nov 2021 03:52:13 +0000 (UTC)
Received: from T590 (ovpn-8-17.pek2.redhat.com [10.72.8.17])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A4E6760C05;
        Wed,  3 Nov 2021 03:52:01 +0000 (UTC)
Date:   Wed, 3 Nov 2021 11:51:56 +0800
From:   Ming Lei <ming.lei@redhat.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Yi Zhang <yi.zhang@redhat.com>,
        Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
Message-ID: <YYIHXGSb2O5va0vA@T590>
References: <CAHj4cs-NUKzGj5pgzRhDgdrGGbgPBqUoQ44+xgvk6njH9a_RYQ@mail.gmail.com>
 <1cf57bc2-5283-a2ce-0bbc-db6a62953c8f@linux.ibm.com>
 <e9965a7c-faba-496e-8110-dbe8f7065080@kernel.dk>
 <4f3811f6-88d9-c0c6-055f-1a3220357e22@kernel.dk>
 <CAHj4cs_+ZDe3KVbKYUK0XnupTxU2MqfA6ARxMkhkTwg9hYBiLg@mail.gmail.com>
 <cb1c00aa-8d06-ef04-4621-0f7b02f54d93@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb1c00aa-8d06-ef04-4621-0f7b02f54d93@kernel.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 02, 2021 at 09:21:10PM -0600, Jens Axboe wrote:
> On 11/2/21 8:21 PM, Yi Zhang wrote:
> >>
> >> Can either one of you try with this patch? Won't fix anything, but it'll
> >> hopefully shine a bit of light on the issue.
> >>
> > Hi Jens
> > 
> > Here is the full log:
> 
> Thanks! I think I see what it could be - can you try this one as well,
> would like to confirm that the condition I think is triggering is what
> is triggering.
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 07eb1412760b..81dede885231 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
>  	if (plug && plug->cached_rq) {
>  		rq = rq_list_pop(&plug->cached_rq);
>  		INIT_LIST_HEAD(&rq->queuelist);
> +		WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
> +		WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>  	} else {
>  		struct blk_mq_alloc_data data = {
>  			.q		= q,
> @@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
>  				bio_wouldblock_error(bio);
>  			goto queue_exit;
>  		}
> +		WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
> +		WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));

Hello Jens,

I guess the issue could be the following code run without grabbing
->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request_hctx().

.rq_flags       = q->elevator ? RQF_ELV : 0,

then elevator is switched to real one from none, and check on q->elevator
becomes not consistent.


Thanks, 
Ming

