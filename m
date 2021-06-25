Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78523B4884
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 19:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhFYRzy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 13:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhFYRzy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Jun 2021 13:55:54 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F212EC061766
        for <linux-next@vger.kernel.org>; Fri, 25 Jun 2021 10:53:32 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id b5so10383897ilc.12
        for <linux-next@vger.kernel.org>; Fri, 25 Jun 2021 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yJBJsM9ajXtVp6Fzt8hy1rMimz6KTG+kuA4EnxYzffE=;
        b=Mm+NR0Yqn2xUv2cW5qE/hI4p/BbctLiKnEdYGlu+sbSPo9ePnZRHMot+XYMFsVqAcU
         2fAH0D6t0/6XM+Ef/4xRdncFkUdw7GvbomjW8dc2Pux4zS02DbytNwdy+zerwU1jpgDC
         8fGqvJeR/iM24WDyzxh86hcAbYaY2lB0OiXx6cJTRTBMXXC6VbrX0d1fWB0Uzg3NmBCl
         0xxGSOT4GWIvifUg9rvHWIW70jAahmBa0YVnfrzFdtgUytJ5irQHAGg5ie0ptf1PZgY9
         RTRklAGK8pW/jnCFKoHH6wpLmLS2MIcFzGljgJ3M2BDhdthqZ48f2xI8erKqZDH/muZ5
         JD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yJBJsM9ajXtVp6Fzt8hy1rMimz6KTG+kuA4EnxYzffE=;
        b=LLjkRTd4ENL7LCWNURQy2pZL/Oc4bqNC2dhajlFENYU5LzrcmLG0g2zHN2GXVaej7U
         HQald5HtzPveP7467LrqEwIjVzTFRk+4+6x2av7eVzIN8C1xCnyeiCLr/FZSM6k2c40v
         ERkCdM6IlfVDaIoWWo5yYJLQ96xO4MYCfXb0eArH3tPTvuL4gHdLP9Ga5YPlZwyJqseJ
         /cNQGbuq6dZ4aVY8daHUfLOgna4O17RU+1tLrZUNMv91tNAxphFJo4YhYuX2kvSSmSY1
         y2VDNBvSITvUX7dSbVuMGoz+/q4Z8Pcyf94YeLD0flqA45g3P4+R1gq2Lscum0tAKyzf
         gaxg==
X-Gm-Message-State: AOAM531BG/dPDIaglXJg7S6gkZuaC1Jaf9z2fEm6H/JM20IPxhoqYd9i
        NnS1ru40E/cRsOZ7L41aQYTgHODZNwM8MOWgkZGt5A==
X-Google-Smtp-Source: ABdhPJzHuMEE4a37QQdqGNlBNvFXA5rJ+qYGetNhq9D5pL97zLcWDucPVAn/GokOB/oySJuUWrrHOBkOhJyD/dIm+bI=
X-Received: by 2002:a05:6e02:1068:: with SMTP id q8mr8231792ilj.194.1624643612214;
 Fri, 25 Jun 2021 10:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210625195232.3a307e53@canb.auug.org.au>
In-Reply-To: <20210625195232.3a307e53@canb.auug.org.au>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 25 Jun 2021 10:53:20 -0700
Message-ID: <CAGS_qxq4_G7dbefETo57hUZgD+A3QK7rxiY=Nk=m0xZGt35zGw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kunit-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 25, 2021 at 2:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kunit-fixes tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> lib/kunit/executor.c:26:1: error: expected identifier or '(' before '+' token
>    26 | +kunit_filter_subsuite(struct kunit_suite * const * const subsuite,
>       | ^
> lib/kunit/executor.c: At top level:
> lib/kunit/executor.c:140:10: fatal error: executor_test.c: No such file or directory
>   140 | #include "executor_test.c"
>       |          ^~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   c9d80ffc5a0a ("kunit: add unit test for filtering suites by names")

For posterity, David sent out a patch addressing this here:
https://lore.kernel.org/linux-kselftest/20210625111603.358518-1-davidgow@google.com/

>
> --
> Cheers,
> Stephen Rothwell
