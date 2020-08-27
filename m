Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975F3254102
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 10:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgH0Ihq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 04:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgH0Ihp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 04:37:45 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A594C06121A
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 01:37:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w14so5494958ljj.4
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 01:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tS9KV0OuL9H7jrZSJX0btlTIW7y0Qv2YervGw+OH1sw=;
        b=PBp6loKQM+EAP/ynTVNWiDbA+vMdlIkKJLjlkuZt12auZvNQR6iTDpvlLWt25w1Kwi
         CjBQZmwGsSDlbkJC8BDsYJylVvS+hSe8G4nCyOy0cjfSEVD4pwxjoMctbsjc5PQRCfMh
         WPC/i7nxQJdrYKeiZHr4PSwafvg8gLVX3RXTc8FkeEwEMzQQg4TDD+oa3ZmPJ21D/kCF
         gpLXlRSW71AJ1WDnBV/hZYTbgvYEnH9lJ7QzJlIEKavnCQ7P6uZxK85ni3SfAZ0AgKoo
         XC7VuGxeXxWYedXWq5uBU7rTuvm2NPft4tcLfOpt0HMcRbmZdHvu/s8cMHYQ70ORS35A
         VQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tS9KV0OuL9H7jrZSJX0btlTIW7y0Qv2YervGw+OH1sw=;
        b=Nv81szZndAnCIumkJT5mW+0vqwShwLhuu/+KHkaZNt6BMULAPSIOaUBS1vu4ELiZVi
         dsvtEsi2DAA9lkkEjD0rUOrRXbV9qwVA3cB6iU5XWVYxqf5IF2T+OTrfWAXK7gI2TIzu
         fUeP6sqrV+AVRy5s7gt/SJx6/rcg2jQLy4+AV0AOQPkzCg6dSOU1n/e3/tMle3pl2/zB
         4n/PzTnUGUVEC1WIkduKbSb5d5NS4lrJXuBwUuqqfiz/pbtpBTAOsFNRSR6v79P0AS7a
         8cA/XvuPVaWEoDnxn1XJvNvMVjIdjJjAPfnIKrJT4OEDerUsXM9jcL3mL+5qA8+iYCwl
         IQeg==
X-Gm-Message-State: AOAM5324jynDOkCuD3U23JKTQha2kEjX0wFECzdQ1+/phPcVvPdgArWV
        HAak9MmleD6dg3LYQOXWw+r4qGONHn0bvBglZsgvsg==
X-Google-Smtp-Source: ABdhPJynHFjeGEynN1vApsTcEGtpq8ohQGl7nDnXnVVPdhzYEtVtmDx4b4z7XkfNqC7a8qhSy3l1t3M3JJ7O8vPj6PA=
X-Received: by 2002:a2e:8e95:: with SMTP id z21mr9579073ljk.143.1598517463040;
 Thu, 27 Aug 2020 01:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200827151105.73c75040@canb.auug.org.au>
In-Reply-To: <20200827151105.73c75040@canb.auug.org.au>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Thu, 27 Aug 2020 10:37:32 +0200
Message-ID: <CADYN=9L8znDFuPOiXzoR_vm+FXYkVR-D5yOf9hwPuG1FyAqDSw@mail.gmail.com>
Subject: Re: linux-next: Tree for Aug 27
To:     Stephen Rothwell <sfr@canb.auug.org.au>, atish.patra@wdc.com,
        anup@brainfault.org, palmerdabbelt@google.com
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 27 Aug 2020 at 07:11, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
>
> Hi all,
>
> News:  There will be no linux-next releases next Monday or Tuesday.
>
> Changes since 20200826:
>
> The net-next tree gained a conflict against the net tree.
>
> Non-merge commits (relative to Linus' tree): 2901
>  3429 files changed, 100496 insertions(+), 37081 deletions(-)
>

I built riscv on todays tag and I see this error:
../arch/riscv/kernel/setup.c: In function =E2=80=98setup_arch=E2=80=99:
../arch/riscv/kernel/setup.c:74:2: error: implicit declaration of
function =E2=80=98early_ioremap_setup=E2=80=99; did you mean =E2=80=98early=
_memtest=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
  early_ioremap_setup();
  ^~~~~~~~~~~~~~~~~~~
  early_memtest
cc1: some warnings being treated as errors

I think its due to commit 3d109b0e0949 ("RISC-V: Add early ioremap support"=
)

It builds with this fix:

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 5ab185130cae..41ef96d0d97a 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -19,6 +19,7 @@
 #include <linux/smp.h>

 #include <asm/cpu_ops.h>
+#include <asm/early_ioremap.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
 #include <asm/sbi.h>


Cheers,
Anders
