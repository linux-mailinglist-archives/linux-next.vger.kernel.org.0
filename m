Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B666433097D
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 09:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhCHIit (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 03:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhCHIiU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2021 03:38:20 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEC8C06174A;
        Mon,  8 Mar 2021 00:38:20 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id m9so13379492edd.5;
        Mon, 08 Mar 2021 00:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8N6zycd2yrKbam+OR3bOq1SNQG2SBp6TImAUSmdj4kM=;
        b=YHYzr+5jM2EQX9SwVJJE1oFqP1APTa8yt5FbhR9XeIKjSgS8ZQCmiJc8+5IXfmeBko
         7e//ub/KDnANa/+KvF187OEHxp79w4sA/8oztCn/rnVECdxOQxZ1vhxNSpwUCf8KoriQ
         YkmTKhSpD49ds4p5nHNV+5zXpMBjcyPcMSQaHisE5+uSAFkD4b+DpW+mTDnxTyUV2WK6
         bcqDdNjaZiLMfy07/Ln/hYCzC4eXVsNzFIXe3jaRV5a77hbsqP6yaYIEulNoZc5zhe8N
         5qmFina6ULJfbkzT4sRkgSm2FpyGpd2UuW8vlKd+DDJwq3QVs04iBjJq120ERDYIEBFU
         UdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=8N6zycd2yrKbam+OR3bOq1SNQG2SBp6TImAUSmdj4kM=;
        b=pMjx9T+jFWz59G+DBArj6YJTsq8AcSWDJ6U6V0fuNHMmNpxeSFSd5PaQnb/i87GvBQ
         BG9RAKOPMIbZIy9l3B7abN/UxffS5xmFd2jA+fgZNFHRbK+eX9Qb4FytxVUcKKqlBt5O
         ejtBxLNtU4dKW5ZwyTuIknpmFgJXNP7LZGKXycAVUGpTqR8ihV8XOEpV6k1ARW4cxAe8
         yaLomxp6gPuj0QvEF4hJJ8cJmwppKB6mZUC9xWJZGU7A6puKCttMVye4bkkGvUmmuLMQ
         ad5eAGRWl5rRcilU+yBuXsXqp2bJd9+gZ2uTvTCardZyHN7a4J9k6Q55KfynUfEpvZBE
         K6Og==
X-Gm-Message-State: AOAM533++bLcMVvIASL4S0jvIcv/2ZNfaDGfAW+TNREOMD+esyk0ZMUU
        aB39wWxTIHBk0AkXa9fCyymsdul5cJw=
X-Google-Smtp-Source: ABdhPJyYNbv1Oa/jyJ4xV6QmCCiIdiJYRaqMHi0NbiGCoAbAdLE3Ow9EqitR7DYR0tLUyaD8aPbtdA==
X-Received: by 2002:aa7:d917:: with SMTP id a23mr9881117edr.122.1615192698724;
        Mon, 08 Mar 2021 00:38:18 -0800 (PST)
Received: from gmail.com (20014C4E1CB4EF00D119361004A17E82.dsl.pool.telekom.hu. [2001:4c4e:1cb4:ef00:d119:3610:4a1:7e82])
        by smtp.gmail.com with ESMTPSA id c17sm7083261edw.32.2021.03.08.00.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 00:38:18 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Mon, 8 Mar 2021 09:38:16 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the tip tree
Message-ID: <20210308083816.GA797670@gmail.com>
References: <20210308131651.68446a90@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308131651.68446a90@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   eca8f0c80a00 ("hrtimer: Update softirq_expires_next correctly after __hrtimer_get_next_event()")
> 
> Fixes tag
> 
>   Fixes: da70160462e ("hrtimer: Implement support for softirq based hrtimers")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 5da70160462e ("hrtimer: Implement support for softirq based hrtimers")

Thanks - fixed.

	Ingo
