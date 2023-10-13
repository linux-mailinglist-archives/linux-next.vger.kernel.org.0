Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82E17C7DD1
	for <lists+linux-next@lfdr.de>; Fri, 13 Oct 2023 08:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjJMGoe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Oct 2023 02:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjJMGoe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Oct 2023 02:44:34 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1208BC
        for <linux-next@vger.kernel.org>; Thu, 12 Oct 2023 23:44:32 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-579de633419so21121587b3.3
        for <linux-next@vger.kernel.org>; Thu, 12 Oct 2023 23:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697179472; x=1697784272; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cYxdrUg3pe8tdeWMHQoZDqPpLxqpVoxJx2AUWSqbQV8=;
        b=x/a9dtoDaraCsOi+dSIKk+RV69Gzdo8VneCwR4ppF4TYA0HaNVxRtfUhlvCxvPStgT
         WdAhY1qO0a26U5pFcqBqkAuWyoXDP3fc/dW2AVVv+6tO566Vhk4dUkjwm/VfYKLK1z6w
         xcon1opJPcNgpFZO2sNF44stMdguRbmGgqIYHEhiE/eSTdyBJEfhBG0UbRM2A/bV3C//
         QI4lyE6iEN2IOXb2UksOx1jJei44CZVHunlrFUeyDEi3uybQvzar+k4C+RAHXtPmAf0K
         BZyjx6ZtEQ3v5JtOZt5XtHq9D34XQ1OEiGkJaZsWrxZ/iYFyPDSuCvP1/D0C5fV0eWpj
         6oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697179472; x=1697784272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYxdrUg3pe8tdeWMHQoZDqPpLxqpVoxJx2AUWSqbQV8=;
        b=dGKeUeM8DQwJfTTj7gsOc8vtevFD56lRv6N/XwIukk9/NKVjItWDdFtqrBX1P9D1/2
         K6so/xC98yXjFRX5OcnI8xb+uFnaucWCjmwedfiimR082MCJDE4Uy16p+BiuGbmdB2iX
         vNeZErDfITPMHYwqFEWirsOJy8A2sOeCNH92mNAtvbHRZVXKTFCkrwSrU9Y9n81PBrmK
         qpOrtyKrRrs465B0tMHqAM0xssuEwn3S07HC5QPfaHWWLOJPOtWSchKOygizUamtlcfQ
         En+0027T4JhZRFvZ7d8zbWb24hlvCuSqvd5fq05nccnhx+CBJZ3dKnyDyZKdjTgperJI
         Q88A==
X-Gm-Message-State: AOJu0Ywb60OV0Qbh65PlglRaS61MS/Jz3ssHNVDoprVpvjL1iqH8MWQw
        4MK+KCwBzsEVjmH0O5WIfUBLgmvnPnvEDC7ZVxvcOQ==
X-Google-Smtp-Source: AGHT+IEwTTEg075ZagqOuZx2hcU6AJqfLw2ya3O7i42wvOIldCQ3zFr2Rmmjp+DVRZSEwNVdT69THM0YP67xUKMQ0f8=
X-Received: by 2002:a81:4908:0:b0:5a7:c49e:3f5c with SMTP id
 w8-20020a814908000000b005a7c49e3f5cmr10098973ywa.21.1697179471830; Thu, 12
 Oct 2023 23:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231013151417.052aa2f5@canb.auug.org.au>
In-Reply-To: <20231013151417.052aa2f5@canb.auug.org.au>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Fri, 13 Oct 2023 08:44:20 +0200
Message-ID: <CACMJSesS=kxajO7f4eiyNEYR2coUOV15ujo6PGAguJVToRiwtw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 13 Oct 2023 at 06:14, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the gpio-brgl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/hte/hte-tegra194.c: In function 'tegra_hte_line_xlate':
> drivers/hte/hte-tegra194.c:424:48: error: implicit declaration of function 'gpio_device_get_base'; did you mean 'gpio_device_get_desc'? [-Werror=implicit-function-declaration]
>   424 |                 line_id = desc->attr.line_id - gpio_device_get_base(gs->gdev);
>       |                                                ^~~~~~~~~~~~~~~~~~~~
>       |                                                gpio_device_get_desc
> drivers/hte/hte-tegra194.c: In function 'tegra_hte_match_from_linedata':
> drivers/hte/hte-tegra194.c:652:33: error: implicit declaration of function 'gpiod_to_device'; did you mean 'gpio_to_desc'? [-Werror=implicit-function-declaration]
>   652 |                                 gpiod_to_device(hdesc->attr.line_data);
>       |                                 ^~~~~~~~~~~~~~~
>       |                                 gpio_to_desc
> drivers/hte/hte-tegra194.c:652:33: error: initialization of 'struct gpio_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   ebee532ff34b ("hte: tegra194: don't access struct gpio_chip")
>
> (Exposed by commit
>
>   63137bee5a7a ("hte: allow building modules with COMPILE_TEST enabled")
>
> from the hte tree.)
>
> I have used the gpio-brgl tree from next-20231012 for today.
>
> --
> Cheers,
> Stephen Rothwell

Gah, we have a couple reworks going on at the same time and I messed
up the order of applying the patches. And the name of
gpiod_to_device() was changed to gpiod_to_gpio_device() and no longer
increases the reference count of the device.

Dipen, I backed out the HTE patch, I will fix it up and resend it
making sure it builds correctly with my gpio/for-next branch.

Bartosz
