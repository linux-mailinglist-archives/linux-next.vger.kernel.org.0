Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AE5363F42
	for <lists+linux-next@lfdr.de>; Mon, 19 Apr 2021 11:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237487AbhDSKA1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Apr 2021 06:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbhDSKA1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Apr 2021 06:00:27 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2B5C06174A;
        Mon, 19 Apr 2021 02:59:56 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i10so19102030lfe.11;
        Mon, 19 Apr 2021 02:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FDGOhqaPmu3im/JE4IpXZ09jQoRV39s/gRjkoNBVyKY=;
        b=EZHTNLZouZoMLyLTmgLvuz8FG1YMM1x2h1vcFtvYUFM9I3x+VTT/guKRngXHMdilqU
         UenNks47/087slpJVH6kkd3EK9GJysXYoWvpIbywOE0HRwkQO0BxiGA34+D9VeYUK6/4
         xi+kt4YZSX7SOuZq+lgSFo+7t33ZKpTEmCZA2A4kG+mc6FoSzCG1MrJkDIiBOYKeKYdw
         L91N1iRzsCLxjc5sAgMzSQdo7aICHWO+vbZsrVQs5Uw7f/PNL2DrIY6HMABRMNple8ic
         daQpbfCSZcOI5xj+H0/o1L6bBnaCk7Xq95WyWkAKm9uVGWGY40M0YzWa1P6rTob6BrSv
         Fg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FDGOhqaPmu3im/JE4IpXZ09jQoRV39s/gRjkoNBVyKY=;
        b=jpHCf9Ww1UYbjDoC80rNHNAiTm0Uk9G6YNHt3FihtgmgwH+dAGQAFcUsKn4Zx3fECT
         d/3OBOmYl+MgPcEe3RETe6v6Rx/eQAwiEA/9ywZOZorHkcYUr2k6CNYenqvHNw8DHuVQ
         3+cNc/V0kUI/VDiNduPqlAoBDhr03LzG4H7XxEA2Uulv1lHo+losqeMBmUGLPJH54OLo
         4LfjLG/oaytFE2xwgy4wIPCJcTFvxe4Ke87gL5EVgqgxF8288Mi0/5L01CkL6bTdnw9y
         i2hc8KsQiOvVsx44ltWa6z6CSpURGDfBppSIgSuZOqVfpr7R66bEkN73Eb4P6iNt2e6t
         vRpA==
X-Gm-Message-State: AOAM533sG3hDGLS0LxrV3Iy/YG87oygSQyns3d/01a8uAGuy6lktPOIw
        bG5vawnjcNzgKjkk76e8z+qvlX/hiGHIqnG0XaJkTjFqxkARyQ==
X-Google-Smtp-Source: ABdhPJwQnGpTascKyiJ1cToLttIEuyb6KjHxOCs6RhEKgClnJH+QO6ghlbyQBC2V5G3V6PWC8LHym4Qbkl9gA+t/ghQ=
X-Received: by 2002:a19:58a:: with SMTP id 132mr11989778lff.520.1618826394783;
 Mon, 19 Apr 2021 02:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210419191425.281dc58a@canb.auug.org.au>
In-Reply-To: <20210419191425.281dc58a@canb.auug.org.au>
From:   Xiongwei Song <sxwjean@gmail.com>
Date:   Mon, 19 Apr 2021 17:59:28 +0800
Message-ID: <CAEVVKH905HJoJ_WVVZadXiy3LG5y+XDpMBVVtUNOwF2MtYTv8Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thank you so much Stephen. Sorry for my negligence.

Should I fix this myself on powerpc tree?

Regards,
Xiongwei

On Mon, Apr 19, 2021 at 5:14 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> arch/powerpc/kernel/fadump.c: In function 'crash_fadump':
> arch/powerpc/kernel/fadump.c:731:28: error: 'INTERRUPT_SYSTEM_RESET' undeclared (first use in this function)
>   731 |  if (TRAP(&(fdh->regs)) == INTERRUPT_SYSTEM_RESET) {
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/kernel/fadump.c:731:28: note: each undeclared identifier is reported only once for each function it appears in
>
> Caused by commit
>
>   7153d4bf0b37 ("powerpc/traps: Enhance readability for trap types")
>
> I have applied the following patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 19 Apr 2021 19:05:05 +1000
> Subject: [PATCH] fix up for "powerpc/traps: Enhance readability for trap types"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/kernel/fadump.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index b55b4c23f3b6..000e3b7f3fca 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -31,6 +31,7 @@
>  #include <asm/fadump.h>
>  #include <asm/fadump-internal.h>
>  #include <asm/setup.h>
> +#include <asm/interrupt.h>
>
>  /*
>   * The CPU who acquired the lock to trigger the fadump crash should
> --
> 2.30.2
>
> --
> Cheers,
> Stephen Rothwell
