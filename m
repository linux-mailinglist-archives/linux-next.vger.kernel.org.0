Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2AD73318FE
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 22:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhCHVCc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 16:02:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCHVCB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2021 16:02:01 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BE3C06174A;
        Mon,  8 Mar 2021 13:02:01 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id v14so312695pgq.2;
        Mon, 08 Mar 2021 13:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EfA28O/UsViP+yPLk+j0rLpQWpebcKOAsJiqskjZxXc=;
        b=sK+yWK70ZHNSJmaL2ofWWUqCWFkE7WFerRIeyuSI/6B+xPw6APL/2/tncdwTcP2DRn
         IPOWAJGVGA5dkMw1I62xYWV0kcAm2rWmJvSGjM0UdKCfN546Mm/f5b/jpOFFslwVr7/I
         9ZkARM5NhwxB03N5M6WtjdbBmm93F7WSjxDt5jOxWegC6dyFYjS4z/Hrnk/TSxvsBOLd
         JEs7MxKFfBOEUopLh4Jxplj3kLM09u/yq4oVFP1QNMFe06kidhVp+qB8V5s/Hd+jKkW0
         XUI2kKuuwscUseAOknon1C57+TT4s7wy9T/AMr4/ZUdMLBqAzW/mmNOZcw9ia4VX46/2
         ySCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EfA28O/UsViP+yPLk+j0rLpQWpebcKOAsJiqskjZxXc=;
        b=iXvvoDZDYtQUl/dFVgemhW+c6ae5f1tL97wV5Ddb/sZ6KfdJEosBt9rMuem+qalpau
         PUezW+eXZS1ir1SrP6rpTC9ha2IYNi6398dsNPDOEp+DQoqJhFUx0MqBQy1pv0oyibZS
         F7Fd6t4lkK2vRDHnziMe+e9Gth9kv3MHXAr8m7PnoKemCiXB1lYhH8GLj6/Zxbun+uZi
         UcqWfToedwgqln2S7qN+YwOTN+Vf0NJ2P7ryVdDcG6fegFr561wUAxT/qxFJXszuIJJU
         8rr6PXcfuUUo4JoLuRkoyjK6eKFp063WuKQxOSfFbLNP+XEnUovNy9Xlv8lT96JOain9
         L3eQ==
X-Gm-Message-State: AOAM530St9LGXmtA5wD20fGawywVDTo23AWdJn0bpI7oTyxaz9z5yaqx
        kxcMY0QIxuanFwufepOFqj2e7aodZJg7E7+u4A0=
X-Google-Smtp-Source: ABdhPJxVM01lybOdYwckGRoBjfKBf6vBKHhaBl9GWPCZE2wFJgtwn9WuQ+iwgS/3gF0lF2S6Uc2LtMK4qwQA9MTqMT0=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr22299306pgf.4.1615237321252;
 Mon, 08 Mar 2021 13:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20210309072620.656e8078@canb.auug.org.au> <20210309073211.392a838d@canb.auug.org.au>
In-Reply-To: <20210309073211.392a838d@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Mar 2021 23:01:44 +0200
Message-ID: <CAHp75Ve2qGd5fFC9ztaEk9d+YBa-aTu-gMn_9dRUbpkWGY9YTw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 gpio-brgl-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 8, 2021 at 10:34 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Tue, 9 Mar 2021 07:26:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Commits
> >
> >   eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2")
> >   809390219fb9 ("gpiolib: acpi: Allow to find GpioInt() resource by name and index")
> >   62d5247d239d ("gpiolib: acpi: Add ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER quirk")
> >   6e5d5791730b ("gpiolib: acpi: Add missing IRQF_ONESHOT")
> >
> > are missing a Signed-off-by from their committers.
>
> This also applies to the gpio-intel-fixes tree (since it is now headed
> by the same commit as the gpio-brgl-fixes tree).

I rebased my branch according to Linus, but I have decided to take
directly Bart's tree.
So when original will be fixed I'll fix mine.

Thanks!

P.S. Bart, you may simply merge my tag even on top of v5.12-rc2. It
will save you time and keep the original SHA IDs.

-- 
With Best Regards,
Andy Shevchenko
