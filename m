Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3166E32452B
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 21:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235393AbhBXU1s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 15:27:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235307AbhBXU1o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 15:27:44 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C30C061574
        for <linux-next@vger.kernel.org>; Wed, 24 Feb 2021 12:27:04 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id b15so2103352pjb.0
        for <linux-next@vger.kernel.org>; Wed, 24 Feb 2021 12:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K6bFzy1IBOO1f9bPCmuHpqHzVfK2W4BUDHnED1osbZM=;
        b=JFpgG7nk7OGnukIxvu4D34I6ubCsFKHpWidOpQSGfFGdQbDu6OVnxmmbdHYm6nsGlU
         L32eYLBx1d1hnwiTAjJOQfX1vmob2N1ay/Gyoph/EntoQskJai4N5dfx8ApV9mmnjGxI
         nvI+dV/7qksjIsrmng5bOU68WLc5lBafzaUEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K6bFzy1IBOO1f9bPCmuHpqHzVfK2W4BUDHnED1osbZM=;
        b=C1oaf3GuJa4xPWnwQ6QXHRv19PrDtAZOxe3wNbFBeYqFOJ4aTDegZo/iEJ/BfGrabp
         1FIaXDB0zOiqJs6uGTEPiQHcAzK1e6ZGJNqL5nJMMV2UyakFIwzvhXYMcMZHB/5Z5SEJ
         Lb959edw8asM/S1hZMBu+fmBL4gFEEIaDbm8NX6sqJUG17GV7PREjphx3SPnp+W7Lceh
         1loLBnobyW9ra2hJzrzHJKOnXuuPCMcA618z9rN3A8Fdx5CABZrKOQaXQFwbkCmOc1nJ
         TBeFpQAkRIEYHKgOMQvv8xg86cA4rNMCEBkSXqBnjIaK7RzcqBPHzaZ6ZfuI2GQIvgjy
         gMjQ==
X-Gm-Message-State: AOAM533emV8U62RkP4Z6+l/oJWiBN4lBHUWqvi/HkepRb59is3NwAJs2
        y1/+9qE8816tMoX/vfWDtk/vHzdp55Mt+Q==
X-Google-Smtp-Source: ABdhPJybQPsJIJy3EWddjbln0YNxI+lgoajIbHsZScO7+Sx0LqJuELxlaN0e3jlnQ0m/jU5d+1cVlg==
X-Received: by 2002:a17:903:31d1:b029:de:8361:739b with SMTP id v17-20020a17090331d1b02900de8361739bmr33898916ple.85.1614198424186;
        Wed, 24 Feb 2021 12:27:04 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o185sm3660030pfb.196.2021.02.24.12.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 12:27:03 -0800 (PST)
Date:   Wed, 24 Feb 2021 12:27:02 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in Linus' tree
Message-ID: <202102241225.11226B262@keescook>
References: <20210224113108.4c05915e@canb.auug.org.au>
 <CAHk-=wi1FEJfk9r4Jw90kU3aayXka4Y4HOWdgAtVQHRFTgpQ+A@mail.gmail.com>
 <20210224114942.4b07cece@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224114942.4b07cece@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 24, 2021 at 11:49:42AM +1100, Stephen Rothwell wrote:
> Hi Linus,
> 
> On Tue, 23 Feb 2021 16:33:47 -0800 Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, Feb 23, 2021 at 4:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > are missing a Signed-off-by from their committer.  
> > 
> > Gaah. Maybe I should do some pre-pull hook or something to notice this
> > automatically (like you clearly do).
> 
> I have attached the scripts I run over things after fetching them, but
> before merging them (so not a hook, sorry).  check_commits runs
> check_fixes - but just for my convenience.

Thank you! I've added these to my PR workflow now, and it yells quite loudly.
I'm still looking at some kind of push hook too...

-- 
Kees Cook
