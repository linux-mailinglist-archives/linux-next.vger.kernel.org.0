Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE06467151A
	for <lists+linux-next@lfdr.de>; Wed, 18 Jan 2023 08:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjARHgQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Jan 2023 02:36:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjARHfU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Jan 2023 02:35:20 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E5293723
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 22:51:18 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id q125so22996506vsb.0
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 22:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kie7n9eyX2y+8J9SsgwusItXi1rTkJJNsJ1PDD++j0E=;
        b=B3s3j3N0gG+bNvJM1kixcYCNP/GKIWVHPyV4lr3MVXl/p0N7BMpYjYlyLkA+JDNEwK
         YPBayZkNvzY9TJMNbLdgwh74aQGMywjDnB+HgnS0sAYfB7rOXeKINkcC80Dq9Chxv1DM
         1Tew2QJlCzFdNmJd4aYvCOrI3jZfPsBDrEg+t6exzkc3wFZhl1TDhr3dj3POyWbweOYR
         +7Npg6iCsUQcJq8UB4rK0rr2tOPePqrnq2X7W6XikqLyrIoHUkuWy0cFKeDRI/7G0kUt
         bC9HiI6ACpwicvuUfC9hiCdSxpSHxHZNDelqvQnkWIAm1HWc1SKEmSTBl5163j53Jqb9
         dDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kie7n9eyX2y+8J9SsgwusItXi1rTkJJNsJ1PDD++j0E=;
        b=1EjWKjkfvDpMP2zywz4FNqRFaYMvZHOYSXY61t/8YT1jDT7UZGVDSANYUAmBd1kVjx
         Ku2BmTqfRjvaspwVxZ3epY4dTpmIFJcYRMhh956MC2NibEnmXIzC8Af/N7lZCUhMtrCc
         vDrkVcqymb5I2vJ5XB4ejpAbLcUB2pESVb/5y2q7OxU8yrdYveGVZc2GPA4VhqIjR+zT
         Reu4j7CJuqFG8Vt5mBwpDgW9J1JeWSiGBLNxLMbyBO5QsovpsbH1Gnw93uSrQuixdqBr
         xjPkAm5lbSOEkLehZ4d3gqS3Cp6mYz1NiGicjVx+kisiPS9KmPgQBzzF39BRT2dtTLLz
         Mpow==
X-Gm-Message-State: AFqh2kqoJLyDt17TEpFhrDXiPp4ZFfZm2WDVx2knLUzRe5qQibfNuxUb
        xqWFlVihdvqwx4EmJlp8ZZ/DW6qKnIK8bnubT8Lo9w==
X-Google-Smtp-Source: AMrXdXsAPqq2grhhH7dWv3ibNzidh83nP0UMQkpPzASvjBVgkLMqi0nHLe5BmrNOLAwh7gP3eyGxpJ7a7jWlLotqW3o=
X-Received: by 2002:a05:6102:5587:b0:3b5:32d0:edcc with SMTP id
 dc7-20020a056102558700b003b532d0edccmr779063vsb.24.1674024677099; Tue, 17 Jan
 2023 22:51:17 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 18 Jan 2023 12:21:06 +0530
Message-ID: <CA+G9fYs+ZDoW8Xm8M5quk7J3aE942D4c34oDWM2Xjg-DQFm+Bw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/gpu: Add devfreq tuning debugfs
To:     dri-devel@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following build regression noticed on Linux next-20230118.

Regressions found on arm:
    - build/gcc-8-imx_v6_v7_defconfig
    - build/gcc-12-imx_v6_v7_defconfig
    - build/clang-15-imx_v6_v7_defconfig
    - build/clang-nightly-imx_v6_v7_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
  Depends on [n]: PM_DEVFREQ [=n]
  Selected by [y]:
  - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM [=n] ||
SOC_IMX5 [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y] &&
IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) &&
(QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] ||
QCOM_COMMAND_DB [=n]=n)

WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
  Depends on [n]: PM_DEVFREQ [=n]
  Selected by [y]:
  - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM [=n] ||
SOC_IMX5 [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y] &&
IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) &&
(QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] ||
QCOM_COMMAND_DB [=n]=n)
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
In file included from drivers/gpu/drm/msm/msm_gpu.h:18,
                 from drivers/gpu/drm/msm/adreno/adreno_gpu.h:15,
                 from drivers/gpu/drm/msm/adreno/adreno_device.c:9:
drivers/gpu/drm/msm/msm_drv.h:237:45: error: field
'gpu_devfreq_config' has incomplete type
  237 |         struct devfreq_simple_ondemand_data gpu_devfreq_config;
      |                                             ^~~~~~~~~~~~~~~~~~

Build log:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230118/testrun/14250189/suite/build/test/gcc-12-imx_v6_v7_defconfig/log

This was already reported a while back on lore,
https://lore.kernel.org/all/202301130108.fslQjvJ8-lkp@intel.com/


--
Linaro LKFT
https://lkft.linaro.org
