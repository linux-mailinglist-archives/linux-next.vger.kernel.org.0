Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9560B473D57
	for <lists+linux-next@lfdr.de>; Tue, 14 Dec 2021 07:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhLNGrf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Dec 2021 01:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhLNGre (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2021 01:47:34 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B242AC061574
        for <linux-next@vger.kernel.org>; Mon, 13 Dec 2021 22:47:34 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id z6so12897152plk.6
        for <linux-next@vger.kernel.org>; Mon, 13 Dec 2021 22:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/4O8I4b8uvBdzX3tctko8VZXzqeg0WIe2qjeUZm++NQ=;
        b=pwSaOo9ELBZW9FM1a+Kr6pSzZlW2qGv62t57EKftZjWKb91lcLP8f58L87jHjxVe4N
         ABxw75vvmvd8aGTfj2N1ArOUaD8XlIbj+Nk7ok9eSCTML1KVBPSy1tN+6YAxsL1E3umo
         eGLU4ztFipv7g9uOraKEU3zj89bfj4sczx+g7yqS1jVayc6dqBJLWQ226LMnQCajcIeo
         cbtiIAlcmPEFJiywxtu57LtHBOTqcNKn0vTG/vMGPJTABQDxq7+aXEExIWrYdq+Q4TqC
         0tdq1vBfZkV6R5jOkVfcEV8jntEAZWynoiHdF85Qo6hBKcoaJetBNvjfH/B/RZHTo0sc
         o7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/4O8I4b8uvBdzX3tctko8VZXzqeg0WIe2qjeUZm++NQ=;
        b=vXmPfGH7xkdVv0HCnZFhv6/WmQu2Gzo9ErEIoALKRNY1yqJ1IDjWYXdTAxvQ/igjzA
         9zJ8wjVs+e3/3BFwStsRTiVuShMFwcX5A66oB9ex1cdeY+meAoJm7gTVBQO4xV6gwtEC
         fNbSMLdqrE1GYehP5I/hryRSZWwNwZXdjo4jwUiK6isl1V9xyglS26aYJW/uW+uPuvep
         taajBhfeldC4UmpWXdYPEUDYWYmU9R13/P6MUoUfFynuVxz1mT2SHLQbhDdHQsMUKmmw
         8szG4PNxphVjkMYxEHTA7Bb1FeElBB97fDsdjUfG3E10djc/wEYHkRLdw+YPeFy4aN9H
         esTg==
X-Gm-Message-State: AOAM530zqrF/Qg5/07pTzbNkzvGH685mM7/9P5Ks5lqmxHExe5Zr0gtr
        +2YRS3FB0pNcCUPmn+aqhJzX0Tftupni+NO9
X-Google-Smtp-Source: ABdhPJzgH2OJNVLa2AUYcGcBo24oT8BLazopUgOFBYqR8ZuRGTbdIh4pZKvnSBbTPsI7yNq2ILDm9w==
X-Received: by 2002:a17:90b:1e0e:: with SMTP id pg14mr3607754pjb.143.1639464453914;
        Mon, 13 Dec 2021 22:47:33 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x1sm11814365pgh.1.2021.12.13.22.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 22:47:33 -0800 (PST)
Message-ID: <61b83e05.1c69fb81.c5541.24ec@mx.google.com>
Date:   Mon, 13 Dec 2021 22:47:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc5-103-g80aa1498c144
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 550 runs,
 6 regressions (v5.16-rc5-103-g80aa1498c144)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 550 runs, 6 regressions (v5.16-rc5-103-g80aa14=
98c144)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

meson-gxbb-p200            | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

minnowboard-turbot-E3826   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+amdgpu      | 1          =

minnowboard-turbot-E3826   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc5-103-g80aa1498c144/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc5-103-g80aa1498c144
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      80aa1498c144a980fa1d4874bf7f276a67b83558 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82328859147ed8b39713f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82328859147ed8b397=
140
        failing since 34 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
meson-gxbb-p200            | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b80ff781d74f4e0339711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b80ff781d74f4e03397=
11f
        new failure (last pass: v5.16-rc4-356-ga119cd39dcbf) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b80c6c3f63c34cc339713d

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61b80c6c3f63c34=
cc3397142
        new failure (last pass: v5.16-rc4-356-ga119cd39dcbf)
        2 lines

    2021-12-14T03:15:42.767605  kern  :emerg : reboot: HARDWARE P<8>[   15.=
658167] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dli=
nes MEASUREMENT=3D2>
    2021-12-14T03:15:42.768727  ROTECTION shu<8>[   15.666786] <LAVA_SIGNAL=
_ENDRUN 0_dmesg 1241234_1.5.2.4.1>
    2021-12-14T03:15:42.769742  tdown (Temperature too high)
    2021-12-14T03:15:42.770727  + set +x   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/61b804025b328bfad039717a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b804025b328bfad0397=
17b
        new failure (last pass: v5.16-rc4-356-ga119cd39dcbf) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8083b6ccdbd1744397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8083b6ccdbd1744397=
149
        new failure (last pass: v5.16-rc4-356-ga119cd39dcbf) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61b80ac3d071944f18397160

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylibre/basel=
ine-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-1=
03-g80aa1498c144/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylibre/basel=
ine-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b80ac3d071944f18397=
161
        new failure (last pass: v5.16-rc4-356-ga119cd39dcbf) =

 =20
