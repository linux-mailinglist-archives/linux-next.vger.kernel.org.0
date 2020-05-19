Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8071D9A84
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 16:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728832AbgESO7G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 10:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbgESO7G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 10:59:06 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B6FC08C5C0
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 07:59:06 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id o26so8013615vsr.10
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cAwM4xUN+JXfgmnpSakIzQBFryyxT4xbvQKyptF8HfU=;
        b=g7UesDSwco++E9tvDmaeYZHTUzwg0n+acwSdyySMURap5qFLIynLhGq5AUrj1fYMJ0
         sw/JLqS9GpKjA2q16tUiCfnRqLnJvDl/gct6mgVedTlmvLGW1Pf+VGOmT8FCq4ufSVfc
         35euMAF2IOS7EKW54E0VcyplYL+ZhWm0tlpcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cAwM4xUN+JXfgmnpSakIzQBFryyxT4xbvQKyptF8HfU=;
        b=SxdCq6kBTdoQ6utDLO8PanDNnc3JYbrldt+joipBuvgnuh/DSMYM9oflE1gU592Wiw
         myEUF3QQJb/t2BoVRdVW+KvVExd43GUHWjWSuFI/NZZLAoalsBYQlMGr9NwuGiZEMb9V
         qw9nhS0vs/+vs0FRsmr1Gg2daGesP69DwnSUaMFAiyOO0cckMcD64kNgth0tVv/Sem4I
         bgLXQApP3n+S6LIAGP/KseGmkZ7Rt3o45jT98BZGxlxO0N9z0jP9l8TOzqx806Qpa5qz
         DnpuRgDuSBdQhDQx6KUfu4Jxqjf+ZcUpAfIYcSvfecV9EFTTKAmg0n1m7PxF5MvWWBA6
         ZlhQ==
X-Gm-Message-State: AOAM5318SMhI7XInsNiloKMaxLlhiZk9EjCr9hKXpPMzNmOWdSiIE9DE
        ACqtEmQGjowVikU2sczg1rFmObY0fH8=
X-Google-Smtp-Source: ABdhPJyS2aLXAnAYiCiq6SAw5Da6eDD6QHS3U+tyLPgB7MLWjwI9J6vuoX0+nas89+uOV325bUdA5A==
X-Received: by 2002:a67:1502:: with SMTP id 2mr15811177vsv.80.1589900345302;
        Tue, 19 May 2020 07:59:05 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id j85sm3671149vsd.14.2020.05.19.07.59.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 07:59:04 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id o35so694793uao.4
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 07:59:03 -0700 (PDT)
X-Received: by 2002:ab0:6806:: with SMTP id z6mr15603649uar.0.1589900343396;
 Tue, 19 May 2020 07:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200520000524.69af8a86@canb.auug.org.au>
In-Reply-To: <20200520000524.69af8a86@canb.auug.org.au>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 May 2020 07:58:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuXEO0KCoRnundQxVMJyre9UBdw2NDUSsWxJwADjCR9A@mail.gmail.com>
Message-ID: <CAD=FV=WuXEO0KCoRnundQxVMJyre9UBdw2NDUSsWxJwADjCR9A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kgdb tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Tue, May 19, 2020 at 7:05 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kgdb tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/tty/serial/kgdboc.c:418:13: error: expected declaration specifiers or '...' before string constant
>   418 | early_param("ekgdboc", kgdboc_early_init);
>       |             ^~~~~~~~~
> drivers/tty/serial/kgdboc.c:418:24: error: expected declaration specifiers or '...' before 'kgdboc_early_init'
>   418 | early_param("ekgdboc", kgdboc_early_init);
>       |                        ^~~~~~~~~~~~~~~~~
> drivers/tty/serial/kgdboc.c:546:13: error: expected declaration specifiers or '...' before string constant
>   546 | early_param("kgdboc_earlycon", kgdboc_earlycon_init);
>       |             ^~~~~~~~~~~~~~~~~
> drivers/tty/serial/kgdboc.c:546:32: error: expected declaration specifiers or '...' before 'kgdboc_earlycon_init'
>   546 | early_param("kgdboc_earlycon", kgdboc_earlycon_init);
>       |                                ^~~~~~~~~~~~~~~~~~~~
> drivers/tty/serial/kgdboc.c:505:19: warning: 'kgdboc_earlycon_init' defined but not used [-Wunused-function]
>   505 | static int __init kgdboc_earlycon_init(char *opt)
>       |                   ^~~~~~~~~~~~~~~~~~~~
> drivers/tty/serial/kgdboc.c:411:19: warning: 'kgdboc_early_init' defined but not used [-Wunused-function]
>   411 | static int __init kgdboc_early_init(char *opt)
>       |                   ^~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   220995622da5 ("kgdboc: Add kgdboc_earlycon to support early kgdb using boot consoles")
>
> I have used the kgdb tree from next-20200518 for today.

Ugh.  Actually, I think the commit to blame is:

eae3e19ca930 ("kgdboc: Remove useless #ifdef
CONFIG_KGDB_SERIAL_CONSOLE in kgdboc")

The next commit just made it worse.  Apparently the #ifdef wasn't so
useless after all.  It was just subtly keeping the code from compiling
when kgdboc was used as a module.  That's because when it's a module
we instead get this defined:

#define CONFIG_KGDB_SERIAL_CONSOLE_MODULE 1

Apparently I didn't re-test as a module after I made this change in
one of the later spins.  :(

I think I can whip up a quick patch that uses "IS_BUILTIN(option)".
Basically this should go back to how the code was in one of the
earlier patchsets where I tested this.

-Doug
