Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE64A4768C8
	for <lists+linux-next@lfdr.de>; Thu, 16 Dec 2021 04:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhLPDmE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Dec 2021 22:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhLPDmD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Dec 2021 22:42:03 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E43C061574
        for <linux-next@vger.kernel.org>; Wed, 15 Dec 2021 19:42:03 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id e3so82874697edu.4
        for <linux-next@vger.kernel.org>; Wed, 15 Dec 2021 19:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=D5vroQmbiOUSX8kzvh85MrZRewy28SouUuDaYvVL1xk=;
        b=jubXd+Iye/GbEdaLEL8jENHjJPcuwy3ld5c//PM/dePq7JdfiK8OYbt7aFdfLGlc7Q
         5+nXPyZwD3D+51JO1uuxCrtHufwdTHOwwErFBEtuLZ3uPdNFwQFcKJyrjpHAPY9fXn0l
         7QLk86MDhYc++nhye3j8a/K4dknggq6fdw+/mLfReDyzeuMMlRLviF8oYOCuWiBiolgL
         7IMvt50arqf7fnEfIVZ/plX78dASqyABVTSMnOfsMUcRTUzupxbZZdGDHUPHG6EC8/H3
         3hVa4JNMU1nrMd/pox9PUrVnCJQkF/hT+4y6OTnnrnHEisCFgwI1P5/GI+UuFddvl2ql
         p8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=D5vroQmbiOUSX8kzvh85MrZRewy28SouUuDaYvVL1xk=;
        b=PhMsnAA4f/6r/yYUU5UqoFIhEAR1yqTaEWtdjOlteaIh6TxlH1FBkX0eSxZ4pgM4hl
         aGqWzdarb4gHctPajNCsVWEsNdM+76K6R5WcEXWgPFqlTFQVhNLR924mzmog3IUtM1Fr
         UWivoYVo0ClHkfUCKOmUnG+HS1TFKhMBEfpo1/+HDR8Hh4G6TbQraxeTuQD15hU4U3q6
         ZZZfh1Sjtk5ujXhkM5zRS0qT8fRFzrpvZ3IqZg9nLoXj9SNqCVRxIId2OpePotseaiu8
         NvKpH9ZI99ONRHBwx70NGLE74o/COwwpRuVjdbpkXXS9CA/8HqDq2KGeL6MwUZz9Qkf0
         PIsw==
X-Gm-Message-State: AOAM531xBh8AXmmBv2hzwI8lwgpi92gCt9/z2AuCDIsfeyYvqU+yvfiQ
        67gw0e3YHm6JldHg69CHvqfxcqfpw5oltCXYsvVpsw==
X-Google-Smtp-Source: ABdhPJwEpp+aPuprraQp/ygrjtR8hkWKmLdkWmyM1VFRInXjfWgoaAiaB0HvoGHFeDsCC6LH5KyxzlJVMwTJ4T3vfxA=
X-Received: by 2002:a17:906:c148:: with SMTP id dp8mr7141488ejc.736.1639626121392;
 Wed, 15 Dec 2021 19:42:01 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 16 Dec 2021 09:11:50 +0530
Message-ID: <CA+G9fYsy+ekg90TEcXZPN+89GD7rZSsACZvF8i2foN8msHjqmA@mail.gmail.com>
Subject: [next] arm: dtbs/imx6ulz-bsh-smm-m2.dts', needed by '__dtbs_install'.
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[ Please ignore this email if it is already reported ]

While building Linux next 20211215 arm defconfig dtbs with gcc-8/9/10/11
following warnings / errors noticed.
* arm, build
  - gcc-10-defconfig
  - gcc-10-imx_v6_v7_defconfig
  - gcc-11-defconfig
  - gcc-11-imx_v6_v7_defconfig
  - gcc-8-defconfig
  - gcc-8-imx_v6_v7_defconfig
  - gcc-9-defconfig
  - gcc-9-imx_v6_v7_defconfig

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current \
 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' \
 'HOSTCC=sccache gcc' dtbs_install \
 INSTALL_DTBS_PATH=/home/tuxbuild/.cache/tuxmake/builds/current/dtbsinstall/dtbs

make[2]: *** No rule to make target
'/home/tuxbuild/.cache/tuxmake/builds/current/dtbsinstall/dtbs/imx6ulz-bsh-smm-m2.dts',
needed by '__dtbs_install'.
make[2]: Target '__dtbs_install' not remade because of errors.
make[1]: *** [Makefile:1465: dtbs_install] Error 2


meta data:
-----------
    git describe: next-20211215
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    git_sha: 93bf6eee76c0e716f6b32de690b1c52991547bb4
    git_short_log: 93bf6eee76c0 (\"Add linux-next specific files for 20211215\")
    target_arch: arm
    toolchain: gcc-11

steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
https://builds.tuxbuild.com/22LD3lFkujTbdIk5l92UpxMvBWx/

--
Linaro LKFT
https://lkft.linaro.org
