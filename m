Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F00D681AE1
	for <lists+linux-next@lfdr.de>; Mon, 30 Jan 2023 20:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238139AbjA3TyX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Jan 2023 14:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238317AbjA3TyJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Jan 2023 14:54:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7B246D4B
        for <linux-next@vger.kernel.org>; Mon, 30 Jan 2023 11:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675108400;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S7NbY3xyyAOulwRi5WVYPym1JmT5SXp4nTm5xbjtnWM=;
        b=WqtLo3fxrMKzxKAzKeQ4dkGioReFmsfzpE4qY2poW+MnPWcrp9JOMU1kGqJ+4CFkW9BFDB
        tt5C2yfYxevtF/4fum28862iV3Ym1k2tZwPdqattZfikjVXy+PZUtyu78Xvxq3SBgJ3C4j
        xiHfWOLWT+FpZ97qhw/6cKLXX86V2To=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-uKTqAhBmNcSQmzrh8NISkw-1; Mon, 30 Jan 2023 14:53:19 -0500
X-MC-Unique: uKTqAhBmNcSQmzrh8NISkw-1
Received: by mail-qt1-f197.google.com with SMTP id q26-20020ac8735a000000b003b63165d87cso5515816qtp.11
        for <linux-next@vger.kernel.org>; Mon, 30 Jan 2023 11:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7NbY3xyyAOulwRi5WVYPym1JmT5SXp4nTm5xbjtnWM=;
        b=IkDNzs5D99Ahc+XaTqk13WTygNZgPd5vTSGzNU1OyohyfdQikNPKjXoA430bBNVfhZ
         sohBkc3eGDuq1U6oMeeeCc5bMn5BwJXVqPAXyqS/4vg07T7VGrCk+PUOvuLPukQd+5Ku
         BIau/NyXdMfwrvM1pijvMyC/H5NZ5QwKnY6NKgXV4V8FwDtMJkS6fHKAGugrXulb5l1h
         8A8eoieMHqtgK/TrzXgS0PI6KKdUxzDS6MuK/XbR77ptiyw0Dcr02KHc3zXofCwVId/7
         5rGpwHtWWUM4brsx6ULzTz5RkdG4D5O4IMibNibPcgsBWZW0BPcrJFrzztAeK+xNi6rS
         S22w==
X-Gm-Message-State: AFqh2kpg6kmyvtpmOLZhXPUpIFKmwJ3378oXLFIEalPTiu/tTuCRaCQY
        QFO9MKq1AWlmSg5svyVXYGQ3idl6VFGK8CLqs2epxH5Rum0/R6ANMr8HqzVwYfgYxNW3JWB5srm
        5T99m/BQKZHcLaJ8jRGOE
X-Received: by 2002:ac8:692:0:b0:3a7:ef31:a07b with SMTP id f18-20020ac80692000000b003a7ef31a07bmr62338333qth.11.1675108398612;
        Mon, 30 Jan 2023 11:53:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuVb4ZUbZzSFK5b9AouGdgOVTLQ3lTs2XxhN17i1kks7idYU03AzNTdy1vXAFzMSW8FLBdybg==
X-Received: by 2002:ac8:692:0:b0:3a7:ef31:a07b with SMTP id f18-20020ac80692000000b003a7ef31a07bmr62338316qth.11.1675108398341;
        Mon, 30 Jan 2023 11:53:18 -0800 (PST)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net. [68.160.166.30])
        by smtp.gmail.com with ESMTPSA id i6-20020a05620a27c600b007049f19c736sm8632208qkp.7.2023.01.30.11.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 11:53:17 -0800 (PST)
Date:   Mon, 30 Jan 2023 14:53:16 -0500
From:   Mike Snitzer <snitzer@redhat.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the device-mapper tree
Message-ID: <Y9ggLAqnncDMDX+q@redhat.com>
References: <20230130124143.210b5149@canb.auug.org.au>
 <310efbe3-fa98-6726-4010-e7137b761647@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <310efbe3-fa98-6726-4010-e7137b761647@kernel.dk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Jan 29 2023 at  8:56P -0500,
Jens Axboe <axboe@kernel.dk> wrote:

> On 1/29/23 6:41 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commits are also in the block tree as different commits
> > (but the same patches):
> > 
> >   08a39c820686 ("blk-iocost: avoid 64-bit division in ioc_timer_fn")
> >   11fd02522aae ("block, bfq: turn bfqq_data into an array in bfq_io_cq")
> >   204a9e1eeb4b ("blk-iocost: don't allow to configure bio based device")
> >   2192a93eb4ac ("ps3vram: remove bio splitting")
> >   3187f22498f6 ("drbd: remove unnecessary assignment in vli_encode_bits")
> >   346122e09011 ("block, bfq: retrieve independent access ranges from request queue")
> >   38d6577f1e01 ("drbd: fix DRBD_VOLUME_MAX 65535 -> 65534")
> >   3b1c494c4317 ("block: add a new helper bdev_{is_zone_start, offset_from_zone_start}")
> >   3bf6e7ac9a43 ("drbd: remove macros using require_context")
> >   419363fec82a ("block: add a BUILD_BUG_ON() for adding more bio flags than we have space")
> >   4e952a32301a ("blk-iocost: fix divide by 0 error in calc_lcoefs()")
> >   51ec2387623a ("block, bfq: split sync bfq_queues on a per-actuator basis")
> >   55ee20573bd6 ("drbd: make limits unsigned")
> >   56f5160bc1b8 ("ublk_drv: add mechanism for supporting unprivileged ublk device")
> >   5d5ce3a05940 ("block: ublk: fix doc build warning")
> >   612307b9e29b ("block: make BLK_DEF_MAX_SECTORS unsigned")
> >   615b51f2a7ec ("block, bfq: forbid stable merging of queues associated with dif
> > ferent actuators")
> >   620183fd3cda ("ublk_drv: add device parameter UBLK_PARAM_TYPE_DEVT")
> >   6b5bcbd01de8 ("drbd: split off drbd_config into separate file")
> >   6e45a73ca9d6 ("drbd: adjust drbd_limits license header")
> >   6faa01c8bf3b ("ublk_drv: don't probe partitions if the ubq daemon isn't truste
> > d")
> >   707107e3c830 ("drbd: drbd_insert_interval(): Clarify comment")
> >   7a5841d1701d ("block, bfq: balance I/O injection among underutilized actuators
> > ")
> >   7a69a19ae640 ("block, bfq: inject I/O to underutilized actuators")
> >   7b6a2c89052b ("blk-iocost: check return value of match_u64()")
> >   7b810b50390b ("blk-iocost: read params inside lock in sysfs apis")
> >   7f0e2433880b ("block: save user max_sectors limit")
> >   803e2ec47623 ("block: introduce bdev_zone_no helper")
> >   8564135fe5b0 ("block: don't allow multiple bios for IOCB_NOWAIT issue")
> >   934f178446b1 ("block: extend bio-cache for non-polled requests")
> >   93cfbaba481c ("drbd: split off drbd_buildtag into separate file")
> >   961ccca54ad5 ("ublk_drv: add module parameter of ublks_max for limiting max al
> > lowed ublk dev")
> >   988136a30715 ("nvme: set REQ_ALLOC_CACHE for uring-passthru request")
> >   9d1d75e23110 ("drbd: drop API_VERSION define")
> >   a2aea8f56f9e ("s390/dcssblk:: don't call bio_split_to_limits")
> >   a5d140c503b6 ("ublk_drv: move ublk_get_device_from_id into ublk_ctrl_uring_cmd
> > ")
> >   aa70bcb25683 ("drbd: interval tree: make removing an "empty" interval a no-op"
> > )
> >   abc42d89596a ("MAINTAINERS: add drbd headers")
> >   ad5572498be1 ("blk-iocost: change div64_u64 to DIV64_U64_ROUND_UP in ioc_refre
> > sh_params()")
> >   ba0b61d03ce3 ("block: treat poll queue enter similarly to timeouts")
> >   d5ff0182856b ("block, bfq: move io_cq-persistent bfqq data into a dedicated st
> > ruct")
> >   d66a012deb65 ("ublk_drv: remove nr_aborted_queues from ublk_device")
> >   ef0e0afd782e ("block: remove superfluous check for request queue in bdev_is_zo
> > ned()")
> >   fd44c9c683bc ("block, bfq: split also async bfq_queues on a per-actuator basis
> > ")
> > 
> > It looks like the block tree was rebased ...
> 
> It was, to avoid a conflict and second patch issue. Mike, let me know if
> rebasing the dm tree is a concern, then we roll back and deal with the
> pain instead...

No problem, I rebased DM.

