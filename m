Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168B9738354
	for <lists+linux-next@lfdr.de>; Wed, 21 Jun 2023 14:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjFUL2u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jun 2023 07:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjFUL2t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jun 2023 07:28:49 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C84E6C
        for <linux-next@vger.kernel.org>; Wed, 21 Jun 2023 04:28:48 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b45b6adffbso77794271fa.3
        for <linux-next@vger.kernel.org>; Wed, 21 Jun 2023 04:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687346927; x=1689938927;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4R8fi9cYEPann0vyPeei/XBYWeLBvD08A7Gh7y01sdE=;
        b=bq0jNGfoVdWVdBkIePcR2DdDezrb/Bt7PnT50R2UdEYleSd/Pu6NAPVe3l6PgAbyyK
         UNgMgLLfO1wP9pDDQzrwEdhNICLnywylMesfKaj+JbRgVC92XA+QAHvSgU3/6Vk8iSue
         In/YWUXS1H1bY3x0udkE7NKU4kNR8WLeNT65QGpilzHZM59EuElzS9rQBkJzaZyPlkbU
         8vEJ9S1x7dfiLwR7wBccDimJXa8wjR0wdZS1v82PChE1JP7cbWGOURiXagumljnBy/Le
         vPDVTivGancHY/Nfosv8M6hv5AsKBFi3i/ZeCylVi6g8Rz7BNQhnFfDkZpGKYPM8SDuS
         SgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687346927; x=1689938927;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4R8fi9cYEPann0vyPeei/XBYWeLBvD08A7Gh7y01sdE=;
        b=GUvmoqxRUnwnIyiHt5RwL2ywDcP++qnmQy+cPTqwalCoS//8VXL69kbJrjxhHH9Q38
         yzXRNAuAPA4flhEG1cwCX9/TUQNpbWbQJv3w1n55bzmuEFf/1/aY3Rcz70rXjSaPHPiC
         GY/adniLadO5ca68k0DQQjFtHEw36wMIEWZm28x/KFiZj4Sd3t+kOl2zSXGq2LNxPZ+S
         KrntnhCqOgRDCkEi83rL9qB6pO5vhf4ykpwyWKBU+mQi0fYyAwgLx0pLyhCM8QmTgNzE
         EnujPxCcIe+o8761fDftpRxULkjE2HGhdxabjG824ZrcMer2e7uQXKsg5w66TaDsx7T0
         TVQw==
X-Gm-Message-State: AC+VfDx7QBLOI5TFB2knJOqab9Lovgkzh7EaWTmN+kM0I8/db4oD6puz
        gUqA49a/6GFWG9jZZktwQ6o7B0AdVrGqQ0bdFrJDPcQlm8eQtpnZhLp5Ng==
X-Google-Smtp-Source: ACHHUZ5HtzMh7LUuRksb6o3JVrqkR/L5C9aO96+ELySDfrXwynxSqfswwDvIB6mKQsvwyuS6UvwKeVb6Md2wgbHq2fQ=
X-Received: by 2002:a2e:7003:0:b0:2b4:70b1:af01 with SMTP id
 l3-20020a2e7003000000b002b470b1af01mr6906098ljc.20.1687346926934; Wed, 21 Jun
 2023 04:28:46 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 21 Jun 2023 16:58:34 +0530
Message-ID: <CA+G9fYtoB7nxiNp23PyHwZpODwA0OPFfbUaK_PWiV9DO34VKjA@mail.gmail.com>
Subject: next: drivers/irqchip/irq-mxs.c:12:10: fatal error:
 linux/irqchip/mxs.h: No such file or directory
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following build regressions noticed on Linux next-20230620 and next-20230621.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on arm:

 - build/gcc-12-mxs_defconfig
 - build/clang-nightly-mxs_defconfig
 - build/gcc-8-mxs_defconfig
 - build/clang-16-mxs_defconfig

Build log:
--------
drivers/irqchip/irq-mxs.c:12:10: fatal error: linux/irqchip/mxs.h: No
such file or directory
   12 | #include <linux/irqchip/mxs.h>
      |          ^~~~~~~~~~~~~~~~~~~~~
compilation terminated.

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230621/testrun/17700541/suite/build/test/gcc-12-mxs_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230621/testrun/17700541/suite/build/test/gcc-12-mxs_defconfig/history/


--
Linaro LKFT
https://lkft.linaro.org
