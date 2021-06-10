Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D2A3A2A1B
	for <lists+linux-next@lfdr.de>; Thu, 10 Jun 2021 13:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhFJLYt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 07:24:49 -0400
Received: from mail-ej1-f54.google.com ([209.85.218.54]:45955 "EHLO
        mail-ej1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhFJLYt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Jun 2021 07:24:49 -0400
Received: by mail-ej1-f54.google.com with SMTP id k7so43500845ejv.12
        for <linux-next@vger.kernel.org>; Thu, 10 Jun 2021 04:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=5q/7Hs4kxI8jI9ZO1LM9ICHbjN0HLJ4X8ULcEWSECyc=;
        b=pJoIZW3hJBXZRKxhfaIYLwUXa03G+1jMnB4xccMYDLg1ggCKX8xmA8sjjZ/yy08J+i
         zM8GTNZMKFMeZ2rA4hseI9dCjIyoKjai6OvZ4Gw9fq4NVxSLc5BEFRhqb2nfeJRw7yep
         u8Wk2cFWKqT8Ea21sOPq/XdLXAZnibPUmnadA3wRU+zrHGLmBPctcqGOzVCpuxak82u6
         j/mIRS8UC2y4JIjSguOw9M+h0vYw85LL9kloHBAL1SswPY2NDpWnWi6CEHpGx9iPf/2I
         dAgA+Fhfqn0onmKcvmeDGfECTwG2s9H0Rs6OY40N5/HVgaPdaTfxAf2iWSZp+92pP4+A
         ouoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=5q/7Hs4kxI8jI9ZO1LM9ICHbjN0HLJ4X8ULcEWSECyc=;
        b=MNG+vRvxkctFIsf9BXdSzuXHsUMI/H3xvJlb8HSWnY+AHgn11yOquoCcyx/97W/jk8
         pMWursR+S3QykjvYIm5/6TZ4GQhAXWU9Sdndur+njKi1fm+ziJgQEBu4c5segduKQOL5
         2wvcf5FSI73cz0KvmNnKFXo9xNVTmr34RlKIT3v+26yBgVe2bJ1yR+4okoPldX3QDRv1
         RZbk8/Gb4F0cgY5AZ2QYIt6jaAcrVGrQwaKgXHVhUS41hOsPE4iweZxwcIfieIKhywMW
         u6LQi5yU9fnZXLrWjYEO+uQoIE4UScgK+z4yqQ5RL5sSzhkXFuG0jswFwLTEF9iiWz80
         FHWQ==
X-Gm-Message-State: AOAM533fuf3Yt2RmnvBfi/MO3G4RQPf6VY7Emp0BfmcLodjOpUzXsQG3
        8S2DC7/dQe6zawOZ8WNMwrG+raWErkj/EE4J0nAd2Q==
X-Google-Smtp-Source: ABdhPJxnRtV6u9DGZ0cSGjEPOfaB1Km3RG3MByG37mKs0Axn6pU4OoOwRZ0GWm4HfqaH3bEoKQDO1Xns+8cDlYeadCc=
X-Received: by 2002:a17:906:d0da:: with SMTP id bq26mr4107730ejb.287.1623324101557;
 Thu, 10 Jun 2021 04:21:41 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 10 Jun 2021 16:51:30 +0530
Message-ID: <CA+G9fYuaV83ZMPHdUd_QmYmzUeyuqgvYOEdimzXZMSy9fehEsw@mail.gmail.com>
Subject: ERROR: modpost: "__aeabi_uldivmod" [fs/xfs/xfs.ko] undefined!
To:     "Darrick J. Wong" <djwong@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Brian Foster <bfoster@redhat.com>,
        Dave Chinner <dchinner@redhat.com>,
        Carlos Maiolino <cmaiolino@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While building Linux next-20210610 following builds failed due to
these warnings / errors.

 - arm (davinci_all_defconfig) with gcc-8 / 9/ 10
 - arm (davinci_all_defconfig) with clang-10/ 11/ 12
 - mips (malta_defconfig) with gcc-8 / 9/ 10

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
ERROR: modpost: "__aeabi_uldivmod" [fs/xfs/xfs.ko] undefined!
make[2]: *** [/builds/linux/scripts/Makefile.modpost:150:
modules-only.symvers] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

steps to reproduce these build errors:

# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch arm --toolchain gcc-9 --kconfig
davinci_all_defconfig

ref:
https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1334701899#L312

--
Linaro LKFT
https://lkft.linaro.org
