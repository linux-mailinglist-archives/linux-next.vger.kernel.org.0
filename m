Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2005822089F
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 11:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729791AbgGOJYp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 05:24:45 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42217 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729672AbgGOJYo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2020 05:24:44 -0400
Received: by mail-oi1-f196.google.com with SMTP id t4so1682859oij.9;
        Wed, 15 Jul 2020 02:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pS8//2m4a4+oXS1cjEaSO4xVTkKzDBQAW/L3md+hqzg=;
        b=c7fAJUmpNjx+e6b7a6RDnF++/0VNQvdRnHJFhVWqX9Z7CyET9HWHqI3Ts/x1tuMYWc
         68vvq/0wouobyrIPRTkFgAQSTUbI/OM848B4XBKTPUkt/T16KZVoy0jnBx7fXN8+apWa
         gZXiDJCxdNq83D4Bih8GsO+BqvLDt7j4bLklx+X6UMlVHlDoMKiqqTT1Tt6dGoysrR71
         fL8TyZUybirt/o4aYcPI8rFRyk2a6HPyeyHlalSEImnFUdL2TfnQmlJf4oUD2BtxcrN7
         YeHbKw9vyIz8GBUxroPWFFXaoG2xlFzU9nYdf1JmhHXT0CDAn1ebnr375OUpi4QuUM3K
         YUnQ==
X-Gm-Message-State: AOAM531vUFwzTZ6Qm8/0KjyrZyN6qYThpadAm+egBO/K23L69J51Y5D/
        rtsJPmNhoUhD/Zov3F1XngdiYF0Up8VWTNOJ4a4vCqfldUc=
X-Google-Smtp-Source: ABdhPJxsOpD6PZBT3rQkWJj7eFLJzhE+VvgtXf6ganwrw77cxSR8jVVbpQ1j8HH0LqdZcqUSBi4IfKu9KiTn7V+ivWI=
X-Received: by 2002:aca:ac10:: with SMTP id v16mr6693336oie.153.1594805083719;
 Wed, 15 Jul 2020 02:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200715121423.6c20731b@canb.auug.org.au>
In-Reply-To: <20200715121423.6c20731b@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 11:24:32 +0200
Message-ID: <CAMuHMdWMmP_YHEwnqmuTMw4-+LSieRaSHeqPLYLZyLq+O7zhyQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 15, 2020 at 4:26 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> block/blk-timeout.c: In function 'blk_round_jiffies':
> block/blk-timeout.c:96:14: error: 'CONFIG_HZ_ROUGH_MASK' undeclared (first use in this function)
>    96 |  return (j + CONFIG_HZ_ROUGH_MASK) + 1;
>       |              ^~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   91ba0f529364 ("block: relax jiffies rounding for timeouts")
>
> CONFIG_HZ_ROUGH_MASK is not defined for this build even though
> CONFIG_HZ_100 is set. The arm arch does not include kernel/Kconfig.hz.
>
> I have reverted that commit for today.

(as I don't have the original patch in my email, I'm commenting here)

    +config HZ_ROUGH_MASK
    +       int
    +       default 127 if HZ_100
    +       default 255 if HZ_250 || HZ_300
    +       default 1023 if HZ_1000

What about other HZ_* values?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
