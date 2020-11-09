Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31B42AC07A
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 17:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbgKIQGM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 11:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgKIQGM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 11:06:12 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E198C0613CF
        for <linux-next@vger.kernel.org>; Mon,  9 Nov 2020 08:06:10 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id v18so11007268ljc.3
        for <linux-next@vger.kernel.org>; Mon, 09 Nov 2020 08:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IFQygj4KvBcSz0ButIzxQiZomFCuva3ZirqjbWYLGz4=;
        b=SVyp6cCyz9Ik39kILJDO1Y3QQnLh6lPpRwTrctZHNpDDWxL0RdJzt+9hF8/IgRROCP
         a2IEjEyPg/SI2QUg8UGM61oLAluyGX2B6s9DtUoFSR6ehUcvitDPmalphiOHF9oz9bt9
         80v4sKIV32cDSUaK6OisyGSytW3gke3YZoMvbgGo+2oKl1AUqA9RylQW5xLQzFYHn+2i
         1aYIU/luWxqWdqpbTrEy0c5y0L7MOG9IuEcWflLF1uDDFduwXLpXJtdYNUjmhm5rMgdq
         CzN15AJpaT3phCP1KCG/7X8yfjqa3Fklu0ZsHrJdJ9t+enp2NQGZKJgXFeb3bKQGc4h/
         /lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IFQygj4KvBcSz0ButIzxQiZomFCuva3ZirqjbWYLGz4=;
        b=lRuBybLVeY5rMrUX2FNwGWOPAflHmwJHv1qHW0IGwioAX+5YB4tiNVA+d02Y9/96CT
         dnJfhCfVU0roGCGf5Dgxj5mo4s7jALGJdqIbjoIGXUM6nDJNyNnjYWcjt8qOqjHvddeK
         l1qXbuORCLNcczlRvc7WjoaXHwcsF9E0I6V7ZZ2KGDz3pIhW6etptJ2QBCmFeM4drdBg
         Hwmwj83gvqt1tOpAjzLK5u+fVemfAKmDHvgYNTLGvMIl9Gw55+51dpDQuPoIiFQxYV6L
         sn8ag+6m3ymcRP2i4q7QxvQNebzUqyQ5twTLh/hkKr3VA4iTBingTmXb757rlXYp2X0R
         yN/w==
X-Gm-Message-State: AOAM531cymVZhr6P2QMJdrO3AdCb/9tsxVuJEg9rLSj0ulEINBVAc8Qp
        1UjNYFjo0m1qxqRxA+85E9oOs7fL85+6wFkdkjE3SA==
X-Google-Smtp-Source: ABdhPJzrYJtF3QQy4PWbjsXhgic5uTxjXt6gmDaifQ2sE5xPyX+whn7JlDeaHS7clRV8B4fIThVlSJTp93znscNghfs=
X-Received: by 2002:a2e:8604:: with SMTP id a4mr6277015lji.100.1604937968956;
 Mon, 09 Nov 2020 08:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org> <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86> <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
In-Reply-To: <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Nov 2020 17:05:57 +0100
Message-ID: <CACRpkdbKLqMmJbMdvw0cNyu3T4HH1KyNFmkR=AS8uOLPkR3Xnw@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Alexander Potapenko <glider@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 6, 2020 at 2:37 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> Is this one of those cases where we should ask Stephen R
> to carry this patch on top of -next until the merge window?

Apparently this is being handled by "post-next" which I have no
idea how it works, seems like a merge quirk path, but if it works
out, I'm happy :D

Yours,
Linus Walleij
