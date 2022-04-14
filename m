Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B43A65004FC
	for <lists+linux-next@lfdr.de>; Thu, 14 Apr 2022 06:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbiDNEUj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Apr 2022 00:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiDNEUj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Apr 2022 00:20:39 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D2732EE9
        for <linux-next@vger.kernel.org>; Wed, 13 Apr 2022 21:18:15 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id t12so3689446pll.7
        for <linux-next@vger.kernel.org>; Wed, 13 Apr 2022 21:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6aMEIATdKq7+WpvDRcbFawRbelNljeEu9Ub8WzKdMEo=;
        b=RvuvYdAToUc4zD9HZPOJMPiiSc7pcX4mHKMCBDWG4lVUzWs1dyjMz+NaucWCReaz6e
         5zSImJnejG7E31MJ63BpXGD3jyZqWWLSdSJgdBD116AW3U+K4lHxozYBiBJVvzdpG8Lg
         jDxOQnlXxycHKPB/lJRQdnHvYPkpYKNQMk26qUbExaJAGA1xQeFJ4i72SnfzzPu7bO5F
         5/W2mVeWfRrnH8oW+6WiwXvSzsOU+cikrOUaKe9BnW4BRSkxm3Zd42ORub4E5Pqzv6rx
         hu7UGemMrdQievm2vPq9U7wUOIbKZk8GwVdDINmsUCpNRqckcnzGktAlWVLfVEqY73rZ
         zZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6aMEIATdKq7+WpvDRcbFawRbelNljeEu9Ub8WzKdMEo=;
        b=LI0LiiX3vgXKS+e+GNQolgnVbZcvFXvgFaB0jOE810bi3An2AQhWCzum7CNMLrk9t/
         mV43l9roGny3HY07CjEWW95AgBe59nZhhUjNaYIWNkL5Om79KeDKOOMbrwgegAD/EZuZ
         tQh8/6Rx1SnqWo9LcE0lUAsXjz35MtHx7YGAjWbGiPBbCFlwpxGySRjLOu9ZQ/0ps79p
         cwhtezZkSz8n+OSQDCE9ypwtIwetNNXUHJGAWNV/X5qEBcQXR5+LHYIFnwG8jg+L9jj+
         n7Lt52QXE6V6wC5SuzISc+mp7Vedayo1wlHdnyyjPRjW6IR/DpvEjHRRqRt8bFlCJ9Bc
         WI1A==
X-Gm-Message-State: AOAM531KyQ8uvc62UgnnCwA5wZHtKe/YlhiGZ0aIZoEGmrjGQm333XT+
        BN1rR/fnTaFQ+ytVtAJlUddnrFc92c3OKEzJ
X-Google-Smtp-Source: ABdhPJzNRcGxvGn/7gwJITmCgUiXsQrVSBz3plVkiNA0ogm9ZVh5UwOocd5TfE8yqaKVE77KBGYuWA==
X-Received: by 2002:a17:902:d511:b0:158:3be2:6637 with SMTP id b17-20020a170902d51100b001583be26637mr23487518plg.107.1649909895090;
        Wed, 13 Apr 2022 21:18:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v16-20020aa78090000000b0050583cb0adbsm584031pff.196.2022.04.13.21.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 21:18:14 -0700 (PDT)
Message-ID: <6257a086.1c69fb81.5220b.238a@mx.google.com>
Date:   Wed, 13 Apr 2022 21:18:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc2-366-ga3e1163f7eb1a
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 294 runs,
 5 regressions (v5.18-rc2-366-ga3e1163f7eb1a)
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

next/pending-fixes baseline: 294 runs, 5 regressions (v5.18-rc2-366-ga3e116=
3f7eb1a)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
da850-lcdk           | arm   | lab-baylibre  | gcc-10   | davinci_all_defco=
nfig        | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-10   | defconfig+arm64-c=
hromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc2-366-ga3e1163f7eb1a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc2-366-ga3e1163f7eb1a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a3e1163f7eb1a309c8e6e8f7851c4c1bf6a16a1d =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
da850-lcdk           | arm   | lab-baylibre  | gcc-10   | davinci_all_defco=
nfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62576c09dd138f7e95ae06a3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62576c09dd138f7=
e95ae06ab
        failing since 80 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-14T00:34:03.402125  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-14T00:34:03.402418  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-14T00:34:03.402591  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-04-14T00:34:03.449820  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62577630af61afae5aae068c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62577630af61afae5aae0=
68d
        new failure (last pass: v5.18-rc2-321-g174c9b9949da) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62578212b6af6be9ebae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62578212b6af6be9ebae0=
67f
        new failure (last pass: v5.18-rc2-321-g174c9b9949da) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/625778f3442cfbec36ae0692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625778f3442cfbec36ae0=
693
        new failure (last pass: v5.18-rc2-321-g174c9b9949da) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-10   | defconfig+arm64-c=
hromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/625772ec7764fbe514ae0692

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
66-ga3e1163f7eb1a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/625772ec7764fbe514ae06b4
        failing since 44 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-14T01:03:30.347789  <8>[   32.642371] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-14T01:03:31.369852  /lava-6084966/1/../bin/lava-test-case   =

 =20
