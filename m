Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7934620A08C
	for <lists+linux-next@lfdr.de>; Thu, 25 Jun 2020 16:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405335AbgFYODC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Jun 2020 10:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405200AbgFYODC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2020 10:03:02 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79026C08C5C1
        for <linux-next@vger.kernel.org>; Thu, 25 Jun 2020 07:03:02 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id u185so1029350pfu.1
        for <linux-next@vger.kernel.org>; Thu, 25 Jun 2020 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jGYwXRep0N444QzDaN2DeGARpOHTuaT9+By2bdw+Gbo=;
        b=Cx9yqTmvw01huF3iMznmJ5auqRddIQjAgTWJXSCHT34FlwLtgjFm0wZe/qiAd/Y/ki
         lkLigZ5aC6VPgN/Tdv6Ajb5onZ7MAEeeM8f2LkYDfL+GSXtfyBeqtqyGJajwDcdsz7uV
         MZlxGulc4M09T3u1HzZ5OE1jdkXP3RJ6EZ6RiPUC0Pmp0B6ZZMXJsGHhXBlL+QQp8i3/
         Z6xAWdRee1OpHGqtM8du+Zrb+NJtH+U0SJPZFnn2pb2A90TTmq6B2dPhhFbalPVeu7Qw
         h0z2O+WN/jpwP5rYdHOKY/reD5kBxMZQR64ApqrKjf1Pn/wbzJe9R5SjN1wef7YC5CLb
         wasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jGYwXRep0N444QzDaN2DeGARpOHTuaT9+By2bdw+Gbo=;
        b=kJ2zURraVvfCkfh4k7oDXg3fizfQ0qxTeTc6FeQk4raoxpbu95sMBby+163KrRorSQ
         bmNy0W/wIFUhbTMLRr21SlQ+2abvVtyoOIN0ltQ6hua7iK4wipWbO9yJYEHIsjPrPp7d
         W/2PzUev4jELz/2Re/74h0EAwZIDGb6b7v2Vd/Lf9KWPJKxb/xqJv7VteHscbA3ZxkRT
         eEl3PhAi0SnTN7vv7Djs8wIHRiWhchAPhjxEl6+wuEvX/50FFnmuM5S3nOhUp7IDWog0
         bIBHvpfFw9v13VS9ze+W6agm1o56FjlM11hyl012KERBUXCt61GyAIYjL1E4vKrSGJUP
         Xj+A==
X-Gm-Message-State: AOAM530jAK/wAauzHaOmTIFf7NRCFBt5HXQR3qfzTGqpsNkmGFFE0REH
        Nwf/w4p2zVTELuTWupdDSGWvd4VQ9hU=
X-Google-Smtp-Source: ABdhPJxh+/LHRF07etQgczf1miCO9RB/6Q9J99Rvp36IADgFK0RCpfrYnsxDTl4/D5GcL3H44DgDSg==
X-Received: by 2002:a62:1d8e:: with SMTP id d136mr34051311pfd.323.1593093781339;
        Thu, 25 Jun 2020 07:03:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w15sm8650672pjb.44.2020.06.25.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 07:03:00 -0700 (PDT)
Message-ID: <5ef4ae94.1c69fb81.4bbaf.8cf8@mx.google.com>
Date:   Thu, 25 Jun 2020 07:03:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200625
Subject: next/master baseline: 106 runs, 5 regressions (next-20200625)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 106 runs, 5 regressions (next-20200625)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200625/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200625
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3f9437c6234d95d96967f1b438a4fb71b6be254d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef472084ed47a129997bf7f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200625/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200625/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef472084ed47a12=
9997bf82
      failing since 0 day (last pass: next-20200623, first fail: next-20200=
624)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef473d81707c621eb97bf49

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200625/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200625/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef473d81707c621=
eb97bf4c
      new failure (last pass: next-20200624)
      1 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ef474b5b3800686e897c003

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200625/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200625/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ef474b5b3800686e897c=
004
      new failure (last pass: next-20200624) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef47124aa6a32d30797bf21

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200625/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200625/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef47124aa6a32d3=
0797bf24
      failing since 19 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef4715ebbd9bb41e997bf17

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200625/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200625/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef4715ebbd9bb41=
e997bf1a
      failing since 19 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
