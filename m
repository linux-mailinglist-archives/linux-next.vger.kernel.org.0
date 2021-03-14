Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E5D33A3A7
	for <lists+linux-next@lfdr.de>; Sun, 14 Mar 2021 09:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbhCNIl3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Mar 2021 04:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbhCNIlQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Mar 2021 04:41:16 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF42EC061574;
        Sun, 14 Mar 2021 00:41:15 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id z13so30281958iox.8;
        Sun, 14 Mar 2021 00:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=82EDgeGC1pgrCK/zuuqYF7NSgFHUyXyBxKsnhBt5u2g=;
        b=EK2Z5iHGlJnd/2uR6GiGrItsC/VvYkH4GRJ02hfHjxtHKzqwG5DHiqJZh3XZs9/feb
         Ewg2CjjaYav6yrY1SRwnVzEMYOPX+BrJRj09pTsfz7jamS/5AsJkgWozPlrFD+2SifKu
         rgvlvXJeKxgPB/s8clyinvNtxEN5ddgsIeEOBpIWdplQEoyoi7Eg61zblBtp4uWrR1Fw
         2NVSNHphCxk8w/Xu3JyCT+jcU3JqINQ+vhSvzJLAfy3Wki9TZO77KVi2OJ4IvgBwE+V/
         xN+53a2AnFPTschdv8TOfJgo8Rcz2ZXjdU3Y33B7tq6PmUcX0Lf3Z/L68Of7WiAVCACY
         5n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=82EDgeGC1pgrCK/zuuqYF7NSgFHUyXyBxKsnhBt5u2g=;
        b=nPKBv4Ku72qnMfBhTmh9dh9/++cYD8j/TPOdE0o0wntWoRw8yqJBOkXS6tpGVdtRiM
         0O4StVm4DCR0eeuJmQ3+zOtjqqWfrmvSkftnASEKy5zMusNBOtRgknC3AocpDJtXNYsU
         CC05V5GBuP9sjA2Xo91SvOjdrZFeS69WfxJVf9Y+5tRMdNovYAXwEZ0SZd0vp2zdZ5iI
         UvHsqTf+0sRP8IpXAPxH89ef/rQsf0QLspbvYyogyDPhZ2RB0jVtO4D9bgqeurcz7X+c
         G6HJ75FU1cTI7nwGLVakdy+aRJbtsnPjglrceVIK5nB1RxHdSp6xzhnBhLHXNmle4Lsc
         Tn6A==
X-Gm-Message-State: AOAM530tmULTig9iPoecGa0qaHnbeJYlwljTgOYnjlIicjJN8jAS0p7F
        xTL3X7Q4TiyaHbzemOgUfzaqA5S6jxHf7iCrWOTk4NXaT1S0+9Yc
X-Google-Smtp-Source: ABdhPJzWxAdYdkTxKj9M96WfjknlvdLjygoVqr21lVXxofrWNjsccaXAobnKZRRdeKOAJv8g/gDDsWu3y6VGfbd9Pcg=
X-Received: by 2002:a5d:9510:: with SMTP id d16mr4237805iom.81.1615711275298;
 Sun, 14 Mar 2021 00:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20210310150217.046fef19@canb.auug.org.au> <62857b03-c12c-6841-72ae-d94f00a3a868@infradead.org>
 <YEiW12IkiVothTb2@alley>
In-Reply-To: <YEiW12IkiVothTb2@alley>
From:   Yafang Shao <laoar.shao@gmail.com>
Date:   Sun, 14 Mar 2021 16:40:39 +0800
Message-ID: <CALOAHbBUEZRHHjuNAuREiQYcLn7DoZLuCXj9nYSM2qWg6D=RCw@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 10 (lib/test_printf.c)
To:     Petr Mladek <pmladek@suse.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 10, 2021 at 5:52 PM Petr Mladek <pmladek@suse.com> wrote:
>
> On Tue 2021-03-09 21:57:48, Randy Dunlap wrote:
> > On 3/9/21 8:02 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> >
> > on i386 (at least):
> >
> > ../lib/test_printf.c: In function 'page_flags_test':
> > ../lib/test_printf.c:595:17: error: 'sec' undeclared (first use in this function); did you mean 'sem'?
> >   page_flags |= (sec & SECTIONS_MASK) << SECTIONS_PGSHIFT;
> >                  ^~~
> >
> >
> > Should that be 'section'?
>
> Yup, it looks like.
>
> There seems to be one more problem found by the test robot:
>
>    lib/test_printf.c:595:17: note: each undeclared identifier is reported only once for each function it appears in
> >> lib/test_printf.c:612:17: error: 'tag' undeclared (first use in this function)
>      612 |  page_flags |= (tag & KASAN_TAG_MASK) << KASAN_TAG_PGSHIFT;
>
>
> Yafang is going to send a fix. I have temporary removed the
> problematic patch from printk/linux.git, for-next branch.
>
> I am sorry for the troubles. Anyway, it is great that linux-next
> and all the test robots are around.
>

Hi Petr,

I sent a new version v6[1] to fix the test failure and build failure
report by kernel test robot.

Sorry for the late fix as I'm very busy recently.

[1]. https://lore.kernel.org/linux-mm/20210314083717.96380-1-laoar.shao@gmail.com/T/#t


-- 
Thanks
Yafang
