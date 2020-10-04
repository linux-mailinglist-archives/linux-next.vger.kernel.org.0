Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDBD282997
	for <lists+linux-next@lfdr.de>; Sun,  4 Oct 2020 10:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgJDI1F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 4 Oct 2020 04:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDI1F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 4 Oct 2020 04:27:05 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD8BC0613CE
        for <linux-next@vger.kernel.org>; Sun,  4 Oct 2020 01:27:03 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id i2so59802pgh.7
        for <linux-next@vger.kernel.org>; Sun, 04 Oct 2020 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7GVkf+RweqDM35TgR0KQ2W8O1h5HD4O2daelha2fSjY=;
        b=VXo2pxcOyal9Arsf8QyZzWEMDo2WQ8elR4HwK0DtNmhpgFb8k1lvqhuauzTad46U5J
         h9U6dmxxNjs3n+zln08jQ3XNAPvoXx1TGbbXv62ZkNbKKvDcOV2Y/18EN0bZ0rVnChYB
         2vyH31UoAoUH9GJakC9pCdNm5yXn0wU8TPWGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7GVkf+RweqDM35TgR0KQ2W8O1h5HD4O2daelha2fSjY=;
        b=c9idFCb0aQZ5T+1sTwcgxhGb6D2IJY0UZL6rtb0KNpNqtdVI+4v5ULPLb6DTh18Epl
         t6sDeTKn2y//iIxMXrYNUUoDRCNT5VEQ0OHVbqblM6ePV+6GcwXtSqvoCW2s8zoT2CbC
         lb6RFajTlNs2IJm1FMhwXZjGvDm1icDS0UNNtvGKblaKgfr/wAN359aYR/vqmPVVAXMn
         2HHj7uzJqNpF1y4IGG09Qg+IZjz0Nq2SlJVWrgtUny7ZwOaJT7rWDU9xqcrp3Dh261ky
         nGNuGm82eikuNFCkPp/2vgOvkdi7VbogrwE4rsUUtb/jEvMXuXgG7lpHRWFdqOse7r4+
         2HpA==
X-Gm-Message-State: AOAM5305y6aSsFHUdOm6mUbTTVYgsPfIDwHTF5JaWeTEoyE1DE6+td4y
        spoQ+2gFVTcwi9sjx0Xr5kXN4w==
X-Google-Smtp-Source: ABdhPJyHWSk4TKGo6luAv+DThjs7QPgZdlV6O3AheGpM0MQBU07HsJtyZlbMHibNqBzGWWNJLb5TQg==
X-Received: by 2002:a65:4d42:: with SMTP id j2mr9078295pgt.182.1601800023169;
        Sun, 04 Oct 2020 01:27:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y25sm7895442pfm.125.2020.10.04.01.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 01:27:02 -0700 (PDT)
Date:   Sun, 4 Oct 2020 01:27:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <202010040125.B5AD5B757@keescook>
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
> Hi Kees,
> 
> On Sat, 3 Oct 2020 14:54:46 -0700 Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, Sep 14, 2020 at 01:22:49PM +1000, Stephen Rothwell wrote:
> > > Hi all,
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
> 
> I am running testing.  Just upgraded to 2.35.1 and the messages are
> still there.  (I did a build of just tip/auto-latest - this is a cross
> build powerpc le hosted)

I assume CONFIG_CONSTRUCTORS is enabled for your build (it should be for
allmodconfig). Does this patch fix it? (I'm kind of blindly guessing
based on my understanding of where this could be coming from...)


diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e1843976754a..22f14956214a 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -701,6 +701,7 @@
 #ifdef CONFIG_CONSTRUCTORS
 #define KERNEL_CTORS()	. = ALIGN(8);			   \
 			__ctors_start = .;		   \
+			KEEP(*(SORT(.ctors.*)))		   \
 			KEEP(*(.ctors))			   \
 			KEEP(*(SORT(.init_array.*)))	   \
 			KEEP(*(.init_array))		   \


-- 
Kees Cook
