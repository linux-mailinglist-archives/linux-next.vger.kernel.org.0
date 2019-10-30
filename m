Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7F9E9AAD
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2019 12:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfJ3LV6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 07:21:58 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40307 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfJ3LV6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Oct 2019 07:21:58 -0400
Received: by mail-lj1-f195.google.com with SMTP id u22so2216391lji.7
        for <linux-next@vger.kernel.org>; Wed, 30 Oct 2019 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v+5tgIc7NKlP13RxDmMGjXSk9aMJhynDI2P7YlJkgyI=;
        b=ZXEXkY5Ndof4MYocfA3heTD+yLCHvo6iFCvacATfbb7eg1Xl/gb2Ro79f5dWdFcwdh
         65ewjNgF/7eHsTYh2tPSP/Pym1ZrM1o1rTRCVgr5pju5dr/i04YK8L/ELHBW3T/2ekJe
         lic5Qv3eInHuscY8Aqsss33lm/yUpge67W1lPVOcJnzE5wIyOGvT6SchCL9xiSrTPj3y
         RZEL0yuSlqAGpabX9wckGx0HkEp9tchgT1FkptWaGESXz3dJ+M7rfa9IjAfOHaox6zxn
         CNC88dDtFcFL2SvcgjxM3kQ4PKANYLUhjFxo2WnzsOaVpBB16xdPMkL4N81PLiNrKdSs
         jclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v+5tgIc7NKlP13RxDmMGjXSk9aMJhynDI2P7YlJkgyI=;
        b=mR8Lxp0l6y7Q7clCsPKiRzxXpXaz2NF2RQu3RhwFGrhbXKerqcGnei5oHiIV7OiPq4
         2Z2HPfvAAsWdn77/uTzBXD+WzOb0shqgW+DI1LtfbRKpafBc7J+qHNjgRe2qU75HAxcK
         4JFi4kzyO4eKoQr+iTzspdDkp0K4PAj+d2Sb9yvyYOpUk8g/RyHx5dUbLqMFOdS8LMfw
         03DjNqRSDa+t4qsNzftMGBREyN8pr5CIovVkiQj1ha6S5nwvUdVx1NCeQp/OyOLgLtw8
         NRLA8pJDc6VsFvCvLQ6TVwS/i8FLwZMTyxwmbF/vvfZAGzNW5Def9Dj8SyZNd4itu5Hy
         qrYQ==
X-Gm-Message-State: APjAAAUQNYLY1qiqrFwJg31yFfx0B0H0T/IGbd8zDq3tKdiZcIv6Ro1/
        zH8snretwH/n/KF5e4SVB3sjCyljR9qNoli2F5nI0w==
X-Google-Smtp-Source: APXvYqzLsjUmiyMk7mQIqEBkWx+7s2G2Uv4V174MWYGp6z7L0D2DpWf/lUoJ75gf1nkkcauibk3th80Nh4wXgy74MtM=
X-Received: by 2002:a2e:9249:: with SMTP id v9mr2047103ljg.184.1572434514459;
 Wed, 30 Oct 2019 04:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191029180731.2153b90c@canb.auug.org.au> <CADYN=9+aqqHVP8tKFFCTKi_zzSt=PW5JVyU2sdaThgrHpYSjzQ@mail.gmail.com>
 <20191030105553.GH25745@shell.armlinux.org.uk>
In-Reply-To: <20191030105553.GH25745@shell.armlinux.org.uk>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Wed, 30 Oct 2019 12:21:43 +0100
Message-ID: <CADYN=9L4i7BWcdhOdG-AFQjuZBU=gv7UjcV6CaO2f0q_KJKhVg@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 29
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 30 Oct 2019 at 11:56, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> Please trim your replies; there's no need to force everyone to page
> through 500 lines of Stephen's email to get to the content of your
> message.

Right, I'll keep that in mind next time.

>
> On Wed, Oct 30, 2019 at 11:25:19AM +0100, Anders Roxell wrote:
> > When I'm building an arm kernel with this .config [1], I can see this
> > build error on next tag next-20191029 and next-20191030. Tag
> > next-20191028 built fine.
> >
> >
> > $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -skj$(getconf
> > _NPROCESSORS_ONLN) O=obj-arm-20191029 zImage
> > arm-linux-gnueabi-ld: kernel/trace/trace_preemptirq.o: in function
> > `trace_hardirqs_on':
> > trace_preemptirq.c:(.text+0x2a0): undefined reference to `return_address'
> > arm-linux-gnueabi-ld: trace_preemptirq.c:(.text+0x2dc): undefined
> > reference to `return_address'
> > arm-linux-gnueabi-ld: kernel/trace/trace_preemptirq.o: in function
> > `trace_hardirqs_off':
> > trace_preemptirq.c:(.text+0x468): undefined reference to `return_address'
> > arm-linux-gnueabi-ld: trace_preemptirq.c:(.text+0x494): undefined
> > reference to `return_address'
> > arm-linux-gnueabi-ld: kernel/trace/trace_irqsoff.o: in function
> > `start_critical_timings':
> > trace_irqsoff.c:(.text+0x798): undefined reference to `return_address'
> > arm-linux-gnueabi-ld:
> > kernel/trace/trace_irqsoff.o:trace_irqsoff.c:(.text+0xed4): more
> > undefined references to `return_address' follow
> > make[1]: *** [/srv/src/kernel/next-testing/Makefile:1074: vmlinux] Error 1
> > make[1]: Target 'zImage' not remade because of errors.
> > make: *** [Makefile:179: sub-make] Error 2
> > make: Target 'zImage' not remade because of errors.
>
> Known problem with one of Ben Dooks patches, which was dropped very
> quickly when Olof's builder spotted the issue...

aha, I missed that.

> though it looks like
> I didn't push it out.

OK.

Cheers,
Anders
