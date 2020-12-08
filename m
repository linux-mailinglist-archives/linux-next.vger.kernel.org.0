Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466E72D265D
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 09:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgLHIhw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 03:37:52 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:46033 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbgLHIhv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 03:37:51 -0500
Received: by mail-ot1-f42.google.com with SMTP id h18so11189350otq.12;
        Tue, 08 Dec 2020 00:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aXDyhPzCieRdhaMthbBXKCwOlq6T9ABtAlajnQOA5AM=;
        b=jwm037JpRGY64ZC6PTPZ+uFpQfsy1vTw9BsYrhHOvKef8ZuQClWjFICKS8s+h/BY3y
         2nVcB8XuBX+3CSRZsTm5L/K5GoeN65JQdJUjcJkoUerjpvW+6JukYhBLI/cMO2UE4rYF
         AABduVI6LSjQXF5i8HRCATdGpAU7z6hPIs1k+7rjkKdjW74NqtRWkfg3wcu3GRkhcVwz
         94F2ANe9x4MMO6G+EXBhtZkJSUUqHRmfbzXZOABxrQTjBEAxh3HMLAPwYGYAtNZ+hKqv
         Ug9hcunuBHXQISK9rWvR4bM9tb9gDp56OjX+kfxK7jX1AMIYYMqFI4aabcHRslWiU4wC
         ho/Q==
X-Gm-Message-State: AOAM531a2es07/w5dZJlH/5A67Wd4ofRRcowXnjhgG2L5vnK+5jX84uo
        TN2w0j6/F0dMPM5utp6BS9XdJwCFDctrLeyCQ28=
X-Google-Smtp-Source: ABdhPJwWi/EZNXz2SL/GMnB/3DnxeKJphp+46T0VmWUZdjOnLvhzG+mxughwd3GBz26RT6HuqDjLxuNa3YH2C0DDS1I=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr16002385ota.107.1607416631045;
 Tue, 08 Dec 2020 00:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20201208090555.7159b138@canb.auug.org.au>
In-Reply-To: <20201208090555.7159b138@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Dec 2020 09:37:00 +0100
Message-ID: <CAMuHMdVYoxUOUL0zNAPzTJUSR3vGzcJWMzvtCKK=ZxyM=8hk+A@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Dec 7, 2020 at 11:06 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> In commit
>
>   c3f207f6d23d ("clk: renesas: r8a779a0: Make rcar_r8a779a0_cpg_clk_register() static")
>
> Fixes tag
>
>   Fixes: c07439dea94050b6 ("clk: renesas: cpg-mssr: Add support for R-Car V3U")
>
> has these problem(s):
>
>   - Target SHA1 does not exist

Oops, my bad.

> Maybe you meant
>
> Fixes: 17bcc8035d2d ("clk: renesas: cpg-mssr: Add support for R-Car V3U")

Yes I did.

Mike/Stephen: do you want me to respin my pull requests?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
