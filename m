Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0514047E48A
	for <lists+linux-next@lfdr.de>; Thu, 23 Dec 2021 15:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243798AbhLWOdA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Dec 2021 09:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbhLWOdA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Dec 2021 09:33:00 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBE3C061401
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 06:33:00 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id c2so5454186pfc.1
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s86B65/mvjNawljeyaPcG3waCkoaMu+EefxS38j0KKo=;
        b=Z9bEt+0U26PzuUTu1En67mcTP7YdDnJ9WI4cQqZtQc0hx7XP9XyFtwn86DDarxsYq7
         hMoak4f59/YuLkmD7snmIWM0PcikrBPp2pI+JS8lTT7yqwYmrBpmv0ioqdfYa+w9dE7/
         1KiilTWawK5y9HTt+VPTd3j9+i3UNbsJFvDXlaI1sSUkzMR9mWUAbYpp6+VznEpVzVHg
         LePqYYB4zPjbWPxilmiaEfQTyJH3p5moHSrBk28sRU2w52m1aOf+pTz8huXH7dyZHN6e
         s6p80E5uAabF9TqBKy3W+l7c4JHSf1j9Y/YFFLQmPzBjpfRv8ZwEr1Z1+kb5/H0AMAdt
         rMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s86B65/mvjNawljeyaPcG3waCkoaMu+EefxS38j0KKo=;
        b=pf/TlJr2XCoTqIqv48dz6HSS/l3Fc4opRlmNxnQUM9KvMGazBnd4Qd6KPG3DLujy/z
         H7Ds5xuxPNTb+sUhmKcpcVuSn8z7zMR40ZCZ2vJf4Ix/hQb+StrE8Gw9Vu3vD0Qiy0ma
         ww7Ru5GQgdX39TYCA58SHp/kgzBRVQWKdjZmuva+Gpde6qh0XjtWBHFvo7e9MMM7d0uo
         l9T7zuko5GkB/jiLQ18Jbbu7He9kgXUB26EC0WPjNC3ehJPzkP/12jLV6SObaFWZcmO+
         UB99LMtpgx4TvAoR3YtqpHg172/pZDifmyD+67fZt3Y0DDB09fewkQsTIFcsWm0Hr64i
         P6qA==
X-Gm-Message-State: AOAM53308dIuQhRZvZ/Ew+t7rI2GSS8cPNuhoNARLl7Fsi7AjKojv0bL
        m6DphhGwe9dENidZZ5aAoQboVf34nJsJS2PG748=
X-Google-Smtp-Source: ABdhPJz0EEN41ZF0PzWiFH1YR/A5uT66wXju9P0V3q2qqkGktt7U0fJaIJlQjXsMRXGu5F823CJ5Ow==
X-Received: by 2002:a05:6a00:2304:b0:4ba:4cbb:8289 with SMTP id h4-20020a056a00230400b004ba4cbb8289mr2679597pfh.79.1640269979619;
        Thu, 23 Dec 2021 06:32:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t3sm6357090pfj.207.2021.12.23.06.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 06:32:59 -0800 (PST)
Message-ID: <61c4889b.1c69fb81.d0432.1182@mx.google.com>
Date:   Thu, 23 Dec 2021 06:32:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc6-213-gcac41c6f3ed1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 612 runs,
 5 regressions (v5.16-rc6-213-gcac41c6f3ed1)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 612 runs, 5 regressions (v5.16-rc6-213-gcac41c=
6f3ed1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu      | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc6-213-gcac41c6f3ed1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc6-213-gcac41c6f3ed1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cac41c6f3ed135fa9e0206517cc859b4236e4d85 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c4794572f97bd64a397123

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c4794572f97bd64a397=
124
        failing since 43 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c4513c36b980f45e397123

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c4513c36b980f45e397=
124
        new failure (last pass: v5.16-rc6-189-gb5f0860e19b1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61c44e79c6e7219ef439712a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-=
minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-=
minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c44e79c6e7219ef4397=
12b
        new failure (last pass: v5.16-rc6-189-gb5f0860e19b1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/61c4500a6939595cb1397153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c4500a6939595cb1397=
154
        new failure (last pass: v5.16-rc5-395-g46f3b5d984fa) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c4463ca07b4b39c7397141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-2=
13-gcac41c6f3ed1/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c4463ca07b4b39c7397=
142
        new failure (last pass: v5.16-rc6-189-gb5f0860e19b1) =

 =20
