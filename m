Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52413C7F9D
	for <lists+linux-next@lfdr.de>; Wed, 14 Jul 2021 09:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbhGNH4H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jul 2021 03:56:07 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:42649 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238139AbhGNH4H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jul 2021 03:56:07 -0400
Received: by mail-vs1-f54.google.com with SMTP id u7so448701vst.9;
        Wed, 14 Jul 2021 00:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x3/MK3eQJImLkG7ZMsR8ZMRn/ZP4avUxVKH3TZwMMJ0=;
        b=nteAxe+APdWd+KRqFPtA/6z+slFq0w4HwF4/bX7LD0C2LQXnU+/p4lWG8grns3wquS
         MZ0YFGR0B6XB/ap713IJZaZJY0sDYap5+/y840QEbNtjdMb683bCUgauukiXotJm4yBp
         rghJgBKL7AaurllGHjz6MmnwXAePFN6fOIKHGHIEjvFaoVI3sMfPauZSdmeuLJCfKqp9
         BWFzPFYvzW/TwJm718WYD8rSjD/+xUoZCTySIeABRCmxgAjOdS5EG+Rh0oE26HO6xuPI
         MEBSiBFHalXWXZXsBNkqEfsOicPmzc3J2M5Y7Xtm/CZ6iqLsyOH7zirnu5vxXaka/Th3
         OcuA==
X-Gm-Message-State: AOAM530glC0n5ph14Z7jqYV3VF/H8WckwrIfDFyBfw7Ha7OcNj05EP1X
        BG6qEb12pZRvfzxnSKL4Cla5eRXaMCB8sMeUuQoLC/jH
X-Google-Smtp-Source: ABdhPJwyunVPh778G/aGGTSvtP0xUCWrSmkfw/KX9ceUj/nZomBFVLw9Uwq5tWsTu2Ills2W36zrTneFYhlPtnCGe54=
X-Received: by 2002:a67:1542:: with SMTP id 63mr10305350vsv.40.1626249195799;
 Wed, 14 Jul 2021 00:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210714083156.29032075@canb.auug.org.au>
In-Reply-To: <20210714083156.29032075@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Jul 2021 09:53:04 +0200
Message-ID: <CAMuHMdVLbfb8N_qhUfbw2aq23c-a1LA9bu7EAJQYb+4iT3pzZQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the clk-renesas tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Jul 14, 2021 at 12:32 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Commits
>
>   1a95840b0d0d ("clk: renesas: r9a07g044: Add DMAC clocks/resets")
>   1f5cda1cc885 ("clk: renesas: r9a07g044: Add I2C clocks/resets")
>
> are missing a Signed-off-by from their committer.

Thanks for the report, fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
