Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F95843AE3B
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 10:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbhJZImh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 04:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbhJZImg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 04:42:36 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA0CC061745;
        Tue, 26 Oct 2021 01:40:12 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bq11so15988547lfb.10;
        Tue, 26 Oct 2021 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ijOwKzeaXpFPGRIQxSXTmMn90o1TvbGRWLX4tLalZBE=;
        b=PJINZiPWegrX910mJuZJ713rquPCluWA0Lx2UZb4WFQoFKts339Bonp7bWsaAoIHoK
         Nf6mdCS73gzJfIELnIHC69/wPqKYd+lBQ320JiUoIlZxG5plcWIZEhoKKx78bTC4UETm
         N7/gFEQc3qS+7TOndhqU/NnIb/ZfU1fXE+H/AXrKarqcDjatlZHSLGrTffPq6AWu976U
         AO0rhOSZVpP+bwRb+dovqzd627J2e21KytWXTZv01Va2uU4kUk6f6Miude+s/yskOj6+
         ywGOsjfRjR9ZNi6aNT9H1Q9D7OZHoSDX7OTCYd6F4G8pybBMiwGcqDR0FcB6SFBET7h7
         13LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ijOwKzeaXpFPGRIQxSXTmMn90o1TvbGRWLX4tLalZBE=;
        b=I6Cg/SUdjpQGD7V0FGlS37DKR9VHWGWYdaSs2bL3+5+4wo63qsKtoFJXWL7nDV6cL9
         1I3f/VsiWfqsajY3XEAUlMu1E9EK6ceq+NEwtM8m8cupoaCY54HlUfoeXmubr9jmeOUY
         ETFvKaERLz6oQeedSImATuvSQi+OXtszYkNE3TlUoQClgvMNE0Ywv1f6C3vB6b3VubPQ
         3UvsMRzzU/pYv+jZB1WZqUzZPExnm+4lI/ihUhL2Pp+D1bWDJZwmfiUBEC9awzhu0Nhq
         rF3ziGvFiNbe0dDWs4HRFiFt0sINJ7gkp4IdQXFwe0H+Pwd+umY5TM2TGqlPK1LFBX/e
         dsiA==
X-Gm-Message-State: AOAM531dFOcNBakUWmlsGsjgYwAhA0kjDuyfDZPQ8E16+drJiumSWI9l
        6ZIEgshd2ZNyGkftHartqSWmH0wRfxc=
X-Google-Smtp-Source: ABdhPJyVM55cZxyXsaUnOKovtCvp/RyyGdUD5eyXSBE1KGuHQNRBc3+guwHQRmPWIqK5Z+cCGWxMcA==
X-Received: by 2002:a05:6512:23a9:: with SMTP id c41mr20365392lfv.573.1635237610634;
        Tue, 26 Oct 2021 01:40:10 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.googlemail.com with ESMTPSA id u4sm331486lff.198.2021.10.26.01.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 01:40:10 -0700 (PDT)
Subject: Re: linux-next: Tree for Oct 25
To:     Ming Lei <ming.lei@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>
References: <20211025204921.73cb3011@canb.auug.org.au>
 <82bbf33e-918f-da01-95e6-9b2cc1b8b610@gmail.com> <YXdZxzAPejKyE8Oi@T590>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <82558c85-d3be-e158-54f1-b3067f15fa21@gmail.com>
Date:   Tue, 26 Oct 2021 11:40:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXdZxzAPejKyE8Oi@T590>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

26.10.2021 04:28, Ming Lei пишет:
> On Tue, Oct 26, 2021 at 01:11:07AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> Recent -next has this new warning splat coming from MMC, please take a look.
>>
>>  ------------[ cut here ]------------
>>  WARNING: CPU: 0 PID: 525 at kernel/sched/core.c:9477 __might_sleep+0x65/0x68
>>  do not call blocking ops when !TASK_RUNNING; state=2 set at [<4316eb02>] prepare_to_wait+0x2e/0xb8
>>  Modules linked in:
>>  CPU: 0 PID: 525 Comm: Xorg Tainted: G        W         5.15.0-rc6-next-20211025-00226-g89ccd6948ec3 #5
>>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>>  (unwind_backtrace) from [<c01089f9>] (show_stack+0x11/0x14)
>>  (show_stack) from [<c0afacb9>] (dump_stack_lvl+0x2b/0x34)
>>  (dump_stack_lvl) from [<c011f689>] (__warn+0xa1/0xe8)
>>  (__warn) from [<c0af6729>] (warn_slowpath_fmt+0x65/0x7c)
>>  (warn_slowpath_fmt) from [<c01421b9>] (__might_sleep+0x65/0x68)
>>  (__might_sleep) from [<c07eb377>] (mmc_blk_rw_wait+0x2f/0x118)
>>  (mmc_blk_rw_wait) from [<c07eba11>] (mmc_blk_mq_issue_rq+0x219/0x71c)
>>  (mmc_blk_mq_issue_rq) from [<c07ec199>] (mmc_mq_queue_rq+0xf9/0x200)
>>  (mmc_mq_queue_rq) from [<c04ad247>] (__blk_mq_try_issue_directly+0xcb/0x100)
>>  (__blk_mq_try_issue_directly) from [<c04adb89>] (blk_mq_request_issue_directly+0x2d/0x48)
>>  (blk_mq_request_issue_directly) from [<c04adcf3>] (blk_mq_flush_plug_list+0x14f/0x1f4)
>>  (blk_mq_flush_plug_list) from [<c04a5313>] (blk_flush_plug+0x83/0xb8)
>>  (blk_flush_plug) from [<c0b013cb>] (io_schedule+0x2b/0x3c)
>>  (io_schedule) from [<c0b01a17>] (bit_wait_io+0xf/0x48)
> 
> The following patch should fix the issue:
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index a71aeed7b987..bee9cb2a44cb 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -2223,7 +2223,7 @@ void blk_mq_flush_plug_list(struct blk_plug *plug, bool from_schedule)
>  		return;
>  	plug->rq_count = 0;
>  
> -	if (!plug->multiple_queues && !plug->has_elevator) {
> +	if (!plug->multiple_queues && !plug->has_elevator && !from_schedule) {
>  		blk_mq_plug_issue_direct(plug, from_schedule);
>  		if (rq_list_empty(plug->mq_list))
>  			return;
> 

Thank you!

Tested-by: Dmitry Osipenko <digetx@gmail.com>
