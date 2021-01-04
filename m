Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487322E91BB
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 09:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbhADI1x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 03:27:53 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:33186 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbhADI1x (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2021 03:27:53 -0500
Received: by mail-ot1-f48.google.com with SMTP id b24so25344611otj.0;
        Mon, 04 Jan 2021 00:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q8mrMRizo5G4M8zcQJZftANXfw6HGDLO8gozolqjZ3c=;
        b=rDhy7Wkl7qyJ7oyCmEHkpNQ63K1u5H0mQZb6a38b+2t+yAsdWhizUVbvmCXykBO4/j
         e440LoXVijq8KUmNJKmvpy5vpBMFvg3NcMDkw4RJ6ZB3J+Cvg/R1j6ICNB/M9s8S5wFP
         mKyiR54lWWJVNtlgRi0+XkNtCs/vjq0J/7dHWaJFw7XqjqYs2EzdX+2l2WwW0zHfR+Q6
         bqocJphNrSOJxWxtOWJhl5KLcYRxUP6vJkiAqmm+qHe4y+oi69VYVbLFLbi4ETcnCry0
         HdQUdaE/LkgRmQ7GoYSjDnfh1Xp9K50JMqsbHdvGuaUzyeqp/oMIy8Eo2H8mvcEELOWZ
         cZlg==
X-Gm-Message-State: AOAM530xyA27D++ARmvO0Ycwo1Dxe1Lb+yUlYIS+jVo7vEMivJ52wM9v
        a3emCcc0oL3hS9E15sjqQyn9x/4hgpgtK0hiWbU=
X-Google-Smtp-Source: ABdhPJzmespCEoSASAuCwLU7pRwHkuZnceMoRPuLcL6/nFBzBGoyr04YtseCe/SkuZY/+YfwZKAqHrMQs1sJSKXZOg4=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr36879192otr.107.1609748832441;
 Mon, 04 Jan 2021 00:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20210104122653.6f35b9bb@canb.auug.org.au>
In-Reply-To: <20210104122653.6f35b9bb@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jan 2021 09:27:01 +0100
Message-ID: <CAMuHMdXWqO2WPKSxsfbr=-_rrXenEwJRW3rYko7VJCPwCnyeLA@mail.gmail.com>
Subject: Re: linux-next: build failures after merge of the staging tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Song Chen <chensong_2000@189.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 4, 2021 at 6:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the staging tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> In file included from include/linux/printk.h:6,
>                  from include/linux/kernel.h:16,
>                  from drivers/staging/board/kzm9d.c:4:
> drivers/staging/board/kzm9d.c:28:17: error: initialization of 'initcall_t' {aka 'int (*)(void)'} from incompatible pointer type 'void (*)(void)' [-Werror=incompatible-pointer-types]
>    28 | device_initcall(kzm9d_init);
>       |                 ^~~~~~~~~~
> include/linux/init.h:197:50: note: in definition of macro '___define_initcall'
>   197 |   __attribute__((__section__(#__sec ".init"))) = fn;
>       |                                                  ^~
> include/linux/init.h:229:30: note: in expansion of macro '__define_initcall'
>   229 | #define device_initcall(fn)  __define_initcall(fn, 6)
>       |                              ^~~~~~~~~~~~~~~~~
> drivers/staging/board/kzm9d.c:28:1: note: in expansion of macro 'device_initcall'
>    28 | device_initcall(kzm9d_init);
>       | ^~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> In file included from include/linux/printk.h:6,
>                  from include/linux/kernel.h:16,
>                  from include/asm-generic/bug.h:20,
>                  from arch/arm/include/asm/bug.h:60,
>                  from include/linux/bug.h:5,
>                  from include/linux/thread_info.h:12,
>                  from include/asm-generic/current.h:5,
>                  from ./arch/arm/include/generated/asm/current.h:1,
>                  from include/linux/sched.h:12,
>                  from include/linux/ratelimit.h:6,
>                  from include/linux/dev_printk.h:16,
>                  from include/linux/device.h:15,
>                  from include/linux/dma-mapping.h:7,
>                  from drivers/staging/board/armadillo800eva.c:12:
> drivers/staging/board/armadillo800eva.c:90:17: error: initialization of 'initcall_t' {aka 'int (*)(void)'} from incompatible pointer type 'void (*)(void)' [-Werror=incompatible-pointer-types]
>    90 | device_initcall(armadillo800eva_init);
>       |                 ^~~~~~~~~~~~~~~~~~~~
> include/linux/init.h:197:50: note: in definition of macro '___define_initcall'
>   197 |   __attribute__((__section__(#__sec ".init"))) = fn;
>       |                                                  ^~
> include/linux/init.h:229:30: note: in expansion of macro '__define_initcall'
>   229 | #define device_initcall(fn)  __define_initcall(fn, 6)
>       |                              ^~~~~~~~~~~~~~~~~
> drivers/staging/board/armadillo800eva.c:90:1: note: in expansion of macro 'device_initcall'
>    90 | device_initcall(armadillo800eva_init);
>       | ^~~~~~~~~~~~~~~
>
> Caused by commit
>
>   850c35bb28ec ("staging: board: Remove macro board_staging")
>
> I have used the staging tree from next-20201223 for today.

Note that a similar patch was (IMHO rightfully) rejected 3 years ago:
https://lore.kernel.org/lkml/20170220175506.GA30142@kroah.com/

So please drop it. Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
