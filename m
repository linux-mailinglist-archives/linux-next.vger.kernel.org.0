Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942F9281E99
	for <lists+linux-next@lfdr.de>; Sat,  3 Oct 2020 00:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgJBWqE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 18:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJBWqD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 18:46:03 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDFCCC0613D0
        for <linux-next@vger.kernel.org>; Fri,  2 Oct 2020 15:46:03 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q4so1909781pjh.5
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2020 15:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zc5L4nr4dVUi+rfFZrY/83BZu7OKCaVrudFyrQwC9tk=;
        b=lgmveYo2LZNOyCCahKX3gYNXSR3RDqXa3gUFBFTRX+E3jlo6amPHHvDkGBdVZzw0S5
         yCBevr+ldYOBy1MyfDBpySf9J71K/FcfemZSHz9pDdVDnuen5uaUQILTXHGLhCC9+e4p
         IR7OLTltI1w9YlOQek3CVC6P86srTSv79sgjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zc5L4nr4dVUi+rfFZrY/83BZu7OKCaVrudFyrQwC9tk=;
        b=KrD+h7wcQ34nerHFwUClaIqpHcwTAh7pbzuXBuWqaG5KA6kTpvnha8GwGPVB4ztQcE
         FvAApVkJ/CQJ4egI6LIsHEr1uMMSjtr9zeUeu11CUnqaASx9CguWzW3r+Lmwq0/8TnL1
         tL+ZtWM+5pXQAzzSbPrdW6KwOjoaPAnVCcHps78yzXBUGEsvRmwXAwn03Mpqms5fjcEM
         sEStRKIul+jD7N+xyrGzq66TTKzSsscaC9EQ2qoCBTx21Z0Cqi/lXbsEdw09orRTFzNg
         dCSqvm3npruANEfs9wgu1KEMS5RY10yNwwGC+Zs0hTxy+kMeQUWOPvCSdI1SXow0XyOn
         VFnQ==
X-Gm-Message-State: AOAM532KPxfR8aEZbW0YjNYbVqQly5xf4lDrF608/caeaIVPlD+laZCJ
        mD/zyR+1AderUXXGO8sRfUeOqQ==
X-Google-Smtp-Source: ABdhPJz86F/vlBMKar8+F1ffAI2X8jj8iZZYcvXnBR9Ubx8INdUjL7Nov24GYM3V1b/HsaljIHU8QA==
X-Received: by 2002:a17:90a:3984:: with SMTP id z4mr4851276pjb.131.1601678763400;
        Fri, 02 Oct 2020 15:46:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m21sm3090187pfo.13.2020.10.02.15.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:46:02 -0700 (PDT)
Date:   Fri, 2 Oct 2020 15:46:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <202010021545.43A9454E@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
 <202009141310.C668784@keescook>
 <20200915083553.144aabef@canb.auug.org.au>
 <20201001210257.19bc53f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001210257.19bc53f8@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 01, 2020 at 09:02:57PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 15 Sep 2020 08:35:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Kees,
> > 
> > On Mon, 14 Sep 2020 13:11:37 -0700 Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Mon, Sep 14, 2020 at 01:22:49PM +1000, Stephen Rothwell wrote:  
> > > > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > > > produced this warning:
> > > > 
> > > > x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/trace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
> > > > [...]    
> > > 
> > > Hmm, I wasn't seeing that...
> > > 
> > > Which gcc and bintuils versions are you using?  
> > 
> > gcc (Debian 10.2.0-5) 10.2.0
> > GNU ld (GNU Binutils for Debian) 2.35
> 
> Any progress on this?

Hi!

I needed to get by build environment set up with the newer toolchain,
and I've finally gotten that done today. I'll be investigating it
shortly; thanks for waiting on me!

-Kees

-- 
Kees Cook
