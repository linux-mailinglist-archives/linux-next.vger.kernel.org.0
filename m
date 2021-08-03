Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6663D3DE7E9
	for <lists+linux-next@lfdr.de>; Tue,  3 Aug 2021 10:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbhHCIJv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Aug 2021 04:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbhHCIJa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Aug 2021 04:09:30 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDE9C06175F
        for <linux-next@vger.kernel.org>; Tue,  3 Aug 2021 01:09:13 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u2so14459229plg.10
        for <linux-next@vger.kernel.org>; Tue, 03 Aug 2021 01:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ly1ouQTlGeDw9IxpFpYtqIe4BwUHQfPE0HYgRmJddoM=;
        b=sRiKQpLOcG4HE5EC+CS/SoIR92WutnDycMyudfNKVuj/72V4+dyj3ri3G2S8S+7GBc
         yDKopCKdCuL3suns7AnO9VA4NiGbI6UuJRjVEPTjCk29LYMeIb/bpK9cdSs7Gf1LzBr3
         X58o/cyI428CPAIGZJyAKKLym50jwyWftQGgCBh3pujQnOXb8OzPxOypwwLpDUz+sT5l
         ZuacR/agyd7KfwBnB/FofF8R4kHNOIShBt4hJtFHIMSSxZsOqeCUdsgQe47s9JSomuiw
         XdCcesrMWV1jZdsTOvfuRuVDE2Wi4hXJQf705tVcvZKCjEa49UBNHmxENuya3VgBgM6M
         DA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ly1ouQTlGeDw9IxpFpYtqIe4BwUHQfPE0HYgRmJddoM=;
        b=ArYiyIalcMxdaKKxiJlnqBuCMtHBLlbUqj22dNj6fBoQlvfSkKByZXPRLSd9MQW/C2
         roGYN4vOjEre/CVf/RHq/R/rfrtEr8gS50Be/iBIeZjjgb+xhnMw4E/8/5AyXoYYIAGK
         Am56rtHWpmCMsY9CRFzIe8AU1CuiI8SPKDl2+iY6lw+6ZJ8mKoen9P8niXdYzY99jwa9
         8GqQeILGcJWoca7kVV3a3HAy7RyIIE4yAa1hDaP7IAhR2aA2EBgf8b1EJsZbF0UBaVow
         0lpeJzzLw/o0TB9GtMlWg2PMcv0OYVTTZtI8UJikZVsm70uGGB4LSiAo05t36EtCL0ZW
         sqFA==
X-Gm-Message-State: AOAM530Uhe8yFIiqM7DxkhiLNjyxxpERAhhuTpzBGKnNvBl5HsPyM6wf
        yMlJlmQyzra4f6KYzrNbyRdmlfd7+LB28w==
X-Google-Smtp-Source: ABdhPJyfhnMrFmsL9SndIZCDmX9T1Fnj7aF+OGhoYJdYXIHgWuwCst8wkHYz6YriVM7H3q84FSxAsA==
X-Received: by 2002:a17:902:6a82:b029:12c:58c0:1af3 with SMTP id n2-20020a1709026a82b029012c58c01af3mr5707517plk.50.1627978152552;
        Tue, 03 Aug 2021 01:09:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j19sm14633865pfr.82.2021.08.03.01.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 01:09:12 -0700 (PDT)
Message-ID: <6108f9a8.1c69fb81.eebce.a5cf@mx.google.com>
Date:   Tue, 03 Aug 2021 01:09:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210802
X-Kernelci-Report-Type: test
Subject: next/master baseline: 780 runs, 113 regressions (next-20210802)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 780 runs, 113 regressions (next-20210802)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

bcm2837-rpi-3-b-32           | arm   | lab-baylibre    | gcc-8    | bcm2835=
_defconfig            | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

hip07-d05                    | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 1          =

hip07-d05                    | arm64 | lab-collabora   | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig                    | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210802/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210802
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3a928c58ca10d61051e6a2be65a81418615ef92c =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bdeddebcbbe6f4b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bdeddebcbbe6f4b13=
662
        failing since 159 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bdb8fbd4df1af7b13689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bdb8fbd4df1af7b13=
68a
        failing since 46 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c309c624090e7eb13675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c309c624090e7eb13=
676
        failing since 46 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bf0cc195310f82b13666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bf0cc195310f82b13=
667
        failing since 46 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c1b4dc0bc1421ab13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c1b4dc0bc1421ab13=
664
        failing since 46 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b96b50cf347963b13670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b96b50cf347963b13=
671
        failing since 46 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c0600051741418b13671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c0600051741418b13=
672
        failing since 46 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b-32           | arm   | lab-baylibre    | gcc-8    | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b83ffa3f2c7fe5b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b83ffa3f2c7fe5b13=
675
        failing since 53 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bf6319b19838ceb1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bf6319b19838ceb13=
66f
        failing since 255 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c65a5b77b4f882b1366c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c65a5b77b4f882b13=
66d
        failing since 255 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108ba4c02fdea4b15b1366a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108ba4c02fdea4b15b13=
66b
        failing since 255 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c362df18be9466b1367b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c362df18be9466b13=
67c
        failing since 255 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bfc579f047b118b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bfc579f047b118b13=
664
        failing since 6 days (last pass: next-20210712, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c1a9aa179b0a8cb1367b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-lx2160=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-lx2160=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c1a9aa179b0a8cb13=
67c
        failing since 6 days (last pass: next-20210714, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108ba9f0d75be35bab13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108ba9f0d75be35bab13=
668
        failing since 14 days (last pass: next-20210714, first fail: next-2=
0210719) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c1d1b19290c226b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c1d1b19290c226b13=
67f
        failing since 6 days (last pass: next-20210714, first fail: next-20=
210727) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b53afb21f2b847b1369d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b53afb21f2b847b13=
69e
        failing since 94 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c56972afa6a45bb13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c56972afa6a45bb13=
666
        failing since 112 days (last pass: next-20210409, first fail: next-=
20210412) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108d0fa5849a2aecdb13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108d0fa5849a2aecdb13=
668
        failing since 112 days (last pass: next-20210409, first fail: next-=
20210412) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bae72697222d63b13680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bae72697222d63b13=
681
        failing since 33 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c996e7cb87b406b136b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c996e7cb87b406b13=
6b3
        failing since 33 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bb78eda331c72eb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bb78eda331c72eb13=
662
        failing since 281 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bb17116cf7ba11b13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bb17116cf7ba11b13=
669
        new failure (last pass: next-20210730) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c0005ca1046447b1378b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c0005ca1046447b13=
78c
        failing since 3 days (last pass: next-20210728, first fail: next-20=
210730) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bf3b55cb6e2712b136a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bf3b55cb6e2712b13=
6a5
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210727) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108ba61a5c8ed0fb5b1366a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108ba61a5c8ed0fb5b13=
66b
        new failure (last pass: next-20210729) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bccca9cb0fca95b13690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bccca9cb0fca95b13=
691
        new failure (last pass: next-20210730) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108be4dd096f881f9b13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108be4dd096f881f9b13=
674
        new failure (last pass: next-20210730) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bd92300eb69a55b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bd92300eb69a55b13=
662
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c2e222d65f3052b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-linaro-lkft/baseline-qc=
om-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-linaro-lkft/baseline-qc=
om-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c2e222d65f3052b13=
668
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bee61c876b9cfdb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bee61c876b9cfdb13=
662
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c18ecaa575e9efb13765

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qc=
om-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qc=
om-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c18ecaa575e9efb13=
766
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b96e50cf347963b13676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-q=
df2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-q=
df2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b96e50cf347963b13=
677
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bac20d75be35bab13689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bac20d75be35bab13=
68a
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c03ab4d4435c6db13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c03ab4d4435c6db13=
668
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b5778c4357e8f4b13685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b5778c4357e8f4b13=
686
        failing since 258 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c3f8dd291a84aab13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c3f8dd291a84aab13=
669
        failing since 258 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b56d19a9c90bdeb13686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b56d19a9c90bdeb13=
687
        failing since 258 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b532e670c44687b1367b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b532e670c44687b13=
67c
        failing since 258 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6108dafcbde9971961b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108dafcbde9971961b13=
664
        failing since 258 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bdc1fbd4df1af7b13691

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bdc1fbd4df1af7b13=
692
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c4dedc8a21913ab13675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c4dedc8a21913ab13=
676
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108ce5f26007a404cb13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108ce5f26007a404cb13=
664
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108dbbe8938d9de72b13690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108dbbe8938d9de72b13=
691
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108be22366d8d5a5eb13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108be22366d8d5a5eb13=
663
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c6e0341ebdb153b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c6e0341ebdb153b13=
66f
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c7d666701309c5b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c7d666701309c5b13=
662
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108d36e21446d0f8cb1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108d36e21446d0f8cb13=
680
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108ddf38fee078ea2b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108ddf38fee078ea2b13=
66e
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108df1f2ed0bbe7afb1368e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108df1f2ed0bbe7afb13=
68f
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108be39b3db17a7adb13684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108be39b3db17a7adb13=
685
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c4029e774e7631b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c4029e774e7631b13=
664
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108cf8b11a1b8e90ab1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108cf8b11a1b8e90ab13=
670
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108da2d33a0f30c58b136a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108da2d33a0f30c58b13=
6a4
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bef51c876b9cfdb13686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bef51c876b9cfdb13=
687
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c5af66eceddba0b1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c5af66eceddba0b13=
680
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c8e70fe31e01ceb1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c8e70fe31e01ceb13=
670
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108d210df2631d7fdb1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108d210df2631d7fdb13=
66f
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108de2f1a2ba0bd50b1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108de2f1a2ba0bd50b13=
670
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108dea96c241e10dcb13681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108dea96c241e10dcb13=
682
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b960827aff83ccb13688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b960827aff83ccb13=
689
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bac8e00134454eb136cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bac8e00134454eb13=
6cc
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c2720ce55ad954b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c2720ce55ad954b13=
675
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c6c95874871123b13680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c6c95874871123b13=
681
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c9725706cfee6eb13689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c9725706cfee6eb13=
68a
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108d7852ea456a97bb1367c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108d7852ea456a97bb13=
67d
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b999e7557f9277b136f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b999e7557f9277b13=
6f6
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bb210fca72fb5eb1367d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bb210fca72fb5eb13=
67e
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c44cef39c83f8db13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c44cef39c83f8db13=
679
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c15b98f0456b0db1367c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c15b98f0456b0db13=
67d
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c45336f1291bc2b13691

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c45336f1291bc2b13=
692
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108cf9455eb375f3fb13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108cf9455eb375f3fb13=
679
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108dc8b36490146a3b13692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108dc8b36490146a3b13=
693
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108dcef8fc505741fb137af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108dcef8fc505741fb13=
7b0
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108de95bf49855db4b13676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108de95bf49855db4b13=
677
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bdac6bad2f7c63b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bdac6bad2f7c63b13=
663
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c4ca93bdb5e807b13685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c4ca93bdb5e807b13=
686
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108cdd3d1b05a0cf0b13689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108cdd3d1b05a0cf0b13=
68a
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108db96a13efb19b1b13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108db96a13efb19b1b13=
665
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bddd40e394ac92b13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bddd40e394ac92b13=
669
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c6855874871123b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c6855874871123b13=
662
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c7af1e14a3af93b1368d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c7af1e14a3af93b13=
68e
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108d2f66ab19a9eedb13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108d2f66ab19a9eedb13=
675
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108dddf205cc4bf9bb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108dddf205cc4bf9bb13=
662
        failing since 6 days (last pass: next-20210719, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108df0bc642abda16b13677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108df0bc642abda16b13=
678
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108be759e06b9768bb13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108be759e06b9768bb13=
664
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c43ea6b7d1cc83b13724

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c43ea6b7d1cc83b13=
725
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108cfdb611efddd76b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108cfdb611efddd76b13=
66f
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108da7dff59299af5b13670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108da7dff59299af5b13=
671
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bf55053caa6958b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bf55053caa6958b13=
663
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c6072295f1da31b1368f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c6072295f1da31b13=
690
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c94099075067b7b13682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c94099075067b7b13=
683
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108d24d264c3dbce0b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108d24d264c3dbce0b13=
662
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108de5939f6ea4f0fb1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108de5939f6ea4f0fb13=
66e
        failing since 6 days (last pass: next-20210720, first fail: next-20=
210726) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108decf736a3c4c1fb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108decf736a3c4c1fb13=
662
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b99c26d89a8fdcb13681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b99c26d89a8fdcb13=
682
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108badc0d75be35bab1369b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108badc0d75be35bab13=
69c
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c25e522de19253b136fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c25e522de19253b13=
6fe
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c71931c1eea9e2b13681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c71931c1eea9e2b13=
682
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c9735706cfee6eb1368c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c9735706cfee6eb13=
68d
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108d6bd10a5338aebb13683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108d6bd10a5338aebb13=
684
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108b97950cf347963b136a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108b97950cf347963b13=
6a5
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bb1d0fca72fb5eb13677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bb1d0fca72fb5eb13=
678
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c3fedd291a84aab1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c3fedd291a84aab13=
66f
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c219869af9733cb13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c219869af9733cb13=
663
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c468c0226239b7b1367d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c468c0226239b7b13=
67e
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108cf15615934ee0cb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108cf15615934ee0cb13=
662
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108dc8dcd2fc1496fb13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108dc8dcd2fc1496fb13=
664
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108dd03c838570917b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108dd03c838570917b13=
662
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6108de931dad980a94b13679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108de931dad980a94b13=
67a
        failing since 10 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bbf4559b3e0614b13685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bbf4559b3e0614b13=
686
        new failure (last pass: next-20210730) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108c26f0ce55ad954b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108c26f0ce55ad954b13=
66f
        failing since 173 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6108bac726407ea034b13671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210802/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108bac726407ea034b13=
672
        new failure (last pass: next-20210730) =

 =20
