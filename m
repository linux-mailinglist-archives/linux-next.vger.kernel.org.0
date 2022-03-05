Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 057914CE1FA
	for <lists+linux-next@lfdr.de>; Sat,  5 Mar 2022 02:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbiCEBzi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Mar 2022 20:55:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiCEBzh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Mar 2022 20:55:37 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881611C2D8E
        for <linux-next@vger.kernel.org>; Fri,  4 Mar 2022 17:54:48 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id t19so5707298plr.5
        for <linux-next@vger.kernel.org>; Fri, 04 Mar 2022 17:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vxrwA5ZarhzEvwpQ2z7lLmY+xY2wvv3aIzGirmcwh68=;
        b=fEajJ345ubg1MiUKe1v9kjBl42G9vVaF2/yEGfJarAFJ34lzJC6p45uCkHGkOzXA8O
         at8xoAUxdx6KWh1B4BtUqJ4UtbnreVYhtCyHrM8RAYBJI/UQkeMPrDQUAPBONp3pt6Uh
         ucSlSo/aqOGDsFqphRwWdkzdAP7r6q4nIkt6oB9RsfgnhgK6vqAmzqdXxTh6631SrUbk
         giAHT4xuJGQNGSBbOVgmB+SgskK70JSVUPrSg22qaY3nu4cljO3uby5s8WKTbFWQrH/b
         xHV6MiHupULbvXE1d+fpKJOz3tW1bn5Plc1pVgGmdLgPe7Z+O951c83yygdAUMIXIQRw
         Yv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vxrwA5ZarhzEvwpQ2z7lLmY+xY2wvv3aIzGirmcwh68=;
        b=GZ2Lm96CMWQOlRIYJEmF3amkj8Kcbra6pTqcMzNQ3eE/9vhVPHEAkixfp+N/NSNilm
         J46k6vxI4ADuhd+PtczH2bfvOcS6va+K3ruj07d+dMOQ+gmu+xDX9Sfu6ge0GcqJej8k
         rPwlEQSywBbklHXd7CrtPtK7Looq2eJga/cy1mbffaxMldbhnQ4BNFkrewdQerj4ax31
         5EIGhjeQE0nMFgbvoIRyzSgHs51uog06m9eqedaH8HVdCyqpHeYlpGv645aWn9MF/+oW
         QENME7CHDDZ/n5rJ2aAekthAKqTzZ9SoNYdIh4lZiJY9Yg4Hzr2YQkhc9HK8Qsry6ZG3
         Y2IQ==
X-Gm-Message-State: AOAM531tlv8ueahKJZl8srd3usrARHdLOTNZv69z9CzQzhSX1y4MTwYh
        gXweha9O+z4OXZm3gRhEgoiF4OLksHnhz5s/cFE=
X-Google-Smtp-Source: ABdhPJxkjyXy4y9qux5TzOBSuCPibihtDRcollW1TV9MPPzi9g1PzkenQ8/d9TftKHmRhSRhQ/2gfA==
X-Received: by 2002:a17:90a:f186:b0:1bf:285a:2731 with SMTP id bv6-20020a17090af18600b001bf285a2731mr1525364pjb.22.1646445287700;
        Fri, 04 Mar 2022 17:54:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bh6-20020a056a00308600b004f6aa0367f6sm4089841pfb.118.2022.03.04.17.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:54:47 -0800 (PST)
Message-ID: <6222c2e7.1c69fb81.fed2.cc92@mx.google.com>
Date:   Fri, 04 Mar 2022 17:54:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220304
Subject: next/master baseline: 340 runs, 18 regressions (next-20220304)
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

next/master baseline: 340 runs, 18 regressions (next-20220304)

Regressions Summary
-------------------

platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
beagle-xm                    | arm    | lab-baylibre | clang-14 | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm    | lab-cip      | gcc-10   | omap2plus=
_defconfig          | 1          =

da850-lcdk                   | arm    | lab-baylibre | clang-14 | multi_v5_=
defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre | gcc-10   | multi_v5_=
defconfig           | 1          =

meson-g12a-u200              | arm64  | lab-baylibre | gcc-10   | defconfig=
+debug              | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre | gcc-10   | oxnas_v6_=
defconfig           | 1          =

panda                        | arm    | lab-baylibre | gcc-10   | omap2plus=
_defconfig          | 1          =

qemu_i386                    | i386   | lab-baylibre | gcc-10   | i386_defc=
onfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-baylibre | gcc-10   | i386_defc=
onfig+debug         | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre | gcc-10   | x86_64_de=
fconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre | gcc-10   | x86_64_de=
fconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre | gcc-10   | x86_64_de=
fconfig+debug       | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre | clang-14 | multi_v7_=
defconfig           | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre | gcc-10   | multi_v7_=
defconfig           | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre | gcc-10   | sunxi_def=
config              | 1          =

zynqmp-zcu102                | arm64  | lab-cip      | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220304/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220304
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6d284ba80c0c485bcaa7bdf67f232d572640edc4 =



Test Regressions
---------------- =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
beagle-xm                    | arm    | lab-baylibre | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6222995eb92b79a41fc6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220226043049+f8ca5=
fabdb54-1~exp1~20220226043142.74)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6222995eb92b79a41fc62=
96c
        new failure (last pass: next-20220215) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
beaglebone-black             | arm    | lab-cip      | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62228f00d9a8897cddc62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228f00d9a8897cddc62=
97a
        new failure (last pass: next-20220201) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm    | lab-baylibre | clang-14 | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62229e4add04afaa48c6299c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220226043049+f8ca5=
fabdb54-1~exp1~20220226043142.74)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v5_defconfig/clang-14/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v5_defconfig/clang-14/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62229e4add04afaa48c62=
99d
        failing since 1 day (last pass: next-20220301, first fail: next-202=
20303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm    | lab-baylibre | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62229cf383301b1c6ec62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62229cf383301b1c6ec62=
969
        new failure (last pass: next-20220301) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6222a1cd7a1e3b419cc62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6222a1cd7a1e3b419cc62=
984
        new failure (last pass: next-20220303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre | gcc-10   | oxnas_v6_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62228aea44b930d5ffc62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228aea44b930d5ffc62=
972
        failing since 1 day (last pass: next-20220301, first fail: next-202=
20303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
panda                        | arm    | lab-baylibre | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62228def25dfa66088c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228def25dfa66088c62=
969
        new failure (last pass: next-20220201) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_i386                    | i386   | lab-baylibre | gcc-10   | i386_defc=
onfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/62228cc906795e66fdc62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228cc906795e66fdc62=
979
        new failure (last pass: next-20220303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre | gcc-10   | i386_defc=
onfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/62228cdc9b1b9d9441c629a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228cdc9b1b9d9441c62=
9a3
        new failure (last pass: next-20220303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre | gcc-10   | x86_64_de=
fconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62229155e822e4f6f6c629d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62229155e822e4f6f6c62=
9da
        new failure (last pass: next-20220303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre | gcc-10   | x86_64_de=
fconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62229152e822e4f6f6c629d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62229152e822e4f6f6c62=
9d4
        new failure (last pass: next-20220303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre | gcc-10   | x86_64_de=
fconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62229154e822e4f6f6c629d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62229154e822e4f6f6c62=
9d7
        new failure (last pass: next-20220303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62228db15769715399c629b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228db15769715399c62=
9b2
        new failure (last pass: next-20220303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6222905b9057770971c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220226043049+f8ca5=
fabdb54-1~exp1~20220226043142.74)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun5i-a13-olinuxino-micro=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun5i-a13-olinuxino-micro=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6222905b9057770971c62=
976
        failing since 1 day (last pass: next-20220301, first fail: next-202=
20303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62228d138bfa4706fec6298c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n5i-a13-olinuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228d138bfa4706fec62=
98d
        failing since 1 day (last pass: next-20220301, first fail: next-202=
20303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62228eb7810d9947a5c62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228eb7810d9947a5c62=
977
        new failure (last pass: next-20220301) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/62228a42696a8fc7dac629b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228a42696a8fc7dac62=
9b3
        failing since 1 day (last pass: next-20220201, first fail: next-202=
20303) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64  | lab-cip      | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62228b90f9960ccf1ec62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220304/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220304/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62228b90f9960ccf1ec62=
969
        new failure (last pass: next-20220303) =

 =20
