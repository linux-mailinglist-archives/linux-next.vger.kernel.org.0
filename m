Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E6D234F8D
	for <lists+linux-next@lfdr.de>; Sat,  1 Aug 2020 05:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbgHADKr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 23:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgHADKq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2020 23:10:46 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8C4C06174A
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2020 20:10:46 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id t6so10148503qvw.1
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2020 20:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qnbKMRa0zAhH2ZLCHxKJeQcqF5KDy+gopDBFNWf9shA=;
        b=YGHeaopyWpWDLXKrlCgqbR5mbkeut5pnAELw0FzoWdN7xZragxD0MZNk/+QvrNZ/c2
         6pzKYfC81dsQxIR8S/lFrE77vLfUW0dKl25JEHThgUCdcQR0za56xEcQI0+0Shbso2kd
         m1i1jYtdV0f4DH7ui189AN9Ei4Te1mbZsRbB2rCpdeUqmtiyfs1W74JpyqpN2rngFtDD
         34dk9dHkFHnq12FnA/gyutfxFVmkXTcL3ze3i1WOi/a6kStFBq/VeqBf98aHNMbEylnJ
         fPsazjefJDs+xSrki4s9ge4N2hZm7GZyUUzKq2IbzXtQZ7Xua2l4x7yjgv3VKCgUOllC
         r9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qnbKMRa0zAhH2ZLCHxKJeQcqF5KDy+gopDBFNWf9shA=;
        b=JJLms5RYZJu89UUTlH5wR5DGZ1eDZ1EDwOfjopDfKcmXRFfgRYRq/9ertCzPwDLGQ+
         tqQdD9z1+yZO+QwUss0U7XnZDAtiBsqPGXj+LYLHbXQNbeZc8XFiTpaO6UxQELFVVm7k
         6HotsSv/1mVDGJJ/GE9JDt4qjJVGi8DJtSiefrqhmrj1vQL1C6vdDTHpSxeVNQqnsDUa
         9T/Bs+TDDibYA9G9fx+9PB/1D/EdCKefneMgFk8Yon/QKjwyy5/UyxL6AkUE0ULnrAIW
         6nzUX3FUFJeG36OHo3f56O5p8yz9ghxyms7GhN9QCbJikiVMWNNUitbhygyCZUkPjgWi
         muAw==
X-Gm-Message-State: AOAM530aAuYaJoL/5sSzbBSqRc+2f85KGGXhPUVpKUSKHQfoHz0StW3a
        7myxIgiWF6l796u2x/bJwd8uwTAZxZ9SfxKCUFRpmB25W8A=
X-Google-Smtp-Source: ABdhPJxxv74V44su6AibvjiFHIXbBoiSD84UvuRcz1CLauN/EnkSZgm5Vd733BgYyNWL+ARVFmG16C2R+BZK65sTGKg=
X-Received: by 2002:a0c:fdc5:: with SMTP id g5mr6855641qvs.189.1596251444129;
 Fri, 31 Jul 2020 20:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200731211909.33b550ec@canb.auug.org.au> <4c6abcd0-e51b-0cf3-92de-5538c366e685@infradead.org>
 <20200801103507.03ae069b@canb.auug.org.au> <97853126-c3fb-fced-547f-6dd7d5c89ca9@infradead.org>
In-Reply-To: <97853126-c3fb-fced-547f-6dd7d5c89ca9@infradead.org>
From:   Brian Vazquez <brianvv@google.com>
Date:   Fri, 31 Jul 2020 20:10:32 -0700
Message-ID: <CAMzD94QypaHC_qswvNxgjM8TtXmGDkUJthWwHtf++iEThhCUjw@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 31 (net/decnet/ & FIB_RULES)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-decnet-user@lists.sourceforge.net,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Ugh I completely missed CONFIG_IP_MULTIPLE_TABLES too, I sent the new
patch. This time I believe I cover all the cases. PTAL.

Thanks,
Brian

On Fri, Jul 31, 2020 at 5:50 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 7/31/20 5:35 PM, Stephen Rothwell wrote:
> > Hi Randy,
> >
> > On Fri, 31 Jul 2020 08:53:09 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> on i386:
> >>
> >> ld: net/core/fib_rules.o: in function `fib_rules_lookup':
> >> fib_rules.c:(.text+0x16b8): undefined reference to `fib4_rule_match'
> >> ld: fib_rules.c:(.text+0x16bf): undefined reference to `fib4_rule_match'
> >> ld: fib_rules.c:(.text+0x170d): undefined reference to `fib4_rule_action'
> >> ld: fib_rules.c:(.text+0x171e): undefined reference to `fib4_rule_action'
> >> ld: fib_rules.c:(.text+0x1751): undefined reference to `fib4_rule_suppress'
> >> ld: fib_rules.c:(.text+0x175d): undefined reference to `fib4_rule_suppress'
> >>
> >> CONFIG_DECNET=y
> >> CONFIG_DECNET_ROUTER=y
> >>
> >> DECNET_ROUTER selects FIB_RULES.
> >
> > I assume that CONFIG_IP_MULTIPLE_TABLES was not set for that build?
>
> Correct.
>
> > Caused by commit
> >
> >   b9aaec8f0be5 ("fib: use indirect call wrappers in the most common fib_rules_ops")
> >
> > from the net-next tree.
>
> thanks.
>
> --
> ~Randy
>
