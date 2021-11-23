Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4130445A60D
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 15:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238229AbhKWOv5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 09:51:57 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:40840 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238191AbhKWOv4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 09:51:56 -0500
Received: by mail-ua1-f41.google.com with SMTP id y5so44229220ual.7;
        Tue, 23 Nov 2021 06:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Fbef1Cr65IM390r0xwl+UzRI+j+QyCypi+gIUcKWUM=;
        b=HtzboajwH/TqNiwt/QAZ1KYwWW/QnrUgQ9xg/a9SaYQBPl+1rvDQkJZnmlTRxSLZO2
         kNY7Nx0GijqdxNjen3gqkq9o98ire3QAiVq/dpqEoWj4IHUFmZxfpcaEpY+9eLuPeFHa
         bo2yZvWVzl01/F8EWmamCUwNkJ/W205YOa1cotAVJyy3XYLemLO8WtK0V5+3zX3NqB7R
         nencB4qi2UR99e55wY/BH3JpiwNuSt3BtHmXWdH3IHAlQoweoSXiXLiILGrkItwAHUan
         vDT/oYsBa0p9G/E0XotxMm6VEk2PI9vJqkjT1NmvcRXN0I0KTulRARU5RTpSWz7KLGxB
         2qHg==
X-Gm-Message-State: AOAM531O8SM9v0TVut681XscXbHt7svYKQeRC6BiBmBuhaQ8nB9ndml2
        FtavBGYBcJflaPWU4avGF/Jyem9VKjB8dw==
X-Google-Smtp-Source: ABdhPJyS6XkSxGVgbrswvmZXDhDhyzXGUKewNbBjZQB5L9F2eYoOWVi1DbK07SxhaTaFByhCaXn8ag==
X-Received: by 2002:a67:db0b:: with SMTP id z11mr9183327vsj.59.1637678927188;
        Tue, 23 Nov 2021 06:48:47 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id s22sm6378792vkm.28.2021.11.23.06.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 06:48:46 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id w23so44224346uao.5;
        Tue, 23 Nov 2021 06:48:45 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr10294794vst.37.1637678925680;
 Tue, 23 Nov 2021 06:48:45 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
In-Reply-To: <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 15:48:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVuoUAM-6H2BXYtUH++4yXhRCGLAdbzx2GqAJk64FYO=A@mail.gmail.com>
Message-ID: <CAMuHMdVuoUAM-6H2BXYtUH++4yXhRCGLAdbzx2GqAJk64FYO=A@mail.gmail.com>
Subject: Re: spinlock.c:306:9: error: implicit declaration of function '__raw_write_lock_nested'
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Arnd,

On Tue, Nov 23, 2021 at 2:50 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Nov 23, 2021 at 12:38 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > While building Linux next 20211123 tag for sh with gcc-11
> > following warnings / errors noticed.
>
> Nothing in here looks like a recent regression from either the kernel
> or gcc-11.

Except for:

    kernel/locking/spinlock.c:306:9: error: implicit declaration of
    function '__raw_write_lock_nested'; did you mean
    '_raw_write_lock_nested'? [-Werror=implicit-function-declaration]
      306 |         __raw_write_lock_nested(lock, subclass);
          |         ^~~~~~~~~~~~~~~~~~~~~~~
          |         _raw_write_lock_nested

Which was also reported for other architectures:
https://lore.kernel.org/all/202111201111.c2ApGeHR-lkp@intel.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
