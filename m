Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F4120EFED
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 09:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgF3Hyf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Jun 2020 03:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726966AbgF3Hye (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2020 03:54:34 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A328CC061755
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 00:54:34 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id f2so8154768plr.8
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 00:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HnTrNI9sUToYH/eQNUsK3NnDJeiANAo/bFMnj748KAA=;
        b=0KcvxGC+aZtFlsQQ6HaCZioURZj0cL4wjqP2s39oZRquv1Vl1dBmUWGYm9nJ0hQO8j
         PSvULXXmbgun6H0H2tXMp9DbZUryP0k66Sl66uGWxgLeels/luGRLnIMBlx4ZoJz5wg2
         JxM5AAyLlZF4kDZodzS9touIf5h8aLFviMK3f06MdaEWfLlQ3lnawgSDEyyZorHjzhyq
         onO7mHBx8gi8DFV/mLAGGrLY6YQ+aqHij1ArqD6eSTehhhfgf1gJRRtt/76GFDNulfH2
         RXsMIAj8fKAQBBmuFfTTxiRckjizypGPPstzx+MGGTJeKxi+FeNTE7GOPF8S9FgzLwC1
         u7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HnTrNI9sUToYH/eQNUsK3NnDJeiANAo/bFMnj748KAA=;
        b=qreoedZ24Cu6JT5fMuRYpbiA1xQEhret/JUwI25xCADXpt4MGxCzZgHNnNh49cHZTj
         RTPP6JK39kdKrEJfXU3nDcLd4cv9oznRJRaXxrvkAAyX6XyCHIBeS1mXX0TWF0jGlr9u
         6WnQ7eAAlBbYci/Tsiqoh+VgHU7paNC/otxysbe/pBlWR9wDsuVOMVuAfiTkugjoI67W
         7l0SCoSOO4G+BvDgLDCfPx9tB/7sz5F39PFCk8P9ffSAvvFUu4zNUTH+Vdjc/LzALmjC
         ScutwQOXqU8t90ywXOkHo3ZY+s3ZzfqqTmygxFUAu0bOuy2HBI+DN5551As+GnZKNg0h
         mCwA==
X-Gm-Message-State: AOAM532nrXko6rzHJN4d4XeyunesLe12tnm3L2shjjHrYGHWDfVS452+
        ePeEkt0R+A9Eewhpsd/fK8zO5cAuupk=
X-Google-Smtp-Source: ABdhPJzY9j/5XT6qmvdVosTN8o7hwMGP1ugUuhwy5J15hqoQiRN5hCr6pD6YziRjpFQeWuUBGYdMIA==
X-Received: by 2002:a17:902:ff0c:: with SMTP id f12mr16984676plj.254.1593503673700;
        Tue, 30 Jun 2020 00:54:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l12sm1658731pff.212.2020.06.30.00.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 00:54:32 -0700 (PDT)
Message-ID: <5efaefb8.1c69fb81.3876e.59d7@mx.google.com>
Date:   Tue, 30 Jun 2020 00:54:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc3-210-g0a3929819868
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 229 runs,
 6 regressions (v5.8-rc3-210-g0a3929819868)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 229 runs, 6 regressions (v5.8-rc3-210-g0a39298=
19868)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 0/1    =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip       | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc3-210-g0a3929819868/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc3-210-g0a3929819868
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0a39298198681fe7b6ad576dc2ae15b326d0344a =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efaba3cd82f18bf7885bb5b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efaba3cd82f18bf=
7885bb60
      failing since 6 days (last pass: v5.8-rc2-295-g0780e0d6abd0, first fa=
il: v5.8-rc2-376-g1c7e639860a8)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efab58c7e6427bf7385bb3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efab58c7e6427bf7385b=
b3b
      new failure (last pass: v5.8-rc3-164-g155c91ddae03) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efabe9893a75668e485bb35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efabe9893a75668e485b=
b36
      new failure (last pass: v5.8-rc2-376-g1c7e639860a8) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efab4db24c0d2343385bb33

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efab4db24c0d234=
3385bb38
      new failure (last pass: v5.8-rc2-453-gf59148f15013)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip       | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efab4dc20c5983bb485bb35

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efab4dc20c5983b=
b485bb38
      new failure (last pass: v5.8-rc2-453-gf59148f15013)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efab4db20c5983bb485bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-21=
0-g0a3929819868/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efab4db20c5983b=
b485bb1b
      new failure (last pass: v5.8-rc2-453-gf59148f15013)
      2 lines =20
