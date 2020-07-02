Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3C62122A4
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 13:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgGBLwa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jul 2020 07:52:30 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29511 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728668AbgGBLwa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2020 07:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593690749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zCfTmJvRvO6CmeTx04OXe3MzPNsYUP6t2rORmnve7mw=;
        b=HP1JqlAlLaVAX7+IJZpzk8nBdikGLiE3qwfBn4BCD68zcYCeZjU7oiGilAhFEk9JAPhgPP
        4fBgxZyJZSx+p/CE9KCxSV/xWGDlIufVE7a5VZB0EGMndj/0veY1P+16gbIj4Ge1apea+u
        P7Q9dHN5vxOSl0EgWI7pf29VQBy8Q9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-VkoWzKWTMUm8cmAlHO47XQ-1; Thu, 02 Jul 2020 07:52:27 -0400
X-MC-Unique: VkoWzKWTMUm8cmAlHO47XQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98292108C30A;
        Thu,  2 Jul 2020 11:52:26 +0000 (UTC)
Received: from T590 (ovpn-12-180.pek2.redhat.com [10.72.12.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D6697788F;
        Thu,  2 Jul 2020 11:52:20 +0000 (UTC)
Date:   Thu, 2 Jul 2020 19:52:16 +0800
From:   Ming Lei <ming.lei@redhat.com>
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        axboe@kernel.dk
Subject: Re: [powerpc][next-20200701] Hung task timeouts during regression
 test runs
Message-ID: <20200702115216.GF2452799@T590>
References: <CDAB3931-FAAD-443A-A9CD-362E527043A1@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CDAB3931-FAAD-443A-A9CD-362E527043A1@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 02, 2020 at 04:53:04PM +0530, Sachin Sant wrote:
> Starting with linux-next 20200701 release I am observing automated regressions
> tests taking longer time to complete. A test which took 10 minutes with next-20200630
> took more than 60 minutes against next-20200701. 
> 
> Following hung task timeout messages were seen during these runs
> 
> [ 1718.848351]       Not tainted 5.8.0-rc3-next-20200701-autotest #1
> [ 1718.848356] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [ 1718.848362] NetworkManager  D    0  2626      1 0x00040080
> [ 1718.848367] Call Trace:
> [ 1718.848374] [c0000008b0f6b8f0] [c000000000c6d558] schedule+0x78/0x130 (unreliable)
> [ 1718.848382] [c0000008b0f6bad0] [c00000000001b070] __switch_to+0x2e0/0x480
> [ 1718.848388] [c0000008b0f6bb30] [c000000000c6ce9c] __schedule+0x2cc/0x910
> [ 1718.848394] [c0000008b0f6bc10] [c000000000c6d558] schedule+0x78/0x130
> [ 1718.848401] [c0000008b0f6bc40] [c0000000005d5a64] jbd2_log_wait_commit+0xd4/0x1a0
> [ 1718.848408] [c0000008b0f6bcc0] [c00000000055fb6c] ext4_sync_file+0x1cc/0x480
> [ 1718.848415] [c0000008b0f6bd20] [c000000000493530] vfs_fsync_range+0x70/0xf0
> [ 1718.848421] [c0000008b0f6bd60] [c000000000493638] do_fsync+0x58/0xd0
> [ 1718.848427] [c0000008b0f6bda0] [c0000000004936d8] sys_fsync+0x28/0x40
> [ 1718.848433] [c0000008b0f6bdc0] [c000000000035e28] system_call_exception+0xf8/0x1c0
> [ 1718.848440] [c0000008b0f6be20] [c00000000000ca70] system_call_common+0xf0/0x278
> 
> Comparing next-20200630 with next-20200701 one possible candidate seems to
> be following commit:
> 
> commit 37f4a24c2469a10a4c16c641671bd766e276cf9f
>     blk-mq: centralise related handling into blk_mq_get_driver_tag
> 
> Reverting this commit allows the test to complete in 10 minutes.

Hello,

Thanks for the report.

Please try the following fix:

https://lore.kernel.org/linux-block/20200702062041.GC2452799@T590/raw


Thanks,
Ming

