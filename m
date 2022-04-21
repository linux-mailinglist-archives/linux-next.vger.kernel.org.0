Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C049950A1D4
	for <lists+linux-next@lfdr.de>; Thu, 21 Apr 2022 16:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbiDUOQD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Apr 2022 10:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389010AbiDUOQC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2022 10:16:02 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FEA3B2AB
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 07:13:12 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2ef5380669cso53343677b3.9
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BVdgNSxnqlRfmwe8g4I+HMnSr43PE82uzgUTPoHty5M=;
        b=SsgZeROgBcjGTbWNg8Zq2LszA8AA5+00vAOdxztiU5YMcWe5eaBtnc+d5m0hRR05P4
         NZ4jSjOylNjS7mdgUaH0ttKhQAcJ5dmNwhEQHyGFd+63Cd8SCx1N7ZFFHP6m01OCkHg4
         pkHftebaQAaGut+o0SJxac+Lks2RI8p2Q8+X9WC6a6oPGKgyRGvg7Cw0parldyYWsbeh
         9YA6kWUmbDcnhBtMmCOCKUqxn7h9YJhHsv4k3us75BxiGGk0MBntPylBe18SQhmo7/D1
         VN0NYSFxoQxb5ZHW5Ng8hFBekz0Ttn0lx6NQ+OC5Hubf3q9Es6599ZpRW2LHvKkCCnfL
         0QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BVdgNSxnqlRfmwe8g4I+HMnSr43PE82uzgUTPoHty5M=;
        b=xBA2XmvINHznKuWOvk0N643APnjC0WTj3Rvm+QzeruL/t7bapizvkK9cLZpjzCTc4u
         QUXVzIm24497J1LdshDw0OUz/qI1LrgAaRpzQaJlzcHLij0/7o6c6GLmjE+n14qPLK8i
         Psmy8WS6UA40/Tqq62hh0UNkMSCK4Y5j1FHXVuwRK28huUIpju0tKxONBHIXjCyVjnXG
         4eAmxondP0qN7xw2kvjAzBCyGI9+Xtiw+YPPp97saUguFZzoYd3EgpfZM7nxAKAuZOSQ
         Ji2iB0UkjqpMD9Nw7nKDrSTmnCKgP+IKZJZYdRbMIcs8Rt8gVFIfJOS8JZSrEKAMn46r
         GiTA==
X-Gm-Message-State: AOAM533wHs2oX3KeHgRPv+haNY2pXCVPdm3PdTkiGD7SjyLk+Q/POFBJ
        eXMnTHWCq2LxU0FiulVdRnP7FnNG5Wdsp18Sxy90zg==
X-Google-Smtp-Source: ABdhPJx6MotXbIXBoeAXHCzviwv22N02CGAiZIi668i5QBawtCVnYBGsHOfXEsIP1aI4HTeqYfd7Amcq+winOd8x0pI=
X-Received: by 2002:a0d:c4c2:0:b0:2f1:6c00:9eb4 with SMTP id
 g185-20020a0dc4c2000000b002f16c009eb4mr24271998ywd.448.1650550390035; Thu, 21
 Apr 2022 07:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220421171116.6dbe87cb@canb.auug.org.au>
In-Reply-To: <20220421171116.6dbe87cb@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 16:12:58 +0200
Message-ID: <CACRpkdYW81iLveJoNu2RDEpySqRcXWqq4XGhGFMYdLvBzhRsUw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 21, 2022 at 9:11 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the pinctrl tree, today's linux-next build (htmldocs)
> produced this warning:
>
> include/linux/gpio/driver.h:507: warning: Incorrect use of kernel-doc format:          * @of_gpio_ranges_fallback
> include/linux/gpio/driver.h:518: warning: Function parameter or member 'of_gpio_ranges_fallback' not described in 'gpio_chip'
>
> Introduced by commit
>
>   a9491df0c4ae ("gpiolib: of: Introduce hook for missing gpio-ranges")

Thanks, I just folded in a quick fix into the offending commit, a
single missing colon.

Yours,
Linus Walleij
