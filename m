Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9C1324E9A
	for <lists+linux-next@lfdr.de>; Thu, 25 Feb 2021 11:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBYKxJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 05:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234875AbhBYKvY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2021 05:51:24 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B152EC06174A
        for <linux-next@vger.kernel.org>; Thu, 25 Feb 2021 02:50:43 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id w18so3344930pfu.9
        for <linux-next@vger.kernel.org>; Thu, 25 Feb 2021 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MC88ryhUIiw+pEMjA2SiEkgPzBqT0+VQS/fR3XNT84o=;
        b=qLqiIpI2V4cjOAJ1ofd6N6GTko1LyGvnBPBNYJTZLCPxQfgFjsBAvGg7cmxq/Fv+hm
         DQOigBwohiK5btLk+A2r8I58Wq9iCDk+i2gBLKlmQCXZ2vcEbsSnNFmBoYIyXRkOhfSR
         WUP1fZZUQNMNRre4+q+eNwqlhNkfODF4twSeAY7XNqBTDddauVKgq/EyFZGR2Dx2zx+G
         N0LC8SbC5R0jnknjWBW/zwYl7Gvgp5R+1TzaLyXlxtBq+1IqrQMpfmNtKVfXf2WxgVsg
         H7+w/f43bj+qsFysSknq7V0CvwjcJn9AFKbmFl2Z4Vvg67M9bLYy/WfHXS6rnZlMLFrk
         SzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MC88ryhUIiw+pEMjA2SiEkgPzBqT0+VQS/fR3XNT84o=;
        b=lTGHEX6DnCnw7yOarAagg+7u2EG9T4rHoBWBaP7eHpi1BaKORdw8KxKnAPOyvWL5p7
         r8toHJsoKBtA+FEjsvpb+vXfRsHTX+833vQOHiB9/EPjxjbSVV+0m9rA5vPKdvFAZt2v
         IlGhOpUi0rfOKq7IFfh66Zpa7dWjrHj3cUj44TyOR3y1DtSrxUHKWt1cIrx5fAJFPtdE
         NyHfEQVMnS/1SH9SpxGpd9Xey/oret1qTLJsWjm62+duZwB4pXoTQ5n91HYWhircLAD6
         /Mjn5Nl/JljuGI/zfd9kYYndBcw5BiivxcSIB/EKm1vfF+JjrR0Fv8n+e1pa54Bu5LIq
         u5WQ==
X-Gm-Message-State: AOAM530SyavZeQsxMP91LEpuRe5mmKiGwf1veIB4lhuoXiS/nUYugb5+
        WoVcfmdiKBvdWWeRTJxoRdUmIMqd/gdcJw==
X-Google-Smtp-Source: ABdhPJwjiy6FIlyuBoQszrsJv9epwr/kl5QnHbI3B0BUVU7PnPur4vLKZV9am89CXL/B25LHAMtr9Q==
X-Received: by 2002:aa7:9550:0:b029:1ee:46a:b8f7 with SMTP id w16-20020aa795500000b02901ee046ab8f7mr2741552pfq.11.1614250242552;
        Thu, 25 Feb 2021 02:50:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w3sm5746331pjn.12.2021.02.25.02.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:50:42 -0800 (PST)
Message-ID: <60378102.1c69fb81.7a34e.c12d@mx.google.com>
Date:   Thu, 25 Feb 2021 02:50:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210225
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 378 runs, 29 regressions (next-20210225)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 378 runs, 29 regressions (next-20210225)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15          | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =

am57xx-beagle-x15          | arm   | lab-linaro-lkft | gcc-8    | omap2plus=
_defconfig          | 1          =

hifive-unleashed-a00       | riscv | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

hip07-d05                  | arm64 | lab-collabora   | clang-10 | defconfig=
                    | 1          =

hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =

hip07-d05                  | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                  | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
                    | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
                    | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-10 | defconfig=
                    | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-11 | defconfig=
                    | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | gcc-8    | defconfig=
                    | 1          =

meson-gxl-s805x-p241       | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210225/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210225
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7f206cf3ec2bee4621325cfacb2588e5085c07f5 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15          | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/603750ceddad886b16addcbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603750ceddad886b16add=
cbd
        failing since 12 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15          | arm   | lab-linaro-lkft | gcc-8    | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60374e286fa569280eaddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm/=
omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm/=
omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374e286fa569280eadd=
cb2
        new failure (last pass: next-20210223) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hifive-unleashed-a00       | riscv | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6037424b27c4b55840addcfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6037424b27c4b55840add=
cfd
        failing since 51 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/603752597be6ee4847addcb1

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/603752597be6ee48=
47addcb4
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222)
        1 lines

    2021-02-25 07:27:40.546000+00:00  [SOL Session operational.  Use ~? for=
 help]
    2021-02-25 07:27:42.011000+00:00  [serdes_cs_hw_calibration_optionV2_ex=
ec]:Macro1 CS1 LC Vco Cal done!(LCVCOCALDONE) in 0ms
    2021-02-25 07:27:42.011000+00:00  [SerdesCsCalib]:Macro1 CS1 PLL lock s=
uccess!(0 ms)
    2021-02-25 07:27:44.321000+00:00  [serdes_init]:SerDes1 init success!
    2021-02-25 07:27:44.412000+00:00  Continue to dreset PCS
    2021-02-25 07:27:44.412000+00:00  Continue to dreset HLLC
    2021-02-25 07:27:45.421000+00:00  Continue to open PCS RX
    2021-02-25 07:27:45.452000+00:00  Wait for HLLC Training........OK
    2021-02-25 07:27:45.452000+00:00  Wait for HLLC1 Training........OK
    2021-02-25 07:27:45.452000+00:00  Wait for S1 HLLC Training........OK =

    ... (5308 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60375977519a0d1ba0addcff

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/60375977519a0d1b=
a0addd02
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222)
        1 lines

    2021-02-25 07:58:08.134000+00:00  [SOL Session operational.  Use ~? for=
 help]
    2021-02-25 07:58:09.749000+00:00  [serdes_cs_hw_calibration_optionV2_ex=
ec]:Macro1 CS1 LC Vco Cal done!(LCVCOCALDONE) in 0ms
    2021-02-25 07:58:09.749000+00:00  [SerdesCsCalib]:Macro1 CS1 PLL lock s=
uccess!(0 ms)
    2021-02-25 07:58:12.072000+00:00  [serdes_init]:SerDes1 init success!
    2021-02-25 07:58:12.149000+00:00  Continue to dreset PCS
    2021-02-25 07:58:12.149000+00:00  Continue to dreset HLLC
    2021-02-25 07:58:13.199000+00:00  Continue to open PCS RX
    2021-02-25 07:58:13.199000+00:00  Wait for HLLC Training........OK
    2021-02-25 07:58:13.200000+00:00  Wait for HLLC1 Training........OK
    2021-02-25 07:58:13.200000+00:00  Wait for S1 HLLC Training........OK =

    ... (5312 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603748b8bc7fcbb8c7addcc8

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/603748b8bc7fcbb8=
c7addccb
        failing since 1 day (last pass: next-20210219, first fail: next-202=
10223)
        1 lines

    2021-02-25 06:47:04.160000+00:00  [SOL Session operational.  Use ~? for=
 help]
    2021-02-25 06:47:05.700000+00:00  [serdes_cs_hw_calibration_optionV2_ex=
ec]:Macro1 CS1 LC Vco Cal done!(LCVCOCALDONE) in 0ms
    2021-02-25 06:47:05.700000+00:00  [SerdesCsCalib]:Macro1 CS1 PLL lock s=
uccess!(0 ms)
    2021-02-25 06:47:08.023000+00:00  [serdes_init]:SerDes1 init success!
    2021-02-25 06:47:08.121000+00:00  Continue to dreset PCS
    2021-02-25 06:47:08.121000+00:00  Continue to dreset HLLC
    2021-02-25 06:47:09.100000+00:00  Continue to open PCS RX
    2021-02-25 06:47:09.140000+00:00  Wait for HLLC Training........OK
    2021-02-25 06:47:09.141000+00:00  Wait for HLLC1 Training........OK
    2021-02-25 06:47:09.141000+00:00  Wait for S1 HLLC Training........OK =

    ... (5266 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/603749dabb8c8c84a4addcde

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/603749dabb8c8c84=
a4addce1
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222)
        1 lines

    2021-02-25 06:51:24.696000+00:00  [SOL Session operational.  Use ~? for=
 help]
    2021-02-25 06:51:24.992000+00:00  [serdes_cs_hw_calibration_optionV2_ex=
ec]:Macro1 CS1 LC Vco Cal done!(LCVCOCALDONE) in 0ms
    2021-02-25 06:51:24.992000+00:00  [SerdesCsCalib]:Macro1 CS1 PLL lock s=
uccess!(0 ms)
    2021-02-25 06:51:27.281000+00:00  [serdes_init]:SerDes1 init success!
    2021-02-25 06:51:27.342000+00:00  Continue to dreset PCS
    2021-02-25 06:51:27.342000+00:00  Continue to dreset HLLC
    2021-02-25 06:51:28.384000+00:00  Continue to open PCS RX
    2021-02-25 06:51:28.385000+00:00  Wait for HLLC Training........OK
    2021-02-25 06:51:28.385000+00:00  Wait for HLLC1 Training........OK
    2021-02-25 06:51:28.386000+00:00  Wait for S1 HLLC Training........OK =

    ... (5306 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6037451bfa97ad8113addcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6037451bfa97ad8113add=
cbc
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60374a2ed8bf3fbdc8addcd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374a2ed8bf3fbdc8add=
cd5
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603747103073477a2badde18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603747103073477a2badd=
e19
        failing since 6 days (last pass: next-20210217, first fail: next-20=
210218) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6037488bd08991aa8faddcce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6037488bd08991aa8fadd=
ccf
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60374380c7ff025a07addcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-pengutronix/baseline-im=
x8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-pengutronix/baseline-im=
x8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374380c7ff025a07add=
cc4
        failing since 5 days (last pass: next-20210218, first fail: next-20=
210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60374905f53591e3f9addd4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374905f53591e3f9add=
d4e
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60374a4e5e5517331baddcc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-11/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-11/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374a4e5e5517331badd=
cc3
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603746685d1a4b1dc8addcbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-pengutronix/baseline-imx8m=
q-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-pengutronix/baseline-imx8m=
q-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603746685d1a4b1dc8add=
cbd
        failing since 1 day (last pass: next-20210219, first fail: next-202=
10223) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/603747b46c74a5cb61addd03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603747b46c74a5cb61add=
d04
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxl-s805x-p241       | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6037468fc0039a7be6addccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6037468fc0039a7be6add=
cce
        new failure (last pass: next-20210224) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6037438ac625433f93addcc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6037438ac625433f93add=
cc1
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60374b344a8a6655ffaddcc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374b344a8a6655ffadd=
cc6
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60374c88b790e83eafaddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374c88b790e83eafadd=
cb2
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60374507b25a02f499addccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374507b25a02f499add=
cce
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/603748771b9858ae8daddcc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603748771b9858ae8dadd=
cc1
        failing since 5 days (last pass: next-20210217, first fail: next-20=
210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60374284d5d182f04faddcf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374284d5d182f04fadd=
cf1
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/603746e4bcab16a9caaddcc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603746e4bcab16a9caadd=
cc5
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/603748611b9858ae8daddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603748611b9858ae8dadd=
cb2
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60374608d532145ab1addcc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374608d532145ab1add=
cca
        failing since 2 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603743cdd6efeacca0addcc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603743cdd6efeacca0add=
cca
        failing since 14 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60374689df30c05d71addd62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60374689df30c05d71add=
d63
        failing since 14 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603747dd7961cd756baddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210225/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603747dd7961cd756badd=
cb2
        failing since 105 days (last pass: next-20201110, first fail: next-=
20201111) =

 =20
