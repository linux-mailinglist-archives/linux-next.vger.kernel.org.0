Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468B12337E4
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 19:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgG3RtX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 13:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgG3RtX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 13:49:23 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DC3C061574
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 10:49:23 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w19so1844911plq.3
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zAsQlJjseg79dIzBbf/4vurEEGf0c2eOUDl+PvAPEAI=;
        b=XQNHsATMjgwdlN+2nu6MR3D1xdDgseWEmpVyZgYm+QWBm9FpEjYCq+VVAAMIRbAAqF
         7X9yXtCbgQek2i1LQd2U7B0iW5Nrh8bZER+kJ81L78Q7tJRr2GVqDy8t7XzNMCfl6om7
         h3GE++/byH6PTw09HYTwIHWZCcfOV+5bCaVpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zAsQlJjseg79dIzBbf/4vurEEGf0c2eOUDl+PvAPEAI=;
        b=JwZ0w3V6tV2XFrXcOJ7ZmpwJCceJJOfALKzdqu2xUl0jIIUhUiGB5hCyUmGX7o3QAu
         pp8DBeqlWfYZZMFkcRoifh3jf2/GX4+lTfx8dy2OhFKWf0kmxNmj+YgSm17Yt/lM6rzh
         CLAIMoH1txr3sNUco0WobXAVFYWgSPyJHK9sRuJq5Ti8P/MzhiW1XHhuEIwYbSwP3Dx+
         8+PWlp7AR5EcPGAi0e5ksccNXDB6HEdIVUsPD8arJ11gBmrp/WKEgjMImIk2WesMdAD6
         tbiMHG9yZI/6/G7jo/Ul7JYBD/Q1A/vXscLqOF48t57LF7gBNyZ2ZZP1MpNDULsnWaEB
         eXwg==
X-Gm-Message-State: AOAM532UWLnsALxLqLoFF7T7zcZFcZMj8H9v8eyf52zdgPlqTUtuAQ+j
        ds9x4qtUpdgOWeZ4VIq4fLLzxg==
X-Google-Smtp-Source: ABdhPJxRBRd4eK3PtBpSOzfO8r1NZUihw8MNLxo8FWk9jSnxMAX16XCx+a60ZnBES9o6GwJRubMhtA==
X-Received: by 2002:a17:90a:e390:: with SMTP id b16mr280073pjz.20.1596131362651;
        Thu, 30 Jul 2020 10:49:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q10sm6508778pfs.75.2020.07.30.10.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 10:49:21 -0700 (PDT)
Date:   Thu, 30 Jul 2020 10:49:20 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Willy Tarreau <w@1wt.eu>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <202007301047.5E8561F203@keescook>
References: <20200730090828.2349e159@canb.auug.org.au>
 <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
 <202007292007.D87DBD34B@keescook>
 <20200730032250.GB7790@1wt.eu>
 <20200730061407.GA7941@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200730061407.GA7941@1wt.eu>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 30, 2020 at 08:14:07AM +0200, Willy Tarreau wrote:
> On Thu, Jul 30, 2020 at 05:22:50AM +0200, Willy Tarreau wrote:
> > On Wed, Jul 29, 2020 at 08:17:48PM -0700, Kees Cook wrote:
> > > And just another heads-up, the patch[1] (which was never sent to a public
> > > list) also breaks arm64 (circular header needs?):
> > (...)
> > 
> > Definitely, we've just got a report about this, I'll have a look once
> > I'm at the office. I'd like to check that we don't obviously break
> > another arch by just removing percpu. If at least shuffling them around
> > is sufficient that'd be nice. Otherwise we'll likely need a separate
> > header (which is not a bad thing for the long term).
> 
> So Linus proposed a clean solution which might be harder to backport
> but looks better for 5.8. However the attached one addresses the issue
> for me on arm64 and still works on x86_64, arm, mips. I think we should
> go with this one first then apply Linus' one on top of it to be long
> term proof, and backport only the first one. Linus ?
> 
> Willy

> From 18fba9e2dfb16605a722e01f95d9e2d020efaa42 Mon Sep 17 00:00:00 2001
> From: Willy Tarreau <w@1wt.eu>
> Date: Thu, 30 Jul 2020 07:59:24 +0200
> Subject: random: fix circular include dependency on arm64 after addition of
>  percpu.h
> MIME-Version: 1.0
> Content-Type: text/plain; charset=latin1
> Content-Transfer-Encoding: 8bit
> 
> Daniel Díaz and Kees Cook independently reported that commit f227e3ec3b5c
> ("random32: update the net random state on interrupt and activity") broke
> arm64 due to a circular dependency on include files since the addition of
> percpu.h in random.h.
> 
> The correct fix would definitely be to move all the prandom32 stuff out
> of random.h but for backporting, a smaller solution is preferred. This
> one replaces linux/percpu.h with asm/percpu.h, and this fixes the problem
> on x86_64, arm64, arm, and mips. Note that moving percpu.h around didn't
> change anything and that removing it entirely broke differently. When
> backporting, such options might still be considered if this patch fails
> to help.
> 
> Reported-by: Daniel Díaz <daniel.diaz@linaro.org>
> Reported-by: Kees Cook <keescook@chromium.org>

FWIW, I was only a messenger. Sami (in Cc) pointed it out to me right
before I got the email from Linus for the x86 plugin breakage. :)

But yes, thanks, this seems to work for me.

> Fixes: f227e3ec3b5c

nit:

Fixes: f227e3ec3b5c ("random32: update the net random state on interrupt and activity")

-Kees

> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  include/linux/random.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/random.h b/include/linux/random.h
> index f310897f051d..9ab7443bd91b 100644
> --- a/include/linux/random.h
> +++ b/include/linux/random.h
> @@ -11,7 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/once.h>
> -#include <linux/percpu.h>
> +#include <asm/percpu.h>
>  
>  #include <uapi/linux/random.h>
>  
> -- 
> 2.20.1
> 


-- 
Kees Cook
