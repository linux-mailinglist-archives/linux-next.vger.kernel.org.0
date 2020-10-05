Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFC3282EEC
	for <lists+linux-next@lfdr.de>; Mon,  5 Oct 2020 04:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgJECo5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 4 Oct 2020 22:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgJECo5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 4 Oct 2020 22:44:57 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4592C0613E9
        for <linux-next@vger.kernel.org>; Sun,  4 Oct 2020 19:44:55 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k8so5834145pfk.2
        for <linux-next@vger.kernel.org>; Sun, 04 Oct 2020 19:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gb3wgZey/nhsUecQI0AK4E4FVf7KdU6hAxj0QQpUtZo=;
        b=ChzSdbai67Qi4PgOp3i2KgxrVOLTQeiAORiKr5YQ4egkY/X8Skdh+hMj/XPSJ1jvLS
         6xeRixitvxivStC+vCD4eo2KB+PPkQP3nkKPsUKyafzcw4vpkeTyUjCfKnskJGY4ci/G
         dgxyCfNfHOru/RQUr2cd3Pg7kfiwbCHjNqALY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gb3wgZey/nhsUecQI0AK4E4FVf7KdU6hAxj0QQpUtZo=;
        b=gaTI2fR1hIz6KoCOgC+kPWxmBf/TVumS6B6FxDg1hCGwJRDv/D/ZG0JSYOE5jXJdZm
         sekKCy1XixBV86kutXzJBqYLwOC+NDuVbZ8QQtbPJ4NdBfgF/cOgZrgWMYG+ur0h2qIC
         /3sEAjPx4ouuDNj45FIQejNEa/8odjNOWXEq9M1d5oyvUPnxmoDpf0Rd08Lp/vSRvciF
         N8KRXgJLtk49tf3XwpMh7x/XUdOxQIyWwfAoDCB9a1lrU6wzsXt8as9oqDqYBBIJY81j
         CrtX7lzS5HDbpcsLTn97kgLOd2Fanv9bqm/vowCHZRdF+c0e5RFHVpNzJawPJwyNq8Du
         ez0Q==
X-Gm-Message-State: AOAM530FlvcJL9xt2I0JLbisFF0XkBEbS1M5qiQlRzL7pK6EAlrHHNlD
        YeWPFJ+r2VDJpmkhMhvM+Xbf1lJPfXDCdVkl
X-Google-Smtp-Source: ABdhPJxuY76yHrON3z58BIX8r/cD0A+mO0MomIEAZVJmWe2JaRCoyuG+FKkz3vVRLizjdpgxmxvVXg==
X-Received: by 2002:a63:165b:: with SMTP id 27mr12021369pgw.197.1601865894675;
        Sun, 04 Oct 2020 19:44:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y4sm8782814pgl.67.2020.10.04.19.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 19:44:53 -0700 (PDT)
Date:   Sun, 4 Oct 2020 19:44:52 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <202010041944.7FEE22407B@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
 <202010031451.ABC49D88@keescook>
 <20201004102437.12fb0442@canb.auug.org.au>
 <202010040125.B5AD5B757@keescook>
 <20201004210018.5bbc6126@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004210018.5bbc6126@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Oct 04, 2020 at 09:00:18PM +1100, Stephen Rothwell wrote:
> Hi Kees,
> 
> On Sun, 4 Oct 2020 01:27:01 -0700 Kees Cook <keescook@chromium.org> wrote:
> >
> > I assume CONFIG_CONSTRUCTORS is enabled for your build (it should be for
> 
> yes, indeed.
> 
> > allmodconfig). Does this patch fix it? (I'm kind of blindly guessing
> > based on my understanding of where this could be coming from...)
> > 
> > 
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index e1843976754a..22f14956214a 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -701,6 +701,7 @@
> >  #ifdef CONFIG_CONSTRUCTORS
> >  #define KERNEL_CTORS()	. = ALIGN(8);			   \
> >  			__ctors_start = .;		   \
> > +			KEEP(*(SORT(.ctors.*)))		   \
> >  			KEEP(*(.ctors))			   \
> >  			KEEP(*(SORT(.init_array.*)))	   \
> >  			KEEP(*(.init_array))		   \
> 
> And that makes the messages go away.

Okay then! Thanks for testing. :) I'm not sure why the ppc-hosted
compiler generates those. Regardless, I'll send a proper patch...

-- 
Kees Cook
