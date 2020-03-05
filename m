Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D37A5179FA9
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 06:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgCEFyW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 00:54:22 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33415 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgCEFyV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2020 00:54:21 -0500
Received: by mail-qt1-f193.google.com with SMTP id d22so3328431qtn.0
        for <linux-next@vger.kernel.org>; Wed, 04 Mar 2020 21:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+7mgcJIet7qBayZZcIdFHC3F2O5NeLmq5vShyrq3W0w=;
        b=dY9g6SaFxN9gyIiVuNUf1N24ghTHSEPIiKO6j1gQ7lJvXc/g0lC4uPLA/xNS6La82i
         v6iOG6cjJopKQ+A3S9uWOyabqxqc3R//HFFVmnsAdtqOUobD/UvkHyyagFzUZ9eHUx67
         nNa5NNGd3JKATe9NJ5WnBiKUMJYO/6IE1Ae5XzY3g3wTBWu3odx6cSNzjtfiNO6XTb8U
         T7MrVuE7JjIQ0wc4HFK6GjzZH384Ov7XWOYe6EOb5woc6wz8raapd3D2MP1RRvRHQ3En
         I/Jet0BWFRonDyGXBoXbjIYFvufiSvVbir0txzFOqF/f1otES0ly9YMfTjGz/GrqPVNw
         SU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+7mgcJIet7qBayZZcIdFHC3F2O5NeLmq5vShyrq3W0w=;
        b=K6cQxLG2VC2Z26r+mpKNbL6rB/Kb4EIvhDV0caWLvlAjDbBkAyQqvCHcaWFX0j7Zvx
         myT5AliK89j+P3F9lubpCSM0HgUL9yfvaRrm0u7eLea6fRG6C60a6xzFdF2DRzfDFRp/
         HwgqKV7SZOsTLGJM1peVxKlLadNN6X9KW8zBwgNtSRfFMSvHsHVQlYkIcD4Uvj6GLGhg
         /GktY1IWjVcGlqyJALgcptLRz4h3P/KMlw0Ho0kE6RRqh6TKPOfB/kELY9cRYwB+Xlau
         6yeZSmYSH0QmcuUNfzsdSzXCJpO5NHyVMeQSPrGn3+jUozOFood5cReJCy2QTcrVzIln
         LLuQ==
X-Gm-Message-State: ANhLgQ3y9+230ylQ3JN9Ew1S7jcFDflSQJYPZTBNkkzWCOBQ1sp23FeC
        j8ZcLva50SaN0HAXZeGvC8iqmbhpiYhSf34KvwzBTw==
X-Google-Smtp-Source: ADFU+vvpfm81OA3PanYLFThp3djsW6cZtJxs9xKlCyhKW+1/lC8XEgyQ51fGhGDLsry1t6MC9Ui/IdM3QW2eFKcg2Wo=
X-Received: by 2002:ac8:3778:: with SMTP id p53mr5648903qtb.158.1583387659031;
 Wed, 04 Mar 2020 21:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20200305163743.7128c251@canb.auug.org.au>
In-Reply-To: <20200305163743.7128c251@canb.auug.org.au>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 5 Mar 2020 06:54:07 +0100
Message-ID: <CACT4Y+ZX0xaZNnNqOzassKi2=NSPz-9K4VpxdL6FGx_Y4vWSUg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Walter Wu <walter-zh.wu@mediatek.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 5, 2020 at 6:37 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> mm/kasan/common.o: warning: objtool: kasan_report()+0x17: call to report_enabled() with UACCESS enabled
> In file included from include/linux/bitmap.h:9,
>                  from include/linux/cpumask.h:12,
>                  from arch/x86/include/asm/paravirt.h:17,
>                  from arch/x86/include/asm/irqflags.h:72,
>                  from include/linux/irqflags.h:16,
>                  from include/linux/rcupdate.h:26,
>                  from include/linux/rculist.h:11,
>                  from include/linux/pid.h:5,
>                  from include/linux/sched.h:14,
>                  from include/linux/uaccess.h:6,
>                  from arch/x86/include/asm/fpu/xstate.h:5,
>                  from arch/x86/include/asm/pgtable.h:26,
>                  from include/linux/kasan.h:15,
>                  from lib/test_kasan.c:12:
> In function 'memmove',
>     inlined from 'kmalloc_memmove_invalid_size' at lib/test_kasan.c:301:2:
> include/linux/string.h:441:9: warning: '__builtin_memmove' specified bound 18446744073709551614 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]

+kasan-dev

We probably need to make this 18446744073709551614 constant "dynamic"
so that compiler does not see it.

Walter, will you take a look? Thanks

>   441 |  return __builtin_memmove(p, q, size);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>   519e500fac64 ("kasan: add test for invalid size in memmove")
>
> That's a bit annoying during a normal x86_64 allmodconfig build ...
>
> --
> Cheers,
> Stephen Rothwell
