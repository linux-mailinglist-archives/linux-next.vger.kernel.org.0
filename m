Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87F420544D
	for <lists+linux-next@lfdr.de>; Tue, 23 Jun 2020 16:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732750AbgFWOU7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 10:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732657AbgFWOU7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2020 10:20:59 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C844C061573
        for <linux-next@vger.kernel.org>; Tue, 23 Jun 2020 07:20:59 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id u14so1538885pjj.2
        for <linux-next@vger.kernel.org>; Tue, 23 Jun 2020 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wLnzfom4cnmAJ52EXcgNgnk25+TQZBwzFO9wyp7aeVU=;
        b=UchUUA70ckyB6aCwNATWh5op06RUezqi5kaaPszxVdMj4HCKUSCVvxs6WBl5aJE7e2
         V+Rhy7bYD55FsjiL/ESDTOn/2cmQiWxcFIXhc0GvWonVdaP6kBPL9Qxq9hzUw+vCzKiw
         Ak0lAucL0K9qDZXNpevqXC4r4Se51nsGa4ZCOTlizLoXqKfSAIUfDQo7lG+nRRTHsQh3
         ND29EnjuGRLcnCuoanzBOd7Cut09b9iXL9p1UM9TBpn9Qy47ltLnHzc7bwY1encBZ8Tr
         Y1gPxjay6ee23byhjQt0MdRZYsQanmX3d+uKBsNRbt38ptpJ4B9pRFGZxOxReNjW8xWG
         DC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wLnzfom4cnmAJ52EXcgNgnk25+TQZBwzFO9wyp7aeVU=;
        b=OWn/5qb7wMhNpmVoifQqbbRD8TVJc1JLFjfgqo0g1S8mrR6iPTP/3xrjHlELF2hzci
         m4uHSr/BpSoGaCvW5C1FI8tuwXIhToDTZGvEwNb287oNtuY1aJb0NHABrOI3TnyCff9q
         83A7zBsP+LW9Kg30l193UbtB/VlMVRMl0mKZ0VLHNaz5/RTRvmN8UCbGJMyrLs+GUghT
         G2PVvxNcpGSJaaL3Mn4nBTIyQXZQXunNuPAUSRwMYJgtgCsJJ6KhKHD5f4YlcRrCYXB4
         ZFTjTAgSxgExQfYou5GEF4PsyqQEEdw1wHuJX7dmZUEKCxwv+xt0iGQLax2oFiWbjMUh
         A0RA==
X-Gm-Message-State: AOAM5327K1TrY0cLn9qWGZ8GhnCvbDcZ/j40X2P5FH7Kr8sDnz3wviaq
        3oHycH+pm53tB/cSYKP5x4z3zs0e3pc=
X-Google-Smtp-Source: ABdhPJxTIvVuDIT1Eg0ewOghrVJhaJr4bDYkQYga2XjT5ki5HncQlIrT/imbSMYQ8rcy9qcQvJyHZQ==
X-Received: by 2002:a17:902:6bc5:: with SMTP id m5mr24507927plt.101.1592922058383;
        Tue, 23 Jun 2020 07:20:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k19sm18093441pfg.153.2020.06.23.07.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 07:20:57 -0700 (PDT)
Message-ID: <5ef20fc9.1c69fb81.e42a9.61a9@mx.google.com>
Date:   Tue, 23 Jun 2020 07:20:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200623
Subject: next/master baseline: 126 runs, 5 regressions (next-20200623)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 126 runs, 5 regressions (next-20200623)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm   | lab-baylibre  | gcc-8    | bcm2835_d=
efconfig            | 3/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 4/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200623/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200623
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      37e7f89b58c9732c6843602ec3e1db9aa00086f2 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm   | lab-baylibre  | gcc-8    | bcm2835_d=
efconfig            | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef1d46b5dd9d3252a97bf21

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200623/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200623/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5ef1d46b5dd9d32=
52a97bf25
      new failure (last pass: next-20200618)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ef1=
d46b5dd9d3252a97bf26
      new failure (last pass: next-20200618)
      29 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef1d1a3e68d98e07e97bf13

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200623/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200623/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ef1d1a4e68d98e=
07e97bf18
      new failure (last pass: next-20200622)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef1d60cd7a85d027f97bf2e

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200623/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200623/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef1d60dd7a85d02=
7f97bf31
      failing since 17 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef1d6a02689bcf03897bf0d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200623/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200623/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef1d6a02689bcf0=
3897bf10
      failing since 17 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
