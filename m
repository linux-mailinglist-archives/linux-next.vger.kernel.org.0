Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278832D54E9
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 08:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbgLJHxg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 10 Dec 2020 02:53:36 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:34556 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgLJHxd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 02:53:33 -0500
Received: by mail-oo1-f49.google.com with SMTP id t63so1068103ooa.1;
        Wed, 09 Dec 2020 23:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=od3/SfRw9owkKLE3PuBGLkFJU3SpegkIJpaUukly2Vk=;
        b=JNGAswZJgw6G0f7sfYLArmVMPETQkOdi4WVTn3tDEcQEYy9uzznWJPblaiBP2UAMNy
         PdxeUyjh4ruD7LBdXl7Juj6KlwvOT80RWB/1mfFUToReLe+xTEv0npfSNhUAoxw3IYH+
         uX7RL1yxjPH1mVvGn8qjGz99GSPVXyM8TV+WZE7vhKRK95oc9Rmnno6djRJyP2tKBo2y
         mMOrE0SwVG/3ptIFPVkMYypW2wKphU7AI4IHfkpYOEjdzG4+fgO+MW3Mo7oVRcp+f8kE
         mJ9uc7i8zTjtd+IoUOOHdWZCLjp9XjxN1ZXDgfX5OlNTnl/MbfiG7OmkkZuDCRzBXUuZ
         UOUQ==
X-Gm-Message-State: AOAM531JvlolDAR5avDk5Ft7UbHQYZsipO6TL6TS2GgkaL7NlEGSUmqC
        w7m/WcCTtsR/gTDCvkrOqvHZE6lamiCPMbZGqBE=
X-Google-Smtp-Source: ABdhPJxGEReNaUAoEWLa0HGLv4p5Io511aYSPbxsxPU1JS4b7LjrRk/vkrhMzPmZaTIQuvMfZ+9gkXCgxq6TDijg2cc=
X-Received: by 2002:a4a:ca14:: with SMTP id w20mr5069865ooq.11.1607586772264;
 Wed, 09 Dec 2020 23:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20201208090555.7159b138@canb.auug.org.au> <CAMuHMdVYoxUOUL0zNAPzTJUSR3vGzcJWMzvtCKK=ZxyM=8hk+A@mail.gmail.com>
 <160753498332.1580929.15118515893187584689@swboyd.mtv.corp.google.com>
In-Reply-To: <160753498332.1580929.15118515893187584689@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 08:52:41 +0100
Message-ID: <CAMuHMdWAtUK6qDOAXZ3-qy69ZzbfZb_Z=bSvx-0S-42dfUiw9w@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
To:     Stephen Boyd <sboyd@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen²,

On Wed, Dec 9, 2020 at 6:29 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2020-12-08 00:37:00)
> > On Mon, Dec 7, 2020 at 11:06 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > In commit
> > >
> > >   c3f207f6d23d ("clk: renesas: r8a779a0: Make rcar_r8a779a0_cpg_clk_register() static")
> > >
> > > Fixes tag
> > >
> > >   Fixes: c07439dea94050b6 ("clk: renesas: cpg-mssr: Add support for R-Car V3U")
> > >
> > > has these problem(s):
> > >
> > >   - Target SHA1 does not exist
> >
> > Oops, my bad.
> >
> > > Maybe you meant
> > >
> > > Fixes: 17bcc8035d2d ("clk: renesas: cpg-mssr: Add support for R-Car V3U")
> >
> > Yes I did.
> >
> > Mike/Stephen: do you want me to respin my pull requests?
>
> Sure a respin is fine. I can fix it up in clk tree. Any chance your

Done, sorry for the mess.

> trees can be pulled into linux-next? That would find this earlier.

That sounds like a great idea, also for pinctrl.
Can you please add the following:
    git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
renesas-clk
    git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
renesas-pinctrl
?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
