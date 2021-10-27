Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B4343C06F
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 04:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238780AbhJ0C72 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 22:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238755AbhJ0C71 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 22:59:27 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AE9C061745
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 19:57:02 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g8so4606525edb.2
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 19:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+MnMGWD/0lv6QE/2RZDyhTwihVaLaY/cF7VXa6a77gU=;
        b=ZaNVx/jqk9FWOrIgexWO/hOBqGfCeeBmqbojUEelH+VIpmg5St9QloHjV2C1+VvhTT
         t7MPi+nZ4z/Fo15zsr28uLoGGxiK6FvKZMnMqv4hPPkre96n58ktGO355LHuuQ5H1CqH
         eaEuYLl1bJjgYwCaabrq+lq4D9ku5jq+J+TaScuvWE1m5CPtDTOaUx0EXIMDiMZ7uyUU
         9zjDyq2q16TEwZgTO72CuOGgixDNxjAF67A96baU6kD8hkWePLImvIALsVxiJPFPa9x+
         2P3f7WuDYHsxQIk4UVy1JC7oR0xJovKp/QU50a6GrBYwoY87R5ClSagU53FAfV4zXlch
         fOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+MnMGWD/0lv6QE/2RZDyhTwihVaLaY/cF7VXa6a77gU=;
        b=oCQvJqzKGKjPLNLAicO20ld6wNv2getexwDRs/ScedU8wHIpu7vtCSYxOGowYX4B9Y
         x2pC8AiJ+mZxX3xSZjusd7UPphDFReW835rjemcHhDfoMw6fIjRmFJ2NiiTvINnYBsDZ
         jYfwBB7ODP5+XKgdcEhEYRk9HhI2547aC2lvkzyfhxalNsX8Sp6NP+juvD+6RxpxVxAZ
         mRvFU4ftuZ2Q0YGRhd5mcIaE82Pk1MDwADLkHNBy9p8lxNYqMbLNVFRWQEUQdxrcX6BM
         Bp7LFC8wA6HTyNL11Osc1xnzhVXM168bcW3+3P9UJalXr0DqzuLX0SxdgYj4FXH55NQ7
         +b1g==
X-Gm-Message-State: AOAM532hcSOv9RzypwlC/yeP0HsebabaOHvSKkjyncLIuqkZlog8HosC
        sj5isAORTTW8Q7X5J2kdSrfEEr3xBv5EOkdevcFing==
X-Google-Smtp-Source: ABdhPJwIK61/V7qcKbhx4yii4iHXjQOUbVeTBUCQwnBLVrY1BbKYFYOd48L8rLqNKXbJxAp/xU4REFHyMBfMvTKiQy8=
X-Received: by 2002:a17:906:c7c1:: with SMTP id dc1mr35935786ejb.6.1635303421412;
 Tue, 26 Oct 2021 19:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <CA+G9fYvdhk-H8wBDdaPmRMZS_egxndncUkbZ92HCnUFD1g_wSQ@mail.gmail.com> <b26491f8-66a4-d532-e866-2dc0ecb922d2@suse.de>
In-Reply-To: <b26491f8-66a4-d532-e866-2dc0ecb922d2@suse.de>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 27 Oct 2021 08:26:48 +0530
Message-ID: <CA+G9fYvsfNO5qNj7TChXQ_si1xDwL3gqyM+8SUgCowocpRqKdA@mail.gmail.com>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to `drm_gem_fb_get_obj'
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Thomas,

I have tested the fix patch [1] and it works fine for me.

> Could you please try the patch at [1]? It fixes the problem for me.

=F0=9F=8E=89 Pass: 6d61a7c3bc2a ("arm: multi_v5_defconfig build fix")
 arm (multi_v5_defconfig) with gcc-11
@ https://builds.tuxbuild.com/204SnLe1DFWQ4iAHpwAMiyUcpsL/


> Best regards
> Thomas
>
> [1] https://patchwork.freedesktop.org/patch/461426/


Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh
