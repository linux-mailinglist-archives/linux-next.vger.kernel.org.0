Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFC44D223A
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 10:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733144AbfJJICN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 04:02:13 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34635 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733115AbfJJICN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Oct 2019 04:02:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id j11so6606993wrp.1;
        Thu, 10 Oct 2019 01:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tlo1xIShsucyvfNJekXe72qo0vfWhsYNLnbaxeilZAA=;
        b=GY8NzSbx80TpUmG1jzklT8s5/8BJyLTJwc9aYbZG96VV1AfD+gHXCCkoA+8ozBQfK5
         B9GEXFg1a4+AfHMIOmFnQ1hLdCBA/lnJ6P8N7NHaVGvFnI39+V7RiCVpRIcXByCb3Hhj
         U3uYms9zV82CUieATD77NotYBJbSNsT9VNm3AWFhKh0UDEKZck/HkdNsClsrqMVQKVX3
         kgLQUvXljNqcjiLDl7cB54fTnLZlzHNLz0gLHbJo9tGY2z66c1Ir0mmVBpbNPaBn2Acu
         brrI0R5ptPbb06kfQErY7pEi9wHWSbp+zmlkQYHDYTfO1smIRDr5TEPHwVWWtXAdkISP
         rRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=tlo1xIShsucyvfNJekXe72qo0vfWhsYNLnbaxeilZAA=;
        b=LtE43gbJPMg/S7LGgKhvCXOSfuz8ULVZm6j4xOiNQ7Yo7UaheHJrPr+95XO3Nrur0L
         Tbvsanlq8yReUvh2TxpIDGDpL3Tn6hqQPGyh5uugaFPdglq+lFFfVHZCn/vETk6oAvi5
         1sYwtr6Bis1n3L3gyv0G5gKutYcu+QGiDC8S5Kqty7VONFKiobUrdBqgobmaAu5NpxMI
         /3Jldy/PNAvViAFg1u68ttM3Y436o3zyTNtH2Wxam37gw7RA2PqKiRzJXQlB5sP13QF0
         TAo+xUImlOd7LKivkwJks7L5vun2a6rnvXeCCNyJX6ObXzAYXvTRyX90gG2dvNqC6j7p
         O6vw==
X-Gm-Message-State: APjAAAXpBwOyc8y91ltT06BrRHCCxMj9fLFqa5y+wXzULAvQRS1TfRD0
        PYVP7lMbZseKPAfDWEQfKk8=
X-Google-Smtp-Source: APXvYqzOhM0XdkF6GWm2qwYw0N6pRz/MoASZgLgYXx2xTTH+8KiTH0+uktUnWbrWkoEDktk6ltUicA==
X-Received: by 2002:adf:a50b:: with SMTP id i11mr7574644wrb.308.1570694531287;
        Thu, 10 Oct 2019 01:02:11 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id j1sm9094519wrg.24.2019.10.10.01.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 01:02:09 -0700 (PDT)
Date:   Thu, 10 Oct 2019 10:02:07 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>, Qian Cai <cai@lca.pw>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191010080207.GA22099@gmail.com>
References: <20191010131448.482da2b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010131448.482da2b2@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/gpu/drm/i915/gt/intel_gt_pm.c: In function 'intel_gt_resume':
> drivers/gpu/drm/i915/gt/intel_gt_pm.c:183:54: error: macro "mutex_release" passed 3 arguments, but takes just 2
>   183 |    mutex_release(&ce->pin_mutex.dep_map, 0, _THIS_IP_);
>       |                                                      ^
> In file included from include/linux/spinlock_types.h:18,
>                  from include/linux/spinlock.h:83,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from include/linux/slab.h:15,
>                  from include/linux/io-mapping.h:10,
>                  from drivers/gpu/drm/i915/i915_drv.h:36,
>                  from drivers/gpu/drm/i915/gt/intel_gt_pm.c:7:
> include/linux/lockdep.h:605: note: macro "mutex_release" defined here
>   605 | #define mutex_release(l, i)   lock_release(l, i)
>       | 
> drivers/gpu/drm/i915/gt/intel_lrc.c: In function '__context_pin_release':
> drivers/gpu/drm/i915/gt/intel_lrc.c:245:51: error: macro "mutex_release" passed 3 arguments, but takes just 2
>   245 |  mutex_release(&ce->pin_mutex.dep_map, 0, _RET_IP_);
>       |                                                   ^
> In file included from include/linux/hardirq.h:6,
>                  from include/linux/interrupt.h:11,
>                  from drivers/gpu/drm/i915/gt/intel_lrc.c:134:
> include/linux/lockdep.h:605: note: macro "mutex_release" defined here
>   605 | #define mutex_release(l, i)   lock_release(l, i)
>       | 
> 
> Caused by commit
> 
>   5facae4f3549 ("locking/lockdep: Remove unused @nested argument from lock_release()")
> 
> interacting with commits
> 
>   dffa8feb3084 ("drm/i915/perf: Assert locking for i915_init_oa_perf_state()")
>   fcde8c7eea60 ("drm/i915/selftests: Exercise potential false lite-restore")
>   b1e3177bd1d8 ("drm/i915: Coordinate i915_active with its own mutex")
> 
> from the drm tree.
> 
> I added the following merge fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 10 Oct 2019 13:08:43 +1100
> Subject: [PATCH] drm/i915: update for mutex_release API change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c | 2 +-
>  drivers/gpu/drm/i915/gt/intel_lrc.c   | 2 +-
>  drivers/gpu/drm/i915/i915_active.c    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

I suspect -next will have to carry this semantic merge conflict 
resolution until the DRM tree is merged upstream.

Thanks,

	Ingo
