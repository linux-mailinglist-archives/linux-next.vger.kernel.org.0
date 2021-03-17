Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648EE33F55D
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 17:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhCQQWj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 12:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbhCQQW2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 12:22:28 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD1FC06175F
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 09:22:28 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id u3so41115454ybk.6
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gSloqn/zPcb4my2AQhUlcF6toHtAZsAY6i+CcPAxeT0=;
        b=iId9NZeiIVnUAr1BvdTvUnpyUEVZfJ/+4+x+3ugboCmh7R6o/KzWC2YlYXMhIZWKx/
         qhepSJ9VyzQBQ2WrwLPSsdlYPHlpN5OFCK7/OKPLKmoC9BJC+9id1IDrBOS7i3f+Wu7G
         Fkfyk4TeDuVUPmxcPz0d2TovbVyIUO71WC8UXItQnzIVn+qYg8f9xNyLNkCGgC3yniDA
         DF7js65BSPGbi3DVFeJTHiZWzGUO8JEWXvS8J3VS+mdo6EB1Hzyya6UWmkpsrDXTP+xG
         umysdZWdfQiwxBiXgfXolNYMba0uIVB3mdxe8cE5lno/Jyizy9d+1pzveNguohhAeIOT
         ROmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gSloqn/zPcb4my2AQhUlcF6toHtAZsAY6i+CcPAxeT0=;
        b=PPITR9sER/UKgGXuwP4DlksbRt4ohpX7EnI0PCFC0vwQhFfr3x0UbOmSvAL4+Qpon1
         VYT08T1ip5rOTOCJg9tC92uhiVhWkEi8FKF3Tx6TTuqvCjU1P90OtGY/58+Z3bFFigrB
         NYkBntx1v5w/ngkQgCUQr3he7OXi8nDIQxK13UcKtxgAXmpC4uCPPFg45MfUTpS5Xrl4
         H4Fj9de0YuxXQK9hYbyf/ZJ+KNZn/UF0f2KLWPH9ge8rnTEzs00We+Mn4GuYcLua7eQx
         S9cMVH+mRwINHlQkpiXX7CCEJMvms20l3717IIE3ttEBwz3C32TJOHUbmF/GX+EyCC7x
         RFkw==
X-Gm-Message-State: AOAM530Sn5NCRraHcD6O28BtaBLwx6SdkjUpjN0+bmU4OPa4L1ly8q5t
        aZFvcZBcEYmJpZyIYGYt+0MAG4kvUoCsyrDfE7iGNg==
X-Google-Smtp-Source: ABdhPJzDQj5X0SZV8FtniC1hloxIGOILZiomd+l8X35wDmhMiWn7/XZRb4y4M4Rkk85lSEz2XtjBgPUjDd9UWdEWjds=
X-Received: by 2002:a25:e4c4:: with SMTP id b187mr5508166ybh.92.1615998147092;
 Wed, 17 Mar 2021 09:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210317150858.02b1bbc8@canb.auug.org.au> <20210317105432.GA32135@zn.tnic>
In-Reply-To: <20210317105432.GA32135@zn.tnic>
From:   Ian Rogers <irogers@google.com>
Date:   Wed, 17 Mar 2021 09:22:15 -0700
Message-ID: <CAP-5=fWKCtJq-9zd5A-XALJWNf8tsds44m-G07sc+kCUoXB8zg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To:     Borislav Petkov <bp@suse.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 3:54 AM Borislav Petkov <bp@suse.de> wrote:
>
> + Ian.
>
> On Wed, Mar 17, 2021 at 03:08:58PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the tip tree, today's linux-next build (native perf)
> > failed like this:
> >
> > In file included from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
> > util/intel-pt-decoder/../../../arch/x86/lib/insn.c:14:10: fatal error: =
asm/inat.h: No such file or directory
> >    14 | #include <asm/inat.h> /*__ignore_sync_check__ */
> >       |          ^~~~~~~~~~~~
> >
> > This is a powerpc build of perf.  I can't see what caused this failure,
> > so I have used the version of the tip tree from next-20210316 for today=
.
>
> Yah, this has come up in the past during review but the wrong version
> somehow snuck in, sorry. ;-\
>
> Can you guys verify this fixes the build issue? I don't have a ppc build
> setup.
>
> Thx.

The <asm/emulate_prefix.h> path also needs fixing. With the following
I was able to build for arm64 and powerpc.

Thanks,
Ian

diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
index cd4dedde3265..968360bf2150 100644
--- a/tools/arch/x86/lib/insn.c
+++ b/tools/arch/x86/lib/insn.c
@@ -11,13 +11,13 @@
 #else
 #include <string.h>
 #endif
-#include <asm/inat.h> /*__ignore_sync_check__ */
-#include <asm/insn.h> /* __ignore_sync_check__ */
+#include "../include/asm/inat.h" /*__ignore_sync_check__ */
+#include "../include/asm/insn.h" /* __ignore_sync_check__ */

 #include <linux/errno.h>
 #include <linux/kconfig.h>

-#include <asm/emulate_prefix.h> /* __ignore_sync_check__ */
+#include "../include/asm/emulate_prefix.h" /* __ignore_sync_check__ */

 #define leXX_to_cpu(t, r)                                              \
 ({                                                                     \

> ---
> From 50d91054fc421e2a90923706d5ca79e941e28300 Mon Sep 17 00:00:00 2001
> From: Borislav Petkov <bp@suse.de>
> Date: Wed, 17 Mar 2021 11:33:04 +0100
> Subject: [PATCH] tools/insn: Restore the relative include paths for cross
>  building
>
> Building perf on ppc causes:
>
>   In file included from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
>   util/intel-pt-decoder/../../../arch/x86/lib/insn.c:14:10: fatal error: =
asm/inat.h: No such file or directory
>      14 | #include <asm/inat.h> /*__ignore_sync_check__ */
>         |          ^~~~~~~~~~~~
>
> Restore the relative include paths so that the compiler can find the
> headers.
>
> Fixes: 93281c4a9657 ("x86/insn: Add an insn_decode() API")
> Reported-by: Ian Rogers <irogers@google.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> NOT-Signed-off-by: Borislav Petkov <bp@suse.de>
> ---
>  tools/arch/x86/lib/insn.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
> index cd4dedde3265..999fbd4c9bea 100644
> --- a/tools/arch/x86/lib/insn.c
> +++ b/tools/arch/x86/lib/insn.c
> @@ -11,8 +11,8 @@
>  #else
>  #include <string.h>
>  #endif
> -#include <asm/inat.h> /*__ignore_sync_check__ */
> -#include <asm/insn.h> /* __ignore_sync_check__ */
> +#include "../include/asm/inat.h" /* __ignore_sync_check__ */
> +#include "../include/asm/insn.h" /* __ignore_sync_check__ */
>
>  #include <linux/errno.h>
>  #include <linux/kconfig.h>
> --
> 2.29.2
>
> --
> Regards/Gruss,
>     Boris.
>
> SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 368=
09, AG N=C3=BCrnberg
