Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37393E1264
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 08:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbfJWGom convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 23 Oct 2019 02:44:42 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38991 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfJWGom (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Oct 2019 02:44:42 -0400
Received: by mail-oi1-f193.google.com with SMTP id w144so16442589oia.6;
        Tue, 22 Oct 2019 23:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SVSqxpmMNICGBqzeKKgU2xy+QpJifG0KMwZHMwK681Q=;
        b=fAhJFmWX3IhGNAhZ/DTw3E6wfvH5zSc5THYyPzxoxtgTIaG2mY/w0IoRtjCimPZ5wP
         wSXLN21aCgqne8S+XW/BG4nPpUfL/RTb2gz+5/l2bN38QumCoABYmDlh0nMC1jWWywiJ
         ecNEi4KKfd2oo6lq3UY5Nfbzx3ShJi21qJKZkABPbCZrqD7v4vQoWG1r3tYJmsOI9ptN
         mbUh82INXQO/WEwV/D0RYkLS/VTnAiWzOW4G9m3qKVpt/VrDvwoEl+o5CYppw2qJfyRj
         M7fbMDv8GviSAcWw6pDT/4GTsoDEu4PscFhgEfYZer7+b9dbn4Li08ztjSu9rONG2OlH
         O+/w==
X-Gm-Message-State: APjAAAXGvcZGZgPVxc1uJAUvqBKBicwU3SgMEgjCyfE/gkoQRV4X7cdK
        I0rdhooNoYhHyGY3s/I7X3nW9+Yv6/JX7ux+RsQcdsaM
X-Google-Smtp-Source: APXvYqzt7Xaa+JSSvDQgzi8CovDH2rJtEMCmvmHs5KCF5pMx4GhViFdbE7ciB/Mg4Q1D0b65mxcuD6TjhfHLRYCWn1s=
X-Received: by 2002:a05:6808:3b4:: with SMTP id n20mr6013733oie.131.1571813079793;
 Tue, 22 Oct 2019 23:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191023155519.2d6765d4@canb.auug.org.au> <d1a57062-24cb-e9c4-e1db-07406b1cea9a@hisilicon.com>
In-Reply-To: <d1a57062-24cb-e9c4-e1db-07406b1cea9a@hisilicon.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Oct 2019 08:44:28 +0200
Message-ID: <CAMuHMdX1rhmvpWBHzvDYRNeYyotNp2ct1ysy4Jd0SjVUvGJd-Q@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 23
To:     Mark Salyzyn <salyzyn@android.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 23, 2019 at 8:17 AM Shaokun Zhang
<zhangshaokun@hisilicon.com> wrote:
> +Cc: Mark Salyzyn
>
> There is a compiler failure on arm64 platform, as follow:
> zhangshaokun@ubuntu:~/linux-next$ make -j64
>   CALL    scripts/atomic/check-atomics.sh
>   CC      arch/arm64/kernel/asm-offsets.s
> In file included from ./include/linux/sysctl.h:30:0,
>                  from ./include/linux/umh.h:9,
>                  from ./include/linux/kmod.h:9,
>                  from ./include/linux/module.h:13,
>                  from ./include/linux/acpi.h:29,
>                  from ./include/acpi/apei.h:9,
>                  from ./include/acpi/ghes.h:5,
>                  from ./include/linux/arm_sdei.h:8,
>                  from arch/arm64/kernel/asm-offsets.c:10:
> ./include/uapi/linux/sysctl.h:561:29: error: expected ‘,’ or ‘}’ before ‘__attribute__’
>   NET_IPV6_TEMP_PREFERED_LFT __attribute__((deprecated)) = /* NOTYPO */
>                              ^
> scripts/Makefile.build:99: recipe for target 'arch/arm64/kernel/asm-offsets.s' failed
> make[1]: *** [arch/arm64/kernel/asm-offsets.s] Error 1
> Makefile:1108: recipe for target 'prepare0' failed
> make: *** [prepare0] Error 2
>
> It's the commit <79f0cf35dccb> ("treewide: cleanup: replace prefered with preferred").

After receiving a report from kisskb for failures for m68k, looking at
http://kisskb.ellerman.id.au/kisskb/head/f3c452cfc59c817950b150b51ec2b33409d7640b/
and doing some testing, it looks like this construct is supported by gcc-7
and gcc-8, but not by gcc-4.6.3 and gcc-5. Don't know about gcc-6.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
