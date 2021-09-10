Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520C0407367
	for <lists+linux-next@lfdr.de>; Sat, 11 Sep 2021 00:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhIJWgY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Sep 2021 18:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbhIJWgX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Sep 2021 18:36:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501C3C061757
        for <linux-next@vger.kernel.org>; Fri, 10 Sep 2021 15:35:11 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id h16so6998526lfk.10
        for <linux-next@vger.kernel.org>; Fri, 10 Sep 2021 15:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DWQGZrSo/Do81bAjpKTAeUBjh1IoG/kzcaTcruy7fk4=;
        b=saxjUAPFfGK5B7x+nTYAT8yzhPqGdjMcWQvcVRiW147le2Hcl7k+yEuEEnfNw/9TyA
         Y3vf1VNph4TncTlTx1IMM/x9uNvAzX3wbgQIHTeOsQXQnzlQQTTX15AxY3FnsB67Ggf3
         hPEOE5t3ZyCWbbXJnDY0pU3XBxYNqcfTk8P8wQI/yV8Ql4708KRfCApaMROmhVXXUmvC
         6vNrZTJjoCkt63PL5L1xSjXhzoB5MVuuQs4fqVCzbWHDR093c6Jv9i8aadzA57XFVCCR
         rL8F5phsIJ8TYBNg3M5uNOWc58OpDrhiOJ2paxP3MNbYc5BrOb92wi//AKbIbJOfwyfK
         U1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DWQGZrSo/Do81bAjpKTAeUBjh1IoG/kzcaTcruy7fk4=;
        b=hyeCu2sxe80c2Gsm1omfIg3UZ7aPKMo7Es4bpYMWzv79nC+Yi2c7TB2qlPMzL9CT+I
         JPBT9HDQwPHGPxBzlouuTZ0wHw6AXjh8Q115Ba4YjVE99I5l5HomdTzskLgijH+/s+sF
         tePyjsT7b4ItE276ZFU63wEkcq6E7abX9ULSbI/+NJM+5lXcQmkcB+c4mY9qo0ngMC9z
         yw4wl07gRd58ZarWwJxJIW9gUFPmD9RdZc+bmjI5GZQoqmQgXxSzwOjXwop78QTTSfxl
         brL7Jak1oGvD2kpO8qdbnwmwp1UGQWJKMW5X/DusE+4OAKhLPvLcqa12IMEFQp+i1KsY
         Cz+w==
X-Gm-Message-State: AOAM530dVXZaWD98MmniQ64Xje3Tc1WRefwcn13VQuzfRex/kP0h8rrl
        s60sfZAeMN6Pes8zrE09oUWR/NO7uYjkTklrPXdEdA==
X-Google-Smtp-Source: ABdhPJw541SsRoH3llrdeNz3D2AuhbrsNp86DUKg8d4moYQ1Lm0on5D/RGg9t2gjrSVV/TE6HoXob88bUDTMzYSAKfk=
X-Received: by 2002:ac2:4c46:: with SMTP id o6mr5569552lfk.240.1631313309434;
 Fri, 10 Sep 2021 15:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210909182525.372ee687@canb.auug.org.au> <20210909225035.3990728-1-ndesaulniers@google.com>
 <CAKwvOd=hoPv2GMZws6UsnMHop6+662wer=Hfo2Tw2=1XXCY2JA@mail.gmail.com>
 <CAKwvOdmXVLjd9ukYpORDgPeqFcM4nRiOYE_1Mtr_bGa=FPo4Cg@mail.gmail.com> <CAKwvOdnDOQPRe3v7ZD6SRR=TgbLqo1wfn_zmgfJpbqGEZyJ1-Q@mail.gmail.com>
In-Reply-To: <CAKwvOdnDOQPRe3v7ZD6SRR=TgbLqo1wfn_zmgfJpbqGEZyJ1-Q@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 10 Sep 2021 15:34:58 -0700
Message-ID: <CAKwvOdkc9oQWh8tFobxS9NTGsyyeWHLz9+RQ2bgxFawob0hEwQ@mail.gmail.com>
Subject: Re: linux-next: build failure while building Linus' tree
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     axboe@kernel.dk, josef@toxicpanda.com, libaokun1@huawei.com,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        llvm@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, sfr@canb.auug.org.au
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 10, 2021 at 3:26 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 10, 2021 at 3:17 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Sep 10, 2021 at 3:02 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Thu, Sep 9, 2021 at 3:50 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > > >
> > > > + Rasmus
> > > >
> > > > This was introduced in
> > > > commit f0907827a8a91 ("compiler.h: enable builtin overflow checkers and add
> > > > fallback code")
> > > > which added division using the `/` operator, which is problematic when checking
> > > > for overflows of 64b operands on 32b targets.
> > > >
> > > > We'll probably need helpers from linux/math64.h and some combination of
> > > > __builtin_choose_expr/__builtin_types_compatible_p.
> > > >
> > > > That will help us fix another compiler bug for older clang releases, too.
> > > > https://github.com/ClangBuiltLinux/linux/issues/1438.
> > >
> > > Ok, I have something hacked up that I think will work:
> > > https://gist.github.com/nickdesaulniers/2479818f4983bbf2d688cebbab435863
> >
> > hmm...playing around with adding some static asserts to the above, I
>
> ah! static_assert can't be used for the type agnostic macros,
> BUILD_BUG_ON needs to be used in its place. Ok, let me add a few and
> see if that can help instill some confidence here.

Ah, I just saw your comment now about raising the minimum required
version of gcc to 5.1.
https://github.com/ClangBuiltLinux/linux/issues/1438#issuecomment-916745801

> > > This incomplete diff is a little hacked up to reproduce the issue with
> > > a known-bad revision of clang that demonstrates a similar issue to GCC
> > > 4.9.  You can ignore the movement of check_mul_overflow and friends in
> > > include/linux/overflow.h.
> > >
> > > I think I'm going to break that up into 2 or 3 patches:
> > > 1. move is_signed_type from include/linux/overflow.h to perhaps
> > > include/linux/typecheck.h.
> > > 2. add div64_x64, div_x64, and div_64 to include/linux/math64.h, use
> > > them in include/linux/overflow.h to fix GCC 4.9
> > > 3. move multiply fallbacks out of
> > > COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW for clang < 14.

In that case, I do have __mulodi4() rewritten from compiler-rt to be
usable in the kernel.
-- 
Thanks,
~Nick Desaulniers
