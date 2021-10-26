Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB62C43A9B6
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 03:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbhJZBbT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 21:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40483 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233336AbhJZBbS (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 21:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635211735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oBsGXv55wWpplGjyxCfLIopyx/VwLnsEwvC3TZf8Ruo=;
        b=URYqiad2wObZkOngFzb46HD4xfWWM1tMVoY711jdVauGAqyPDskmsowGqsVR5QRotyDiDq
        q+or0tPYt2FocYu6eXPyhWTWuu7kOL42B/DA5YJzKaGmXNbuKEyEBCQYDwN8eqQ7v/TU92
        zEVNKG5R+yqm74u6w6Si0VVSoJATkI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-Usvy8dpZOTeXQXE67Jz7Jg-1; Mon, 25 Oct 2021 21:28:53 -0400
X-MC-Unique: Usvy8dpZOTeXQXE67Jz7Jg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 114CB872FF3;
        Tue, 26 Oct 2021 01:28:52 +0000 (UTC)
Received: from T590 (ovpn-8-17.pek2.redhat.com [10.72.8.17])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A2ED15D6BA;
        Tue, 26 Oct 2021 01:28:44 +0000 (UTC)
Date:   Tue, 26 Oct 2021 09:28:39 +0800
From:   Ming Lei <ming.lei@redhat.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 25
Message-ID: <YXdZxzAPejKyE8Oi@T590>
References: <20211025204921.73cb3011@canb.auug.org.au>
 <82bbf33e-918f-da01-95e6-9b2cc1b8b610@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82bbf33e-918f-da01-95e6-9b2cc1b8b610@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 26, 2021 at 01:11:07AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> Recent -next has this new warning splat coming from MMC, please take a look.
> 
>  ------------[ cut here ]------------
>  WARNING: CPU: 0 PID: 525 at kernel/sched/core.c:9477 __might_sleep+0x65/0x68
>  do not call blocking ops when !TASK_RUNNING; state=2 set at [<4316eb02>] prepare_to_wait+0x2e/0xb8
>  Modules linked in:
>  CPU: 0 PID: 525 Comm: Xorg Tainted: G        W         5.15.0-rc6-next-20211025-00226-g89ccd6948ec3 #5
>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>  (unwind_backtrace) from [<c01089f9>] (show_stack+0x11/0x14)
>  (show_stack) from [<c0afacb9>] (dump_stack_lvl+0x2b/0x34)
>  (dump_stack_lvl) from [<c011f689>] (__warn+0xa1/0xe8)
>  (__warn) from [<c0af6729>] (warn_slowpath_fmt+0x65/0x7c)
>  (warn_slowpath_fmt) from [<c01421b9>] (__might_sleep+0x65/0x68)
>  (__might_sleep) from [<c07eb377>] (mmc_blk_rw_wait+0x2f/0x118)
>  (mmc_blk_rw_wait) from [<c07eba11>] (mmc_blk_mq_issue_rq+0x219/0x71c)
>  (mmc_blk_mq_issue_rq) from [<c07ec199>] (mmc_mq_queue_rq+0xf9/0x200)
>  (mmc_mq_queue_rq) from [<c04ad247>] (__blk_mq_try_issue_directly+0xcb/0x100)
>  (__blk_mq_try_issue_directly) from [<c04adb89>] (blk_mq_request_issue_directly+0x2d/0x48)
>  (blk_mq_request_issue_directly) from [<c04adcf3>] (blk_mq_flush_plug_list+0x14f/0x1f4)
>  (blk_mq_flush_plug_list) from [<c04a5313>] (blk_flush_plug+0x83/0xb8)
>  (blk_flush_plug) from [<c0b013cb>] (io_schedule+0x2b/0x3c)
>  (io_schedule) from [<c0b01a17>] (bit_wait_io+0xf/0x48)

The following patch should fix the issue:

diff --git a/block/blk-mq.c b/block/blk-mq.c
index a71aeed7b987..bee9cb2a44cb 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2223,7 +2223,7 @@ void blk_mq_flush_plug_list(struct blk_plug *plug, bool from_schedule)
 		return;
 	plug->rq_count = 0;
 
-	if (!plug->multiple_queues && !plug->has_elevator) {
+	if (!plug->multiple_queues && !plug->has_elevator && !from_schedule) {
 		blk_mq_plug_issue_direct(plug, from_schedule);
 		if (rq_list_empty(plug->mq_list))
 			return;

-- 
Ming

