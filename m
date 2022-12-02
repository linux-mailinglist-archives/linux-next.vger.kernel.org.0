Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 996456408BB
	for <lists+linux-next@lfdr.de>; Fri,  2 Dec 2022 15:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbiLBOst (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Dec 2022 09:48:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbiLBOss (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Dec 2022 09:48:48 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7BFCA790
        for <linux-next@vger.kernel.org>; Fri,  2 Dec 2022 06:48:46 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id v21so1745584uam.1
        for <linux-next@vger.kernel.org>; Fri, 02 Dec 2022 06:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OuRJnTeKjq6r9MP1xf+PA8XGnVHD2Jj2xuTkOIE2tQk=;
        b=twdZXXS67RdfArXAJw6kcz/cz8vYVZPOq3b130pTjReT9osmyrVEKuLFy2G5Mcx2md
         5kQCBNSgUq4cFpRwMBGMEkdnOwyETrzp/0pNio0FwDRXo4Dhnv6QJE03oKH/dchUaS0/
         PI80t3r2Msf1MKHzHjXGEbu46hie45f3xX6XqZdbnat5HOh0OnFk8cSKwxxI2AstrrI9
         gF4/FXShFcdSDTmqqSz1jg69tU5E2JoeIO+jov3u29rOZSRT8BNq53jNgtLEFhJa/BCW
         4CA1HMHaW1KAE20njaB2bp6wpVDTN+Iw7Sqkfg+Ha69NqEDz7aVFRBPyniLtJh6Xug23
         kYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuRJnTeKjq6r9MP1xf+PA8XGnVHD2Jj2xuTkOIE2tQk=;
        b=XWOAD/c58KT7ODKKTNSP4OH+kUdtE6YiKZ6JWX7T+qL31d/ZdC66VX2b4ue5hN6Rg1
         Hl9hc7tkYqt5+Ln/a9zHnFKkaS94lElKeCha5VF3ZXBYd9whKuoMZxTtiO75AdpGXiKK
         mq6ENBHSpXI0FIevFHnavi4bwquX2hsIErOR2BzAG28M1edNYX1+h58sgzJixR226vje
         SxMuGpmmxOQN06s5Jex4IuC9YcciP4+hD09WEZRFdf1h3V5ddEhW5hBKQmdTafITrBTw
         1tlbcj9/tas0iwUQ9XU2DpR2e9Fxx/uqtelrt5XoCV7cc+n5donL0NidOST++c0QRBmz
         LU6g==
X-Gm-Message-State: ANoB5pmicoKG+dGmAe2nXfpi/WMHDQ/664gOT1g4MO6wXvXeFp58/ktp
        ARJeOQdnYBr2ZG5ScXYNDFii4qdHpP5pMU3Aiptu/w==
X-Google-Smtp-Source: AA0mqf5UrkL+mO8lgA+r75PXKEDapjawSRlt4JOXRkCclgc78M/8JXJ/f8uZycm3gMKctvTYCo6b8W32UIk6+S2Z12I=
X-Received: by 2002:ab0:734e:0:b0:419:18c7:58d with SMTP id
 k14-20020ab0734e000000b0041918c7058dmr16962245uap.119.1669992525433; Fri, 02
 Dec 2022 06:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20221202140454.273333-1-vincent@systemli.org> <Y4oMCYksMaQ6KYwU@smile.fi.intel.com>
In-Reply-To: <Y4oMCYksMaQ6KYwU@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Dec 2022 15:48:34 +0100
Message-ID: <CAMRc=Mc2XtcbZPh5pic_uYiOuie0+5KdMO2hJav2HYGc_3ygfw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix compiling when CONFIG_GPIO_CDEV_V1 is not defined
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Nick Hainke <vincent@systemli.org>, linux-next@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Dec 2, 2022 at 3:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 02, 2022 at 03:04:54PM +0100, Nick Hainke wrote:
>
> Thank you for the report!
>
> I believe Bart needs to fold it into his patch / PR, because
> it's not good to send a broken PR to Linus.
>

Ah cr*p, I saw today's next build went fine, so I assumed the patch
was good to go and sent the PR.

Yeah, if Nick is fine with that, I'd like to squash it with the
offending commit or we'll break bisectability.

Thanks for the report.

Bartosz
