Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE8A5E83D0
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 10:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbfJ2JF2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 05:05:28 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34979 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfJ2JF1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 05:05:27 -0400
Received: by mail-oi1-f194.google.com with SMTP id n16so6040660oig.2;
        Tue, 29 Oct 2019 02:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/e/OXl/eSB3S3s8RmU98HsH5ODaBeFtkQ+8P1wGA6WU=;
        b=uFcYWpP2jsKfGccj9mkaRQdIj7iZYSxuqlx7YGmqN5cnVYeteZ5CfHujJwTjK/NFiq
         btBarCLJZH61NlQx4GVLQcIivC743EpeLeuOSm8R3ewEXHZCEOiB2d7euG0VwRtb+XGe
         bAQQ/6srVR8JkCXZ7MzjW0Pf++WVMfHSUhT944a8ZlnaX5aa62YT17KlIMW/4bzz8Fv6
         1VER0gZGjMv6FA2+8QB8pTdB53vHGkY8+V9qGJPNPZRlYVhG+p0OEom5ZNrbucXMsJxJ
         A3LQbV98x12okCHXm87jJjl0qjYsI+9fHxJo1zQJJj6gsIp3PqI6D4AHNus1L1+VKMcK
         eBSA==
X-Gm-Message-State: APjAAAUzMvNHgrnuwEjgCq4Dz+3X8/Y7PCMMQzpu1fUAOibu7YzEoaoP
        Uh3WFvCqUjBMAXk9bgMJsMQXMAjqG37YFjcFtgo=
X-Google-Smtp-Source: APXvYqx2l2QDxxl6Pp9UmXl3j5zgDTqm4st8pBarLtb61+fstLH97WqlTYGMWHYBEUNyjw/fr1XcKOIzzUAJbA3Q4U8=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr2914747oii.153.1572339926899;
 Tue, 29 Oct 2019 02:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191022102334.67e5d3d1@canb.auug.org.au>
In-Reply-To: <20191022102334.67e5d3d1@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Oct 2019 10:05:15 +0100
Message-ID: <CAMuHMdUCx31k3VJt=nYSkFXcOQdRhH7FiY8_f5RX4w4zaksP-w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the thermal tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 22, 2019 at 1:25 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the thermal tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> In file included from drivers/thermal/qcom/tsens-common.c:13:
> drivers/thermal/qcom/tsens-common.c: In function 'tsens_set_interrupt':
> include/linux/regmap.h:87:2: warning: 'index' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    87 |  regmap_field_update_bits_base(field, ~0, val, NULL, false, false)
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thermal/qcom/tsens-common.c:183:6: note: 'index' was declared here
>   183 |  u32 index;
>       |      ^~~~~
> In file included from drivers/thermal/qcom/tsens-common.c:13:
> include/linux/regmap.h:87:2: warning: 'index_clear' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    87 |  regmap_field_update_bits_base(field, ~0, val, NULL, false, false)
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thermal/qcom/tsens-common.c:199:18: note: 'index_clear' was declared here
>   199 |  u32 index_mask, index_clear;
>       |                  ^~~~~~~~~~~
> drivers/thermal/qcom/tsens-common.c:199:6: warning: 'index_mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   199 |  u32 index_mask, index_clear;
>       |      ^~~~~~~~~~
>
> Introduced by commit
>
>   fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")

And kisskb reported the following link failure on m68k:

    ERROR: "__udivdi3" [drivers/thermal/qcom/qcom_tsens.ko] undefined!

Probably caused by a plain 64-bit division in the code.
I expect this shows up on other 32-bit platforms, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
