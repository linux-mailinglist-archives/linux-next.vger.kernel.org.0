Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C93584B52FF
	for <lists+linux-next@lfdr.de>; Mon, 14 Feb 2022 15:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbiBNORk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Feb 2022 09:17:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234816AbiBNORj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Feb 2022 09:17:39 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432EB49F9D
        for <linux-next@vger.kernel.org>; Mon, 14 Feb 2022 06:17:29 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id y18so10612206plb.11
        for <linux-next@vger.kernel.org>; Mon, 14 Feb 2022 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=M5CfIWo9KwLbEW7BqmTkpXqpRj1LNd2CmjfZ5GHFjXw=;
        b=lK6mj+4LuxlQRxH03eJdwmGyBVWOGKSlFnF2teoBVf5f++9qdlwP1zBTSlbzlyrv8V
         ihR+to1aV3k82P1HuPHqqePdIcOz2nK7G69yEKhPEAWeGdPbhXJDSRyDv7ygsTQ4Wxas
         oU4z9JzEWOoxuznLxTepV4IbxyLpl03AetS4hs5r6wdbkuEIhKObJpwX961x+0Mo196a
         d6LdLfEN/CN5Sob145lqV4GUl9NV+X6fSm8up/k/qQQDfnuSrtlvsYN9rtZPrg3YnQV1
         Pl9xdL367aTQjTCnLIpzg8os45pGronHPp6vv2a+jptJHUx54aEMIk9o/IaG9pKRmmrp
         UOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=M5CfIWo9KwLbEW7BqmTkpXqpRj1LNd2CmjfZ5GHFjXw=;
        b=f2hEU4A8ZZSgeG+41QLMaXQ/rVZW9nauReNop3ykMpnouN0qZihW9ysUysFviHtp1b
         YfdEuQ3OZuXApIyoBtye4T+fXBGa8WyECoZQOdjwNCc1cfFBquC+exMgWZymF0LmhgUg
         3jJE2Z7qkKFOz6W/nXX5Az22hudkikpltCZSf/gPWSTFydVdcQgoLD/XfN38e7ItJXKx
         6MOJTj3u4nzpgysNvZ0UlQmfnEL+lsMSXMY317m9P9NwHLMIfTuxPnZCUqWI0DrOO0CT
         rPVjOa7l5VhgX6ruxZVkbuzTb+Ep6gn8tUj3xJq3GoIg0I6IjlU2GtNHCxsRl4j5RmfS
         eP+Q==
X-Gm-Message-State: AOAM533aICaZ5KIP67tjQ1ZQgHGjf/P3/MgFFYQgdy3CeslWcCDJ7B8W
        xcfHVHS9YiF9IuQ2OiWgXlrbg9BbCCvEuBxo
X-Google-Smtp-Source: ABdhPJwqsU4qRiodGQfcnkyrsKMc+nWSNi8qNchz1ay8HA6pNCj0YVhRdOu/+K6PszhEHKwEJ3LKOA==
X-Received: by 2002:a17:90a:b906:: with SMTP id p6mr14823656pjr.212.1644848247198;
        Mon, 14 Feb 2022 06:17:27 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i8sm21379533pgf.94.2022.02.14.06.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 06:17:26 -0800 (PST)
Message-ID: <620a6476.1c69fb81.3ae2a.4223@mx.google.com>
Date:   Mon, 14 Feb 2022 06:17:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220214
Subject: next/master baseline: 612 runs, 108 regressions (next-20220214)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 612 runs, 108 regressions (next-20220214)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
cubietruck                 | arm   | lab-baylibre  | clang-14 | multi_v7_de=
fconfig           | 2          =

cubietruck                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

cubietruck                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig           | 2          =

meson-gxbb-p200            | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip       | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip       | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | clang-14 | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre  | clang-14 | multi_v7_de=
fconfig           | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe    | clang-14 | multi_v7_de=
fconfig           | 2          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig           | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220214/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220214
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      259cbfc98c55ba3b6ef6e61fb7cfc3751dfded1e =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
cubietruck                 | arm   | lab-baylibre  | clang-14 | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/620a31cb58c5b69f7cc6297e

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620a31cb58c5b69=
f7cc62982
        failing since 12 days (last pass: next-20220127, first fail: next-2=
0220201)
        16 lines

    2022-02-14T10:41:05.320498  <8>[   37.901775] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-14T10:41:05.352576  kern  :alert : 8<--- cut here ---
    2022-02-14T10:41:05.360799  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-14T10:41:05.364118  kern  :alert : [000001a0] *pgd=3Dbcd52835
    2022-02-14T10:41:05.374793  kern  :alert : Register<8>[   37.953636] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620a31cb58c5b69=
f7cc62983
        failing since 12 days (last pass: next-20220127, first fail: next-2=
0220201)
        83 lines

    2022-02-14T10:41:05.377491   r0 information: NULL pointer
    2022-02-14T10:41:05.383067  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-14T10:41:05.388802  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-14T10:41:05.393479  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-14T10:41:05.402008  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4ecbc00 pointer offset 64 size 1024
    2022-02-14T10:41:05.407957  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-14T10:41:05.416474  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4ecbc00 pointer offset 608 size 1024
    2022-02-14T10:41:05.425161  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4ecbc00 pointer offset 64 size 1024
    2022-02-14T10:41:05.433775  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21aa000 pointer offset 16 size 1024
    2022-02-14T10:41:05.438795  kern  :alert : Register r9 information: non=
-paged memory =

    ... (42 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
cubietruck                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/620a2a37f44103768fc62988

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620a2a37f441037=
68fc6298c
        failing since 12 days (last pass: next-20220127, first fail: next-2=
0220201)
        16 lines

    2022-02-14T10:08:30.845458  <8>[   37.160260] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-14T10:08:30.874435  kern  :alert : 8<--- cut here ---
    2022-02-14T10:08:30.882735  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-14T10:08:30.886168  kern  :alert : [000001a0] *pgd=3Dbc8d1835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620a2a37f441037=
68fc6298d
        failing since 12 days (last pass: next-20220127, first fail: next-2=
0220201)
        54 lines

    2022-02-14T10:08:30.897502  kern  :alert : Register<8>[   37.207835] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-14T10:08:30.899523   r0 information: NULL pointer
    2022-02-14T10:08:30.905357  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-14T10:08:30.910824  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-14T10:08:30.915626  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-14T10:08:30.924616  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c2cdf400 pointer offset 64 size 1024
    2022-02-14T10:08:30.932243  kern  :alert : Register r5 information: sla=
b task_struct start c2ddb300 pointer offset 0
    2022-02-14T10:08:30.941055  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c19aa000 pointer offset 16 size 1024
    2022-02-14T10:08:30.949577  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c2cdf400 pointer offset 128 size 1024
    2022-02-14T10:08:30.955278  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
cubietruck                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/620a2ad82ec1e91726c6298d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620a2ad82ec1e91=
726c62991
        failing since 10 days (last pass: next-20220128, first fail: next-2=
0220204)
        16 lines

    2022-02-14T10:11:23.505204  kern  :alert : 8<--- cut here ---
    2022-02-14T10:11:23.513307  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-14T10:11:23.517005  kern  :alert : [000001a0] *pgd=3Dbcb7a835
    2022-02-14T10:11:23.521410  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-14T10:11:23.530130  ke<8>[   37.143835] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620a2ad82ec1e91=
726c62992
        failing since 10 days (last pass: next-20220128, first fail: next-2=
0220204)
        54 lines

    2022-02-14T10:11:23.535780  rn  :alert : Register r1 information: non-s=
lab/vmalloc memory
    2022-02-14T10:11:23.541689  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-14T10:11:23.546487  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-14T10:11:23.555264  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4536800 pointer offset 64 size 1024
    2022-02-14T10:11:23.562961  kern  :alert : Register r5 information: sla=
b task_struct start c4560000 pointer offset 0
    2022-02-14T10:11:23.567999  kern  :alert : Register r6 information: sla=
b kmalloc-1k
    2022-02-14T10:11:23.576619  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4536800 pointer offset 128 size 1024
    2022-02-14T10:11:23.582277  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-14T10:11:23.590936  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21aa000 pointer offset 0 size 1024
    2022-02-14T10:11:23.599685  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c45a1400 pointer offset 0 size 1024 =

    ... (45 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a31d723bb3a73d3c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a31d723bb3a73d3c62=
969
        new failure (last pass: next-20220211) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2bd432a93c4619c629b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2bd432a93c4619c62=
9b2
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2b9d79ec71747bc6297e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2b9d79ec71747bc62=
97f
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip       | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a33ad0312c911a3c629a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a33ad0312c911a3c62=
9a4
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2941fd20df2fddc6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2941fd20df2fddc62=
980
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a1f937fecec01c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a1f937fecec01c62=
96a
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2abdc23d728c0cc6297c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2abdc23d728c0cc62=
97d
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2cf8ac5784d299c6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2cf8ac5784d299c62=
96c
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d8cdef5bd9ea2c6298d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d8cdef5bd9ea2c62=
98e
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2dc9dee5ed092ec629bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2dc9dee5ed092ec62=
9c0
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a294061240a4e53c6297c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a294061240a4e53c62=
97d
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a34f44103768fc6297c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a34f44103768fc62=
97d
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2abcff1dcfb778c6299e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2abcff1dcfb778c62=
99f
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2cf87695fcecf2c62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2cf87695fcecf2c62=
972
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d01e3669459d7c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d01e3669459d7c62=
969
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d3eae8281498dc629e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d3eae8281498dc62=
9e2
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2b782fb745c61ec629ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2b782fb745c61ec62=
9ef
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2ee84e26c32739c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2ee84e26c32739c62=
976
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a302570842db8dcc62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a302570842db8dcc62=
984
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a36b5ab77947a0bc6296e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a36b5ab77947a0bc62=
96f
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a37192302f569e6c62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a37192302f569e6c62=
977
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a377d6ba6f5834cc6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a377d6ba6f5834cc62=
96b
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2be924c6a72558c6297b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2be924c6a72558c62=
97c
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2bd5bf24abcfc3c62989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2bd5bf24abcfc3c62=
98a
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a341ea0b4cdf454c6297b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a341ea0b4cdf454c62=
97c
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2967329f4a2e0fc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2967329f4a2e0fc62=
969
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a6e57c06f050bc62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a6e57c06f050bc62=
976
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2abc6c8d0fe04bc62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2abc6c8d0fe04bc62=
972
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2af9caaede0038c6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2af9caaede0038c62=
98f
        failing since 5 days (last pass: next-20220207, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2cd9ac08d7125dc6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2cd9ac08d7125dc62=
97b
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d79d76bbe41b4c6297e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d79d76bbe41b4c62=
97f
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2db68c051c1802c6299f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2db68c051c1802c62=
9a0
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2943fd20df2fddc62988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2943fd20df2fddc62=
989
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a59df797be407c62980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a59df797be407c62=
981
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a98500377681fc62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a98500377681fc62=
977
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2af8c23d728c0cc629ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2af8c23d728c0cc62=
9ae
        failing since 5 days (last pass: next-20220207, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2cc6ac08d7125dc62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2cc6ac08d7125dc62=
976
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2cdc20de377b7ac62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2cdc20de377b7ac62=
982
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d3dae8281498dc629de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d3dae8281498dc62=
9df
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2fc1c43abc97dbc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2fc1c43abc97dbc62=
969
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/620a309de28eee0a24c629ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a309de28eee0a24c62=
9af
        failing since 5 days (last pass: next-20220207, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a367c64bf165845c62990

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a367c64bf165845c62=
991
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a36f527d97570a6c6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a36f527d97570a6c62=
980
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a3795a97520ce8cc62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a3795a97520ce8cc62=
972
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2c2489283d8d90c6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2c2489283d8d90c62=
96c
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2bd672e5b7b71bc6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2bd672e5b7b71bc62=
96b
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip       | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a33e51e7eaec15ec62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a33e51e7eaec15ec62=
982
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2942fd20df2fddc62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2942fd20df2fddc62=
986
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a44e86f7ed3ecc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a44e86f7ed3ecc62=
969
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2aaa500377681fc62984

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2aaa500377681fc62=
985
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d000811ddc876c62970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d000811ddc876c62=
971
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d3fceeb33f27fc62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d3fceeb33f27fc62=
982
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2dca04ccc08a94c62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2dca04ccc08a94c62=
979
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a294288a8d5ec1ac6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a294288a8d5ec1ac62=
970
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a58df797be407c6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a58df797be407c62=
97e
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a96a11c325732c629c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a96a11c325732c62=
9c1
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2c9e44210447f1c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2c9e44210447f1c62=
96a
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d02f3526a86e8c62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d02f3526a86e8c62=
97a
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d51b0d174920cc6298c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d51b0d174920cc62=
98d
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2b8912ae63dca0c6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2b8912ae63dca0c62=
96b
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2f38321bc1af0cc62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2f38321bc1af0cc62=
96a
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2fc4c43abc97dbc62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2fc4c43abc97dbc62=
978
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a36909461e5d75ac62970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a36909461e5d75ac62=
971
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a370857324ac4fec6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a370857324ac4fec62=
970
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a37e4d271209ef5c6299a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a37e4d271209ef5c62=
99b
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2bd524c6a72558c6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2bd524c6a72558c62=
970
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2bad79ec71747bc62994

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2bad79ec71747bc62=
995
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a33814b8be3c566c6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a33814b8be3c566c62=
980
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2993353ad4c64fc62980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2993353ad4c64fc62=
981
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a1e7f1dd75f7ec62994

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a1e7f1dd75f7ec62=
995
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2aab24cb6356d9c62a08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2aab24cb6356d9c62=
a09
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2af8caaede0038c6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2af8caaede0038c62=
980
        failing since 5 days (last pass: next-20220207, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d2a433079af8ac62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d2a433079af8ac62=
979
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d651559e187c4c62998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d651559e187c4c62=
999
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2e08837562b357c6299e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2e08837562b357c62=
99f
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a294461240a4e53c62984

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a294461240a4e53c62=
985
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a1f430830e64ec62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a1f430830e64ec62=
96a
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2a97a11c325732c629c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2a97a11c325732c62=
9c6
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2ad12ec1e91726c62972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2ad12ec1e91726c62=
973
        failing since 5 days (last pass: next-20220207, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2cd9ac08d7125dc6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2cd9ac08d7125dc62=
97e
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d29ae8281498dc62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d29ae8281498dc62=
982
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2d6699a14fc78ac62989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2d6699a14fc78ac62=
98a
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2c2c89283d8d90c62980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2c2c89283d8d90c62=
981
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2e6d8393b6de49c629b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2e6d8393b6de49c62=
9b7
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/620a2fda6e3c6acac6c629d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a2fda6e3c6acac6c62=
9d2
        failing since 3 days (last pass: next-20220208, first fail: next-20=
220210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/620a30dc13d5fd0b67c6297b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a30dc13d5fd0b67c62=
97c
        failing since 5 days (last pass: next-20220207, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a376dd3fcd626e7c62992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a376dd3fcd626e7c62=
993
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/620a380c36d27aae62c62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a380c36d27aae62c62=
974
        failing since 5 days (last pass: next-20220208, first fail: next-20=
220209) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/620a3030cf9813e9dac6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620a3030cf9813e9dac62=
96d
        failing since 2 days (last pass: next-20220210, first fail: next-20=
220211) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620a358932763bdeb6c62996

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/620a358932763bdeb6c629bb
        failing since 21 days (last pass: next-20220121, first fail: next-2=
0220124)

    2022-02-14T10:56:38.569758  <4>[   22.640119] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-02-14T10:56:39.422274  /lava-5691381/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre  | clang-14 | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/620a2f7373d53a8d71c62993

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620a2f7373d53a8=
d71c62997
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220209)
        16 lines

    2022-02-14T10:31:02.235778  kern  :alert : 8<--- cut here ---
    2022-02-14T10:31:02.236033  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-14T10:31:02.236203  kern  :alert : [000001a0] *pgd=3D7d<8>[   3=
7.162638] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-14T10:31:02.236360  4f6835
    2022-02-14T10:31:02.236512  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-14T10:31:02.236660  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-14T10:31:02.236808  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620a2f7373d53a8=
d71c62998
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220209)
        83 lines

    2022-02-14T10:31:02.278939  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-14T10:31:02.279217  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c21a2c00 pointer offset 64 size 1024
    2022-02-14T10:31:02.279391  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-14T10:31:02.279548  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a2c00 pointer offset 608 size 1024
    2022-02-14T10:31:02.279705  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c21a2c00 pointer offset 64 size 1024
    2022-02-14T10:31:02.279856  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-14T10:31:02.321763  kern  :alert : Register r9 information: non=
-paged memory
    2022-02-14T10:31:02.321951  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c21a2c00 pointer offset 128 size 1024
    2022-02-14T10:31:02.322112  kern  :alert : Register r11 information: sl=
ab kmalloc-64 start c4e58700 pointer offset 0 size 64
    2022-02-14T10:31:02.322266  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (45 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe    | clang-14 | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/620a2f99c8dab3cee7c62987

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620a2f99c8dab3c=
ee7c6298b
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220209)
        16 lines

    2022-02-14T10:31:36.071495  kern  :alert : 8<--- cut here ---
    2022-02-14T10:31:36.082336  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-14T10:31:36.091603  kern  :alert : [000001a0] *pgd=3D7d[   43.5=
64951] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-14T10:31:36.091934  500835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620a2f99c8dab3c=
ee7c6298c
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220209)
        83 lines

    2022-02-14T10:31:36.097058  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-14T10:31:36.102466  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-14T10:31:36.106208  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-14T10:31:36.111691  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-14T10:31:36.122591  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4eb1c00 pointer offset 64 size 1024
    2022-02-14T10:31:36.126349  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-14T10:31:36.137300  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4eb1c00 pointer offset 608 size 1024
    2022-02-14T10:31:36.142853  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4eb1c00 pointer offset 64 size 1024
    2022-02-14T10:31:36.152045  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-14T10:31:36.157405  kern  :alert : Register r9 information: non=
-paged memory =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/620a28ce34361e9bb2c629ac

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620a28ce34361e9=
bb2c629b0
        failing since 6 days (last pass: next-20220127, first fail: next-20=
220208)
        16 lines

    2022-02-14T10:02:39.535884  kern  :alert : 8<--- cut here ---
    2022-02-14T10:02:39.578896  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-14T10:02:39.579117  kern  :alert : [000001a0] *pgd=3D7d072835
    2022-02-14T10:02:39.579281  kern  :alert : Register<8>[   37.076623] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-14T10:02:39.579436   r0 information: NULL pointer
    2022-02-14T10:02:39.579583  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-14T10:02:39.579729  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-14T10:02:39.579872  kern  :alert : Register r3 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620a28ce34361e9=
bb2c629b1
        failing since 6 days (last pass: next-20220127, first fail: next-20=
220208)
        54 lines

    2022-02-14T10:02:39.622053  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c19b3400 pointer offset 64 size 1024
    2022-02-14T10:02:39.622277  kern  :alert : Register r5 information: sla=
b task_struct start c28bc400 pointer offset 0
    2022-02-14T10:02:39.622446  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c19a1c00 pointer offset 16 size 1024
    2022-02-14T10:02:39.622599  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c19b3400 pointer offset 128 size 1024
    2022-02-14T10:02:39.622746  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-14T10:02:39.664966  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c19a1c00 pointer offset 0 size 1024
    2022-02-14T10:02:39.665173  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c2dd3c00 pointer offset 0 size 1024
    2022-02-14T10:02:39.665341  kern  :alert : Register r11 information: NU=
LL pointer
    2022-02-14T10:02:39.665499  kern  :alert : Register r12 information: sl=
ab task_struct start c28bc400 pointer offset 0
    2022-02-14T10:02:39.665653  kern  :emerg : Internal error: Oops: 17 [#1=
] SMP THUMB2 =

    ... (46 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/620a2a0db6e5dc289bc629ec

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620a2a0db6e5dc2=
89bc629f0
        failing since 6 days (last pass: next-20220128, first fail: next-20=
220208)
        16 lines

    2022-02-14T10:08:07.001325  kern  :alert : 8<--- cut here ---
    2022-02-14T10:08:07.001550  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-14T10:08:07.001728  kern  :alert : [000001a0] *pgd=3D7d348835
    2022-02-14T10:08:07.001854  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-14T10:08:07.001969  ke<8>[   36.979972] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-02-14T10:08:07.002080  rn  :alert : Register r1 information: non-s=
lab/vmalloc memory
    2022-02-14T10:08:07.002187  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620a2a0db6e5dc2=
89bc629f1
        failing since 6 days (last pass: next-20220128, first fail: next-20=
220208)
        54 lines

    2022-02-14T10:08:07.044508  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-14T10:08:07.044777  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c451bc00 pointer offset 64 size 1024
    2022-02-14T10:08:07.044948  kern  :alert : Register r5 information: sla=
b task_struct start c22eee80 pointer offset 0
    2022-02-14T10:08:07.045104  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-14T10:08:07.045256  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c451bc00 pointer offset 128 size 1024
    2022-02-14T10:08:07.045403  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-14T10:08:07.087315  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024
    2022-02-14T10:08:07.087523  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c4519800 pointer offset 0 size 1024
    2022-02-14T10:08:07.087654  kern  :alert : Register r11 information: NU=
LL pointer
    2022-02-14T10:08:07.087772  kern  :alert : Register r12 information: sl=
ab task_struct start c22eee80 pointer offset 0 =

    ... (47 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/620a28ce838f5c1e31c62972

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620a28ce838f5c1=
e31c62976
        failing since 6 days (last pass: next-20220127, first fail: next-20=
220208)
        16 lines

    2022-02-14T10:02:36.360597  kern  :alert : 8<--- cut here ---
    2022-02-14T10:02:36.371636  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-14T10:02:36.372012  kern  :alert : [000001a0] *pgd=3D7d0b3835
    2022-02-14T10:02:36.380707  kern  :alert : Register[   44.803346] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620a28ce838f5c1=
e31c62977
        failing since 6 days (last pass: next-20220127, first fail: next-20=
220208)
        54 lines

    2022-02-14T10:02:36.386184   r0 information: NULL pointer
    2022-02-14T10:02:36.391772  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-14T10:02:36.395397  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-14T10:02:36.400945  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-14T10:02:36.411864  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c2d9b400 pointer offset 64 size 1024
    2022-02-14T10:02:36.421012  kern  :alert : Register r5 information: sla=
b task_struct start c287f700 pointer offset 0
    2022-02-14T10:02:36.426501  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c19a1c00 pointer offset 16 size 1024
    2022-02-14T10:02:36.435682  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c2d9b400 pointer offset 128 size 1024
    2022-02-14T10:02:36.441216  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-14T10:02:36.452143  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c19a1c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/620a2a4916ee52ad24c62970

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220214/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620a2a4916ee52a=
d24c62974
        failing since 6 days (last pass: next-20220128, first fail: next-20=
220208)
        16 lines

    2022-02-14T10:08:50.165561  kern  :alert : 8<--- cut here ---
    2022-02-14T10:08:50.176457  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-14T10:08:50.176877  kern  :alert : [000001a0] *pgd=3D7d355835
    2022-02-14T10:08:50.185661  kern  :alert : Register[   44.069479] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620a2a4916ee52a=
d24c62975
        failing since 6 days (last pass: next-20220128, first fail: next-20=
220208)
        54 lines

    2022-02-14T10:08:50.191155   r0 information: NULL pointer
    2022-02-14T10:08:50.196555  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-14T10:08:50.200395  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-14T10:08:50.205863  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-14T10:08:50.216799  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c21b2000 pointer offset 64 size 1024
    2022-02-14T10:08:50.220574  kern  :alert : Register r5 information: sla=
b task_struct start c459ee80 pointer offset 0
    2022-02-14T10:08:50.231495  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-14T10:08:50.240721  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c21b2000 pointer offset 128 size 1024
    2022-02-14T10:08:50.246233  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-14T10:08:50.257163  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (44 line(s) more)  =

 =20
