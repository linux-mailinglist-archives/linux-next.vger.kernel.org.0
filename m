Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EC22AED0E
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 10:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgKKJMp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 04:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbgKKJMC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 04:12:02 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD244C0613D4
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 01:12:01 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id z21so2145618lfe.12
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 01:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nbnt6veYw6qTwcMDRL4+mV8KXeaSuLnKhno6+5s2SFU=;
        b=ty5YHZnWhYAcWsKkLNWiqJBKnBrNi5lXjTSZ32spL4wqL6UtA6AbHjprIxTz2iMOiE
         7NvsJXhMLQXVaeyWfyE94zxEGVf4a01pagdCHqtXlvIdjqELf35c/jNzbcV3DDeU2odX
         aIhx4RYmhkNYPo74YQ/Pfl2ewAKmoeUrL40WuyIxJ03UrfnVmanZnEEw+F0tR8vf2D79
         yjDVk1rKlxp67wThAFS/KJqiEgssn3/2MiUCp8Z2YkNsnXdc4p1db9Gf9ilp3A2PguGA
         Lvj0VM16+uUbPKSbLNMxTUGkl+Rq8zc3QrEknvEK6zb5emqqqP2QL6O3SgsTy/hhN/z/
         UOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nbnt6veYw6qTwcMDRL4+mV8KXeaSuLnKhno6+5s2SFU=;
        b=KFtBNXhsUmJien+zcleJNlvRyYVOHrESRzfqf5Yd9kGHsF4IaEQCU4HaC/Ptos8+vd
         sXp7Ti4F0rxO2jMTszdVnxU4pEbJG+baH4irdmxbXdkxjrH93HBS63TEmErENwwL5uR9
         8EoM82m7C9fMgodQx/LhHexUF23lU6cJIPaR5YY3JEfmeEpQn6SPpRgVtTjnzwzeAaNn
         ORwY9CeoW7xy1LBStqMFBS4JdVLHZ8WQHni0qFY+tiULL6ScyrKmz+UL8Lv3sWxxnX26
         kekGPMj+3IvrjPVxnttyPMgbClLPyqPt1sMplEZDSyFMquCqpkr0SNd3RrtFgfFn0xcm
         4D6g==
X-Gm-Message-State: AOAM533p1eGdoZ9G2Dix+DnfQ98ejPlIgZU8ORKt+sMc92jY11Gj0XoM
        wYoRRfzZv4Ktc45SimHJKgGopUDoQNTDIzufjfIXqw==
X-Google-Smtp-Source: ABdhPJwos4mzSJfmoOsowN+ImAeNCfboX3OCQ3wQdi+b27K1mVTdppGK3LmHg1zytVgXlWp7fxJcgNHKY9Yn6AOigTo=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr8771651lfm.333.1605085919810;
 Wed, 11 Nov 2020 01:11:59 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtrOq66zz8ux=G+SDH7ZUJevv-L0W+xvtERHAJCuCmj_g@mail.gmail.com>
 <CAMj1kXESZU2w98gX3uSc-uAw_w9KxSYTKUr6Ne6XHCPWsYT=jQ@mail.gmail.com>
In-Reply-To: <CAMj1kXESZU2w98gX3uSc-uAw_w9KxSYTKUr6Ne6XHCPWsYT=jQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Nov 2020 10:11:48 +0100
Message-ID: <CACRpkdbs__j01qQ5ZudiZ3HX7ifY0ENdF3Tk_8vpfKc9OW=7gg@mail.gmail.com>
Subject: Re: arm: kasan: WARNING: CPU: 0 PID: 0 at arch/arm/kernel/insn.c:47 __arm_gen_branch
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 11, 2020 at 9:15 AM Ard Biesheuvel <ardb@kernel.org> wrote:

> (23552K kernel code, 9970K rwdata, 16736K rodata, 3072K init, 4849K
> bss, 189072K reserved, 65536K cma-reserved, 2293756K highmem)
>
> and so the kernel text section is too large to resolve relative branches.

Hm, that's really exotic but it's bound to happen. It'd be great if we
could warn about that. Maybe even at link
time, I wonder how hard it would be?

Yours,
Linus Walleij
