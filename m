Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5874D5387
	for <lists+linux-next@lfdr.de>; Thu, 10 Mar 2022 22:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343929AbiCJVTJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Mar 2022 16:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343925AbiCJVTI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2022 16:19:08 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865305FA3
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 13:18:06 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id l2so13422572ybe.8
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 13:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nhFqQpiOYKlNA1YRE7vtTmb4P6NrEAao+scW0km1bcY=;
        b=nz+lWrRZ3gqsCC+znwQmxF4OHYZN722DRhu9/qVle2QU4r+oNMwHR2zp6IfA67joF8
         IFobFmwPtJKV1WtnIneJIGCsUSlyd5mKf1lX1M/Rx3qmEQqNsWNAwpwSESetnMijJ0C9
         BGc28eVvX9EGRFNdxGPkkDGuaVAF1AahP9kAU4g/6FTBQOoB9RRv8TElwsESKrBR4L2h
         Maex41H/UGCk8OZMp/Go4ykhRXQQwKh512P5LBIv/1K7o05OnIPtUi9mmIWlNvasSmhx
         K0O9vxnt9pPA2nIkDeOzo3fkxv1eq1XoW11yk8y1FkdH91YLnY17QauJbF+bOECLdMLS
         D+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nhFqQpiOYKlNA1YRE7vtTmb4P6NrEAao+scW0km1bcY=;
        b=EWP2OoI3zNuiuP/9kMUTkCVGFwzwCo2nq2df3lOzai60LnyfxoM/vtnqvy79YI07A1
         hCwMjjeDbG0ISlRXFTgqpp+/7sc7RQMzRYFAaOK+uJJwEG05Ldom6kJNH/KTMw91WVpx
         DFVgTbZZcTp2YubWp2VQ2srqaS3uX4mmKjMhmMf29+8JVlTqWuAz8tfQ3LqgjhGL9+DR
         257yUo4Smo+z7mX+c+kOm+dq1JyRFjmntqxSBuFPrJcGoeRu22KULW3PspMJL7N96ipp
         Rg2zYQ5bM9O45nrVAIecRAmfnTu6vSZ7n0YJGqJ1LXj9zMVg7PCGCczmyvADfMW+VnC3
         B9/g==
X-Gm-Message-State: AOAM531chQlBe81xWPqtyD9KWZt1rUiZZONCnA0LK7HrSjh0pi5vCe2i
        fIFo1GjuuuKxUfKkvkOcZf9/xMNZNnRcbR6U1OR7zg==
X-Google-Smtp-Source: ABdhPJwgbGyUzfjOiOmtVmNTLPhs8snB2MxBi9sXZLrsrnzoFYAKFWvdJWmcUNlV1xSdH2I0UZhfI42B76Nu1AyuIxM=
X-Received: by 2002:a25:9846:0:b0:61a:3deb:4d39 with SMTP id
 k6-20020a259846000000b0061a3deb4d39mr5710562ybo.537.1646947085641; Thu, 10
 Mar 2022 13:18:05 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXEFZVeWLaRQJmwO+Nn6uW4q6vXJOaNNTVKju1p2bMQksA@mail.gmail.com>
 <YijCkHHhpleeADAO@shell.armlinux.org.uk> <CA+G9fYtjrAMg8TykZdRyZEfRthyqom_73x87F-60C_QFeEL8Bg@mail.gmail.com>
 <YijfzAhWAgfGGqCO@shell.armlinux.org.uk> <CAMj1kXFvjawvOzeTb2m1H=P-_aXgW-ozvaOK1FtjBv7G0sCDFA@mail.gmail.com>
 <Yij2cZVKwPexGsTf@shell.armlinux.org.uk> <CAMj1kXE02HH7vRUjF3iKAL+1idKTy-oOYyGnBd3g90m6eObBxg@mail.gmail.com>
 <YikByJteDEtKi4Xv@shell.armlinux.org.uk> <CAMj1kXGnwbe=YYWaRxaXioEfTJOdXg9JYcNddO8iifpWLRZCWg@mail.gmail.com>
 <Yinwq3Z9l0selLLS@shell.armlinux.org.uk> <Yin2jQqW+pUWJZ7E@shell.armlinux.org.uk>
 <CAMj1kXGkUJ=-4oA4GvBZNK94A1MrZ7UwKDN_tJRgwq8KF06VmA@mail.gmail.com>
In-Reply-To: <CAMj1kXGkUJ=-4oA4GvBZNK94A1MrZ7UwKDN_tJRgwq8KF06VmA@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 11 Mar 2022 02:47:54 +0530
Message-ID: <CA+G9fYvEANOMekjvtu7agdVYQ_b8OMtxQdyAV2JT_vMdBU3VRA@mail.gmail.com>
Subject: Re: [next] arm: Internal error: Oops: 5 PC is at __read_once_word_nocheck
To:     Ard Biesheuvel <ardb@kernel.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Ard and Russell,

The boot test pass on linux next-20220310 tag with  KASAN=y on BeagleBoard x15
device. but LTP cve tests reproduced the reported kernel crash  [1].
From the available historical data I can confirm that this is an
intermittent issue on
BeagleBoard x15 devices.

OTOH, the kernel crash is always reproducible on qemu-arm with KASAN=y
while booting which has been known to fail for a long time.

From the Ardb tree I have boot tested qemu-arm with KASAN=y the reported
kernel crash is always reproducible.

The build steps [3] and extra Kconfigs.

- Naresh
[1] https://lkft.validation.linaro.org/scheduler/job/4701310
[2] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/
[3] https://builds.tuxbuild.com/2661dIAPUjE2DMJvye91He2gus0/tuxmake_reproducer.sh
