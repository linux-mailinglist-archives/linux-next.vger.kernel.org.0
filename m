Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085CD282975
	for <lists+linux-next@lfdr.de>; Sun,  4 Oct 2020 09:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgJDHm4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 4 Oct 2020 03:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgJDHmz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 4 Oct 2020 03:42:55 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A2EC0613CF
        for <linux-next@vger.kernel.org>; Sun,  4 Oct 2020 00:42:53 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b26so1091424pff.3
        for <linux-next@vger.kernel.org>; Sun, 04 Oct 2020 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YfJ6oI/cx9RfsuyVosR0SJxaCQ+cWKtTDlmRTsDCB9o=;
        b=UJ0hPVHB1fPPShGpiGyAHioRu5zQERm9VGgu03OGDVKR9Wk+UWm2B/0c66MBi8IGOy
         jOE1W5pw0hpOavL+/4BpIgJRFwCPA+dx1FVQvXfYuRi6vLjmqtFhQMlezdjm2CxTxiwF
         ty/Qs8z2Dv7gEIihbr5/BskJMG6Emz4pWA0eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YfJ6oI/cx9RfsuyVosR0SJxaCQ+cWKtTDlmRTsDCB9o=;
        b=fk0yWFa/7LwkzpXYqGmHmMrvmyT9nfgeeUYU5rBHZIX1M1IEov0uCKs+FSuUEkHWJj
         86hjNk9bOGF0W5yvHYkvlYUxVLqBCHOA5E4RNmM3WaPnIj07Kb4mb0KuxYZvBobDThhO
         Znp4ZayWxEIKai6061NvHMre3H1iZrb1AWGsLIADtMVGIp7EPCvLqKIHCUGhx5LEBAYP
         +/NOOtbvg2/BiIO7j6ydA8pyD3EVIwP0HiUlvizpPVWEVZqmEftw2fxPzKn/3qa+jG2N
         QVK67k4EkStR7MH6h4i+mQrJU/z10+0hqZKdcuQSTIgtRJavcAQOnSRzv4u2Jt/3GvUp
         EEtg==
X-Gm-Message-State: AOAM530hkPoci3lWqZb5tSALKtYUorJCcdWNf+Pz0TqKnnpvd5MHU3nJ
        fH3ZazVo/NpjAiCmdjcnEwW8fODbXUqMsFWB
X-Google-Smtp-Source: ABdhPJyogk1UCoNcQg7FX1meMqKl7T/kZ1fK+7W9VWE5nFJXVNtqCYYfvScQ9l84dg7CC+RzblGlKQ==
X-Received: by 2002:aa7:97a8:0:b029:13e:d13d:a105 with SMTP id d8-20020aa797a80000b029013ed13da105mr10972037pfq.33.1601797373308;
        Sun, 04 Oct 2020 00:42:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s28sm8001324pfd.111.2020.10.04.00.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 00:42:52 -0700 (PDT)
Date:   Sun, 4 Oct 2020 00:42:51 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <202010032117.0A418A3FF7@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
 <202010031451.ABC49D88@keescook>
 <20201004102437.12fb0442@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004102437.12fb0442@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Oct 04, 2020 at 10:24:37AM +1100, Stephen Rothwell wrote:
> On Sat, 3 Oct 2020 14:54:46 -0700 Kees Cook <keescook@chromium.org> wrote:
> > On Mon, Sep 14, 2020 at 01:22:49PM +1000, Stephen Rothwell wrote:
> > > 
> > > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > > produced this warning:
> > > 
> > > x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/trace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
> > > [...]  
> > 
> > Is it only trace that is warning?
> 
> Yes, it is only trace.  it is always 65435 as well, in case that matters.
> 
> > > gcc (Debian 10.2.0-5) 10.2.0
> > > GNU ld (GNU Binutils for Debian) 2.35  
> > 
> > I can't reproduce this with:
> > 
> > gcc (Ubuntu 10.2.0-11ubuntu1) 10.2.0
> > GNU ld (GNU Binutils for Ubuntu) 2.35.1
> >
> > Are you running Debian testing or unstable? (I see binutils 2.35.1 is
> > in both, so was this fixed in the .1?)
> > 
> > I will go build a Debian testing container...

Still nothing for me on Debian testing, x86_64 host:

gcc (Debian 10.2.0-9) 10.2.0
GNU ld (GNU Binutils for Debian) 2.35.1
$ lsb_release -r
Release:        testing
$ uname -m
x86_64

> I am running testing.  Just upgraded to 2.35.1 and the messages are
> still there.  (I did a build of just tip/auto-latest - this is a cross
> build powerpc le hosted)

Interesting. I can't imagine this would be host-specific?

-- 
Kees Cook
