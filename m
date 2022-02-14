Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B69694B408D
	for <lists+linux-next@lfdr.de>; Mon, 14 Feb 2022 05:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbiBNEBp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Feb 2022 23:01:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234964AbiBNEBo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Feb 2022 23:01:44 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B554EA3B
        for <linux-next@vger.kernel.org>; Sun, 13 Feb 2022 20:01:35 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id m7so13366009pjk.0
        for <linux-next@vger.kernel.org>; Sun, 13 Feb 2022 20:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=A8guyXHAFXVwkK/Infzzmf/fCZDfaZ7aUDeRtmqBiRo=;
        b=5nkG0jv2sd60OthJbjPnqcss/OuA8dBfTbVYpdMVy/A2uyO0gfFF9shHs3Rl8Oqcft
         fsj4IijS09L2p2L3sDbs5+PtryPZuY8Wh6YW7JMwc3yvnPW9oMfn0oZBljTUPClAS9wj
         5EvKNeI2RlAX/BGDyOusUxF7MuEEEYbJU3B2K0uhqFFvzn/kEmVMmLFB35K09mGUgC3v
         1yHl9VJxNJ7nNQJI2AUDNlJRxGZCRwqc2tweed+N0WEKIx965K+h9kG3jNIeBeUR798R
         QqHGtFHpz1fxk7cgDrOws35ohhkNV+RSOTriTRUTOmKXR8mQdpji46NwYs0GMP0D3RK5
         xnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=A8guyXHAFXVwkK/Infzzmf/fCZDfaZ7aUDeRtmqBiRo=;
        b=ayTGnf+tlV91CCnyVJvYiy/2dHuUv6G6JcfiOvJqwG0xg6tyd4ybStfsDYTPwDPuh2
         tbvEBa5JjWLWpyZk7gEpC3IrZGobLPuDqC31N9iDRKlVIMTkJ4w+pJk4gYwiSDX03alx
         aMgOGPqdPffMFBBKFdnpYkEj/vb/9KeJgKdHuuw4nRJVE1nFhm7GixmNfMWwkjom1O/U
         AmmrDIGzlL8iACNB4jNqbcK/dEcYUXCxDmefpAyucjcX5+6XDFKjuldcYksK+f2TuYPA
         9N+QdTw5cXT6hwZSAMfPF+p4ljBd5rva88PC5r1VDHdqwD0fhywPyEcY66bNOQOUVus0
         kmQA==
X-Gm-Message-State: AOAM532MTutMjjwbZfESksHQRSrl66ISG5j7bI/qorq3pYExUxbWC5cP
        GnJJiZGw2r8KQmdcJ8HdZC8H6S/RnxPN0Rjf
X-Google-Smtp-Source: ABdhPJzdnBxaQdZL0zS/+jmNHO1XdrCdZX2rO5/XX9SrcVKmIh3iKe7ACjYEaU9IAT7rN566dmyGMg==
X-Received: by 2002:a17:90a:3846:: with SMTP id l6mr12381132pjf.221.1644811294501;
        Sun, 13 Feb 2022 20:01:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id oo9sm8919823pjb.10.2022.02.13.20.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 20:01:34 -0800 (PST)
Message-ID: <6209d41e.1c69fb81.e2d4c.6920@mx.google.com>
Date:   Sun, 13 Feb 2022 20:01:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc4-173-gecf2acb68532
Subject: next/pending-fixes baseline: 487 runs,
 45 regressions (v5.17-rc4-173-gecf2acb68532)
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

next/pending-fixes baseline: 487 runs, 45 regressions (v5.17-rc4-173-gecf2a=
cb68532)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15          | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

da850-lcdk                 | arm   | lab-baylibre    | gcc-10   | davinci_a=
ll_defconfig        | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc4-173-gecf2acb68532/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc4-173-gecf2acb68532
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ecf2acb685329e7b08aab86ae96f4158613d76de =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15          | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a3cdacac87106dc629ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a3cdacac87106dc62=
9ac
        failing since 3 days (last pass: v5.17-rc3-356-gdfd7907f4e4f, first=
 fail: v5.17-rc3-394-gc849047c2473) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
da850-lcdk                 | arm   | lab-baylibre    | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62099c87311fd05431c629bb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62099c87311fd05=
431c629bf
        failing since 21 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-14T00:03:59.060209  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-14T00:03:59.060516  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-14T00:03:59.060685  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-14T00:03:59.105073  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099bdc452ae8eee1c62991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099bdc452ae8eee1c62=
992
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62099f61d97041d807c6298f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099f61d97041d807c62=
990
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a2d3860fe638bcc629a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a2d3860fe638bcc62=
9a6
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099bbc9a5d9ead01c629a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099bbc9a5d9ead01c62=
9aa
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62099ea0478e88a353c62992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099ea0478e88a353c62=
993
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a1abf5641920abc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a1abf5641920abc62=
969
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099c7b311fd05431c62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099c7b311fd05431c62=
97a
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a4eb98f01f07b2c629c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a4eb98f01f07b2c62=
9ca
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a81fd779e73c2dc62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a81fd779e73c2dc62=
984
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099c07032fba7c99c629af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099c07032fba7c99c62=
9b0
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62099efdbb7783aef6c629ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099efdbb7783aef6c62=
9ad
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a1f6ba356cef17c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a1f6ba356cef17c62=
976
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a2ac3fa4c1efe2c6298a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a2ac3fa4c1efe2c62=
98b
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099be03121c29568c62994

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099be03121c29568c62=
995
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62099e9d6fcbd29429c6299a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099e9d6fcbd29429c62=
99b
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a1354cd323c8fac6299a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a1354cd323c8fac62=
99b
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a197e698be2c23c6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a197e698be2c23c62=
97e
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a487b287356ba8c62991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a487b287356ba8c62=
992
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a747cf344270bcc62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a747cf344270bcc62=
977
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a7bf733424992fc6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a7bf733424992fc62=
96b
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6209b639d95beddb5dc62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209b639d95beddb5dc62=
97a
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099c08032fba7c99c629bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099c08032fba7c99c62=
9c0
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62099f1515d44fde36c62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099f1515d44fde36c62=
972
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a2e766cbdf0030c6298c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a2e766cbdf0030c62=
98d
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099be1b6d37b3900c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099be1b6d37b3900c62=
969
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62099e9f6fcbd29429c629a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099e9f6fcbd29429c62=
9a1
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a1bd5d508d977bc62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a1bd5d508d977bc62=
96a
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099cdf38fc58f163c6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099cdf38fc58f163c62=
96d
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a54b1e2002a72fc62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a54b1e2002a72fc62=
97a
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a837906711b69ac62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a837906711b69ac62=
984
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099c06032fba7c99c629ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099c06032fba7c99c62=
9ad
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62099f14831bac88e0c629a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099f14831bac88e0c62=
9a2
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a1bbf5641920abc629a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a1bbf5641920abc62=
9a2
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a2ab3fa4c1efe2c62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a2ab3fa4c1efe2c62=
986
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099bcd3121c29568c62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099bcd3121c29568c62=
982
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62099e9e478e88a353c6298a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099e9e478e88a353c62=
98b
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a134830f3fa48fc6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a134830f3fa48fc62=
98f
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a1963c7ce56586c6297e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a1963c7ce56586c62=
97f
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62099ce538fc58f163c62972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62099ce538fc58f163c62=
973
        new failure (last pass: v5.17-rc2-403-g6098f9527e1d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a4b34211569923c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a4b34211569923c62=
969
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a6b7bf8b8ae27ac62987

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a6b7bf8b8ae27ac62=
988
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6209a7938718002091c6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209a7938718002091c62=
97e
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6209b6382c08936b2fc62974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc4-1=
73-gecf2acb68532/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6209b6382c08936b2fc62=
975
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =20
