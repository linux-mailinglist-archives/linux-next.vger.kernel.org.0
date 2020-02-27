Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 293151713F1
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 10:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbgB0JSU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 04:18:20 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44780 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgB0JSU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 04:18:20 -0500
Received: by mail-ot1-f66.google.com with SMTP id h9so2224308otj.11;
        Thu, 27 Feb 2020 01:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SWtutpT9WncKocAt4Tkrc09ZwQz2Jl6Eo/FfuCHBERQ=;
        b=n+QfvUP3c7uyjhkR7mu54dZOSZihF/qcGZKDcDZ+XWLWe4zAmuLMcw8WK+7ofirTdD
         hu+4Oz7r26eQtF8jUmenh2MWhl6kUBCjPsewpSVLFzsijqzd1d3qPC1f/MFjtzyLOtzJ
         TAZc8kwFXlU0ovvGVz8L4kgNBie/1r0wiqDF7p1LKeiyn7nvt3EFm/5Mb7f6bEpVhgZD
         KyF7hGHyCP2P0El75/8ZZ3XibWM7h381GZQH80kkhMripqCRPexgu8rkAbr6NhQJEs9w
         3bPL6vqODKLILBEq5LgRZR+TsPcLR8aY/l1/v28GT53rQaP/e1y67X4ybUEYJSJt5tzx
         mHXA==
X-Gm-Message-State: APjAAAXsa2fzKchOQaOrl1ZXR6mMS4HratRNri5DieZlc4Zhpo4Cinti
        w54JTqR3r8+E0AIvQswLx2nVuOjpo6wcZwA7teE=
X-Google-Smtp-Source: APXvYqyOl8hu7316/joLgtG8PIpMm0lrFsra46ySBtFnX2nEJRn0nPinTRSjehUDrpzIkCv30Jx0pvyP5Ub5cntyBJQ=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr2483256ots.250.1582795099339;
 Thu, 27 Feb 2020 01:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20200225220551.d9a409bc04b77cdf48eae3ea@kernel.org> <158264140162.23842.11237423518607465535.stgit@devnote2>
In-Reply-To: <158264140162.23842.11237423518607465535.stgit@devnote2>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Feb 2020 10:18:08 +0100
Message-ID: <CAMuHMdW+JECxNPX8yDswARq+fLXig7VAo0oosCPAkZhtc_XR0g@mail.gmail.com>
Subject: Re: [PATCH] bootconfig: Fix CONFIG_BOOTTIME_TRACING dependency issue
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Hiramatsu-san,

On Tue, Feb 25, 2020 at 4:47 PM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> Since commit d8a953ddde5e ("bootconfig: Set CONFIG_BOOT_CONFIG=n by
> default") also changed the CONFIG_BOOTTIME_TRACING to select
> CONFIG_BOOT_CONFIG to show the boot-time tracing on the menu,
> it introduced wrong dependencies with BLK_DEV_INITRD as below.
>
> WARNING: unmet direct dependencies detected for BOOT_CONFIG
>   Depends on [n]: BLK_DEV_INITRD [=n]
>   Selected by [y]:
>   - BOOTTIME_TRACING [=y] && TRACING_SUPPORT [=y] && FTRACE [=y] && TRACING [=y]
>
> This makes the CONFIG_BOOT_CONFIG selects CONFIG_BLK_DEV_INITRD to
> fix this error and make CONFIG_BOOTTIME_TRACING=n by default, so
> that both boot-time tracing and boot configuration off but those
> appear on the menu list.
>
> Fixes: d8a953ddde5e ("bootconfig: Set CONFIG_BOOT_CONFIG=n by default")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> ---
>  init/Kconfig         |    2 +-
>  kernel/trace/Kconfig |    1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index a84e7aa89a29..8b4c3e8c05ea 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1217,7 +1217,7 @@ endif
>
>  config BOOT_CONFIG
>         bool "Boot config support"
> -       depends on BLK_DEV_INITRD
> +       select BLK_DEV_INITRD
>         help
>           Extra boot config allows system admin to pass a config file as
>           complemental extension of kernel cmdline when booting.
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 795c3e02d3f1..402eef84c859 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -145,7 +145,6 @@ config BOOTTIME_TRACING
>         bool "Boot-time Tracing support"
>         depends on TRACING

Why not "depends on BLK_DEV_INITRD?" here?

/me tries to contain the bloat introduced by the bootconfig stuff.

>         select BOOT_CONFIG
> -       default y
>         help
>           Enable developer to setup ftrace subsystem via supplemental
>           kernel cmdline at boot time for debugging (tracing) driver

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
