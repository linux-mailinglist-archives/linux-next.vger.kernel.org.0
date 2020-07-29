Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70DF232480
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 20:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgG2SNX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 14:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgG2SNW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 14:13:22 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657F7C0619D4
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 11:13:22 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 2so19028132qkf.10
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yy9mtIjdA8AtEwqn//sgva5a/m1w48DJN/R7rI1Pu+4=;
        b=DhaB3CWJuwOUWsKiZ0bWtUjW5xHK0iAqD4Cjzc7UAhDU4EcJQcIUdxj8gu2WB57Bz3
         6UEGKdA7j3qjFIatPNEE+CVjq4PTOZwGGMhK34gn4yby1irxP5Hp7Pgxk/sgcPxlY4Lj
         q21WMWfFdjjTWB7NZHYi6rK7Dz5pt1/T/85p7PvtUn0usmliZqK0FIt1JS5ll4r4eT3V
         HcRwYFpbXohH+um91PNrFcC6kSCFicriNeSEEO6Ob0Z9YEYLuZZCm+Ay8/Ilal6etcB4
         k1lPayuFZSWf+CXVU8dhNiQBe8o74z9vjDk5UbcbUmTX9KNnEwziQ3hP9ghpHWSnhgCP
         dEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yy9mtIjdA8AtEwqn//sgva5a/m1w48DJN/R7rI1Pu+4=;
        b=e2TwUVPiQJDyras9xKAOiEJ7rUGDa+SfIuA+8F53A8PfGys5XnaljA7YPvr0XhWi3n
         fNnsoeZMjPpsUONTztYBTqfOJQslQeQFXhztlkBp6GpA+bbJpb9xTN4TJt/xNxIQqena
         ePb+ZTudV0PExf7R2eFjn81rgc5zLOTM+nZkBqgIy9pRytGrINf+N+85oCqol5wNKk7d
         t331RdF+9wxoeYHsZyCtwd6YeBQzi1X1fn3UDYRAv/Hk+XOfnPlfwP2+1IsEYz8SLDDE
         I9WZUgQ7nXR+kV4+Q4Jm7FjFqRAskECCPASftrBUKIMpIA4nwZsc99XL+Eve8qquar8v
         AMkg==
X-Gm-Message-State: AOAM531RGnPefiLYz5RV3fUHTcfDaPGqcy8bHN+2RI0fdg/M2LYqFzVm
        sMAunM/bDqqAqL+u8KKzjZqsTnb4g71UJapJLTEERVISPNb91w==
X-Google-Smtp-Source: ABdhPJx/a6zoUQJF008j02CLsUPE1M3WzyL4vwhssrFyCZpl7X7F9yTGiqyXLXCU1OAV/DI7RvYYCleCmEOtgp87kLw=
X-Received: by 2002:a05:620a:c88:: with SMTP id q8mr6004594qki.49.1596046401216;
 Wed, 29 Jul 2020 11:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200729212721.1ee4eef8@canb.auug.org.au>
In-Reply-To: <20200729212721.1ee4eef8@canb.auug.org.au>
From:   Brian Vazquez <brianvv@google.com>
Date:   Wed, 29 Jul 2020 11:13:10 -0700
Message-ID: <CAMzD94RRbuWKf0kYt9jzpTchjiwoWpKx8-xZNrVHggjNiCm5Vg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen, thanks for reaching out and reporting the issue. I have
just sent the fix for review in net-next:
http://patchwork.ozlabs.org/project/netdev/patch/20200729181018.3221288-1-brianvv@google.com/

cheers,
Brian

On Wed, Jul 29, 2020 at 4:27 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the net-next tree, today's linux-next build (i386 defconfig)
> failed like this:
>
> x86_64-linux-gnu-ld: net/core/fib_rules.o: in function `fib_rules_lookup':
> fib_rules.c:(.text+0x5c6): undefined reference to `fib6_rule_match'
> x86_64-linux-gnu-ld: fib_rules.c:(.text+0x5d8): undefined reference to `fib6_rule_match'
> x86_64-linux-gnu-ld: fib_rules.c:(.text+0x64d): undefined reference to `fib6_rule_action'
> x86_64-linux-gnu-ld: fib_rules.c:(.text+0x662): undefined reference to `fib6_rule_action'
> x86_64-linux-gnu-ld: fib_rules.c:(.text+0x67a): undefined reference to `fib6_rule_suppress'
> x86_64-linux-gnu-ld: fib_rules.c:(.text+0x68d): undefined reference to `fib6_rule_suppress'
>
> Caused by commit
>
>   b9aaec8f0be5 ("fib: use indirect call wrappers in the most common fib_rules_ops")
>
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
>
> I have reverted that commit for today.
>
> --
> Cheers,
> Stephen Rothwell
