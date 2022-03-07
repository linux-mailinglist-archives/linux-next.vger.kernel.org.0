Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE744D093D
	for <lists+linux-next@lfdr.de>; Mon,  7 Mar 2022 22:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241847AbiCGVRJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Mar 2022 16:17:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242263AbiCGVRI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Mar 2022 16:17:08 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF1B70CEB
        for <linux-next@vger.kernel.org>; Mon,  7 Mar 2022 13:16:11 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v1-20020a17090a088100b001bf25f97c6eso676235pjc.0
        for <linux-next@vger.kernel.org>; Mon, 07 Mar 2022 13:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rxYEiZx62dY9cXf0CA71oRUB6r4rW3cS/4ix/d8lYZE=;
        b=aWukPdtNTMdGfh4DYKjrcfHlVnEaMGKgCI7db+5Jzr7Eze8h7eTsayfeUWtn4YbQCP
         qhlHIw1dI+fbs/NuYgSeDT/fngprGVpe7ZaCN5lKWbcLKpYgtQSUoYtY2R0TH5km1yPv
         WRpAX8evhxUMIf44EbOofxTdmAnvAm4aKkIv04XoNfNS/C1DsRoSSvwNkbp+PMdDvQyi
         BrZObhSjG5yTaQId8ZLMbN+detpXq9sX4aqQ1NjD2RM7WDa7NB4xUNZwSc10MSQmcAV2
         vTiibY/hiBL8RisJXNsa0lwS2EmUiSpIhlxy64F44MRHgcu7tYE4ltbkMXt42U9YVl0i
         2rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rxYEiZx62dY9cXf0CA71oRUB6r4rW3cS/4ix/d8lYZE=;
        b=7PxXAPS3OX6ySSmcRiiCcyyUfU3j0MMtnZXBRx9niBpYpz9Dps0GIrVgPoz5tfUDTW
         G5FsI25/actNqHwJ7X3/1Zd8Fw/U5kE6RIwBDOuDz7h+U+g1jJzMpI3OSfqqPsZudn5O
         BTfq92dMBpN+emoSeDAABMmjsbNAeHHH3FjFvJ9CEPJ0/kKv4UoGMSlqOtT90AHd0CoU
         29n1V09hU+jyHhrX01Wo+kwcrA95xlbRoyPzailM1alORQwGViNwaMZ11FHxn5b92FPi
         5KhZyaMBYUnVhFOAn9qpatr0GmJbquLkQYrBQw+9A+RIyks2puIWKflm4T7cslilSxRL
         clnA==
X-Gm-Message-State: AOAM532x/+JO7UD8d3uXJSgFjJXKPKXNJQ2YApataue8GGfvsANMl2Pq
        LjxEiz84KVynWMQCMDKk4ohrkLMdtnlAVquLwPQ=
X-Google-Smtp-Source: ABdhPJzVyT+5veSu5kQbdsnN8fY7q+D7aHHoscLIPrMNlq/SbNEF8G4CTtC44bSfjzVgzjfDhyVx9g==
X-Received: by 2002:a17:903:2285:b0:151:ae75:21c6 with SMTP id b5-20020a170903228500b00151ae7521c6mr14215059plh.32.1646687770745;
        Mon, 07 Mar 2022 13:16:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 67-20020a630846000000b00372782a65d0sm13686606pgi.60.2022.03.07.13.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 13:16:10 -0800 (PST)
Message-ID: <6226761a.1c69fb81.b7c27.41f4@mx.google.com>
Date:   Mon, 07 Mar 2022 13:16:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220307
Subject: next/master baseline: 95 runs, 10 regressions (next-20220307)
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

next/master baseline: 95 runs, 10 regressions (next-20220307)

Regressions Summary
-------------------

platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
beagle-xm                    | arm  | lab-baylibre | clang-14 | multi_v7_de=
fconfig   | 1          =

beaglebone-black             | arm  | lab-cip      | gcc-10   | omap2plus_d=
efconfig  | 1          =

ox820-clouden...lug-series-3 | arm  | lab-baylibre | gcc-10   | oxnas_v6_de=
fconfig   | 1          =

panda                        | arm  | lab-baylibre | gcc-10   | omap2plus_d=
efconfig  | 1          =

qemu_arm-vexpress-a9         | arm  | lab-baylibre | gcc-10   | vexpress_de=
fconfig   | 1          =

qemu_i386                    | i386 | lab-baylibre | gcc-10   | i386_defcon=
fig+debug | 1          =

qemu_i386-uefi               | i386 | lab-baylibre | gcc-10   | i386_defcon=
fig+debug | 1          =

sun4i-a10-olinuxino-lime     | arm  | lab-baylibre | clang-14 | multi_v7_de=
fconfig   | 1          =

sun5i-a13-olinuxino-micro    | arm  | lab-baylibre | clang-14 | multi_v7_de=
fconfig   | 1          =

sun5i-a13-olinuxino-micro    | arm  | lab-baylibre | gcc-10   | sunxi_defco=
nfig      | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220307/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220307
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      519dd6c19986696f59847ff8bf930436ccffd9a1 =



Test Regressions
---------------- =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
beagle-xm                    | arm  | lab-baylibre | clang-14 | multi_v7_de=
fconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/622645e5c2ee56d9f1c629a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220226043049+f8ca5=
fabdb54-1~exp1~20220226043142.74)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622645e5c2ee56d9f1c62=
9a4
        failing since 2 days (last pass: next-20220215, first fail: next-20=
220304) =

 =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
beaglebone-black             | arm  | lab-cip      | gcc-10   | omap2plus_d=
efconfig  | 1          =


  Details:     https://kernelci.org/test/plan/id/62264768ba97ae6fa4c62974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62264768ba97ae6fa4c62=
975
        failing since 2 days (last pass: next-20220201, first fail: next-20=
220304) =

 =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
ox820-clouden...lug-series-3 | arm  | lab-baylibre | gcc-10   | oxnas_v6_de=
fconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/62263d6719c5c7b41ac62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62263d6719c5c7b41ac62=
97a
        failing since 4 days (last pass: next-20220301, first fail: next-20=
220303) =

 =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
panda                        | arm  | lab-baylibre | gcc-10   | omap2plus_d=
efconfig  | 1          =


  Details:     https://kernelci.org/test/plan/id/622645af66023c83f4c629ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622645af66023c83f4c62=
9ac
        failing since 2 days (last pass: next-20220201, first fail: next-20=
220304) =

 =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
qemu_arm-vexpress-a9         | arm  | lab-baylibre | gcc-10   | vexpress_de=
fconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/62263f81ba8d7113b6c6299f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62263f81ba8d7113b6c62=
9a0
        failing since 4 days (last pass: next-20220201, first fail: next-20=
220303) =

 =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
qemu_i386                    | i386 | lab-baylibre | gcc-10   | i386_defcon=
fig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/62263e2e14e921bf26c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62263e2e14e921bf26c62=
969
        failing since 2 days (last pass: next-20220303, first fail: next-20=
220304) =

 =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
qemu_i386-uefi               | i386 | lab-baylibre | gcc-10   | i386_defcon=
fig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/62263e2df42d750208c6298b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62263e2df42d750208c62=
98c
        failing since 2 days (last pass: next-20220303, first fail: next-20=
220304) =

 =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
sun4i-a10-olinuxino-lime     | arm  | lab-baylibre | clang-14 | multi_v7_de=
fconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/622646274e14f61d95c6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220226043049+f8ca5=
fabdb54-1~exp1~20220226043142.74)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622646274e14f61d95c62=
980
        new failure (last pass: next-20220211) =

 =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
sun5i-a13-olinuxino-micro    | arm  | lab-baylibre | clang-14 | multi_v7_de=
fconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/62264663a8671a1995c6299a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220226043049+f8ca5=
fabdb54-1~exp1~20220226043142.74)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun5i-a13-olinuxino-micro=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun5i-a13-olinuxino-micro=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62264663a8671a1995c62=
99b
        failing since 4 days (last pass: next-20220301, first fail: next-20=
220303) =

 =



platform                     | arch | lab          | compiler | defconfig  =
          | regressions
-----------------------------+------+--------------+----------+------------=
----------+------------
sun5i-a13-olinuxino-micro    | arm  | lab-baylibre | gcc-10   | sunxi_defco=
nfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/62263d5119c5c7b41ac6296e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220307/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220307/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62263d5119c5c7b41ac62=
96f
        failing since 4 days (last pass: next-20220201, first fail: next-20=
220303) =

 =20
