Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E93972E3
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 09:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725268AbfHUHBO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 03:01:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42832 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfHUHBN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Aug 2019 03:01:13 -0400
Received: by mail-lj1-f193.google.com with SMTP id l14so1090052ljj.9
        for <linux-next@vger.kernel.org>; Wed, 21 Aug 2019 00:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45VwxPMZ2VRTdvGcS6InzQ5jT8ovuVn5bmoUU3rlkSU=;
        b=RMKm8u4aDSYop1iSb3Gr6mPLG3mGQTPimrATSgn1UAhXY9PdU0M+EFKRzBvXhRrbk6
         cVVVYUvMuCTtBJCbNZDav1n9HZl/C3LwRD87ZuP0ua+k03/iACX2NVVP57WPfg5H6EXQ
         KB6EGLymq+dTSromI57EF3NrDGbTaHjNAHFN7bEShqfKNTy3KObSsQcHvc7CeG32O5M5
         eTtzLUu2PbiTCCntA0bCBtEM3vUuY0Jrfz5I2J8aGajQclbrZnuszRGECKEO8WW+8dR1
         jtet4kko5WNee74vzaFS+pUuYR0CUCBPLRfjPB0pqPmMgvL+b9Pf3mIpzczJxZxYUvyj
         mVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45VwxPMZ2VRTdvGcS6InzQ5jT8ovuVn5bmoUU3rlkSU=;
        b=U5Fs9hI5Nso2VNyrLX8EMnFvCyGSLcOTgeXlKyczpqVnZgCGJk9VLYVpUjy13XfaDt
         U6ZvzSJkVutUNn2tLvq/fwhZ57HLqw2jiH6cWo+pJairEGMY8G/RWEN9t12+qs2A+NFm
         jC1Y1H1UkBOCW0Zq1jRfsphL4Hyssic7aWD4kLeYpONmCbXYItfqIB9lrNzDxUkhLX23
         SpQt+fThhDLwCMtBQA6ddPOyT759/aEqoksGWSXrkvL0ZvKYWneoO60ZFozGDLSUSQdO
         iWyTD18AynnB+lPH9HzumClr1HVa/DlJD5FkCzmLBp4qyPhjD86reI4o+mO9dDkkITSg
         mtqw==
X-Gm-Message-State: APjAAAUQ8ihcezGjiCYKHTUv3oQGOAwrMqqrr/kTuw56EUVtw8piG0+A
        KM4MX1+MKWyPvt76eGzhvES5YgaaU/eWFdGf/bTWbg==
X-Google-Smtp-Source: APXvYqzzxpc/KIZteudGF3ML4Pwcop+gQzvsBym8rGDx914MnhHB6d4FabwwAY98D2vLM2yvWZJMLmMX1KYPGXhN+IE=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr15248039ljg.62.1566370870887;
 Wed, 21 Aug 2019 00:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190821161620.403f663c@canb.auug.org.au>
In-Reply-To: <20190821161620.403f663c@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 21 Aug 2019 09:00:59 +0200
Message-ID: <CACRpkdZUpuK2fg9ASF_0z_c=9r2sk0vU5JKsje98J-Qt1aQSrQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 21, 2019 at 8:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/pinctrl/pinctrl-st.c: In function 'st_pctl_dt_parse_groups':
> drivers/pinctrl/pinctrl-st.c:1212:15: error: implicit declaration of function 'of_get_named_gpio'; did you mean 'of_get_address'? [-Werror=implicit-function-declaration]
>    conf->pin = of_get_named_gpio(pins, pp->name, 0);
>                ^~~~~~~~~~~~~~~~~
>                of_get_address
>
> Probably caused by commit
>
>   712dfdaf62b6 ("pinctrl: st: Include the right header")

Yeah my mistake :(

I made a v2 patch fixing the error and took this out.

Thanks,
Linus Walleij
