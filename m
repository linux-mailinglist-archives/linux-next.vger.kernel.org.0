Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B88D2D93A7
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 08:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439023AbgLNHc4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 02:32:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:57876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439019AbgLNHcx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 02:32:53 -0500
X-Gm-Message-State: AOAM532P/Jx5HQ8zHZnzdJSXIXRord0FpeZ6O9YjSF0H6+Y7xmL01VSa
        DF928zR9jDZl7jBE6T0CY4A69UAlXiNwmlGfJZ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607931132;
        bh=B2/NH6QzCAvUVo+NfGwDUvirnlGhp4a3QWT1Pn51uwc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S4c9Kw3VFdY1ieTdCvu5Gh2HDvGwx5EukY7CMRW4PeXP8Ehx5SpLtxiqjEf0Jtbry
         g3qRBpHQ6lSQHWUiqTtMGlkUV00lDoSXVf1BlMHLOW4zz6u6bGPac+5RWfm/nxMnqA
         hxJZgDmnuAFtDr6QUGoOCehPk6PTplk1hj6JeNuOLJ27eNmjU2xmm226jJoHGmLVtR
         hOJm2n0OjHxyz3j/hC1woSYpN0gVd1RFF/+kGYfIky/Kwh1JtYbU47KpimeZ0WegyH
         ilcfP7H4uDjiMD9bOVb4EtPgKUxvPgLoZJuJesvPdhxZQ5jK7el5fJstDCtQIpiEs0
         fssxMneVRKdeQ==
X-Google-Smtp-Source: ABdhPJxhkJKxgWYA3DE8Y2xrY2FcYqWHlZDBZvTu1/6D/ZL/XRSVdmCzFSsBvv0qJHjyBJ9uupZJWukaFYbw0YQPd1g=
X-Received: by 2002:a9d:12c:: with SMTP id 41mr18568064otu.77.1607931131884;
 Sun, 13 Dec 2020 23:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20201214164836.0d73cf9a@canb.auug.org.au>
In-Reply-To: <20201214164836.0d73cf9a@canb.auug.org.au>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 14 Dec 2020 08:32:00 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFmRTLfyfF_pkkwNzDnvz6ra2_RYan8UJUzSXYmjKEZRg@mail.gmail.com>
Message-ID: <CAMj1kXFmRTLfyfF_pkkwNzDnvz6ra2_RYan8UJUzSXYmjKEZRg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 14 Dec 2020 at 06:48, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> In file included from include/linux/kernel.h:14,
>                  from include/linux/list.h:9,
>                  from include/linux/wait.h:7,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from include/linux/proc_fs.h:10,
>                  from include/linux/efi.h:19,
>                  from drivers/firmware/efi/libstub/arm32-stub.c:5:
> drivers/firmware/efi/libstub/arm32-stub.c: In function 'handle_kernel_image':
> include/linux/minmax.h:18:28: warning: comparison of distinct pointer types lacks a cast
>    18 |  (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>       |                            ^~
> include/linux/minmax.h:32:4: note: in expansion of macro '__typecheck'
>    32 |   (__typecheck(x, y) && __no_side_effects(x, y))
>       |    ^~~~~~~~~~~
> include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
>    42 |  __builtin_choose_expr(__safe_cmp(x, y), \
>       |                        ^~~~~~~~~~
> include/linux/minmax.h:58:19: note: in expansion of macro '__careful_cmp'
>    58 | #define max(x, y) __careful_cmp(x, y, >)
>       |                   ^~~~~~~~~~~~~
> arch/arm/include/asm/efi.h:74:25: note: in expansion of macro 'max'
>    74 | #define EFI_PHYS_ALIGN  max(SZ_2M, roundup_pow_of_two(TEXT_OFFSET))
>       |                         ^~~
> drivers/firmware/efi/libstub/arm32-stub.c:123:44: note: in expansion of macro 'EFI_PHYS_ALIGN'
>   123 |  int alloc_size = MAX_UNCOMP_KERNEL_SIZE + EFI_PHYS_ALIGN;
>       |                                            ^~~~~~~~~~~~~~
...


Thanks for the report. I actually spotted this and sent a fix
yesterday [0]. I'll send it to -tip today.

[0] https://lore.kernel.org/linux-efi/20201213151306.73558-1-ardb@kernel.org/
