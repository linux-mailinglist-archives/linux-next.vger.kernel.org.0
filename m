Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D1A20D47A
	for <lists+linux-next@lfdr.de>; Mon, 29 Jun 2020 21:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730018AbgF2TIs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 15:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730514AbgF2TCm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 15:02:42 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98ED7C030F26
        for <linux-next@vger.kernel.org>; Mon, 29 Jun 2020 09:37:32 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id f2so7299571plr.8
        for <linux-next@vger.kernel.org>; Mon, 29 Jun 2020 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mPCZqkXpl/N5YSg1KZoyWv5XjwrxyARIg2fRs30tzSk=;
        b=yJ+GlwJ/nsop5jVMsYLuQk8asioYwMbpLE9UWTcu9R5wORVQnwu2zs/8pnQSyfH23N
         30FFM3dmM2Dkt5o4EfyQjWB0DK4x3wKaK+tA1IoMo0eCRZObcIUlPe8F0BO6AoFVHc+V
         eE7Fh+qPAr9RAfz3Y5HgaZmiTZq/FIM5QFWV5m8JPFK0cM1fZChgwxl2vsLBViTsxF4T
         avJ1MdoyGTqs3tJzxwe6VpSAHcho1zQjxzuvyhp2s7v71/yNhLetiX9NN+AIxu85RKQx
         Gh7ksc5NzSxBAYyXUKKUwTJRll+c8Bp57MvgNwyxAaE9Mr09dpi+5SQqj7Bv3D7pcI7R
         vo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mPCZqkXpl/N5YSg1KZoyWv5XjwrxyARIg2fRs30tzSk=;
        b=Y4ydKlZSy0xAgQx2j1Ja4xvX6UKcPQ7nfMyTZJdfFe47MkUe8ylT1SQDCAIlzNpqZS
         e0/Jkg8qGPg9E6Mi7/yKnisxwdTOiybnmRz2Q1Rf60H3pAH6PP79LrC5yoUbx0VkG72I
         b5kWaozzyNKfy2HAG5VSlWika4ac3DvJXq2By7Z4757cluueZC1f3mtNIVkfBHw6fN7A
         hre2C9DuCvmQBThlvzmWq7WlJ1jLnqiRiKNkiD8fshkN9IzB8kbhdHWM4lRYTj8joikH
         bEdKLvyP8Zcittt4P6nEHvKkcMK667Zy6na81+noc38xEgX2uTU+VTD5VwaWHwCRFOLY
         p6Gw==
X-Gm-Message-State: AOAM533Nig/sdIpskxgMu/2jFCKpruNitRvHivgm8WTSiC/NtOyWwnDZ
        ZBNuqYU5Lj6ZL5tj0A6PuUI5iLXGOk8=
X-Google-Smtp-Source: ABdhPJwkrtY0O4mI+mAak3WkK6hf877KeC2phCy21KVNEah65R4HINKUf9Lfsot9SX2+UpW+4asyQQ==
X-Received: by 2002:a17:90a:9606:: with SMTP id v6mr15765777pjo.110.1593448651755;
        Mon, 29 Jun 2020 09:37:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m14sm259957pgn.83.2020.06.29.09.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 09:37:30 -0700 (PDT)
Message-ID: <5efa18ca.1c69fb81.621a6.0ad8@mx.google.com>
Date:   Mon, 29 Jun 2020 09:37:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200629
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 195 runs, 4 regressions (next-20200629)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 195 runs, 4 regressions (next-20200629)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip       | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200629/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200629
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c28e58ee9dadc99f79cf16ca805221feddd432ad =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ef9e0f9db13548df085bb4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200629/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200629/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ef9e0f9db13548df085b=
b4f
      new failure (last pass: next-20200625) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef9dd1ad7639d30ae85bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200629/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200629/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef9dd1ad7639d30=
ae85bb1b
      failing since 14 days (last pass: next-20200603, first fail: next-202=
00615)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip       | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef9dd1b574da2c24085bb28

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200629/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200629/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef9dd1b574da2c2=
4085bb2b
      failing since 14 days (last pass: next-20200603, first fail: next-202=
00615)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef9dd15574da2c24085bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200629/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200629/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef9dd15574da2c2=
4085bb1b
      failing since 14 days (last pass: next-20200603, first fail: next-202=
00615)
      2 lines =20
