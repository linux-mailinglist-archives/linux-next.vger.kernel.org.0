Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A20F391132
	for <lists+linux-next@lfdr.de>; Wed, 26 May 2021 09:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbhEZHKT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 03:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232871AbhEZHKT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2021 03:10:19 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E8AC061574;
        Wed, 26 May 2021 00:08:47 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id p7so30964990wru.10;
        Wed, 26 May 2021 00:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UIsoLMn5RoixwHJ5dhWXuu2fz9vEguk6KHRZLQrMsj8=;
        b=Q4MEs9fBCeWwLgVBQ8nmc961lBZWhjXv+hqshVVlKQGqtr/8lG+ixVrGfhDeN85NE4
         HXDn/FkiBbpCFlvDQF6JPS0mndVMtUgm6pJoCjU3Z6eMC+4Tzd3mXxxuMqLxIVki5Xdn
         b5vsUGYrsIRfr76ivZMaGpMAPUo/InprxroqLqOoKKzw9O4PvkqEMh/6B6wI/14zspAU
         jBX1zo+vhVT8zSy1Znq4lQSP8kZVjtWkgAUTBLmwDQEqGdssT9bMLRDgOTqPxuyfxkpN
         P+umbLOcv1QFw6l4Q3DHArJ8GQPHBdA8Vv6cHcQ1U8Z/kA5fHTnSDUB9Dzxo8IXJ+shi
         sXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=UIsoLMn5RoixwHJ5dhWXuu2fz9vEguk6KHRZLQrMsj8=;
        b=m/JzDsxmY4wk436nS3NoOJjz09ZgO9ii9FRhZ9ui4pFL9hp6y+bcLsieXVPzskKTov
         eefm46PlZWca36E5ygh2pvWu1rvfdgBLIQng0zql9ZaX18pbhunBK2MchaPNvWFOO+hr
         OxBuS51oOgQNP6Vo9Ikh++Mb23PjXaBww74VZmE/zvcg1vQxq3kkB/oN29bjqSEUa+3B
         dL8d1NE6uUeAqeGVfNF+53AadZMwh23KgXd8aAlbc38WVrlTj1PEGnZ1ALuBx/h4yoMh
         bbtIAqrUYbHh25nR/VK6l0uJY6YWvPgYsIxG6cY6b2ITb9vtqkg9Xs+3XKvfOdDF7GVP
         RNdg==
X-Gm-Message-State: AOAM533iJOyA5qWjFo/9L4RKHc4Rs+yg57/jMJCt2Iyo5ZRGstQgyEvj
        aikJveXNFgkrKVe5FiPvXgmekhknHBE=
X-Google-Smtp-Source: ABdhPJy/loBwcw3gDbsyade0rOjDoCIaqf6WZH72B2utsYHXLRE8KPI/vCwGsI8t/9FE3qVBc9Cwog==
X-Received: by 2002:adf:f907:: with SMTP id b7mr30816996wrr.357.1622012926349;
        Wed, 26 May 2021 00:08:46 -0700 (PDT)
Received: from gmail.com (0526ECF1.unconfigured.pool.telekom.hu. [5.38.236.241])
        by smtp.gmail.com with ESMTPSA id b13sm5225405wmj.40.2021.05.26.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 00:08:45 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Wed, 26 May 2021 09:08:44 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Subject: Re: linux-next: Tree for May 25 (x86: NR_CPUS undeclared)
Message-ID: <YK3z/OojxVvXvIeK@gmail.com>
References: <20210525163932.785c1a2a@canb.auug.org.au>
 <e76d764e-9ed2-b11e-cf0f-53e7172745d4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e76d764e-9ed2-b11e-cf0f-53e7172745d4@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Randy Dunlap <rdunlap@infradead.org> wrote:

> On 5/24/21 11:39 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210524:
> > 
> 
> on x86_64, there can be +/- 100 build errors like so:
> 
> ../arch/x86/include/asm/fixmap.h:103:48: error: 'NR_CPUS' undeclared here (not in a function); did you mean 'NR_OPEN'?
>   FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_MAX_IDX * NR_CPUS) - 1,
>                                                 ^~~~~~~
>                                                 NR_OPEN
> 
> Fix is here:
> https://lore.kernel.org/lkml/20210521195918.2183-1-rdunlap@infradead.org/

This came into -next via a stray header dependencies patch in -mm.

I followed up in that thread, but I'm somewhat worried that the complexity 
of header dependencies are not going in the right direction in that group 
of headers. ;-)

Thanks,

	Ingo
