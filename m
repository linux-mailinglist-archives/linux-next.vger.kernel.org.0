Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C93897E413C
	for <lists+linux-next@lfdr.de>; Tue,  7 Nov 2023 14:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbjKGNxW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Nov 2023 08:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbjKGNwz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Nov 2023 08:52:55 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312D610F0
        for <linux-next@vger.kernel.org>; Tue,  7 Nov 2023 05:51:44 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7bb2e625165so910494241.1
        for <linux-next@vger.kernel.org>; Tue, 07 Nov 2023 05:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699365103; x=1699969903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFbhgesTUnqxhtDQL2m5PAauT+IbKwZ6JL+G8+IHHdQ=;
        b=k16zXvaxUbR/1P7PTzeBhhcULujmCr3FUFKcqL6LRXxm6G/+lSvQFWYGrc3VKQ8Zwf
         SfvHqUNn1sYolhL1965mNtPob4akS0ZjARodFpdZ6Dc2Tb6NaDSYFS5fpCkaglfjOW9J
         Kwcxy2J52rJ2EM9UIETM3IqhHsuPPh9Wq/Z9/LS3og3MlLjuHxQlW9Z1yGt3UBpS+DCg
         KkaBMeACgRz+r/pT7vvpDhaEd+OcyAp/dDaCvaVEM0cgSMh3XQwOx1k1xrj7ZrFfJFsg
         n4B8F1jbVXSr13JF8z8dSNsvtE9GFUyxVyrO53xoqeUypQ6VNPHVB4tsb4UJuPJq82cm
         XmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699365103; x=1699969903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFbhgesTUnqxhtDQL2m5PAauT+IbKwZ6JL+G8+IHHdQ=;
        b=q1w/GGIt+M8TJ6u0huaGeSB5irA2egen6mze52A6O82w+x96oNlEZglW6zP0dY0cfV
         XpQ7ICu8NlAWC7kcNy60MLCz431cyD3vwIFe3UYo1X+22wbFYd+rYC3fEU2HesusGJAm
         czHWroutU5mTPoNJwGxPPcKrU+t/WC9QFxbgHnfmJpgxYwqyN+reYApLpXjASBmD27Jv
         9N34tBR2Y5cGZF34gjvC4ly8viKS5kHiH4/6S5jkQ+T+niKdTxLafczhE8VROaO5fgVM
         3Ee6ZPT9gd/VmNSXFC+QZVqkb1+iMSII6PlnBEXEqn+/rtuzxXgpE7Hjy3xtsA51KO75
         G20g==
X-Gm-Message-State: AOJu0YymuCNpJJFNu6l1OjXTmGqjgfnAXYYw2E+B44Cj+epx7QJBS1DL
        a2bHnsa3uBwewcJGyiEn2ZhVC8/r+KgEmxaEd9xH7A==
X-Google-Smtp-Source: AGHT+IEYK3VvFqFlqkqCX6v5oLDKyDaPY5K2oNNBOIIHvCR8ElKbDarcbIVw0JRJQkyIBzCUOD6vzk6X2p3e7cEnjYU=
X-Received: by 2002:a67:c113:0:b0:45f:274:8c32 with SMTP id
 d19-20020a67c113000000b0045f02748c32mr6745817vsj.32.1699365103136; Tue, 07
 Nov 2023 05:51:43 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYv94gx8+-JMzbmQaue3q3y6QdBmsGUCdD-26X5XavL3Ag@mail.gmail.com>
 <ZAocZRZh4FQRH3lc@smile.fi.intel.com> <CA+G9fYsOttth+k3Ki8LK_ZiayvXa0bAg-DmQAaFHZeEyR=6Lrw@mail.gmail.com>
 <CACRpkdbUYWcFiRh+Y=MOekv2RjSP4sB2t5tVrSsz54Eez6wmVg@mail.gmail.com> <ZJHWdcP+PDaNrw07@smile.fi.intel.com>
In-Reply-To: <ZJHWdcP+PDaNrw07@smile.fi.intel.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 7 Nov 2023 19:21:32 +0530
Message-ID: <CA+G9fYvReHr+ofJAW4yfA5EWT6-MRpR2+fOQG24hROjSd+dY0g@mail.gmail.com>
Subject: Re: selftests: gpio: crash on arm64
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Pengfei Xu <pengfei.xu@intel.com>, yi1.lai@intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Linus and Bartosz,

On Tue, 20 Jun 2023 at 22:11, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 11, 2023 at 10:57:28AM +0200, Linus Walleij wrote:
> > On Mon, Apr 10, 2023 at 11:16=E2=80=AFAM Naresh Kamboju
> > <naresh.kamboju@linaro.org> wrote:
>
> ...
>
> > Add a pr_info() devm_gpio_chip_release() in drivers/gpio/gpiolib-devres=
.c
> > and see if the callback is even called. I think this could be the
> > problem: if that isn't cleaned up, there will be dangling references.
>
> Side note: Since we have devres tracepoints, your patch seems an overkill=
 :-)
> Just enable devres tracepoints and filter out by the function name. I bel=
ieve
> that should work.

Since I have been tracking open issues on the stable-rc kernel,
The reported problem on stable-rc linux.6.3.y has been solved
on the stable-rc linux.6.6.y branch.

Thanks for fixing this reported issue.

Upstream links about this fix and discussion,

Commit daecca4b8433
gpiolib: Do not alter GPIO chip fwnode member

[1] https://lore.kernel.org/linux-gpio/20230703142308.5772-4-andriy.shevche=
nko@linux.intel.com/
[2] https://lore.kernel.org/linux-gpio/CAMRc=3DMfFEBSeJ78NO7XeuzAMJ0KezEPAY=
WsWnFXXaRyQPAf3dA@mail.gmail.com/
[3] https://lore.kernel.org/linux-gpio/CA+G9fYv94gx8+-JMzbmQaue3q3y6QdBmsGU=
CdD-26X5XavL3Ag@mail.gmail.com/

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
