Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50277C9FDD
	for <lists+linux-next@lfdr.de>; Mon, 16 Oct 2023 08:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjJPGqn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Oct 2023 02:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJPGqm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Oct 2023 02:46:42 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F8FE5
        for <linux-next@vger.kernel.org>; Sun, 15 Oct 2023 23:46:40 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a7eef0b931so51675367b3.0
        for <linux-next@vger.kernel.org>; Sun, 15 Oct 2023 23:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697438799; x=1698043599; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dQQiPsq+ki3Zsy1687dcKYniTRWsroNOkXxpPxDNmMU=;
        b=EOK03tWpHMAUIiq1hWgKTxZvyEHMUBFjUNkKtTmxjyZ+LQoxpImDMU7Vi6kqoDkuCi
         8HJCPrLO0JjFWVQJLGgL1LioE39bL+WPicLdXVtp7dqu2QBTjo/rAE1fNtgVkMD05w5F
         NjqCLQeum3+HomAQSVs9YtrpRVm/mMa/dZwfLuyu0JsUbK6artzdBMlO80oIkmocJ7u1
         m6zzxgS4G/Nq/qHa5F5WfthrsnyRSOde9p/EIab2m4aWH/V1dyOVO8pd4HJuItmELvAi
         +GHIEscgyP3hLNZNeixCWochmWLD+EjMTPx6PrmDk1stY2joqv6mVmJA5AZcAp0kPOtr
         XZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697438799; x=1698043599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQQiPsq+ki3Zsy1687dcKYniTRWsroNOkXxpPxDNmMU=;
        b=MfAAIfyZEiJKTLmfRcazpnJ5reumgu4xQEPytyfDy74o+oO8VlXC2t8sEybR3im0m5
         3D/6Z5xRq68wCD4aCRKouvhs5H8nBDJiUWB3g/3Y8ntW/XTt5ACtVduiuIyZPvtOxJiI
         IPkjcrGSeloHajHMt5wN1LyUkJyOyhzzOnRcmk+dNRuzD+Xap4LzlVmVD0aTZEpw9oDP
         4xr/gt2HfQ+nnMZsgtX/MZBN4iUTzTl+5KjiM7dxU13iD9wPOs/BIHuFz/aGU9J8rLc+
         ecY8Bqof98kWCfqYtKaFLR3y6ipPZ46OYuKHMqoSStAT5n7sUvSAqWNvKvS57dUwdnEr
         x0Yg==
X-Gm-Message-State: AOJu0YzlinHRDiVojBPA51opvscYNuQDhm2LLaPsqFHjan8ID/KBNxQm
        p/wLnHbqLqEmvMcb6hiQiARk1s69dknQN9xkmXbkHg==
X-Google-Smtp-Source: AGHT+IFsjMPNeszkvSCvgbKhGdOnZkVhdJIb/V4vLfZKT7g+LqOpig7orC5ItfeKWUYxLIM7qVUxH1Zy+bFXn6i4Be0=
X-Received: by 2002:a0d:e3c6:0:b0:5a1:635e:e68 with SMTP id
 m189-20020a0de3c6000000b005a1635e0e68mr34835374ywe.46.1697438799711; Sun, 15
 Oct 2023 23:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231016134159.11d8f849@canb.auug.org.au>
In-Reply-To: <20231016134159.11d8f849@canb.auug.org.au>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Mon, 16 Oct 2023 08:46:28 +0200
Message-ID: <CACMJSesS-faA0VLTbX-8szNQCkYCX2WvzyW93jb3P_ttzULCLw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the usb tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Greg KH <greg@kroah.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Wentong Wu <wentong.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 16 Oct 2023 at 04:42, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   drivers/gpio/gpio-ljca.c
>
> between commit:
>
>   1034cc423f1b ("gpio: update Intel LJCA USB GPIO driver")
>
> from the usb tree and commit:
>
>   da2ad5fe2292 ("gpio: ljca: Convert to platform remove callback returning void")
>
> from the gpio-brgl tree.
>
> I fixed it up (I just used the former version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell

Looks good, the latter patch converts the driver to using the
auxiliary bus whose .remove() already returns void.

Bart
