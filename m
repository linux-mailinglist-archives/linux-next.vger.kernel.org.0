Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A043D4395C7
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 14:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbhJYMQ3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 08:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbhJYMQ2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 08:16:28 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825CFC061767
        for <linux-next@vger.kernel.org>; Mon, 25 Oct 2021 05:14:06 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id u13so18386968edy.10
        for <linux-next@vger.kernel.org>; Mon, 25 Oct 2021 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=6e5dClZNqugBonIUDa3xy+s+zikUwDcuCRtJDo7dWDc=;
        b=UI1SGw3rj6zDGc3ho5bxfEYVRrJF9huO+iOj4Qie1YJH0hJSitseo7xPTw1jcRfSPi
         WoJjDjaRVTb02lCF+m6/pvSs934gD4eLWpn/lgZds7N4DhkkFvoyP1uUHZqHmA7cn/ce
         0V/fpkuLITE14ueEoy6pnK/07x4z0HHmubYikqlqdRzWL9rh0PSyIiW5ffhSRreX1Mnv
         6ntxhX/GjxCokmfjfjxWPgkRTQDnkPShsqPmt1DMpYTy+8ioo50/8rPiCCsztdftd0Ip
         S6PvOuNIj5aBMw91TC00gKRGLlAbXQ+RTBnv/EwhnTfEnhqauHOYLJUpO62ZK/+PoiIS
         Pt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=6e5dClZNqugBonIUDa3xy+s+zikUwDcuCRtJDo7dWDc=;
        b=K0EdyrdNzS/Vz1LrB7OGb5Fxsj/rL2VStBlxro73USpv4h5eReTJnb9o5ZEZ4GC+L4
         k7PyagMcCZiQ1HPq+iR8bog8qNX5TTDVFBCM8LxzootngHeBQh2FUPICyRVKbus+dT/R
         61CXP+xW8sQczpXYBG62SlfJ0oawreestSeFsQS96t1uYj6CzrdwcitZfxUVj3BIZBUm
         qetfkUpoLhYueUwlGoh7TpI8RoC8u5Tg5ZRrlRYWRSFUFUUaV7WpSs9Yj3Vratur1foR
         bPPSYZl7F8fiRgyKM67Rk1OIq5CMBIvuWDzxd7CguoLoSDQ1nLe4lEZQMU42CC/y0EtH
         pmqw==
X-Gm-Message-State: AOAM532jaul6tbBo6Nlipa5zfmk+VaAJU7GHVBkHFZqC/4L9zup30bk6
        PkClOmtZNMADnLMFI/ke/cE0GCoeyxX36rjU7xz9MVVh4bQFrA==
X-Google-Smtp-Source: ABdhPJwYIDzIsHOM44KEDTo1eeUMhc2q7IlHYTePt1GAveyFCSaLen+h5x5KtB67vFlUAnVpGwuzqiQ8tylPZDcOU4g=
X-Received: by 2002:a05:6402:3587:: with SMTP id y7mr25938248edc.182.1635164044795;
 Mon, 25 Oct 2021 05:14:04 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 25 Oct 2021 17:43:53 +0530
Message-ID: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
Subject: gpu: drm_fb_cma_helper.c:46: undefined reference to `drm_gem_fb_get_obj'
To:     dri-devel@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Regression found on arm gcc-11 built with multi_v5_defconfig
Following build warnings / errors reported on linux next 20211025.

metadata:
    git_describe: next-20211025
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: 9ae1fbdeabd3 (\"Add linux-next specific files for 20211025\")
    target_arch: arm
    toolchain: gcc-11
    config: multi_v5_defconfig

build error :
--------------
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in
function `drm_fb_cma_get_gem_obj':
drivers/gpu/drm/drm_fb_cma_helper.c:46: undefined reference to
`drm_gem_fb_get_obj'
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46:
undefined reference to `drm_gem_fb_get_obj'
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46:
undefined reference to `drm_gem_fb_get_obj'
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in
function `drm_fb_cma_sync_non_coherent':
drivers/gpu/drm/drm_fb_cma_helper.c:133: undefined reference to
`drm_atomic_helper_damage_iter_init'
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:135:
undefined reference to `drm_atomic_helper_damage_iter_next'
make[1]: *** [Makefile:1252: vmlinux] Error 1
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:226: __sub-make] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


build link:
-----------
https://builds.tuxbuild.com/1zzgFZBGjpQ5R0lawQFW9iJ39Hp/build.log

build config:
-------------
https://builds.tuxbuild.com/1zzgFZBGjpQ5R0lawQFW9iJ39Hp/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig multi_v5_defconfig

--
Linaro LKFT
https://lkft.linaro.org
