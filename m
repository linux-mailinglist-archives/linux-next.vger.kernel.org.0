Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4C529761B
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 19:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753840AbgJWRuZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Oct 2020 13:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S462286AbgJWRuZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Oct 2020 13:50:25 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1743AC0613D2
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 10:50:25 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id k6so2810558ior.2
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VHLmS2i+xk5cy1+Hh+6vgNtXSGGSQNTTVydbxoIIvxM=;
        b=zC+oRhFaf2/DzBVi/uf1QHqmlqYAMFk/0Yiq6WYy9+Xgfh3NGCaUCcTJ5Q7xSOvUZb
         xe6Nolg1AUdP4BtgPyn07pt0IrBoA9v6TPP5Zfonzu9OhuRJOOPnfM9l4P489FofeFwK
         MfB12Fm281RSTLVc2auMXC/NjKcR9gM+7yPsbZGb6xRuj/RVIewwfCV+5XqaGZnYtALt
         XJ/4OaJYvehbbklG3uz5H59+p1C9Jz2kLQ0URQd+x0aYhYZCEVAU/yJBvItYYSk/tetF
         ss5gP7Je4RLLDflZH5pdRyLfYVhSwGK+kZrSB3N6p+ziSWiyM5NEFfOhAGetgintlI5G
         I8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VHLmS2i+xk5cy1+Hh+6vgNtXSGGSQNTTVydbxoIIvxM=;
        b=kOmkZgBTTgC79rqYMkzdjnR1hmnjT9HGQNYh5lTh0frJY5AfrDwZm3La3gBn7lL/4m
         yeaQopl7hmEOFgygzVrlVqJ1N5PAgGcBuA3jsqH22pPFaByTBL4d/WqaDZRBW/5Mp8cD
         im9o7VEFnzWeKAH8Yrsjv3ubjC+E2jjqi/byDAeFXncXdJjSx8vDtwDs5p/EzucliJU4
         Xu9JDEpE0elq+3wZoo2l29mW/acpAq7/64kft3ujjedGjxI5S2MbnoWv7j9SUwNTw9e5
         ZyjWBO3nzeHnQInZ6ecmcYEi1o0HL0BN8UqTOXdwWGfrUG4o+TidquBXMJZSE8SMSqrT
         bO1A==
X-Gm-Message-State: AOAM530PLNdjoPw89inb0cvM19ls/uPQyMtLMvDMmYcUEDtC4Qn1qP7S
        1/fcX36ag84yknZGklxNcQm8kTIiKf8902RkkYFvyA==
X-Google-Smtp-Source: ABdhPJyI9aI5b3pmXuhMgGrCrrMpBrygNRxfLkTQjP+IQ0Z6lG4mFD0G0YvJFmbR/nZxXl1QGX0zhYxPd3SDPBH82Q8=
X-Received: by 2002:a02:a910:: with SMTP id n16mr2826341jam.35.1603475424367;
 Fri, 23 Oct 2020 10:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <20201023050214.GG23681@linux.intel.com> <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
 <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com> <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
In-Reply-To: <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 23 Oct 2020 23:20:13 +0530
Message-ID: <CA+G9fYtR9p_OqYNT6=tKh=hsQDXC_1m1TgERPFH0ubuZGcg-DA@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        zenglg.jy@cn.fujitsu.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        X86 ML <x86@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mm <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 23 Oct 2020 at 22:03, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Oct 23, 2020 at 8:54 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, Oct 23, 2020 at 12:14 AM Rasmus Villemoes
> > <linux@rasmusvillemoes.dk> wrote:
> > >
> > > That's certainly garbage. Now, I don't know if it's a sufficient fix (or
> > > could break something else), but the obvious first step of rearranging
> > > so that the ptr argument is evaluated before the assignment to __val_pu
> >
> > Ack. We could do that.
> >
> > I'm more inclined to just bite the bullet and go back to the ugly
> > conditional on the size that I had hoped to avoid, but if that turns
> > out too ugly, mind signing off on your patch and I'll have that as a
> > fallback?
>
> Actually, looking at that code, and the fact that we've used the
> "register asm()" format forever for the get_user() side, I think your
> approach is the right one.
>
> I'd rename the internal ptr variable to "__ptr_pu", and make sure the
> assignments happen just before the asm call (with the __val_pu
> assignment being the final thing).
>
> lso, it needs to be
>
>         void __user *__ptr_pu;
>
> instead of
>
>         __typeof__(ptr) __ptr = (ptr);
>
> because "ptr" may actually be an array, and we need to have the usual
> C "array to pointer" conversions happen, rather than try to make
> __ptr_pu be an array too.
>
> So the patch would become something like the appended instead, but I'd
> still like your sign-off (and I'd put you as author of the fix).
>
> Narest, can you confirm that this patch fixes the issue for you?

This patch fixed the reported problem.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Build location:
https://builds.tuxbuild.com/uDAiW8jkN61oWoyxZDkEYA/

Test logs,
https://lkft.validation.linaro.org/scheduler/job/1868045#L1597

- Naresh
