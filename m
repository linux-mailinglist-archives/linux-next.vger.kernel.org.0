Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF80576C42B
	for <lists+linux-next@lfdr.de>; Wed,  2 Aug 2023 06:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbjHBEbg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Aug 2023 00:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbjHBEb2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 00:31:28 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB82C10D4
        for <linux-next@vger.kernel.org>; Tue,  1 Aug 2023 21:31:23 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bba04b9df3so50971155ad.0
        for <linux-next@vger.kernel.org>; Tue, 01 Aug 2023 21:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690950683; x=1691555483;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FaSxmhUBooPem58Ixeyj1481s6iPe7FxPTV88LPjVkQ=;
        b=a5rhq5Q7SnfW2GL4rXE19Kp5HwTSxY+uPTglsuDKqeZP622Fx4JJm117KFpXGNWPtJ
         AvKmF+9C3dB0vWYqw2GehXYWyt4miyZ//ZKuL1dX006p0aww7EfcUYPNlOTglHAVY5m0
         qngOM4HfHSMYiV1ohm/ALDnFfv2KzbMFlHPS+TtOST/kwCytWS4i3kPBzbEXIm1yO6Wy
         g0mEugJwz59XHgLGKZqK/AgIBQHhHKVVeKmkZkACLYaIpAC29vPDLvpYYM2agoP17X/m
         hqVZueH5DrdMAz9BW1cGJ1EvHQ2uJVADgs9C9ejFHCV9dZGLklkVl19jGRMrJT4zqPX4
         uF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690950683; x=1691555483;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaSxmhUBooPem58Ixeyj1481s6iPe7FxPTV88LPjVkQ=;
        b=bSso6/ECfDO1RIGQ+49sTQm1PSUbBkC/62eGmbupWk/5fRZqzVh3MNP9mIQYrBd4Kv
         DLcmPQZ30HI9b/s13S45A4LbYYBm4g59kZ3uaWfXq7BS1rFtXSX3N+AchYE3z/Jj38EZ
         x/muwYbPKPMB8g7sKolXbYBGDIJPZmzEIJmtaZyG/4Zgu2jo2uWOqHFaXLn74jXmtaFI
         +dYiBvsGTeHrqljEAYh3KIjNABhy0Zrkn6X0eUvxPPyL8S7gTYIPDjTJCKqPamPLAA1/
         tP12t+lQ6UKxCMysKbywehKKVBpeQ6T0AxwC5WmbiAedaUFbqgfNcz/0wZ75Rp3u9uAz
         6bmQ==
X-Gm-Message-State: ABy/qLbUDPPjIhOTBOdUy3lsO+EszueBMoYzrfjxnRbyda7m4fRLW3TZ
        xTo+mBcUMygkL8AE6JnpHabiCce5ZXdtunhzzAb1RA==
X-Google-Smtp-Source: APBJJlGp+78jeKezbDLpeyMT0PcoNoinGtzImV/lEfJalug3Ph036Ya+WRVcCkc0/n1WtWIWFodX5g==
X-Received: by 2002:a17:902:efc7:b0:1b8:73a4:706a with SMTP id ja7-20020a170902efc700b001b873a4706amr12585028plb.69.1690950682377;
        Tue, 01 Aug 2023 21:31:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090274c800b001b39ffff838sm11229225plt.25.2023.08.01.21.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 21:31:21 -0700 (PDT)
Message-ID: <64c9dc19.170a0220.63414.6f9a@mx.google.com>
Date:   Tue, 01 Aug 2023 21:31:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc4-271-g34fbf9d4c5844
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 63 runs,
 58 regressions (v6.5-rc4-271-g34fbf9d4c5844)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 63 runs, 58 regressions (v6.5-rc4-271-g34fbf9d=
4c5844)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
bcm2711-rpi-4-b              | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

fsl-ls1028a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig          | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig          | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig          | 1          =

fsl-lx2160a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig          | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig          | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig          | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig          | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig          | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

mt8365-evk                   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

qemu_i386                    | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig     | 1          =

qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig     | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig     | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig     | 1          =

qemu_riscv64                 | riscv  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

qemu_riscv64                 | riscv  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

qemu_smp8_riscv64            | riscv  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

qemu_smp8_riscv64            | riscv  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig   | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig   | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig   | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig   | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig   | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig          | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig          | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

rk3588-rock-5b               | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc4-271-g34fbf9d4c5844/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc4-271-g34fbf9d4c5844
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      34fbf9d4c584469c2b06b8a434f20ecbe63221ba =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
bcm2711-rpi-4-b              | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac14128a4880628ace26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-=
4-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-=
4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac14128a4880628ac=
e27
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
fsl-ls1028a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac6ee71160dc1e8ace25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac6ee71160dc1e8ac=
e26
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac828f474f6d238ace32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac828f474f6d238ac=
e33
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac71e71160dc1e8ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac71e71160dc1e8ac=
e29
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
fsl-lx2160a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac80e71160dc1e8ace2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-lx2160a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac80e71160dc1e8ac=
e2c
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9aa28dd1b2985638ace2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleas=
hed-a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleas=
hed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9aa28dd1b2985638ac=
e30
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac0b84baace4808ace2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac0b84baace4808ac=
e2f
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac28f312065a678ace24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac28f312065a678ac=
e25
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac22128a4880628ace2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-=
nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-=
nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac22128a4880628ac=
e2f
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac22482c05f1088ace30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac22482c05f1088ac=
e31
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac31b2406f67f68ace1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beag=
leboneai64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beag=
leboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac31b2406f67f68ac=
e20
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac0b482c05f1088ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac0b482c05f1088ac=
e1d
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac0c50762260668ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac0c50762260668ac=
e1d
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac0984baace4808ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac0984baace4808ac=
e29
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac534374b5334f8ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac534374b5334f8ac=
e24
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9abd776c446aca48ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-od=
roid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-od=
roid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9abd776c446aca48ac=
e1d
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac588ee3ce0b2c8ace2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s90=
5x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s90=
5x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac588ee3ce0b2c8ac=
e2b
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac371e94d4929b8ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905=
x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905=
x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac371e94d4929b8ac=
e21
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
mt8365-evk                   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac378f474f6d238ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-mt8365-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-baylibre/baseline-mt8365-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac378f474f6d238ac=
e24
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9adb5a2d72ac2b58ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9adb5a2d72ac2b58ac=
e1d
        new failure (last pass: v6.5-rc3-393-g6d8e2e5dcd42c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac394374b5334f8ace1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac394374b5334f8ac=
e1f
        new failure (last pass: v6.5-rc3-393-g6d8e2e5dcd42c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9adb3adbfe236a98ace24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9adb3adbfe236a98ac=
e25
        new failure (last pass: v6.5-rc3-393-g6d8e2e5dcd42c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac387044d055f08ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac387044d055f08ac=
e29
        new failure (last pass: v6.5-rc3-393-g6d8e2e5dcd42c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ad483ac9bdb1c98ace1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ad483ac9bdb1c98ac=
e20
        new failure (last pass: v6.5-rc3-393-g6d8e2e5dcd42c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac35ac012072928ace25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac35ac012072928ac=
e26
        new failure (last pass: v6.5-rc3-393-g6d8e2e5dcd42c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ad8ba69fa618858ace1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ad8ba69fa618858ac=
e1f
        new failure (last pass: v6.5-rc3-393-g6d8e2e5dcd42c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac379dac857df08ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac379dac857df08ac=
e23
        new failure (last pass: v6.5-rc3-393-g6d8e2e5dcd42c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9acff641b6238568ace2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9acff641b6238568ac=
e2c
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9abfd76c446aca48ace2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9abfd76c446aca48ac=
e2f
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac4d641b6238568ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac4d641b6238568ac=
e21
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9abfb84baace4808ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9abfb84baace4808ac=
e23
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac37641b6238568ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac37641b6238568ac=
e1e
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9abf984baace4808ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9abf984baace4808ac=
e1d
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac4b1e94d4929b8ace25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac4b1e94d4929b8ac=
e26
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9abfa76c446aca48ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9abfa76c446aca48ac=
e29
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_i386                    | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a8003895471de88ace1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a8003895471de88ac=
e20
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a7fd026a99f0858ace3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i38=
6.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i38=
6.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a7fd026a99f0858ac=
e3f
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a7ff3895471de88ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a7ff3895471de88ac=
e1d
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a7fc21d6b4e04c8ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i38=
6-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i38=
6-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a7fc21d6b4e04c8ac=
e1d
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_riscv64                 | riscv  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9aacf6f63b070368ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9aacf6f63b070368ac=
e21
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_riscv64                 | riscv  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9aa19dd1b2985638ace29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9aa19dd1b2985638ac=
e2a
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_smp8_riscv64            | riscv  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9aa1b4d3169320e8ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_smp8_risc=
v64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_smp8_risc=
v64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9aa1b4d3169320e8ac=
e24
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_smp8_riscv64            | riscv  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9aa184d3169320e8ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_smp8_ri=
scv64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_smp8_ri=
scv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9aa184d3169320e8ac=
e1e
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a96780d12e2e978ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a96780d12e2e978ac=
e21
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a96680d12e2e978ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a96680d12e2e978ac=
e1d
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a9687eb0b895e68ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a9687eb0b895e68ac=
e21
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a9677eb0b895e68ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a9677eb0b895e68ac=
e1d
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a96abecbabeb478ace21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a96abecbabeb478ac=
e22
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9a969becbabeb478ace1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9a969becbabeb478ac=
e1f
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac1684baace4808ace41

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rz=
g2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rz=
g2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac1684baace4808ac=
e42
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac4b8ee3ce0b2c8ace25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac4b8ee3ce0b2c8ac=
e26
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac11482c05f1088ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulc=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulc=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac11482c05f1088ac=
e23
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac1a50762260668ace2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulc=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulc=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac1a50762260668ac=
e2c
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac1184baace4808ace37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac1184baace4808ac=
e38
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
rk3588-rock-5b               | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac1af312065a678ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3588-rock-=
5b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3588-rock-=
5b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac1af312065a678ac=
e1d
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac24482c05f1088ace37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pin=
e64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pin=
e64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac24482c05f1088ac=
e38
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac2250762260668ace30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac2250762260668ac=
e31
        failing since 13 days (last pass: v6.5-rc2-246-gefabeaa08ef1, first=
 fail: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig          | regressions
-----------------------------+--------+-----------------+----------+-------=
-------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64c9ac1284baace4808ace3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-27=
1-g34fbf9d4c5844/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c9ac1284baace4808ac=
e3b
        new failure (last pass: v6.5-rc4-220-gd08ef24947110) =

 =20
