Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7602AC065
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 17:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgKIQCX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 11:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729570AbgKIQCX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 11:02:23 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D50C0613CF
        for <linux-next@vger.kernel.org>; Mon,  9 Nov 2020 08:02:21 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id t13so10942141ljk.12
        for <linux-next@vger.kernel.org>; Mon, 09 Nov 2020 08:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LYXkVfDx+sIP3XjpaTJvSwehzbCXVjxjdcBKl6KL1A0=;
        b=pFVPI1xkW0aqQAjpkbCAAoJRoBDBCH7rdMdh5VUHeEGLwZhJq37S0X10xpVsj9/jV0
         W/KxNx/5RCpcfPqsI1lj2SfajM8VHT3lKLE7SmpzflAw4pB0CiXKm+IdMz1Prtuh5g5P
         T4WN7huVw/IXIfD/Hf5oCitPswX+gphHkc9nC13jOMdFC8WO2RH6Vk+OL1+ossDKwEHd
         722+29mqR7d86/f5RKkxCffOaIuGRZ3hKt9CwHzsN6FMm2NuvbPvTnB4YPIMhiQicg6u
         GNmkkjWQXLLtF6451g0730d7ihhso2iaMXPTO4VLr3/F6J0jhD/PolKCYRg4zYiA5fRp
         XBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LYXkVfDx+sIP3XjpaTJvSwehzbCXVjxjdcBKl6KL1A0=;
        b=kJgmLvKweNVlqCQiRmfDeE8OvcoW/0N3jaPWhEekgsQvvNEp37rwygN5u0sbQHqvsO
         wN/efl+EXdMbwM2lTCWKFVXZTnmQwwDMEAdFX8ars91zBjJgfW8a7YyWKdLQJCgvsO9i
         4tQYyz27jUwS6mp9t27FLmuoNq2IZ/oKnZhfOrcUqp4xTzjd/v5FpaWEkV18Wta7ljgD
         eyxZFkvwd9zO8LiwFizjjQubvdu48WolXb6LOHhJwAogyExmpROOPekQuj2D2rSBXzTP
         PeBPiPvzdhV55ici0Zim677OJIbNAPXrAMNGbpPnwtx6hsl3K7qzwNmzj/xWGh54hmXM
         T8Mg==
X-Gm-Message-State: AOAM533p8476y4srx4xUbvhquH6H9txmpJkFPm1L9fp8x1C2jv7o2DMp
        P/J289efBdCeRgPZsTIrSaFSZJl9KmyZHhu61ATLlFgz6ice2A==
X-Google-Smtp-Source: ABdhPJxj6Cuf5HS726v1ZFt7Qu0Txl8F03ZaftacuJ3u/oEu7Qy1S6XveNuSGSSZImFMAz9Oy2VwDEcrglaJDukcVCI=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr6952555ljg.286.1604937740121;
 Mon, 09 Nov 2020 08:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org> <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86> <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
 <20201106151554.GU1551@shell.armlinux.org.uk>
In-Reply-To: <20201106151554.GU1551@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Nov 2020 17:02:09 +0100
Message-ID: <CACRpkdaaDMCmYsEptrcQdngqFW6E+Y0gWEZHfKQdUqgw7hiX1Q@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 6, 2020 at 4:16 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Fri, Nov 06, 2020 at 02:37:21PM +0100, Linus Walleij wrote:

> > Aha. So shall we submit this to Russell? I figure that his git will not
> > build *without* the changes from mmotm?
> >
> > That tree isn't using git either is it?
> >
> > Is this one of those cases where we should ask Stephen R
> > to carry this patch on top of -next until the merge window?
>
> Another solution would be to drop 9017/2 ("Enable KASan for ARM")
> until the following merge window, and queue up the non-conflicing
> ARM KASan fixes in my "misc" branch along with the rest of KASan,
> and the conflicting patches along with 9017/2 in the following
> merge window.
>
> That means delaying KASan enablement another three months or so,
> but should result in less headaches about how to avoid build
> breakage with different bits going through different trees.
>
> Comments?

I suppose I would survive deferring it. Or we could merge the
smaller enablement patch towards the end of the merge
window once the MM changes are in.

If it is just *one* patch in the MM tree I suppose we could also
just apply that one patch also to the ARM tree, and then this
fixup on top. It does look a bit convoluted in the git history with
two hashes and the same patch twice, but it's what I've done
at times when there was no other choice that doing that or
deferring development. It works as long as the patches are
textually identical: git will cope.
If there is a risk that the patch in MM changes this latter
approach is a no-go.

Yours,
Linus Walleij
