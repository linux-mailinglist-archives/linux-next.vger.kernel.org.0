Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64B679FE45
	for <lists+linux-next@lfdr.de>; Thu, 14 Sep 2023 10:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbjINI0N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Sep 2023 04:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjINI0N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Sep 2023 04:26:13 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07FD1BF9
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 01:26:08 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1d5a1965a9aso411541fac.2
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 01:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694679968; x=1695284768; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/EUQe9WVtlR3SqKJhe4cmWV8+t9nfcrMPNJw5GCj+Q=;
        b=ylJORjZXnoumPh7sOfkt4q2N2Dd3FrF5Gwqm4geznwUO3WfXQflnPB7ha4MFluEXZz
         s3peDxYqF4NuFAw9n2nHNFq2JNJuy2mMW74VVgwUloIzCsww1B6jgVk53oIdy/mjyT1b
         8euFX3H1iz/b5Yeuz3VHxh3SrqyjqMCz4jw8XfnLzwyraD9O6MdEYDLeEhybfPsOw3Ld
         yegUAVVsrQDPQfrCVFKqqyTA7bpsu9uq9IzYSc4jfj/RvaE399FZDg3/91XR7OmRMgN/
         FVT60kjJwXKxcFSE1pbCTL2YYVNSbKAdlaGV7mYjW15ohvesWOPoHq0rOyDN8UztcWFT
         79ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694679968; x=1695284768;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/EUQe9WVtlR3SqKJhe4cmWV8+t9nfcrMPNJw5GCj+Q=;
        b=SemL44X0UbbNwOYcZH/9XclOMXd45Ixz/WjrKEThVoXsz6QnLhRqbywVXV4+1wvzSH
         GR5RZiheWXjB3XOm9n5qxi6QagpvRTSa9WP9EOZyevTlAWc4DFQG8pa04mYVPKX3qOPp
         SIz9qPy7VUUYO/YgFP40DmOyACIv3Nx8pMXwmaIkDcqQ4z0s1DEG0OQU/qtQRfGzwESx
         +GvecEDUjnz73olE4h4NqaIr9mwcSVPViQrR9bFQL5iqpqIRP0zFeQsJobYi7Xg7bcHm
         4Pje2ptBvF3+6pR4WdLjfsh2/Qq84W6H3QX/T3BQ/EDdbkKNxVfxzHNsbIiRx5DxaE+s
         puug==
X-Gm-Message-State: AOJu0YwjrR0S9bYtoWR54tznOQyhj47xj5LXQ7AwkSZk2MsiBXc4kosH
        XLBrMwtJt9m/A2BO9crqi0jvZBrmfpqw5NpPg0M=
X-Google-Smtp-Source: AGHT+IF4LsPbIiK7tFzu8Ks8x2nCJvseHo4G9+jNeEbbdNcArQ65NXzfwaTnSw5IYGx52bGPsFINXA==
X-Received: by 2002:a05:6870:40cb:b0:1bb:9846:94ed with SMTP id l11-20020a05687040cb00b001bb984694edmr5332644oal.3.1694679965988;
        Thu, 14 Sep 2023 01:26:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b9-20020a63a109000000b0056c5454105csm685682pgf.93.2023.09.14.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 01:26:05 -0700 (PDT)
Message-ID: <6502c39d.630a0220.b5dc.2368@mx.google.com>
Date:   Thu, 14 Sep 2023 01:26:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230914
X-Kernelci-Report-Type: test
Subject: next/master baseline: 318 runs, 112 regressions (next-20230914)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 318 runs, 112 regressions (next-20230914)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | clang-17   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig                    | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10     | defcon=
fig+CON...BIG_ENDIAN=3Dy | 6          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ook+videodec | 12         =

qemu_arm-virt-gicv2          | arm    | lab-broonie   | gcc-10     | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora | gcc-10     | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie   | gcc-10     | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora | gcc-10     | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie   | gcc-10     | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora | gcc-10     | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie   | gcc-10     | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora | gcc-10     | multi_=
v7_defconfig+debug     | 1          =

qemu_i386                    | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =

qemu_mips-malta              | mips   | lab-broonie   | gcc-10     | malta_=
defconfig              | 1          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10     | malta_=
defconfig              | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10     | defcon=
fig+videodec           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230914/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230914
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      98897dc735cf6635f0966f76eb0108354168fb15 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/650286ad2e4e9d536a8a0b3b

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650286ad2e4e9d536a8a0b50
        failing since 15 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-14T04:06:03.420815  + <8>[   10.642631] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11521286_1.4.2.3.1>

    2023-09-14T04:06:03.420932  set +x

    2023-09-14T04:06:03.524937  / # #

    2023-09-14T04:06:03.625666  export SHELL=3D/bin/sh

    2023-09-14T04:06:03.625897  #

    2023-09-14T04:06:03.726482  / # export SHELL=3D/bin/sh. /lava-11521286/=
environment

    2023-09-14T04:06:03.726712  =


    2023-09-14T04:06:03.827312  / # . /lava-11521286/environment/lava-11521=
286/bin/lava-test-runner /lava-11521286/1

    2023-09-14T04:06:03.827657  =


    2023-09-14T04:06:03.831846  / # /lava-11521286/bin/lava-test-runner /la=
va-11521286/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f1a08bac14ae98a0a63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f1a08bac14ae98a0=
a64
        failing since 120 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f2538822efabc8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f2538822efabc8a0=
a43
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f3a38822efabc8a0aa8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cbv514-1h-34uz-brya.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cbv514-1h-34uz-brya.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f3a38822efabc8a0=
aa9
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f407223da484e8a0a58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f407223da484e8a0=
a59
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f3a610fe026268a0a7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cp514-3wh-r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cp514-3wh-r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f3a610fe026268a0=
a80
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f3e7223da484e8a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C433TA-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C433TA-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f3e7223da484e8a0=
a45
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028fcc0da7bb935c8a0a5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028fcc0da7bb935c8a0=
a5c
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f2008bac14ae98a0a6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f2008bac14ae98a0=
a6d
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f3dc1a197bf4b8a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f3dc1a197bf4b8a0=
a46
        failing since 120 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f1c08bac14ae98a0a69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f1c08bac14ae98a0=
a6a
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f33610fe026268a0a57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f33610fe026268a0=
a58
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f39610fe026268a0a7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f39610fe026268a0=
a7d
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65028513aa1b60339b8a0a47

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65028513aa1b60339b8a0a5c
        failing since 15 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-14T03:59:04.612838  + <8>[   11.154617] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11521307_1.4.2.3.1>

    2023-09-14T03:59:04.612958  set +x

    2023-09-14T03:59:04.717627  / # #

    2023-09-14T03:59:04.818305  export SHELL=3D/bin/sh

    2023-09-14T03:59:04.818515  #

    2023-09-14T03:59:04.919055  / # export SHELL=3D/bin/sh. /lava-11521307/=
environment

    2023-09-14T03:59:04.919249  =


    2023-09-14T03:59:05.019845  / # . /lava-11521307/environment/lava-11521=
307/bin/lava-test-runner /lava-11521307/1

    2023-09-14T03:59:05.020284  =


    2023-09-14T03:59:05.024985  / # /lava-11521307/bin/lava-test-runner /la=
va-11521307/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f1b08bac14ae98a0a66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f1b08bac14ae98a0=
a67
        failing since 120 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6502854add7c09ed978a0a4f

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6502854add7c09ed978a0a64
        failing since 15 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-14T03:59:55.197983  + <8>[   11.058337] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11521282_1.4.2.3.1>

    2023-09-14T03:59:55.198068  set +x

    2023-09-14T03:59:55.302576  / # #

    2023-09-14T03:59:55.403251  export SHELL=3D/bin/sh

    2023-09-14T03:59:55.403448  #

    2023-09-14T03:59:55.504022  / # export SHELL=3D/bin/sh. /lava-11521282/=
environment

    2023-09-14T03:59:55.504214  =


    2023-09-14T03:59:55.604814  / # . /lava-11521282/environment/lava-11521=
282/bin/lava-test-runner /lava-11521282/1

    2023-09-14T03:59:55.605098  =


    2023-09-14T03:59:55.609225  / # /lava-11521282/bin/lava-test-runner /la=
va-11521282/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f2c38822efabc8a0a88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f2c38822efabc8a0=
a89
        failing since 120 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f467223da484e8a0a5e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f467223da484e8a0=
a5f
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f5282229c14e38a0a68

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f5282229c14e38a0=
a69
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f2e610fe026268a0a49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f2e610fe026268a0=
a4a
        failing since 120 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | clang-17   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/650289ea46816106828a0ac5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650289eb46816106828a0ace
        failing since 29 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-14T04:19:41.645302  + set<8>[   30.041001] <LAVA_SIGNAL_ENDRUN =
0_dmesg 106660_1.5.2.4.1>
    2023-09-14T04:19:41.648981   +x
    2023-09-14T04:19:41.755003  / # #
    2023-09-14T04:19:42.920646  export SHELL=3D/bin/sh
    2023-09-14T04:19:42.926811  #
    2023-09-14T04:19:44.425925  / # export SHELL=3D/bin/sh. /lava-106660/en=
vironment
    2023-09-14T04:19:44.431997  =

    2023-09-14T04:19:47.145918  / # . /lava-106660/environment/lava-106660/=
bin/lava-test-runner /lava-106660/1
    2023-09-14T04:19:47.152404  =

    2023-09-14T04:19:47.167501  / # /lava-106660/bin/lava-test-runner /lava=
-106660/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6502879274c572e2068a0aa5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6502879274c572e2068a0aae
        failing since 29 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-14T04:09:32.935631  + set<8>[   29.257505] <LAVA_SIGNAL_ENDRUN =
0_dmesg 106626_1.5.2.4.1>
    2023-09-14T04:09:32.936235   +x
    2023-09-14T04:09:33.044967  / # #
    2023-09-14T04:09:34.210939  export SHELL=3D/bin/sh
    2023-09-14T04:09:34.217079  #
    2023-09-14T04:09:35.716303  / # export SHELL=3D/bin/sh. /lava-106626/en=
vironment
    2023-09-14T04:09:35.722368  =

    2023-09-14T04:09:38.445746  / # . /lava-106626/environment/lava-106626/=
bin/lava-test-runner /lava-106626/1
    2023-09-14T04:09:38.452606  =

    2023-09-14T04:09:38.455624  / # /lava-106626/bin/lava-test-runner /lava=
-106626/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65028ec3e19f0f913b8a0a64

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65028ec3e19f0f913b8a0a6d
        failing since 29 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-14T04:40:24.154053  + set<8>[   27.939534] <LAVA_SIGNAL_ENDRUN =
0_dmesg 106722_1.5.2.4.1>
    2023-09-14T04:40:24.154524   +x
    2023-09-14T04:40:24.264584  #
    2023-09-14T04:40:25.426582  / # #export SHELL=3D/bin/sh
    2023-09-14T04:40:25.432529  =

    2023-09-14T04:40:26.927470  / # export SHELL=3D/bin/sh. /lava-106722/en=
vironment
    2023-09-14T04:40:26.933511  =

    2023-09-14T04:40:29.646136  / # . /lava-106722/environment/lava-106722/=
bin/lava-test-runner /lava-106722/1
    2023-09-14T04:40:29.652362  =

    2023-09-14T04:40:29.658004  / # /lava-106722/bin/lava-test-runner /lava=
-106722/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f4f82229c14e38a0a5a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65028f4f82229c14e38a0a63
        failing since 29 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-14T04:42:34.422971  + set<8>[   27.567844] <LAVA_SIGNAL_ENDRUN =
0_dmesg 106745_1.5.2.4.1>
    2023-09-14T04:42:34.423121   +x
    2023-09-14T04:42:34.528834  / # #
    2023-09-14T04:42:35.688214  export SHELL=3D/bin/sh
    2023-09-14T04:42:35.693646  #
    2023-09-14T04:42:37.188112  / # export SHELL=3D/bin/sh. /lava-106745/en=
vironment
    2023-09-14T04:42:37.194330  =

    2023-09-14T04:42:39.917685  / # . /lava-106745/environment/lava-106745/=
bin/lava-test-runner /lava-106745/1
    2023-09-14T04:42:39.924427  =

    2023-09-14T04:42:39.928847  / # /lava-106745/bin/lava-test-runner /lava=
-106745/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6502899dea15e4644a8a0a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6502899dea15e4644a8a0=
a52
        failing since 42 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f21e7fdec3c4d8a0aed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f21e7fdec3c4d8a0=
aee
        failing since 120 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10     | defcon=
fig+CON...BIG_ENDIAN=3Dy | 6          =


  Details:     https://kernelci.org/test/plan/id/65028cdda1a4a8250d8a0a4b

  Results:     43 PASS, 8 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65028cdda=
1a4a8250d8a0a52
        new failure (last pass: next-20230912)

    2023-09-14T04:32:04.454242  /lava-3772828/1/../bin/lava-test-case
    2023-09-14T04:32:04.455106  <8>[   27.195570] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-09-14T04:32:04.455872  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
028cdda1a4a8250d8a0a53
        new failure (last pass: next-20230912)

    2023-09-14T04:32:03.212999  <3>[   25.968044] mmc0: error -84 whilst in=
itialising SD card
    2023-09-14T04:32:03.418228  /lava-3772828/1/../bin/lava-test-case
    2023-09-14T04:32:03.421800  <8>[   26.174799] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =


  * baseline.bootrr.dw-hdmi-i2s-audio-driver-present: https://kernelci.org/=
test/case/id/65028cdda1a4a8250d8a0a5b
        new failure (last pass: next-20230912)

    2023-09-14T04:32:01.101111  <3>[   23.856045] mmc0: error -84 whilst in=
itialising SD card
    2023-09-14T04:32:01.202789  /lava-3772828/1/../bin/lava-test-case
    2023-09-14T04:32:01.206238  <8>[   23.960932] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddw-hdmi-i2s-audio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.meson-drm-driver-present: https://kernelci.org/test/cas=
e/id/65028cdda1a4a8250d8a0a60
        new failure (last pass: next-20230912)

    2023-09-14T04:31:58.046007  /lava-3772828/1/../bin/lava-test-case
    2023-09-14T04:31:58.049432  <8>[   20.802634] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-tx-present RESULT=3Dblocked>
    2023-09-14T04:31:58.989457  <3>[   21.744033] mmc0: error -84 whilst in=
itialising SD card
    2023-09-14T04:31:59.068974  /lava-3772828/1/../bin/lava-test-case
    2023-09-14T04:31:59.072514  <8>[   21.825445] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmeson-drm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.meson-dw-hdmi-driver-present: https://kernelci.org/test=
/case/id/65028cdda1a4a8250d8a0a61
        new failure (last pass: next-20230912)

    2023-09-14T04:31:56.871594  <3>[   19.627073] mmc0: error -84 whilst in=
itialising SD card
    2023-09-14T04:31:56.999426  /lava-3772828/1/../bin/lava-test-case
    2023-09-14T04:31:57.024371  <8>[   19.779248] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmeson-dw-hdmi-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65028cdda1a4a8250d8a0a81
        new failure (last pass: next-20230912)

    2023-09-14T04:31:53.927081  / # #
    2023-09-14T04:31:54.031077  export SHELL=3D/bin/sh
    2023-09-14T04:31:54.032249  #
    2023-09-14T04:31:54.134860  / # export SHELL=3D/bin/sh. /lava-3772828/e=
nvironment
    2023-09-14T04:31:54.136046  =

    2023-09-14T04:31:54.238788  / # . /lava-3772828/environment/lava-377282=
8/bin/lava-test-runner /lava-3772828/1
    2023-09-14T04:31:54.240652  =

    2023-09-14T04:31:54.249477  / # /lava-3772828/bin/lava-test-runner /lav=
a-3772828/1
    2023-09-14T04:31:54.326171  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-14T04:31:54.327002  + cd /lava-3772828/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65028d0b1a1ed99e158a0a68

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028d0b1a1ed99e158a0=
a69
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ook+videodec | 12         =


  Details:     https://kernelci.org/test/plan/id/65028d2a4bc1e358858a0a61

  Results:     155 PASS, 16 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65028d2a4bc1e35=
8858a0a64
        new failure (last pass: next-20230913)
        2 lines

    2023-09-14T04:33:34.548563  at virtual address 0000000000000008

    2023-09-14T04:33:34.551832  kern  :alert : Mem abort info:

    2023-09-14T04:33:34.555202  kern  :alert :   ESR =3D 0x0000000096000004

    2023-09-14T04:33:34.561501  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-09-14T04:33:34.561595  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-09-14T04:33:34.571514  kern  :alert :  <8>[   17.040805] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65028d2a4bc1e35=
8858a0a65
        new failure (last pass: next-20230913)
        13 lines

    2023-09-14T04:33:34.545282  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   17.012432] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>
   =


  * baseline.bootrr.mtk-jpeg-probed: https://kernelci.org/test/case/id/6502=
8d2a4bc1e358858a0a9c
        new failure (last pass: next-20230913)

    2023-09-14T04:33:49.896726  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:49.906401  <8>[   32.375090] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-jpeg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-scp-probed: https://kernelci.org/test/case/id/65028=
d2a4bc1e358858a0a9e
        new failure (last pass: next-20230913)

    2023-09-14T04:33:48.842507  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:48.853507  <8>[   31.322409] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-scp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma1-probed: https://kernelci.org/test/c=
ase/id/65028d2a4bc1e358858a0aaa
        new failure (last pass: next-20230913)

    2023-09-14T04:33:47.546760  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:47.557955  <8>[   30.026525] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma1-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma0-probed: https://kernelci.org/test/c=
ase/id/65028d2a4bc1e358858a0aab
        new failure (last pass: next-20230913)

    2023-09-14T04:33:46.516103  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:46.525820  <8>[   28.994614] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l1-probed: https://kernelci.org/test/=
case/id/65028d2a4bc1e358858a0aad
        new failure (last pass: next-20230913)

    2023-09-14T04:33:45.465223  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:45.475049  <8>[   27.943014] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l1-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l0-probed: https://kernelci.org/test/=
case/id/65028d2a4bc1e358858a0aae
        new failure (last pass: next-20230913)

    2023-09-14T04:33:44.430869  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:44.441682  <8>[   26.910602] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl0-probed: https://kernelci.org/test/ca=
se/id/65028d2a4bc1e358858a0aaf
        new failure (last pass: next-20230913)

    2023-09-14T04:33:43.399216  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:43.409226  <8>[   25.878452] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.panel-edp-driver-present: https://kernelci.org/test/cas=
e/id/65028d2a4bc1e358858a0ab5
        new failure (last pass: next-20230913)

    2023-09-14T04:33:41.226081  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:41.236560  <8>[   23.705545] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.pwm-backlight-probed: https://kernelci.org/test/case/id=
/65028d2a4bc1e358858a0ab6
        new failure (last pass: next-20230913)

    2023-09-14T04:33:40.198533  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:40.209696  <8>[   22.678530] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpwm-backlight-probed RESULT=3Dfail>
   =


  * baseline.bootrr.anx7625-probed: https://kernelci.org/test/case/id/65028=
d2a4bc1e358858a0aba
        new failure (last pass: next-20230913)

    2023-09-14T04:33:38.084837  <8>[   20.552862] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danx7625-driver-present RESULT=3Dpass>

    2023-09-14T04:33:39.102145  /lava-11521585/1/../bin/lava-test-case

    2023-09-14T04:33:39.112510  <8>[   21.581423] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danx7625-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie   | gcc-10     | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65028cbdc271c00a508a0a5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028cbdc271c00a508a0=
a5b
        failing since 365 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora | gcc-10     | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c8cc3bfbc0ed68a0a60

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c8cc3bfbc0ed68a0=
a61
        failing since 365 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie   | gcc-10     | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65028cd0a1a4a8250d8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028cd0a1a4a8250d8a0=
a43
        failing since 365 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora | gcc-10     | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65028cf0a1a4a8250d8a0a8b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028cf0a1a4a8250d8a0=
a8c
        failing since 365 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie   | gcc-10     | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65028ca9c271c00a508a0a54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028ca9c271c00a508a0=
a55
        failing since 363 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora | gcc-10     | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c8dc3bfbc0ed68a0a63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c8dc3bfbc0ed68a0=
a64
        failing since 363 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie   | gcc-10     | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65028d491a1ed99e158a0b3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028d491a1ed99e158a0=
b3d
        failing since 365 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora | gcc-10     | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65028cf1a1a4a8250d8a0a8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028cf1a1a4a8250d8a0=
a8f
        failing since 365 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65028dd678d7ebae068a0ad3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028dd678d7ebae068a0=
ad4
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65028cdca1a4a8250d8a0a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028cdca1a4a8250d8a0=
a48
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/650284af8a9869bfad8a0a64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650284af8a9869bfad8a0=
a65
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6502897651969ce2478a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6502897651969ce2478a0=
a43
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/650284938a9869bfad8a0a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650284938a9869bfad8a0=
a50
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6502877774c572e2068a0a9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6502877774c572e2068a0=
aa0
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65028e154dc8d76b018a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028e154dc8d76b018a0=
a43
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65028cdd4bc1e358858a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028cdd4bc1e358858a0=
a44
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/650284af8a9869bfad8a0a67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650284af8a9869bfad8a0=
a68
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/650289880c839184468a0a7d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650289880c839184468a0=
a7e
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/65028492e7710003c28a0a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028492e7710003c28a0=
a6e
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65028778022edcf1ec8a0a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028778022edcf1ec8a0=
a52
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-broonie   | gcc-10     | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/650290926e8aca42c08a0a48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650290926e8aca42c08a0=
a49
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10     | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/650290896e8aca42c08a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650290896e8aca42c08a0=
a43
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028e9f9cafba3f8e8a0a6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028e9f9cafba3f8e8a0=
a6b
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028e1da383af85518a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028e1da383af85518a0=
a44
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6502858d01e3c4a50e8a0a97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6502858d01e3c4a50e8a0=
a98
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65028b2db5691767688a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028b2db5691767688a0=
a54
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028dd582f1ba530c8a0a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028dd582f1ba530c8a0=
a76
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6502851faa1b60339b8a0a9d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6502851faa1b60339b8a0=
a9e
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65028abf95d495f7cf8a0a62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028abf95d495f7cf8a0=
a63
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028cb47aaf95cc3f8a0a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028cb47aaf95cc3f8a0=
a52
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/650285ef3e0922709d8a0a64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650285ef3e0922709d8a0=
a65
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/65028cf91a1ed99e158a0a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028cf91a1ed99e158a0=
a50
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028d48cf9dee45278a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028d48cf9dee45278a0=
a45
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/650285abcd1af196ad8a0a8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650285abcd1af196ad8a0=
a8d
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c177c6fc7fe338a0a4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c177c6fc7fe338a0=
a4d
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c77c271c00a508a0a4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c77c271c00a508a0=
a4b
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028e9e961298b5bf8a0b2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028e9e961298b5bf8a0=
b2f
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028e314dc8d76b018a0a71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028e314dc8d76b018a0=
a72
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6502853cdd7c09ed978a0a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6502853cdd7c09ed978a0=
a48
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65028bcdc3a0b98d558a0a63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028bcdc3a0b98d558a0=
a64
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028dc182f1ba530c8a0a6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028dc182f1ba530c8a0=
a70
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6502851eaa1b60339b8a0a9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6502851eaa1b60339b8a0=
a9b
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65028ac1b5e8b2cb168a0a4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028ac1b5e8b2cb168a0=
a4d
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c7bc3bfbc0ed68a0a5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c7bc3bfbc0ed68a0=
a5b
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/65028618ee59a448458a0a6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028618ee59a448458a0=
a70
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/65028d354bc1e358858a0b1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028d354bc1e358858a0=
b1e
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028d8555d0d846d08a0c26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028d8555d0d846d08a0=
c27
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/650285ab3e0922709d8a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650285ab3e0922709d8a0=
a45
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c137c6fc7fe338a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c137c6fc7fe338a0=
a43
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c78c3bfbc0ed68a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c78c3bfbc0ed68a0=
a54
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028e899cafba3f8e8a0a50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028e899cafba3f8e8a0=
a51
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028e1cdf8b2f6d788a0a5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028e1cdf8b2f6d788a0=
a60
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6502858cdd7c09ed978a0a79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6502858cdd7c09ed978a0=
a7a
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65028be1c3a0b98d558a0a6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028be1c3a0b98d558a0=
a6f
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028dc182f1ba530c8a0a6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028dc182f1ba530c8a0=
a6c
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6502851fc948cfea438a0a64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6502851fc948cfea438a0=
a65
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65028ac0b5e8b2cb168a0a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028ac0b5e8b2cb168a0=
a48
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c79c3bfbc0ed68a0a57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c79c3bfbc0ed68a0=
a58
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/650285f03e0922709d8a0a6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650285f03e0922709d8a0=
a6b
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c6dc3bfbc0ed68a0a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c6dc3bfbc0ed68a0=
a48
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028d4a55d0d846d08a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028d4a55d0d846d08a0=
a44
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/650285aacd1af196ad8a0a86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi=
-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi=
-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650285aacd1af196ad8a0=
a87
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c159f33fd56f58a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c159f33fd56f58a0=
a46
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65028c509f33fd56f58a0a58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028c509f33fd56f58a0=
a59
        failing since 0 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10     | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/650287c487578b4f768a0aed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650287c487578b4f768a0af4
        failing since 36 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-09-14T04:10:12.970894  + set +x
    2023-09-14T04:10:12.974121  <8>[   28.623477] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1008680_1.5.2.4.1>
    2023-09-14T04:10:13.082249  / # #
    2023-09-14T04:10:14.544052  export SHELL=3D/bin/sh
    2023-09-14T04:10:14.565331  #
    2023-09-14T04:10:14.565721  / # export SHELL=3D/bin/sh
    2023-09-14T04:10:16.520304  / # . /lava-1008680/environment
    2023-09-14T04:10:20.116851  /lava-1008680/bin/lava-test-runner /lava-10=
08680/1
    2023-09-14T04:10:20.138075  . /lava-1008680/environment
    2023-09-14T04:10:20.138316  / # /lava-1008680/bin/lava-test-runner /lav=
a-1008680/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65028ee0fadb8b85be8a0ab1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65028ee0fadb8b85be8a0ab8
        failing since 43 days (last pass: next-20230712, first fail: next-2=
0230801)

    2023-09-14T04:40:45.233891  + set +x
    2023-09-14T04:40:45.237097  <8>[   27.446274] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1008692_1.5.2.4.1>
    2023-09-14T04:40:45.344567  / # #
    2023-09-14T04:40:46.807377  export SHELL=3D/bin/sh
    2023-09-14T04:40:46.828257  #
    2023-09-14T04:40:46.828655  / # export SHELL=3D/bin/sh
    2023-09-14T04:40:48.783537  / # . /lava-1008692/environment
    2023-09-14T04:40:52.379589  /lava-1008692/bin/lava-test-runner /lava-10=
08692/1
    2023-09-14T04:40:52.400908  . /lava-1008692/environment
    2023-09-14T04:40:52.401169  / # /lava-1008692/bin/lava-test-runner /lav=
a-1008692/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65028f86112077ac648a0a57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65028f86112077ac648a0=
a58
        new failure (last pass: next-20230913) =

 =20
