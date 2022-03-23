Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39FD4E4BB2
	for <lists+linux-next@lfdr.de>; Wed, 23 Mar 2022 04:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbiCWDzb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Mar 2022 23:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbiCWDzb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Mar 2022 23:55:31 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286AC13EB3
        for <linux-next@vger.kernel.org>; Tue, 22 Mar 2022 20:54:00 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o6-20020a17090a9f8600b001c6562049d9so564073pjp.3
        for <linux-next@vger.kernel.org>; Tue, 22 Mar 2022 20:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+XC3M71fAtHCjKPsUL71Fx/yzXvVC4j1vWbchopOwLY=;
        b=XbcLaUnGgSK54xMJGeQ5N40Q+N6o0IAOP/0fpQkPp9d5Q7LapVsjEh2ORjsSrmdrMk
         Sbv16IjxAnu3Rzl9ls76QEXZFXeYOnvrfPBbKmo6zNC6yo2nZhy2u73ZHgruYOyOAbYR
         jifFLvrvBz7IcyxJxjogABaz8iVKJxWh7NWrn1ew7rHXqWzESDIe5vi3+pOUIscH4acY
         KsZ/t26NX6eexXwNmPH27d4MgMgy7ZY01vKFUMy7JI+DHyJJkk2iudd0C1GHvhW+Yy4H
         KLhjTVVhVJuypWnoGdzftvk+xED9y/wxVexIcK9BAJcz+ShLD39fPk5BJJlybK9tE9rD
         dMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+XC3M71fAtHCjKPsUL71Fx/yzXvVC4j1vWbchopOwLY=;
        b=xwI0eFIznPN2WZNguFJp5l+4sKpiDtZL3klkv1dnJeGG36uLLaapWzDPfhfI6R+4bS
         zJJNQo81OzdtoNmxrimWHovY4wx9QkOAB7LtJeY3etzf2fNabfw9O3jPNDCx3yyPGkD1
         Bo3gmwKVTNWXxvLG0XL1yga5g35a5OXQhu7fi05hD+80QHl0CTC4XLcgO+RamdYicSTO
         IGqsQW2xdwwSbY4+kx5se+eantl/JmbvmQnBK+hCyTAiPGmBkITkkmA8Pkk5WiD3Bx1O
         0DWTW96RProHxXMpHC0xrNgQgqxM8p4lhy+/29mfeISN+WUEJ3vFHV3w2GpauY5vYtgD
         DQaw==
X-Gm-Message-State: AOAM533+h2wOCg5vrYc4fAv4iWjSvEpzwjF5H/uyy4TYFxLf1D3q//+9
        LFYbzWgAiMLBVd3Q4PJrcQRLTfW5hDSbFa2fwbI=
X-Google-Smtp-Source: ABdhPJziuMhGS7ryHrE8/+h2JuEfHMhsqOB9QPUZTiOu5sU2U7JdcuYHgEyj0FbKtJ7XwguieZP/Jg==
X-Received: by 2002:a17:902:f612:b0:14c:e978:f99e with SMTP id n18-20020a170902f61200b0014ce978f99emr21524948plg.23.1648007640081;
        Tue, 22 Mar 2022 20:54:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k185-20020a6384c2000000b003821dcd9020sm14130980pgd.27.2022.03.22.20.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 20:53:59 -0700 (PDT)
Message-ID: <623a99d7.1c69fb81.870d4.7f76@mx.google.com>
Date:   Tue, 22 Mar 2022 20:53:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.17-2275-g6bcc7ba3ca32
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 182 runs,
 7 regressions (v5.17-2275-g6bcc7ba3ca32)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 182 runs, 7 regressions (v5.17-2275-g6bcc7ba3c=
a32)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
am57xx-beagle-x15        | arm    | lab-linaro-lkft | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =

bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

d2500cc                  | x86_64 | lab-clabbe      | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

d2500cc                  | x86_64 | lab-clabbe      | gcc-10   | x86_64_def=
config+amdgpu      | 1          =

da850-lcdk               | arm    | lab-baylibre    | gcc-10   | davinci_al=
l_defconfig        | 1          =

kontron-pitx-imx8m       | arm64  | lab-kontron     | gcc-10   | defconfig+=
crypto             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+amdgpu      | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-2275-g6bcc7ba3ca32/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-2275-g6bcc7ba3ca32
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6bcc7ba3ca3283e9b5ae25e13307e9aa36a5bf45 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
am57xx-beagle-x15        | arm    | lab-linaro-lkft | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/623a97e0ba04b9f39c0be66f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-=
am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-=
am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623a97e1ba04b9f39c0be=
670
        failing since 0 day (last pass: v5.17-100-gfb4e0eea8056, first fail=
: v5.17-1379-g27610c0a0ca2) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/623a6a5897a667d6290be644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623a6a5897a667d6290be=
645
        failing since 33 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
d2500cc                  | x86_64 | lab-clabbe      | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/623a62184f56a7dc5a0be666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-clabbe/basel=
ine-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-clabbe/basel=
ine-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623a62184f56a7dc5a0be=
667
        new failure (last pass: v5.17-rc8-149-g382d8f4c46c1f) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
d2500cc                  | x86_64 | lab-clabbe      | gcc-10   | x86_64_def=
config+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/623a63bcd62a5cb6240be66c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-clabbe/baseline-d25=
00cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-clabbe/baseline-d25=
00cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623a63bcd62a5cb6240be=
66d
        new failure (last pass: v5.17-rc8-133-gcdf39fcb6bec) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
da850-lcdk               | arm    | lab-baylibre    | gcc-10   | davinci_al=
l_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/623a61fb40ad374e910be659

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/623a61fb40ad374=
e910be65d
        failing since 58 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-22T23:55:21.737368  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-22T23:55:21.737673  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-22T23:55:21.737852  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-22T23:55:21.779238  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m       | arm64  | lab-kontron     | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/623a63f30397a268e70be659

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/623=
a63f30397a268e70be670
        new failure (last pass: v5.17-1379-g27610c0a0ca2)

    2022-03-23T00:03:53.332690  /lava-101930/1/../bin/lava-test-case
    2022-03-23T00:03:53.333006  <8>[   11.346735] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-03-23T00:03:53.333181  /lava-101930/1/../bin/lava-test-case
    2022-03-23T00:03:53.333356  <8>[   11.366558] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-03-23T00:03:53.333572  /lava-101930/1/../bin/lava-test-case
    2022-03-23T00:03:53.333805  <8>[   11.387707] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-03-23T00:03:53.333964  /lava-101930/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/623a633de41302e7080be644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-2275-=
g6bcc7ba3ca32/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623a633de41302e7080be=
645
        new failure (last pass: v5.17-1379-g27610c0a0ca2) =

 =20
