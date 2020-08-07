Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2315423E505
	for <lists+linux-next@lfdr.de>; Fri,  7 Aug 2020 02:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgHGATQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 20:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgHGATQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2020 20:19:16 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25309C061574;
        Thu,  6 Aug 2020 17:19:16 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k13so201277plk.13;
        Thu, 06 Aug 2020 17:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UXliulb/nEB8A5bXluLowN5ZPsnjirc+VXLcTbaZeNw=;
        b=NgaYN8P3J3ZDD5wpDwgv3SvayRjgk1R7Qxy3cr9dFe1Qfk0e50tiLjwxEiqo+lC/pc
         SvZidJa6ko+FckNmWQ9UGlKRxl8A8Kjoe4HVhAEd/hBGKDyJ2AEpSkheGmJzHsqiH5u0
         ngiWBYBtL41xzkVIvLYFAMmpeWWm3eT+irh7Yg+jHyp1RiYPPj6sT3QkwLTJpwc50Af/
         oVhl9IoXVj8Iej/oAI4BSPuYCiDZPuxKLDMNSXkzgqkeYfZDWt9HIo6iwDV060HioF7w
         Dua+CILcmuntPwHXWvf9rZOTxvIcSsS5kWCGoA3J/6rLUJnq347WK6QrZNQVwnlGKr4o
         8AKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=UXliulb/nEB8A5bXluLowN5ZPsnjirc+VXLcTbaZeNw=;
        b=lHwLpnDRmStXAORIu5EU1dS6Cj0RapouRckEUSKyf6O+Mobnxwi9dtD5DUyllC5i6B
         LScqYpGjIQQIyKeYndeUZs95WjW1f7nq+uUI+XoFztvpzI8VAnAIq+SoHv+0wY/z4pyu
         zXnHqhcZLpauONorT3D8EBZxgRur5EL3iV8zAfTTRtTykhMVznY7vAKIMnpHh+wxXJDH
         2hluxudUE16KR57bpucbrsra6xT2TEoJWXW+dCfWbW2WpCD8DB2sCEwNlAWEBBpEZ4/b
         evTSjaI/Uh72cXg/Co2I0v6iux3lyhfps6GYAykLA9c+v8icMyuTm/+8mVX3d71zYmf7
         kl3w==
X-Gm-Message-State: AOAM532sFYqG9sbkD5rHuylbSpLNU9NG88GheaH8KbK5PM5oeLPm0jDx
        zJ7RAWIlp4HYnerTKY0GMvA=
X-Google-Smtp-Source: ABdhPJzvJSmv39MSPsAAtzl7DF+Dt/hliUkfkx5Ii8UPRzZ561wwXNl4DjzrU+24ewxb4Yo9lpj3fA==
X-Received: by 2002:a17:90a:c28d:: with SMTP id f13mr596183pjt.124.1596759554941;
        Thu, 06 Aug 2020 17:19:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y10sm8240162pjv.55.2020.08.06.17.19.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 17:19:14 -0700 (PDT)
Date:   Thu, 6 Aug 2020 17:19:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Qian Cai <cai@lca.pw>
Cc:     torvalds@linux-foundation.org, daniel.diaz@linaro.org,
        tytso@mit.edu, catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sfr@canb.auug.org.au, linux-next@vger.kernel.org
Subject: Re: [PATCH] random: fix a compilation error on arm64
Message-ID: <20200807001912.GA29367@roeck-us.net>
References: <20200806135836.31736-1-cai@lca.pw>
 <4edcf552-ef82-cdd2-3fda-38d42ebfecc7@roeck-us.net>
 <20200806224313.GA36490@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200806224313.GA36490@lca.pw>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 06, 2020 at 06:43:14PM -0400, Qian Cai wrote:
> On Thu, Aug 06, 2020 at 07:50:23AM -0700, Guenter Roeck wrote:
> > On 8/6/20 6:58 AM, Qian Cai wrote:
> > > linux-next failed to compile using this .config,
> > > https://gitlab.com/cailca/linux-mm/-/blob/master/arm64.config
> > > 
> > > arch/arm64/kernel/kaslr.c: In function 'kaslr_early_init':
> > > arch/arm64/kernel/kaslr.c:128:6: error: implicit declaration of function
> > > '__early_cpu_has_rndr'; did you mean '__early_pfn_to_nid'?
> > > [-Werror=implicit-function-declaration]
> > >   if (__early_cpu_has_rndr()) {
> > >       ^~~~~~~~~~~~~~~~~~~~
> > >       __early_pfn_to_nid
> > > arch/arm64/kernel/kaslr.c:131:7: error: implicit declaration of function
> > > '__arm64_rndr' [-Werror=implicit-function-declaration]
> > >    if (__arm64_rndr(&raw))
> > >        ^~~~~~~~~~~~
> > > cc1: some warnings being treated as errors
> > > 
> > 
> > This happens because ARCH_RANDOM is disabled. May be I am wrong, but I
> > would argue that __arm64_rndr() should not be called directly in the
> > first place. arch_get_random_seed_long_early() should be called instead.
> 
> I am not sure about if that would cure possible ARCH_RANDOM=n compiling
> failures on all arches. Since my patch would not compile on mips etc, an
> alternative is to revert the buggy commit 585524081ecd for now. Any thought?
> 
It is quite unlikely that any other architecture would attempt to compile
any arm64 code (which is the only code touched by commit 585524081ecd).
Also, commit 585524081ecd fixes a different problem caused by the
recursive inclusion of asm/archrandom.h. On top of that, I think using
arch_get_random_seed_long_early() would be much cleaner than the current
code since it doesn't override/bypass ARCH_RANDOM.

Let's do it this way: I'll submit an alternate patch using
arch_get_random_seed_long_early(). This way Linus can decide how to
proceed, and we don't have to go back and forth.

Thanks,
Guenter

> > 
> > Thanks,
> > Guenter
> > 
> > > Fixes: 585524081ecd ("random: random.h should include archrandom.h, not the other way around")
> > > Signed-off-by: Qian Cai <cai@lca.pw>
> > > ---
> > >  include/linux/random.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/include/linux/random.h b/include/linux/random.h
> > > index f45b8be3e3c4..da782c16c20c 100644
> > > --- a/include/linux/random.h
> > > +++ b/include/linux/random.h
> > > @@ -12,6 +12,8 @@
> > >  #include <linux/list.h>
> > >  #include <linux/once.h>
> > >  
> > > +#include <asm/archrandom.h>
> > > +
> > >  #include <uapi/linux/random.h>
> > >  
> > >  struct random_ready_callback {
> > > 
> > 
