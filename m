Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E312AD5B8
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 12:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgKJL5C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 06:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKJL5B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Nov 2020 06:57:01 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C2FC0613CF
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2020 03:56:59 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id f27so6556319pgl.1
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2020 03:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hQ5ZeQo82Ezfh53sqE1GqmGPl8F0vlaIb17nOKgFbpM=;
        b=mTW2OmA7aYA0AKVJoDUEwYcmqhHnRwPbFyoQtsc4L4HeY5jrlIjKer5IzmimCTBAZc
         IjBkZDW774pXqTlikAtUukbFX4mKH/Chgkqc0gYPuAkdklUScPRVZUYrPMgX2vXHoeCs
         wOaGBeLIgrT7cvDnKUiZ2hRoEU1AU9q+DUfUb+pQeC/u+OsYuEyTqBY980imkhp6TLrc
         qI9uAiJRP7xOf73Yz2oQ6uxd6ex8bkzzcAbHeAjuZMyfaw89jBiRrBKBrfEUc/dmGTzv
         fbh6sptn8Hoil7vJOn8RvJOrWLkXoYkuoTP02hlVLFI3CqGZ9g8VS4VSpbrSpsq5Dy3A
         mRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hQ5ZeQo82Ezfh53sqE1GqmGPl8F0vlaIb17nOKgFbpM=;
        b=BoPLNtfk90Ql45AGJFgRsV+CyAtBqHzW7MADJnLP8x5ehyDsUIr+lIN2V4QX+L8ZLh
         RAw8um4WopD+mFUyxQX25g2JmbIrhBB6fSmDpTOeeGlvrpJzR51z6k5JzyMY2axuISm3
         mTU9OPcAyP/szgdGniAGLz+y+XSwQ30uZ/kKF62fcIkksfX5MVDORQ8FEf69Tp/wcP/b
         W60QsWBJg9tJdXr2ux3C2fuGT5LQhhQbDJZj1ElV5H1In7MV3XRTx5S04xPtdVzaZCoS
         KlmANPNgfL0AohBTcJAFm9UP3rTeRGCxIyb9Ssp8855whiOdhkN/pV4eZolUZj9OT+IC
         97Eg==
X-Gm-Message-State: AOAM533palVdxZYG+WKiszaNLS8O5okwtHss95jkY8HxV18jsFDX6bf5
        ljtURz2m7mf6Wi4KNPhmpRwnGCohlzLhQg==
X-Google-Smtp-Source: ABdhPJyOJ+cpDUKiJMEKKqDdVMrTpi//whPpljFSZVWVTv9S8IqAQaDevdfXdcU8xwdgWgckwKdk3Q==
X-Received: by 2002:a17:90a:ea01:: with SMTP id w1mr4743765pjy.153.1605009417307;
        Tue, 10 Nov 2020 03:56:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w4sm2802856pjh.47.2020.11.10.03.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 03:56:56 -0800 (PST)
Message-ID: <5faa8008.1c69fb81.3fa29.71bf@mx.google.com>
Date:   Tue, 10 Nov 2020 03:56:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20201110
Subject: next/master baseline: 703 runs, 153 regressions (next-20201110)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 703 runs, 153 regressions (next-20201110)

Regressions Summary
-------------------

platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora         | gcc-8    | b=
cm2835_defconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora         | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

beaglebone-black             | arm   | lab-baylibre          | clang-11 | m=
ulti_v7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip               | clang-11 | m=
ulti_v7_defconfig           | 1          =

beaglebone-black             | arm   | lab-collabora         | clang-11 | m=
ulti_v7_defconfig           | 1          =

beaglebone-black             | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defconfig           | 1          =

beaglebone-black             | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip               | gcc-8    | m=
ulti_v7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip               | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-collabora         | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-collabora         | gcc-8    | m=
ulti_v7_defconfig           | 1          =

imx6q-sabresd                | arm   | lab-nxp               | gcc-8    | i=
mx_v6_v7_defconfig          | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

imx8mm-ddr4-evk              | arm64 | lab-nxp               | clang-10 | d=
efconfig                    | 2          =

imx8mm-ddr4-evk              | arm64 | lab-nxp               | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =

imx8mm-ddr4-evk              | arm64 | lab-nxp               | clang-11 | d=
efconfig                    | 2          =

imx8mm-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig                    | 2          =

imx8mm-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 2          =

imx8mm-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp               | clang-10 | d=
efconfig                    | 2          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp               | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp               | clang-11 | d=
efconfig                    | 2          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 2          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 2          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig                    | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =

imx8mp-evk                   | arm64 | lab-nxp               | clang-10 | d=
efconfig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp               | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp               | clang-11 | d=
efconfig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp               | gcc-8    | d=
efconfig                    | 1          =

meson-g12a-sei510            | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

meson-g12a-sei510            | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

meson-g12a-u200              | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =

meson-g12a-u200              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

meson-g12a-u200              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | clang-10 | d=
efconfig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | clang-11 | d=
efconfig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | gcc-8    | d=
efconfig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana              | arm64 | lab-collabora         | clang-10 | d=
efconfig                    | 1          =

rk3328-rock64                | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

rk3328-rock64                | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =

rk3328-rock64                | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

rk3328-rock64                | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora         | clang-10 | d=
efconfig                    | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora         | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora         | clang-11 | d=
efconfig                    | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora         | gcc-8    | d=
efconfig                    | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora         | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora         | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

rk3399-puma-haikou           | arm64 | lab-theobroma-systems | gcc-8    | d=
efconfig                    | 1          =

rk3399-puma-haikou           | arm64 | lab-theobroma-systems | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe            | clang-10 | d=
efconfig                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe            | clang-11 | d=
efconfig                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe            | gcc-8    | d=
efconfig                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe            | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe            | clang-11 | m=
ulti_v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe            | gcc-8    | m=
ulti_v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe            | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe            | gcc-8    | s=
unxi_defconfig              | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre          | clang-11 | m=
ulti_v7_defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre          | gcc-8    | s=
unxi_defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre          | clang-11 | m=
ulti_v7_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre          | gcc-8    | s=
unxi_defconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre          | clang-11 | m=
ulti_v7_defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre          | gcc-8    | s=
unxi_defconfig              | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe            | clang-11 | m=
ulti_v7_defconfig           | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe            | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe            | gcc-8    | m=
ulti_v7_defconfig           | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe            | gcc-8    | s=
unxi_defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201110/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201110
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6dd65e60af981e77a6bc142d82138c26fb18c3e9 =



Test Regressions
---------------- =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora         | gcc-8    | b=
cm2835_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa498907fa8e66e8db8879

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa498907fa8e66e8db8=
87a
        failing since 13 days (last pass: next-20201027, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora         | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa52d32921dbab26db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa52d32921dbab26db8=
854
        failing since 40 days (last pass: next-20200929, first fail: next-2=
0200930) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4dbd9eaa2c5886db8865

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5faa4dbd9eaa2c58=
86db8868
        new failure (last pass: next-20201109)
        1 lines

    2020-11-10 08:20:12.657000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-10 08:20:12.657000+00:00  (user:khilman) is already connected
    2020-11-10 08:20:28.622000+00:00  =00
    2020-11-10 08:20:28.622000+00:00  =

    2020-11-10 08:20:28.622000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-10 08:20:28.622000+00:00  =

    2020-11-10 08:20:28.638000+00:00  DRAM:  948 MiB
    2020-11-10 08:20:28.653000+00:00  RPI 3 Model B (0xa02082)
    2020-11-10 08:20:28.742000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-10 08:20:28.774000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (376 line(s) more)  =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4ac837120618b6db888c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5faa4ac837120618=
b6db888f
        new failure (last pass: next-20201109)
        1 lines

    2020-11-10 08:07:32.437000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-10 08:07:32.437000+00:00  (user:khilman) is already connected
    2020-11-10 08:07:48.074000+00:00  =00
    2020-11-10 08:07:48.074000+00:00  =

    2020-11-10 08:07:48.074000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-10 08:07:48.074000+00:00  =

    2020-11-10 08:07:48.075000+00:00  DRAM:  948 MiB
    2020-11-10 08:07:48.089000+00:00  RPI 3 Model B (0xa02082)
    2020-11-10 08:07:48.178000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-10 08:07:48.209000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (376 line(s) more)  =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
beaglebone-black             | arm   | lab-baylibre          | clang-11 | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa49260602b67054db886c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa49260602b67054db8=
86d
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
beaglebone-black             | arm   | lab-cip               | clang-11 | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48df1e0b1e7649db8855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48df1e0b1e7649db8=
856
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
beaglebone-black             | arm   | lab-collabora         | clang-11 | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4aa89ad208f24adb88b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4aa89ad208f24adb8=
8b9
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
beaglebone-black             | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa488949736c6f93db8886

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa488949736c6f93db8=
887
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
beaglebone-black             | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48b1ef17eb46a5db8867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48b1ef17eb46a5db8=
868
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
beaglebone-black             | arm   | lab-cip               | gcc-8    | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4883023118cd30db887e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4883023118cd30db8=
87f
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
beaglebone-black             | arm   | lab-cip               | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa488b49736c6f93db8889

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beaglebone-black.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beaglebone-black.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa488b49736c6f93db8=
88a
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
beaglebone-black             | arm   | lab-collabora         | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa489049736c6f93db889d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-beaglebone-b=
lack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-beaglebone-b=
lack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa489049736c6f93db8=
89e
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
beaglebone-black             | arm   | lab-collabora         | gcc-8    | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48db277c18067cdb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48db277c18067cdb8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx6q-sabresd                | arm   | lab-nxp               | gcc-8    | i=
mx_v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4b9154eaf3df5ddb8867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4b9154eaf3df5ddb8=
868
        failing since 15 days (last pass: next-20201023, first fail: next-2=
0201026) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa49a9d549744002db8861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa49aad549744002db8=
862
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mm-ddr4-evk              | arm64 | lab-nxp               | clang-10 | d=
efconfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4fc60bec39ba0bdb885d

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mm-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mm-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4fc60bec39b=
a0bdb8861
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:30:48.006000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:30:48.008000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:30:48.046000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:30:48.046000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:30:48.046000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:30:48.046000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:30:48.047000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:30:48.047000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:30:48.047000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000b9ba1000
    2020-11-10 08:30:48.047000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D00000000463dc003, p4d=3D00000000463dc003, pud=3D00000000463de003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4fc60bec39b=
a0bdb8862
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:30:48.088000+00:00  kern  :emerg : Code: b40002e0 a9be7bf=
d f9000bf3 910003fd (f9408408)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mm-ddr4-evk              | arm64 | lab-nxp               | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4bde9e8d514637db8881

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mm-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mm-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4bde9e8d514=
637db8885
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:13:53.768000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:13:53.768000+00:00  kern  :alert :   ESR =3D 0x96000007
    2020-11-10 08:13:53.809000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:13:53.809000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:13:53.809000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:13:53.809000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:13:53.809000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2020-11-10 08:13:53.810000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:13:53.810000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000068b31000
    2020-11-10 08:13:53.810000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D00000000697d0003, p4d=3D00000000697d0003, pud=3D00000000697d0003, pmd=3D=
00000000697c0003, pte=3D0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4bde9e8d514=
637db8886
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:13:53.859000+00:00  kern  :emerg : Code: b40002e0 a9be7bf=
d f9000bf3 910003fd (f9408408)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mm-ddr4-evk              | arm64 | lab-nxp               | clang-11 | d=
efconfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4e9a18f203472bdb8853

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mm-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mm-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4e9a18f2034=
72bdb8857
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:25:40.072000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:25:40.074000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:25:40.112000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:25:40.113000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:25:40.113000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:25:40.114000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:25:40.114000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:25:40.114000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:25:40.114000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000466cd000
    2020-11-10 08:25:40.114000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D00000000466ce003, p4d=3D00000000466ce003, pud=3D00000000466cf003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4e9a18f2034=
72bdb8858
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:25:40.151000+00:00  kern  :emerg : Code: b40002e0 a9be7bf=
d f9000bf3 910003fd (f9408408)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mm-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4a570ba4e0b34adb8887

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mm-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mm-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4a570ba4e0b=
34adb888b
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:07:32.729000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:07:32.730000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:07:32.772000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:07:32.772000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:07:32.772000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:07:32.773000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:07:32.773000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:07:32.773000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:07:32.773000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000428a6000
    2020-11-10 08:07:32.773000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D00000000428a3003, p4d=3D00000000428a3003, pud=3D00000000428a4003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4a570ba4e0b=
34adb888c
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:07:32.813000+00:00  kern  :emerg : Code: a9be7bfd 910003f=
d f9000bf3 aa0003f3 (f9408400)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mm-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4d1f612bfe29cddb885e

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mm-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mm-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4d1f612bfe2=
9cddb8862
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:19:15.891000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:19:15.891000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:19:15.932000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:19:15.932000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:19:15.932000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:19:15.933000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:19:15.933000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:19:15.933000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:19:15.934000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000b99da000
    2020-11-10 08:19:15.934000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D00000000b99ff003, p4d=3D00000000b99ff003, pud=3D00000000b9b51003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4d1f612bfe2=
9cddb8863
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:19:15.969000+00:00  kern  :emerg : Code: a9be7bfd 910003f=
d f9000bf3 aa0003f3 (f9408400)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mm-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa50f31761f61006db8886

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mm-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mm-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa50f31761f61=
006db888a
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:35:41.992000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:35:41.992000+00:00  kern  :alert :   ESR =3D 0x96000007
    2020-11-10 08:35:41.992000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:35:42.033000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:35:42.033000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:35:42.033000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:35:42.034000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2020-11-10 08:35:42.034000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:35:42.034000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000068ac1800
    2020-11-10 08:35:42.034000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D000000006b820003, p4d=3D000000006b820003, pud=3D000000006b820003, pmd=3D=
000000006b830003, pte=3D0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa50f31761f61=
006db888b
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:35:42.076000+00:00  kern  :emerg : Code: a9be7bfd 910003f=
d f9000bf3 aa0003f3 (f9408400)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4f6e98d8d06e79db8882

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4f6e98d8d06=
e79db8886
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:29:17.308000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:29:17.309000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:29:17.340000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:29:17.342000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:29:17.343000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:29:17.345000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:29:17.346000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:29:17.347000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:29:17.348000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000468b6000
    2020-11-10 08:29:17.349000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D00000000468b7003, p4d=3D00000000468b7003, pud=3D00000000468b8003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4f6e98d8d06=
e79db8887
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:29:17.383000+00:00  kern  :emerg : Code: b40002e0 a9be7bf=
d f9000bf3 910003fd (f9408408)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp               | clang-10 | d=
efconfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4dea9eaa2c5886db8882

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4dea9eaa2c5=
886db8886
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:22:38.386000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:22:38.387000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:22:38.428000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:22:38.428000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:22:38.428000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:22:38.429000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:22:38.429000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:22:38.429000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:22:38.429000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000046a89000
    2020-11-10 08:22:38.429000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D0000000046a8a003, p4d=3D0000000046a8a003, pud=3D0000000046b6d003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4dea9eaa2c5=
886db8887
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:22:38.465000+00:00  kern  :emerg : Code: b40002e0 a9be7bf=
d f9000bf3 910003fd (f9408408)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4b968b17554824db8856

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4b968b17554=
824db885a
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:12:51.980000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:12:51.990000+00:00  kern  :alert :   ESR =3D 0x96000007
    2020-11-10 08:12:52.012000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:12:52.014000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:12:52.016000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:12:52.017000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:12:52.018000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2020-11-10 08:12:52.019000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:12:52.020000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000068ad1000
    2020-11-10 08:12:52.021000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D000000006e720003, p4d=3D000000006e720003, pud=3D000000006e720003, pmd=3D=
000000006ebb0003, pte=3D0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4b968b17554=
824db885b
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:12:52.063000+00:00  kern  :emerg : Code: b40002e0 a9be7bf=
d f9000bf3 910003fd (f9408408)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4e1483dffee9f6db8867

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4e1483dffee=
9f6db886b
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:23:34.185000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:23:34.186000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:23:34.188000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:23:34.217000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:23:34.219000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:23:34.220000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:23:34.221000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:23:34.223000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:23:34.224000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000004672b000
    2020-11-10 08:23:34.225000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D000000004671f003, p4d=3D000000004671f003, pud=3D000000004671e003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4e1483dffee=
9f6db886c
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:23:34.256000+00:00  kern  :emerg : Code: b40002e0 a9be7bf=
d f9000bf3 910003fd (f9408408)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp               | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4acd94e8740255db8853

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4acd94e8740=
255db8857
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:09:26.562000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:09:26.563000+00:00  kern  :alert :   ESR =3D 0x96000007
    2020-11-10 08:09:26.603000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:09:26.603000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:09:26.604000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:09:26.604000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:09:26.604000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2020-11-10 08:09:26.604000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:09:26.604000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D000000006e1c0c00
    2020-11-10 08:09:26.604000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D000000006ee80003, p4d=3D000000006ee80003, pud=3D000000006ee80003, pmd=3D=
000000006f040003, pte=3D0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4acd94e8740=
255db8858
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:09:26.646000+00:00  kern  :emerg : Code: b40002e0 a9be7bf=
d f9000bf3 910003fd (f9408408)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp               | clang-11 | d=
efconfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4c4271f408a709db8874

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4c4271f408a=
709db8878
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:15:42.646000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:15:42.648000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:15:42.688000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:15:42.688000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:15:42.688000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:15:42.688000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:15:42.689000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:15:42.689000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:15:42.689000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000469c2000
    2020-11-10 08:15:42.689000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D0000000046a7a003, p4d=3D0000000046a7a003, pud=3D00000000469ba003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4c4271f408a=
709db8879
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:15:42.726000+00:00  kern  :emerg : Code: b40002e0 a9be7bf=
d f9000bf3 910003fd (f9408408)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4a480ba4e0b34adb8867

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4a480ba4e0b=
34adb886b
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:07:17.390000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:07:17.400000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:07:17.421000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:07:17.423000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:07:17.425000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:07:17.426000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:07:17.427000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:07:17.428000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:07:17.429000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000046b4d000
    2020-11-10 08:07:17.430000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D0000000046b4e003, p4d=3D0000000046b4e003, pud=3D0000000046b4f003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4a480ba4e0b=
34adb886c
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:07:17.461000+00:00  kern  :emerg : Code: a9be7bfd 910003f=
d f9000bf3 aa0003f3 (f9408400)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4d4310dc98a79fdb886c

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4d4310dc98a=
79fdb8870
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:20:04.435000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:20:04.448000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:20:04.463000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:20:04.464000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:20:04.466000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:20:04.468000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:20:04.469000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:20:04.470000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:20:04.471000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000046b77000
    2020-11-10 08:20:04.472000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D0000000046b78003, p4d=3D0000000046b78003, pud=3D0000000046b79003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4d4310dc98a=
79fdb8871
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:20:04.503000+00:00  kern  :emerg : Code: a9be7bfd 910003f=
d f9000bf3 aa0003f3 (f9408400)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa5058a4bb2ea57ddb887a

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa5058a4bb2ea=
57ddb887e
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:33:14.747000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:33:14.757000+00:00  kern  :alert :   ESR =3D 0x96000007
    2020-11-10 08:33:14.779000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:33:14.781000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:33:14.782000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:33:14.784000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:33:14.785000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2020-11-10 08:33:14.786000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:33:14.787000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D000000006ddf1600
    2020-11-10 08:33:14.788000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D000000006e7e0003, p4d=3D000000006e7e0003, pud=3D000000006e7e0003, pmd=3D=
000000006e810003, pte=3D0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa5058a4bb2ea=
57ddb887f
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:33:14.829000+00:00  kern  :emerg : Code: a9be7bfd 910003f=
d f9000bf3 aa0003f3 (f9408400)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4a5a57f196429bdb8860

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4a5a57f1964=
29bdb8864
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:07:31.874000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:07:31.875000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:07:31.916000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:07:31.916000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:07:31.916000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:07:31.916000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:07:31.916000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:07:31.916000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:07:31.917000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000046e92000
    2020-11-10 08:07:31.917000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D0000000046e93003, p4d=3D0000000046e93003, pud=3D0000000046e94003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4a5a57f1964=
29bdb8865
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:07:31.955000+00:00  kern  :emerg : Code: a9be7bfd 910003f=
d f9000bf3 aa0003f3 (f9408400)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa4b3fe53b7a2d32db8857

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa4b3fe53b7a2=
d32db885b
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:11:17.972000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:11:17.973000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-10 08:11:18.013000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:11:18.013000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:11:18.013000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:11:18.014000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:11:18.014000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-10 08:11:18.014000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:11:18.014000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000b998f000
    2020-11-10 08:11:18.014000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D00000000b998c003, p4d=3D00000000b998c003, pud=3D00000000b998d003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa4b3fe53b7a2=
d32db885c
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:11:18.053000+00:00  kern  :emerg : Code: a9be7bfd 910003f=
d f9000bf3 aa0003f3 (f9408400)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp               | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5faa5002a4bb2ea57ddb8866

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5faa5002a4bb2ea=
57ddb886a
        new failure (last pass: next-20201109)
        11 lines

    2020-11-10 08:31:39.852000+00:00  kern  :alert : Mem abort info:
    2020-11-10 08:31:39.852000+00:00  kern  :alert :   ESR =3D 0x96000007
    2020-11-10 08:31:39.892000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-10 08:31:39.892000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-10 08:31:39.893000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-10 08:31:39.893000+00:00  kern  :alert : Data abort info:
    2020-11-10 08:31:39.893000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2020-11-10 08:31:39.894000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-10 08:31:39.894000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000068fa1600
    2020-11-10 08:31:39.894000+00:00  kern  :alert : [00000000000000f5] pgd=
=3D000000006e6e0003, p4d=3D000000006e6e0003, pud=3D000000006e6e0003, pmd=3D=
000000006e6f0003, pte=3D0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5faa5002a4bb2ea=
57ddb886b
        new failure (last pass: next-20201109)
        2 lines

    2020-11-10 08:31:39.939000+00:00  kern  :emerg : Code: a9be7bfd 910003f=
d f9000bf3 aa0003f3 (f9408400)    =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mp-evk                   | arm64 | lab-nxp               | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa50b6fe65991369db885e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa50b6fe65991369db8=
85f
        failing since 4 days (last pass: next-20201105, first fail: next-20=
201106) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mp-evk                   | arm64 | lab-nxp               | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4cb9cc3e885384db889c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4cb9cc3e885384db8=
89d
        failing since 6 days (last pass: next-20201103, first fail: next-20=
201104) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mp-evk                   | arm64 | lab-nxp               | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4f12d6cced62b4db8863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4f12d6cced62b4db8=
864
        new failure (last pass: next-20201109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
imx8mp-evk                   | arm64 | lab-nxp               | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4b1a65599ccefcdb887d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4b1a65599ccefcdb8=
87e
        new failure (last pass: next-20201109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa7e59e0fa53b6a3db886b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa7e59e0fa53b6a3db8=
86c
        failing since 12 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa740f595e3f8c9fdb8857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa740f595e3f8c9fdb8=
858
        failing since 12 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa7e8c96dac0c952db8869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa7e8c96dac0c952db8=
86a
        failing since 12 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4d692f70609a20db8873

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4d692f70609a20db8=
874
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa498407fa8e66e8db8876

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa498407fa8e66e8db8=
877
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4bbfd74668b072db8858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4bbfd74668b072db8=
859
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48e57ddee86a1cdb8861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48e57ddee86a1cdb8=
862
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4a76df39c1b90edb88ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4a76df39c1b90edb8=
8af
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4f0da2fd2de5d8db8898

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4f0da2fd2de5d8db8=
899
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4d6b0810b8293edb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4d6b0810b8293edb8=
854
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa498a9051479d56db886f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa498a9051479d56db8=
870
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4bc79e8d514637db887d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4bc79e8d514637db8=
87e
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48c929b4cb2cd4db886d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48c929b4cb2cd4db8=
86e
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4a79df39c1b90edb88bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4a79df39c1b90edb8=
8be
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4eead0469df9cadb8858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4eead0469df9cadb8=
859
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa56bee624e24c36db8855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa56bee624e24c36db8=
856
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4dfce076eae222db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4dfce076eae222db8=
854
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4d81f8d57a1ca1db8875

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4d81f8d57a1ca1db8=
876
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa531f5a7d248db3db8859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa531f5a7d248db3db8=
85a
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa49fdd3ca4ae367db8856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa49fdd3ca4ae367db8=
857
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4c23ad07ad25cbdb886a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4c23ad07ad25cbdb8=
86b
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4cad19ac5beca7db8854

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4cad19ac5beca7db8=
855
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4e7616df58d068db885c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4e7616df58d068db8=
85d
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5748b9c21c0940db8854

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5748b9c21c0940db8=
855
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa491f0602b67054db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa491f0602b67054db8=
854
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4ad394e8740255db8869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4ad394e8740255db8=
86a
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora         | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4f90967f27b2e2db886f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4f90967f27b2e2db8=
870
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4d4010dc98a79fdb8867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4d4010dc98a79fdb8=
868
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4963855b71a002db8889

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4963855b71a002db8=
88a
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4b9df35cb66d5cdb885f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4b9df35cb66d5cdb8=
860
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48ce29b4cb2cd4db8879

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48ce29b4cb2cd4db8=
87a
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4a4608ffed8667db8897

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4a4608ffed8667db8=
898
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4ee4dd38f73fbbdb8871

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4ee4dd38f73fbbdb8=
872
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa50338222b5ac88db887c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa50338222b5ac88db8=
87d
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4d117e0fdf6879db886b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4d117e0fdf6879db8=
86c
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4f51a6cff4d533db8886

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4f51a6cff4d533db8=
887
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa49d5b82a9c7a81db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa49d5b82a9c7a81db8=
854
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4b243a685ba4a9db8885

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4b243a685ba4a9db8=
886
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4e25e523652072db885d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4e25e523652072db8=
85e
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa50fea1a5a43fa4db8855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa50fea1a5a43fa4db8=
856
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4d6aab0eaa7e76db888f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4d6aab0eaa7e76db8=
890
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa498902c578ed40db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa498902c578ed40db8=
854
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4bc6d74668b072db885b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4bc6d74668b072db8=
85c
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48eb7ddee86a1cdb886d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48eb7ddee86a1cdb8=
86e
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4a77df39c1b90edb88ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4a77df39c1b90edb8=
8bb
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4f0fd6cced62b4db8860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4f0fd6cced62b4db8=
861
        failing since 13 days (last pass: next-20201026, first fail: next-2=
0201028) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora         | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4e8fbaad469dd5db8854

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4e8fbaad469dd5db8=
855
        new failure (last pass: next-20201109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3328-rock64                | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4d3fb9f16c21cedb8868

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4d3fb9f16c21cedb8=
869
        new failure (last pass: next-20201109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3328-rock64                | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4966b83aadc9ccdb887a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4966b83aadc9ccdb8=
87b
        new failure (last pass: next-20201109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3328-rock64                | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4b9b54eaf3df5ddb886c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4b9b54eaf3df5ddb8=
86d
        new failure (last pass: next-20201109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3328-rock64                | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48c429b4cb2cd4db885c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48c429b4cb2cd4db8=
85d
        new failure (last pass: next-20201109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3328-rock64                | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4a479ff17d00f6db886d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4a479ff17d00f6db8=
86e
        new failure (last pass: next-20201109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3328-rock64                | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4ee6dd38f73fbbdb8874

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4ee6dd38f73fbbdb8=
875
        new failure (last pass: next-20201109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora         | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4d79f8d57a1ca1db885d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4d79f8d57a1ca1db8=
85e
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora         | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa49c877885d0e3fdb8888

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa49c877885d0e3fdb8=
889
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora         | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4c6bcfa89cb44edb8874

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4c6bcfa89cb44edb8=
875
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora         | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4935d8069137dddb8880

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4935d8069137dddb8=
881
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora         | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4a819ad208f24adb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4a819ad208f24adb8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora         | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4f140cab252f54db885c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4f140cab252f54db8=
85d
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3399-puma-haikou           | arm64 | lab-theobroma-systems | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa49e3b82a9c7a81db8892

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-theobroma-systems/baseline-rk3399-puma-haikou.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-theobroma-systems/baseline-rk3399-puma-haikou.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa49e3b82a9c7a81db8=
893
        failing since 54 days (last pass: next-20200417, first fail: next-2=
0200916) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
rk3399-puma-haikou           | arm64 | lab-theobroma-systems | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4c94cc3e885384db887e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-theobroma-systems/baseline-=
rk3399-puma-haikou.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-theobroma-systems/baseline-=
rk3399-puma-haikou.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4c94cc3e885384db8=
87f
        failing since 54 days (last pass: next-20200417, first fail: next-2=
0200916) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe            | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4f8c967f27b2e2db886a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4f8c967f27b2e2db8=
86b
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe            | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4e41e523652072db886c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4e41e523652072db8=
86d
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe            | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4a1f08ffed8667db8886

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4a1f08ffed8667db8=
887
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe            | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4cee293adfdb11db8886

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4cee293adfdb11db8=
887
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5e3598a990946cdb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5e3598a990946cdb8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa599399f711f864db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa599399f711f864db8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5cb813960519bedb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5cb813960519bedb8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa55f386fcfe8630db8854

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa55f386fcfe8630db8=
855
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa57f82475ed1ecddb8858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa57f82475ed1ecddb8=
859
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5b2a960ef9babadb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5b2a960ef9babadb8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5fa03acb6e8b0bdb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5fa03acb6e8b0bdb8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | clang-10 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa518e356afd824fdb8858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa518e356afd824fdb8=
859
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | clang-11 | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4eca0cab252f54db8854

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4eca0cab252f54db8=
855
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | clang-11 | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa50eb1761f61006db8880

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa50eb1761f61006db8=
881
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | gcc-8    | d=
efconfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4d9af8d57a1ca1db888e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4d9af8d57a1ca1db8=
88f
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa503f618b8e47dadb8877

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa503f618b8e47dadb8=
878
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre          | gcc-8    | d=
efconfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa533fa1d16fcb99db8854

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa533fa1d16fcb99db8=
855
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe            | clang-11 | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5126a1a5a43fa4db885a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5126a1a5a43fa4db8=
85b
        failing since 1 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe            | gcc-8    | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4969b83aadc9ccdb887f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4969b83aadc9ccdb8=
880
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe            | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4fb2967f27b2e2db887a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-a83t-bana=
napi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-a83t-bana=
napi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4fb2967f27b2e2db8=
87b
        failing since 1 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe            | gcc-8    | s=
unxi_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa50f01761f61006db8883

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa50f01761f61006db8=
884
        failing since 1 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre          | clang-11 | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5697c3ceb653dadb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5697c3ceb653dadb8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa488749736c6f93db8883

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa488749736c6f93db8=
884
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa49210602b67054db8867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-=
h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-=
h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa49210602b67054db8=
868
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre          | gcc-8    | s=
unxi_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5618bd105dd61ddb885d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5618bd105dd61ddb8=
85e
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre          | clang-11 | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5ad021033ae03edb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5ad021033ae03edb8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa488c49736c6f93db8891

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa488c49736c6f93db8=
892
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5172356afd824fdb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5172356afd824fdb8=
854
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre          | gcc-8    | s=
unxi_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa51e3b84b62e56ddb885c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa51e3b84b62e56ddb8=
85d
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre          | clang-11 | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa5087f68a453612db8858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa5087f68a453612db8=
859
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa488549736c6f93db8865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa488549736c6f93db8=
866
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre          | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48abef17eb46a5db8858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48abef17eb46a5db8=
859
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre          | gcc-8    | s=
unxi_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa48d649b04554a4db887a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa48d649b04554a4db8=
87b
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe            | clang-11 | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4eeadd38f73fbbdb8877

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/clang-11/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4eeadd38f73fbbdb8=
878
        failing since 1 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe            | gcc-8    | m=
ulti_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4e1ae076eae222db8862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-h3-orange=
pi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-h3-orange=
pi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4e1ae076eae222db8=
863
        failing since 1 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe            | gcc-8    | m=
ulti_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4e5aaa99e7fa60db8877

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4e5aaa99e7fa60db8=
878
        failing since 0 day (last pass: next-20201106, first fail: next-202=
01109) =

 =



platform                     | arch  | lab                   | compiler | d=
efconfig                    | regressions
-----------------------------+-------+-----------------------+----------+--=
----------------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe            | gcc-8    | s=
unxi_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5faa4e93baad469dd5db8859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201110/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faa4e93baad469dd5db8=
85a
        failing since 4 days (last pass: next-20201105, first fail: next-20=
201106) =

 =20
