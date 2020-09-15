Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FB6269CD3
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 06:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgIOED0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 00:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgIOEDW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 00:03:22 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C16C06174A
        for <linux-next@vger.kernel.org>; Mon, 14 Sep 2020 21:03:21 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e11so10155038wme.0
        for <linux-next@vger.kernel.org>; Mon, 14 Sep 2020 21:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IdWyBJyS0oKhGVRiD+UrbYCxAhuM82RyBR7Rd+xcd8M=;
        b=hahHnwMl5tDjgeiwqIfxSVa4NhrpgF88zGK0AneZ4a/mNpNIMZoHBSsgM8RxI/Jff+
         3dRX6e9D6llaSDJMzaSosHZQpVXS465byBBtGRAMUMhCDUZ04SdRcw8XduyQHPPXl5i1
         okEv0pQdTPYWTNOwjthyGUWrildF0hMjodSvcSEzms71NtuuJR7JpUuiUbwJSm9vsZkW
         /xDeq1xv/zfbKny0yIgrpONvzzeeKxfvqQ+O55x5Zc1D2r6vSBh+Jn2f23DXITEQgSWm
         kBZfJm4LXHY9rnyBjHOSNKVvV58Tn0fO9k/zegWigCO07UZKFe5XucnNNq3iejBOBAUf
         XosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IdWyBJyS0oKhGVRiD+UrbYCxAhuM82RyBR7Rd+xcd8M=;
        b=eObnHipEbgDjMxjxN0bZfXz5Xt55Cjz6kEVXpQFYEXq3OYZeyBjcDxoFFEkMfvkILq
         LdsLnBvNgknZOf+B1Ao8Sne2Te/DUq7v4AawHP2cj4n3n9R2vWxlRGVN0nwpfbWZaqh+
         uxd2Jdkh3+peGDAEIDkRQgoZWhV8dWDQi1TAxYASqnbuZx9Dxuj8l3fEK2cE5O9mxzhL
         3JB3h+MBb2jyPDN4+D9UIbpERM7R2PQ1WZt7lsuLwLBPDVZ3koO7TjjMIpqd+acnJnv+
         tjFF9qAikg71lhFBCP4U+XvakhGuq0kLbXwsCsWgL5qdzAQoF083MF7zlgcCn0laZpfj
         Snqw==
X-Gm-Message-State: AOAM532HIGa6bcVRch2XaYBtwC19ZvfFGrfdykl7TH8T/fQ3TJ4YvO1k
        SEU9rYH9PhriduXYrZ8GOcO/EhysYNXIwJLXmL+1Hw==
X-Google-Smtp-Source: ABdhPJzyLV2ghRAL4Ywx8K4f2sh2aLPSnD+wTg8+mayOuSlHjdJEpRnXn0msMlnpsDLB9KgEDtlahtuCGvZNnP/Qoc0=
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr2445837wmk.86.1600142600065;
 Mon, 14 Sep 2020 21:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200914170055.45a02b55@canb.auug.org.au>
In-Reply-To: <20200914170055.45a02b55@canb.auug.org.au>
From:   David Gow <davidgow@google.com>
Date:   Tue, 15 Sep 2020 12:03:08 +0800
Message-ID: <CABVgOSko2FDCgEhCBD4Nm5ExEa9vLQrRiHMh+89nPYjqGjegFw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Patricia Alfonso <trishalfonso@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[+kasan-dev, +kunit-dev]

On Mon, Sep 14, 2020 at 3:01 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> In file included from lib/test_kasan_module.c:16:
> lib/../mm/kasan/kasan.h:232:6: warning: conflicting types for built-in function '__asan_register_globals'; expected 'void(void *, long int)' [-Wbuiltin-declaration-mismatch]
>   232 | void __asan_register_globals(struct kasan_global *globals, size_t size);
>       |      ^~~~~~~~~~~~~~~~~~~~~~~
> lib/../mm/kasan/kasan.h:233:6: warning: conflicting types for built-in function '__asan_unregister_globals'; expected 'void(void *, long int)' [-Wbuiltin-declaration-mismatch]
>   233 | void __asan_unregister_globals(struct kasan_global *globals, size_t size);
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> lib/../mm/kasan/kasan.h:235:6: warning: conflicting types for built-in function '__asan_alloca_poison'; expected 'void(void *, long int)' [-Wbuiltin-declaration-mismatch]
>   235 | void __asan_alloca_poison(unsigned long addr, size_t size);
>       |      ^~~~~~~~~~~~~~~~~~~~
> lib/../mm/kasan/kasan.h:236:6: warning: conflicting types for built-in function '__asan_allocas_unpoison'; expected 'void(void *, long int)' [-Wbuiltin-declaration-mismatch]
>   236 | void __asan_allocas_unpoison(const void *stack_top, const void *stack_bottom);
>       |      ^~~~~~~~~~~~~~~~~~~~~~~
> lib/../mm/kasan/kasan.h:238:6: warning: conflicting types for built-in function '__asan_load1'; expected 'void(void *)' [-Wbuiltin-declaration-mismatch]
>   238 | void __asan_load1(unsigned long addr);
>       |      ^~~~~~~~~~~~
[...some more similar warnings truncated...]

Whoops -- these are an issue with the patch: the test_kasan_module.c
file should be built with -fno-builtin. I've out a new version of the
series which fixes this:
https://lore.kernel.org/linux-mm/20200915035828.570483-1-davidgow@google.com/T/#t

Basically, the fix is just:

diff --git a/lib/Makefile b/lib/Makefile
index 8c94cad26db7..d4af75136c54 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_KASAN_KUNIT_TEST) += test_kasan.o
 CFLAGS_test_kasan.o += -fno-builtin
 CFLAGS_test_kasan.o += $(call cc-disable-warning, vla)
 obj-$(CONFIG_TEST_KASAN_MODULE) += test_kasan_module.o
+CFLAGS_test_kasan_module.o += -fno-builtin
 obj-$(CONFIG_TEST_UBSAN) += test_ubsan.o
 CFLAGS_test_ubsan.o += $(call cc-disable-warning, vla)
 UBSAN_SANITIZE_test_ubsan.o := y
-- 
2.28.0.618.gf4bc123cb7-goog


> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: In function 'common_nfc_set_geometry':
> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:514:3: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>   514 |   nanddev_get_ecc_requirements(&chip->base);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>

I was unable to reproduce this warning: it looks unrelated, so I'm
assuming it was attributed.

> Introduced by commit
>
>   77e7d1c8c356 ("KASAN: Port KASAN Tests to KUnit")
>
> --
> Cheers,
> Stephen Rothwell

Sorry for the mess,
-- David
