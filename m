Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57B34556F4
	for <lists+linux-next@lfdr.de>; Thu, 18 Nov 2021 09:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244528AbhKRIaL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Nov 2021 03:30:11 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:46595 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244527AbhKRI3s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Nov 2021 03:29:48 -0500
Received: by mail-ua1-f53.google.com with SMTP id az37so11848910uab.13;
        Thu, 18 Nov 2021 00:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UWwtY9YsySvXg/7Lw9HdiFiuskQgydDNkqP2vDd2c4k=;
        b=UvtkZnm8NSSB63Z6XOce8qmNpFL4fYqviwlxcOu4TmHKeVblJwxHrBtJZmt8Iae7VH
         s9da/e6qEfn9Ksmfv4T9WW9O3RgS6fE4ppqMhqy7qo+yCO+rN7sU9DsgBomP2Jga7AFU
         tdgs8jm6xRdOvx33A2ZtoFX/D1QQc6j9WhHgDhMzzlL0PtdaoId95mARP2ys4aEdLi4v
         eiCFcHqY3OnNIxdi1nd5EeqWdo1BjA5/6MYgo7hYZv7utIeNCDHOAAnLEfqkqcTZRzbl
         aLTWNemnCuMvLp5M0Iow9/WokcbjXeO7lHFYvfYKzJ1laoXEL2zmPEb6W8S5+7t+2r+/
         xkjA==
X-Gm-Message-State: AOAM530JsEaUGJNxYi5E6SlciR6oRXeEOkg+MF3OtfcZlZ3iUF5Cqce0
        0r2ffuWGJZcz7IMrcyTyfC5TAFByJ+C3fQ==
X-Google-Smtp-Source: ABdhPJxT4hNGHFrPSuFLDaZIMilih4FXtlR8SyeW1Vt0hBX5j1DHkye5QGQVu6eku3jFPREtI97CDw==
X-Received: by 2002:a05:6102:e8b:: with SMTP id l11mr78677827vst.20.1637224008109;
        Thu, 18 Nov 2021 00:26:48 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id p69sm1370465uap.1.2021.11.18.00.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 00:26:47 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id t127so3278937vke.13;
        Thu, 18 Nov 2021 00:26:47 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr100762688vko.7.1637224007329;
 Thu, 18 Nov 2021 00:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20211117135800.0b7072cd@canb.auug.org.au> <70141efe-8137-4491-f234-110b24f9d623@infradead.org>
In-Reply-To: <70141efe-8137-4491-f234-110b24f9d623@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 09:26:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbHd9iLpXqpzxfXwSOZ0U5FmKVYMQ15VLCRu=YpLgteg@mail.gmail.com>
Message-ID: <CAMuHMdWbHd9iLpXqpzxfXwSOZ0U5FmKVYMQ15VLCRu=YpLgteg@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 17 (fs/dlm/lowcomms.c)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Aring <aahringo@redhat.com>,
        David Teigland <teigland@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 17, 2021 at 11:23 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 11/16/21 6:58 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20211116:
> >
>
> on m68k (but probably other places as well):
> when CONFIG_IPV6 is not set/enabled:
>
> In file included from ../fs/dlm/lowcomms.c:46:
> ../fs/dlm/lowcomms.c: In function 'lowcomms_error_report':
> ../include/net/sock.h:386:45: error: 'struct sock_common' has no member named 'skc_v6_daddr'; did you mean 'skc_daddr'?
>    386 | #define sk_v6_daddr             __sk_common.skc_v6_daddr
>        |                                             ^~~~~~~~~~~~

Introduced by commit 4c3d90570bcc2b33 ("fs: dlm: don't call
kernel_getpeername() in error_report()"), which has not been sent
for review to any public mailing list archived by lore.

I have sent a fix
https://lore.kernel.org/r/20211118082355.983825-1-geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
