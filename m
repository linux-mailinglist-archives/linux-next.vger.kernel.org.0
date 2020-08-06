Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAD923E423
	for <lists+linux-next@lfdr.de>; Fri,  7 Aug 2020 00:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgHFWnX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 18:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgHFWnW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2020 18:43:22 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F95C061575
        for <linux-next@vger.kernel.org>; Thu,  6 Aug 2020 15:43:21 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id b79so84780qkg.9
        for <linux-next@vger.kernel.org>; Thu, 06 Aug 2020 15:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b+1ry44sHxvv4KXqzeNT9YyGHdp3tNCfWY1mccMksCA=;
        b=FbxkZDKr5sG/xvWst2LK41bbtukdW5ZZMFu+oYE1TGshv/unqZZOIpzT6poyKLm4Gm
         iDGHP8Od63rRrq817YwjMdp4BUZOP9sFdATNUdKS3TfkFKpRdsB8ePQ7jGaCcxYwp3kC
         G+gRcgd59VoXXkQP+piBtfQA2jBEo/sUNr/9m/DUt0ynekmQH6HWNGUW90udBb3SLi/X
         Z779D1hEL3w22PUzyxb0hEQKTB7iSCa8I5ookM0VXqWbxfIuBGHfjBdU/6Q4mZcs25n8
         0wgVj6SiuEUS8gsPrtL4ei4b6DYTv/EkJtYZZN9uS3FmAI6qxnou5vxxayCvhzbFKhPz
         Uz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b+1ry44sHxvv4KXqzeNT9YyGHdp3tNCfWY1mccMksCA=;
        b=FRNsVRhWX7BnskAy4xkjJ1KVzfAOZpH8FSpKsmxXqnsOEgGf+o/Cm3fvGdfVVo8+C4
         4eTlIwhG8DX4R0EjfXvWKdJ/iY+E1fWFIIdy0YDYC8jr0JC9jwb62sDkL42jL9sQEHPb
         tmfevp4GLfMSzGOCV9q46F7MV/i71G/v1gTo2yeEElJefyxvPL+sU5Uv8DEO8PmmQRAi
         g6d3IqW3lKo1r4V++LUxgX0LAQQLtWUINL7NYLzpdK/5BAGxPqLrXGdNTKDKFNp5r9Cg
         PadHUT/ypIcBHBQ0eY7uGMWL/jiyF2kuX34EqcCtobPzqM9B8EjKLFAFsEUliQpPfgGY
         PxoA==
X-Gm-Message-State: AOAM533cylAsHvGQLkMwAqVpCJhHp+EIZNXImVszPcJoM9h2Y95a9DOd
        CzjNPARquCE4zq3U21o6eJh/eQ==
X-Google-Smtp-Source: ABdhPJyk2tlCoRxKg3WlLar97JCSwlt2F3Eo4+MM3g3LceM2ipQAWCTJw4bWRRyK5I7MIlPEyBdfSA==
X-Received: by 2002:a37:d97:: with SMTP id 145mr10653488qkn.218.1596753800801;
        Thu, 06 Aug 2020 15:43:20 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id i20sm5042334qka.17.2020.08.06.15.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 15:43:20 -0700 (PDT)
Date:   Thu, 6 Aug 2020 18:43:14 -0400
From:   Qian Cai <cai@lca.pw>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     torvalds@linux-foundation.org, daniel.diaz@linaro.org,
        tytso@mit.edu, catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sfr@canb.auug.org.au, linux-next@vger.kernel.org
Subject: Re: [PATCH] random: fix a compilation error on arm64
Message-ID: <20200806224313.GA36490@lca.pw>
References: <20200806135836.31736-1-cai@lca.pw>
 <4edcf552-ef82-cdd2-3fda-38d42ebfecc7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4edcf552-ef82-cdd2-3fda-38d42ebfecc7@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 06, 2020 at 07:50:23AM -0700, Guenter Roeck wrote:
> On 8/6/20 6:58 AM, Qian Cai wrote:
> > linux-next failed to compile using this .config,
> > https://gitlab.com/cailca/linux-mm/-/blob/master/arm64.config
> > 
> > arch/arm64/kernel/kaslr.c: In function 'kaslr_early_init':
> > arch/arm64/kernel/kaslr.c:128:6: error: implicit declaration of function
> > '__early_cpu_has_rndr'; did you mean '__early_pfn_to_nid'?
> > [-Werror=implicit-function-declaration]
> >   if (__early_cpu_has_rndr()) {
> >       ^~~~~~~~~~~~~~~~~~~~
> >       __early_pfn_to_nid
> > arch/arm64/kernel/kaslr.c:131:7: error: implicit declaration of function
> > '__arm64_rndr' [-Werror=implicit-function-declaration]
> >    if (__arm64_rndr(&raw))
> >        ^~~~~~~~~~~~
> > cc1: some warnings being treated as errors
> > 
> 
> This happens because ARCH_RANDOM is disabled. May be I am wrong, but I
> would argue that __arm64_rndr() should not be called directly in the
> first place. arch_get_random_seed_long_early() should be called instead.

I am not sure about if that would cure possible ARCH_RANDOM=n compiling
failures on all arches. Since my patch would not compile on mips etc, an
alternative is to revert the buggy commit 585524081ecd for now. Any thought?

> 
> Thanks,
> Guenter
> 
> > Fixes: 585524081ecd ("random: random.h should include archrandom.h, not the other way around")
> > Signed-off-by: Qian Cai <cai@lca.pw>
> > ---
> >  include/linux/random.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/linux/random.h b/include/linux/random.h
> > index f45b8be3e3c4..da782c16c20c 100644
> > --- a/include/linux/random.h
> > +++ b/include/linux/random.h
> > @@ -12,6 +12,8 @@
> >  #include <linux/list.h>
> >  #include <linux/once.h>
> >  
> > +#include <asm/archrandom.h>
> > +
> >  #include <uapi/linux/random.h>
> >  
> >  struct random_ready_callback {
> > 
> 
