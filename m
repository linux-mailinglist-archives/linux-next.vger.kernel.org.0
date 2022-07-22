Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC7AA57DB2B
	for <lists+linux-next@lfdr.de>; Fri, 22 Jul 2022 09:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbiGVHS5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jul 2022 03:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbiGVHSq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2022 03:18:46 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BCB972CA
        for <linux-next@vger.kernel.org>; Fri, 22 Jul 2022 00:18:35 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id j22so7118848ejs.2
        for <linux-next@vger.kernel.org>; Fri, 22 Jul 2022 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IKcHWhHLCbnuHvgLiKMwDvz81Pgdj8AXCEWxJOu/1dE=;
        b=sc2JUCYXDtkMU8ccXbzIM5u4hTQHKWEweOGwEP1DLnS7mV+uQZN3xKOOuiyntqa5zS
         Jm+3fqTrJniRxLPk3hcFbCLERc7GUUopb208cJIi90gIymCqQ3HoDU4CWvCt9OxUIYWc
         kfuPr1MeAwWzQEGzlCy8NfzW2U7y1R19BiDo7xhXtX/GsfxbxYGDcGuKxE/PEf1dfW3B
         wdhBcJP4HpzoZoiViVw7qBTM6Wy6xYrJ7WJgTnt1+XxFrHmlay8RAFJ05oRMSMMyHCmw
         JxEO7yYO4Ly0NnSm7PV+sFI7UiwskDwN38u+dHy9Bxqw1fCCLoHukvqDD0TIHtVI8234
         CTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKcHWhHLCbnuHvgLiKMwDvz81Pgdj8AXCEWxJOu/1dE=;
        b=U81xmWMlLgw5qKMeOCjcL1RUPsl7WPDtYMiEZdSGjqF5FZbHkl0XG4nMtag26fBXfD
         LPMTaIaORWHlGzhgZnkHxYW9BLwaM+/2Yl6X+fGWRDX+Cnp6c/1oh92ltve++8NXOD1b
         j731R3XIsU3sABkjsL3yXNiEZEO5BZawRY4bXqfeu5WbVOPG//uYSd3ZZ1FbpS2owouH
         PJqV3rYBdGaaoofyUMB46Wb6b9hc/KK36wAziFYBjodjUXK3f5tIOPmToJrO6+pZ2/pB
         AqoLKLiZVPNHGJVnxaTRFx6Tu1bfJyjPWPxLyGTRc7SahpF4+M2b/aK3Bc52DsFEY+ZO
         gn5A==
X-Gm-Message-State: AJIora/7A9nX8Jtul0o2uer4du/nq95bGyDEHToWCBcxPTxGd1v36gFr
        1q5qNp1eyIv+mDd57QPviRaMMkFY7dLNFxbbrGlpNZvmm6Q=
X-Google-Smtp-Source: AGRyM1sa/4VkRblJLNUgVvrJHsqn5/Kg8T/Pt5KH3qWjYSsuyLK0p49NFzFHKCAKjc5leZV+Ciwd5XDbh6Bgs+1pwOk=
X-Received: by 2002:a17:906:2dd:b0:712:1293:3dd8 with SMTP id
 29-20020a17090602dd00b0071212933dd8mr2076705ejk.448.1658474314198; Fri, 22
 Jul 2022 00:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsuUdyUUUa_Xcfzfnh+Y8c82LnjeHum31C2ancBdxswCQ@mail.gmail.com>
 <87zgh2y35y.wl-maz@kernel.org>
In-Reply-To: <87zgh2y35y.wl-maz@kernel.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 22 Jul 2022 12:48:22 +0530
Message-ID: <CA+G9fYtB=5iHqNiL+=dB0bHfmTiQYyKhbabep7z4-0ZOUBZiUA@mail.gmail.com>
Subject: Re: arm64: defconfig build failed on Linux next-20220721
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Aishwarya TCV <Aishwarya.TCV@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 21 Jul 2022 at 19:32, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 21 Jul 2022 14:53:03 +0100,
> Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > arm64 defconfig build failed on Linux next-20220721 tag kernel.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Regressions found on arm64:
> >    - build-gcc-11-lkftconfig-64k_page_size
> >    - build-gcc-11-lkftconfig-rcutorture
> >    - build-gcc-11-lkftconfig-devicetree
> >    - build-gcc-11-lkftconfig
> >    - build-gcc-11-lkftconfig-debug
> >    - build-gcc-11-lkftconfig-armv8_features
> >    - build-gcc-11-lkftconfig-kselftest
> >    - build-gcc-11-lkftconfig-kunit
> >    - build-gcc-11-lkftconfig-libgpiod
> >    - build-gcc-11-lkftconfig-kasan
> >    - build-clang-12-lkftconfig
> >    - build-clang-14-lkftconfig
> >    - build-clang-13-lkftconfig
> >    - build-clang-nightly-lkftconfig
> >    - build-gcc-11-lkftconfig-debug-kmemleak
> >
> > make --silent --keep-going --jobs=8
> > O=/home/tuxbuild/.cache/tuxmake/builds/1/build
> > CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- ARCH=arm64
> > CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
> > 'HOSTCC=sccache gcc'
> > /builds/linux/arch/arm64/kernel/head.S: Assembler messages:
> > /builds/linux/arch/arm64/kernel/head.S:334: Error: immediate cannot be
> > moved by a single instruction
>
> See https://lore.kernel.org/r/20220721124244.903567-1-maz@kernel.org
> as a potential workaround.
>

I have tested this patch and the reported build problem has been fixed.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

> Another solution would be to have Peter's patch in 5.19 but not in
> 5.20.

- Naresh
