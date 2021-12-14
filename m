Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2102473FAB
	for <lists+linux-next@lfdr.de>; Tue, 14 Dec 2021 10:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbhLNJkB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Dec 2021 04:40:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhLNJkA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2021 04:40:00 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E12C061574
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 01:40:00 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id o14so13146313plg.5
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 01:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OfU1Cw0+XFfsuoX6kma5LnmxidaiEUsKl8gZXn0QIRs=;
        b=0L+joY+pZ3dZY1IpzUvGFSJ8IFdJdCj3X6c/t0XfMOqyc/EMN/Of/6G+7C4Ed0NwMu
         F93VsgGbJCOb3sMDwApx+l2FvR/pmDA9n4a3iLrzTh4DZQKCUKZ29UUeHlbv4e6RSACr
         bgatRXHe3BGTZ6zvAhT0IoBt52aQYs4BvSG1pk/Z2uAUFEt1dP3DO011JEvxUtkMjhSI
         gUqSOOTluc1Rmr9rImlRGtMBLNA1jcqyFQMEQkNQuyAnrFOZqjjibNY8+dHCA68F4D2S
         8vhYg/PhkRznwcnV4Q3xbf5A3w+Od6gtDv3eDIfhYIjTxSLoAxLtwuZZhjb/CeG1KwAX
         V1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OfU1Cw0+XFfsuoX6kma5LnmxidaiEUsKl8gZXn0QIRs=;
        b=s7UCJZ15c6UVdpNvauaXUrp/vwHh5MzPbwtmArfdkkezj6IgI4WCRickd2lzi8+8BP
         mBJGRborKlmAp/mVMuB5KZPxi8avPXv9tnlkX6ALVJ0RjduMjm/5h6Cl2o8WVdoyipr3
         xc0gll7Nqgi2276VfGXg9rINpDr4WifEvRYJ/Cytrm1PkT5OJUeCre5oqo87qhFYtqNH
         2KdPhQGbVL+Yhr96sUc7vJRDP876UudqZPgm1SDmdx0HQqDHa2PeJBp3pUKwUE4xKszE
         yoybr89AS/Z9tTerKHL7USnIBhc75Y/92pZy9FFhKt72GrNIzjrp980l+xx3ggFu/7k/
         VgKA==
X-Gm-Message-State: AOAM531Nn0t5oOmrCmmzXZB/oZbkCeCTSk2TXeGVhu2BMst/iqeOWJ6m
        9J/G+s9qPhqNyvFw08ssVyfAomXIMxmLh+0R
X-Google-Smtp-Source: ABdhPJwoxjoSjFPxoUmsJWaZHh8ikrs/u8ALMKihcekyXUH1ssJSGP3ZLwvoN33Q6NTKnoYLN6alUw==
X-Received: by 2002:a17:90b:4d0a:: with SMTP id mw10mr4553008pjb.89.1639474799673;
        Tue, 14 Dec 2021 01:39:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s5sm15761233pfk.65.2021.12.14.01.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 01:39:59 -0800 (PST)
Message-ID: <61b8666f.1c69fb81.a0028.b61a@mx.google.com>
Date:   Tue, 14 Dec 2021 01:39:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc5-6644-gbcd5ddb85fad
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 877 runs,
 30 regressions (v5.16-rc5-6644-gbcd5ddb85fad)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 877 runs, 30 regressions (v5.16-rc5-6644-gbcd5ddb85fa=
d)

Regressions Summary
-------------------

platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | clang-13 | defconfi=
g                    | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | clang-13 | defconfi=
g                    | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+ima                | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+crypto             | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g                    | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+crypto             | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g                    | 1          =

bcm2836-rpi-2-b            | arm    | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =

beagle-xm                  | arm    | lab-baylibre    | clang-13 | multi_v7=
_defconfig           | 1          =

minnowboard-turbot-E3826   | x86_64 | lab-collabora   | gcc-10   | x86_64_d=
efcon...86_kvm_guest | 1          =

minnowboard-turbot-E3826   | x86_64 | lab-collabora   | gcc-10   | x86_64_d=
efconfig             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+debug              | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+crypto             | 1          =

sun50i-a64-bananapi-m64    | arm64  | lab-clabbe      | gcc-10   | defconfi=
g                    | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | clang-13 | defconfi=
g                    | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+ima                | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+crypto             | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g                    | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/v5.16-r=
c5-6644-gbcd5ddb85fad/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: v5.16-rc5-6644-gbcd5ddb85fad
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bcd5ddb85fad453da26afd5b3fca8ad931b5253d =



Test Regressions
---------------- =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | clang-13 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82ec5c5cb0dba5839712c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/clang-13/lab-collabora/baseline-bcm2711-rpi-4-b.=
txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/clang-13/lab-collabora/baseline-bcm2711-rpi-4-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82ec5c5cb0dba58397=
12d
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82ef0caef089bcb397128

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabor=
a/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabor=
a/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82ef0caef089bcb397=
129
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | clang-13 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82e94f3e2b6534439713a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/clang-13/lab-linaro-lkft/baseline-bcm2711-rpi-4-=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/clang-13/lab-linaro-lkft/baseline-bcm2711-rpi-4-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82e94f3e2b65344397=
13b
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82ecfb9a99c50f8397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-l=
kft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-l=
kft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82ecfb9a99c50f8397=
149
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8285f7bb4151b5b397134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/b=
aseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/b=
aseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8285f7bb4151b5b397=
135
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8288992e62ec00c39714e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8288992e62ec00c397=
14f
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61b829f1cc178b51f9397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-b=
cm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-b=
cm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b829f1cc178b51f9397=
121
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82a54c0f6a4daa2397146

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-bcm2711-rpi=
-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-bcm2711-rpi=
-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82a54c0f6a4daa2397=
147
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82d74d1cb1580af397145

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82d74d1cb1580af397=
146
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b828527bb4151b5b39712e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft=
/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft=
/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b828527bb4151b5b397=
12f
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61b829e2c09a55f68c39715a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+arm64-chromebook/gcc-10/lab-linaro-lkft/baseline=
-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+arm64-chromebook/gcc-10/lab-linaro-lkft/baseline=
-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b829e2c09a55f68c397=
15b
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82a3f3d45f41237397190

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-bcm2711-r=
pi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-bcm2711-r=
pi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82a3f3d45f41237397=
191
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82d67cf0d1d19fd39719b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.=
txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82d67cf0d1d19fd397=
19c
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/61b832f7fa5901cbb8397125

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b832f7fa5901cbb8397=
126
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
beagle-xm                  | arm    | lab-baylibre    | clang-13 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82ce30bb1e21a9339711f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm/multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.=
txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm/multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82ce30bb1e21a93397=
120
        failing since 13 days (last pass: next-20211129, first fail: next-2=
0211130) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826   | x86_64 | lab-collabora   | gcc-10   | x86_64_d=
efcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61b825b6b1d5658e79397176

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/basel=
ine-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/basel=
ine-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b825b6b1d5658e79397=
177
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826   | x86_64 | lab-collabora   | gcc-10   | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b829c7ec300f205b39712e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minnowboar=
d-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minnowboar=
d-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b829c7ec300f205b397=
12f
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b83664bfbd15b7d939712d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b83664bfbd15b7d9397=
12e
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b833b8f0b3caa25a39712b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b833b8f0b3caa25a397=
12c
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8417dc2f7933c43397123

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8417dc2f7933c43397=
124
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8449c414278ca6e397141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a77950-sal=
vator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a77950-sal=
vator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8449c414278ca6e397=
142
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
sun50i-a64-bananapi-m64    | arm64  | lab-clabbe      | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82f6a0918dcc64a39711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m=
64.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82f6a0918dcc64a397=
11f
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | clang-13 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8316236f193c18c397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8316236f193c18c397=
133
        failing since 19 days (last pass: next-20211118, first fail: next-2=
0211124) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8328d248ca8c69839712b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/base=
line-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/base=
line-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8328d248ca8c698397=
12c
        failing since 20 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82852389713915539715e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baselin=
e-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baselin=
e-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b828523897139155397=
15f
        failing since 20 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61b828caeddd3c4a80397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b828caeddd3c4a80397=
121
        failing since 20 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82a5ac0f6a4daa2397164

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82a5ac0f6a4daa2397=
165
        failing since 20 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82d79d1cb1580af397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseli=
ne-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseli=
ne-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82d79d1cb1580af397=
149
        failing since 20 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82e4195df70d8b339712f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82e4195df70d8b3397=
130
        failing since 20 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b82ff959d8450cad39714d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc5-6644-gbc=
d5ddb85fad/arm64/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b82ff959d8450cad397=
14e
        failing since 20 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
