Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15C626FFFCC
	for <lists+linux-next@lfdr.de>; Fri, 12 May 2023 07:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjELFDc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 May 2023 01:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjELFDa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 May 2023 01:03:30 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6A849C1
        for <linux-next@vger.kernel.org>; Thu, 11 May 2023 22:03:25 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-643990c5319so6820393b3a.2
        for <linux-next@vger.kernel.org>; Thu, 11 May 2023 22:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683867805; x=1686459805;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KXuuYI+wpA9w485PGaulJpp8PbzDqv8LRz+RIlJHXOc=;
        b=q/26Rm6HaGJ8qwSwCpQyjj9WJ1LjW7LUTUMBT9Lh3bXUBRlHwr3lgIwhDIz+fYhMBX
         pzbKMeCKsqF/g7eH6aWx2QMSw8wxD8it8OeMx0IOxLeCo/+vpBay+5nqem/NWndUZagm
         XFfZvYqJMP9zdgBDg9mexbtWmaaiqiIfrLM/W+K/3qJVTx4qY6Q+tq95PY/9532aDs1G
         uLeC7jpufYgBf63Z15A9mmLY0rG7ZJSgwYrrgjZd4BMoKD4WfRoAY4ATvPshi3abIy5P
         HB88CSjxqg0kY8nndsAM+tQfHbfhSvllUE3vNdw9BwnlsFYtXOkz254hFpCQ9P2phAbO
         V3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683867805; x=1686459805;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXuuYI+wpA9w485PGaulJpp8PbzDqv8LRz+RIlJHXOc=;
        b=kzn4tvLJ6db4PcL0/pYsBKNbRpzhq7xcNj7YhGxyKaR+Bms7meECMBd9tqGfnwPbSi
         1stM5Na9fXg5X1pnEwYXfSq6oHMsfFdtziiZ9bVbA/+TlqAyaZ08cNooNcQqCJ8lk3xB
         sRx0GdwIR3tETpr0/X5Hp+yOgx+kQAFJyN73lKkm7DZ240VZF7zs/GjoKCoEWSByxZPk
         lbk4Gvy+4OcolQ+orovX8RnQ/MEJOZjdfVVURZr0y/nb3tmJajkfmP4/2+7hhVage0+7
         Sn3clpCHidToXQlrUX+1p6YUwRf/mrAuIUkDpN64PIdZdezqMlk7vqV2GLUTQ2kEe2Xn
         IEYg==
X-Gm-Message-State: AC+VfDzuuc2KBB0uPIolc4j9CGzRvQSfTa/azYsYUr0AgyN3Oex86GJV
        VLgSBMLHofiMwBONrNBMm0km2BrC8Shh56j9EgCLqA==
X-Google-Smtp-Source: ACHHUZ6SIdIzKJyE5XoT+G7pJpKR12+xf6L4Jm5XyUcswtis0fVHEmQ/1PNbENgVatfgxV3jLquAiw==
X-Received: by 2002:a05:6a20:7485:b0:103:a24e:9a48 with SMTP id p5-20020a056a20748500b00103a24e9a48mr7745040pzd.17.1683867802789;
        Thu, 11 May 2023 22:03:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r19-20020a635d13000000b0052c3f0ae381sm5823263pgb.78.2023.05.11.22.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 22:03:22 -0700 (PDT)
Message-ID: <645dc89a.630a0220.ba206.b5e3@mx.google.com>
Date:   Thu, 11 May 2023 22:03:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.4-rc1-260-g4cffd190aeed9
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 738 runs,
 95 regressions (v6.4-rc1-260-g4cffd190aeed9)
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

next/pending-fixes baseline: 738 runs, 95 regressions (v6.4-rc1-260-g4cffd1=
90aeed9)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc1-260-g4cffd190aeed9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc1-260-g4cffd190aeed9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4cffd190aeed947ab08d9a8d775288e53e50485d =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92ddebf8f7a6f72e8626

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d92ddebf8f7a6f72e8=
627
        failing since 214 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8fdc75ed8cfc822e85e9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8fdc75ed8cfc822e85ee
        failing since 44 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:00:58.181485  <8>[   10.336882] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289011_1.4.2.3.1>

    2023-05-12T01:00:58.184761  + set +x

    2023-05-12T01:00:58.289121  / # #

    2023-05-12T01:00:58.389731  export SHELL=3D/bin/sh

    2023-05-12T01:00:58.389917  #

    2023-05-12T01:00:58.490487  / # export SHELL=3D/bin/sh. /lava-10289011/=
environment

    2023-05-12T01:00:58.490736  =


    2023-05-12T01:00:58.591243  / # . /lava-10289011/environment/lava-10289=
011/bin/lava-test-runner /lava-10289011/1

    2023-05-12T01:00:58.591540  =


    2023-05-12T01:00:58.597623  / # /lava-10289011/bin/lava-test-runner /la=
va-10289011/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d928c8ddc8b7c282e8697

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d928c8ddc8b7c282e869c
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-12T01:12:31.175254  + set +x

    2023-05-12T01:12:31.181875  <8>[   13.611639] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289122_1.4.2.3.1>

    2023-05-12T01:12:31.291099  / # #

    2023-05-12T01:12:31.393272  export SHELL=3D/bin/sh

    2023-05-12T01:12:31.393981  #

    2023-05-12T01:12:31.495314  / # export SHELL=3D/bin/sh. /lava-10289122/=
environment

    2023-05-12T01:12:31.496043  =


    2023-05-12T01:12:31.597527  / # . /lava-10289122/environment/lava-10289=
122/bin/lava-test-runner /lava-10289122/1

    2023-05-12T01:12:31.598619  =


    2023-05-12T01:12:31.604942  / # /lava-10289122/bin/lava-test-runner /la=
va-10289122/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92e58877e02eef2e85f2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92e58877e02eef2e85f7
        failing since 44 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:13:54.819388  <8>[   11.435040] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289190_1.4.2.3.1>

    2023-05-12T01:13:54.822278  + set +x

    2023-05-12T01:13:54.926733  / # #

    2023-05-12T01:13:55.027459  export SHELL=3D/bin/sh

    2023-05-12T01:13:55.027693  #

    2023-05-12T01:13:55.128267  / # export SHELL=3D/bin/sh. /lava-10289190/=
environment

    2023-05-12T01:13:55.128508  =


    2023-05-12T01:13:55.229095  / # . /lava-10289190/environment/lava-10289=
190/bin/lava-test-runner /lava-10289190/1

    2023-05-12T01:13:55.229464  =


    2023-05-12T01:13:55.235927  / # /lava-10289190/bin/lava-test-runner /la=
va-10289190/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8fe0b14ccd3c972e8612

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8fe0b14ccd3c972e8617
        failing since 44 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:01:11.006027  + set<8>[   10.997905] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10289003_1.4.2.3.1>

    2023-05-12T01:01:11.006666   +x

    2023-05-12T01:01:11.114560  / # #

    2023-05-12T01:01:11.217194  export SHELL=3D/bin/sh

    2023-05-12T01:01:11.218013  #

    2023-05-12T01:01:11.319579  / # export SHELL=3D/bin/sh. /lava-10289003/=
environment

    2023-05-12T01:01:11.320379  =


    2023-05-12T01:01:11.421932  / # . /lava-10289003/environment/lava-10289=
003/bin/lava-test-runner /lava-10289003/1

    2023-05-12T01:01:11.423174  =


    2023-05-12T01:01:11.428312  / # /lava-10289003/bin/lava-test-runner /la=
va-10289003/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/645d92808ddc8b7c282e85fc

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92808ddc8b7c282e8601
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-12T01:12:17.190856  + set +x

    2023-05-12T01:12:17.197873  <8>[   12.921551] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289134_1.4.2.3.1>

    2023-05-12T01:12:17.302242  / # #

    2023-05-12T01:12:17.402885  export SHELL=3D/bin/sh

    2023-05-12T01:12:17.403132  #

    2023-05-12T01:12:17.503594  / # export SHELL=3D/bin/sh. /lava-10289134/=
environment

    2023-05-12T01:12:17.503754  =


    2023-05-12T01:12:17.604305  / # . /lava-10289134/environment/lava-10289=
134/bin/lava-test-runner /lava-10289134/1

    2023-05-12T01:12:17.604622  =


    2023-05-12T01:12:17.608942  / # /lava-10289134/bin/lava-test-runner /la=
va-10289134/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d92808ddc8b7=
c282e8603
        failing since 1 day (last pass: v6.4-rc1-141-gb95366eba58e, first f=
ail: v6.4-rc1-166-g16fe96af4971)
        3 lines

    2023-05-12T01:12:17.167531  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-05-12T01:12:17.173607  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-05-12T01:12:17.180127  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-05-12T01:12:17.187167  <8>[   12.904990] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92ab90f6ef3f742e8639

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92ab90f6ef3f742e863e
        failing since 44 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:12:58.570599  + <8>[   11.430335] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10289200_1.4.2.3.1>

    2023-05-12T01:12:58.570680  set +x

    2023-05-12T01:12:58.674597  / # #

    2023-05-12T01:12:58.775212  export SHELL=3D/bin/sh

    2023-05-12T01:12:58.775431  #

    2023-05-12T01:12:58.875903  / # export SHELL=3D/bin/sh. /lava-10289200/=
environment

    2023-05-12T01:12:58.876101  =


    2023-05-12T01:12:58.976579  / # . /lava-10289200/environment/lava-10289=
200/bin/lava-test-runner /lava-10289200/1

    2023-05-12T01:12:58.976873  =


    2023-05-12T01:12:58.981830  / # /lava-10289200/bin/lava-test-runner /la=
va-10289200/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8fe049c73c66082e8637

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8fe049c73c66082e863c
        failing since 44 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:01:02.931447  <8>[   10.829616] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10288958_1.4.2.3.1>

    2023-05-12T01:01:02.934695  + set +x

    2023-05-12T01:01:03.036227  #

    2023-05-12T01:01:03.036508  =


    2023-05-12T01:01:03.137049  / # #export SHELL=3D/bin/sh

    2023-05-12T01:01:03.137289  =


    2023-05-12T01:01:03.237812  / # export SHELL=3D/bin/sh. /lava-10288958/=
environment

    2023-05-12T01:01:03.237972  =


    2023-05-12T01:01:03.338441  / # . /lava-10288958/environment/lava-10288=
958/bin/lava-test-runner /lava-10288958/1

    2023-05-12T01:01:03.338752  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d926b6b3a2811ad2e8624

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d926b6b3a2811ad2e8629
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-12T01:12:04.043578  <8>[   13.285124] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289121_1.4.2.3.1>

    2023-05-12T01:12:04.046959  + set +x

    2023-05-12T01:12:04.151817  / # #

    2023-05-12T01:12:04.252480  export SHELL=3D/bin/sh

    2023-05-12T01:12:04.252712  #

    2023-05-12T01:12:04.353636  / # export SHELL=3D/bin/sh. /lava-10289121/=
environment

    2023-05-12T01:12:04.354411  =


    2023-05-12T01:12:04.456130  / # . /lava-10289121/environment/lava-10289=
121/bin/lava-test-runner /lava-10289121/1

    2023-05-12T01:12:04.457289  =


    2023-05-12T01:12:04.462654  / # /lava-10289121/bin/lava-test-runner /la=
va-10289121/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92b3ce52d7652a2e8638

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92b3ce52d7652a2e863d
        failing since 44 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:12:59.764893  <8>[    8.010740] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289203_1.4.2.3.1>

    2023-05-12T01:12:59.767837  + set +x

    2023-05-12T01:12:59.869358  =


    2023-05-12T01:12:59.970009  / # #export SHELL=3D/bin/sh

    2023-05-12T01:12:59.970197  =


    2023-05-12T01:13:00.070769  / # export SHELL=3D/bin/sh. /lava-10289203/=
environment

    2023-05-12T01:13:00.071222  =


    2023-05-12T01:13:00.172079  / # . /lava-10289203/environment/lava-10289=
203/bin/lava-test-runner /lava-10289203/1

    2023-05-12T01:13:00.172387  =


    2023-05-12T01:13:00.177106  / # /lava-10289203/bin/lava-test-runner /la=
va-10289203/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9443d9c26661012e86be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d9443d9c26661012e8=
6bf
        new failure (last pass: v6.3-13708-gfd7527bf42e6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645d962b0d8095d8442e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-s=
ama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-s=
ama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d962b0d8095d8442e8=
5ed
        new failure (last pass: v6.3-13708-gfd7527bf42e6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8fcb049c43f8c72e865c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8fcb049c43f8c72e8661
        failing since 120 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-05-12T01:00:42.534363  / # #

    2023-05-12T01:00:42.636452  export SHELL=3D/bin/sh

    2023-05-12T01:00:42.637163  #

    2023-05-12T01:00:42.738584  / # export SHELL=3D/bin/sh. /lava-10288939/=
environment

    2023-05-12T01:00:42.739304  =


    2023-05-12T01:00:42.840741  / # . /lava-10288939/environment/lava-10288=
939/bin/lava-test-runner /lava-10288939/1

    2023-05-12T01:00:42.841902  =


    2023-05-12T01:00:42.858521  / # /lava-10288939/bin/lava-test-runner /la=
va-10288939/1

    2023-05-12T01:00:42.966292  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-12T01:00:42.966816  + cd /lava-10288939/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d915bc9dbe553ce2e863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d915bc9dbe553ce2e8=
63b
        failing since 74 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9264423ec273a32e8619

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d9264423ec273a32e8=
61a
        failing since 110 days (last pass: v6.2-rc4-412-g665ddd640630, firs=
t fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/645d91c56dd16e7b5f2e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagl=
e-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagl=
e-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d91c56dd16e7b5f2e8=
608
        new failure (last pass: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d91614ff93d76402e8661

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d91614ff93d76402e8666
        failing since 114 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-12T01:07:22.043259  <8>[   14.000513] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3577681_1.5.2.4.1>
    2023-05-12T01:07:22.149390  / # #
    2023-05-12T01:07:22.250884  export SHELL=3D/bin/sh
    2023-05-12T01:07:22.251274  #
    2023-05-12T01:07:22.352460  / # export SHELL=3D/bin/sh. /lava-3577681/e=
nvironment
    2023-05-12T01:07:22.353301  =

    2023-05-12T01:07:22.454695  / # . /lava-3577681/environment/lava-357768=
1/bin/lava-test-runner /lava-3577681/1
    2023-05-12T01:07:22.455190  =

    2023-05-12T01:07:22.459831  / # /lava-3577681/bin/lava-test-runner /lav=
a-3577681/1
    2023-05-12T01:07:22.501700  <3>[   14.447243] Bluetooth: hci0: command =
0x0c03 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9422735428e7d52e8604

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d9422735428e7d52e8609
        failing since 114 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-12T01:19:13.750900  + set +x<8>[   14.325673] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3577691_1.5.2.4.1>
    2023-05-12T01:19:13.751341  =

    2023-05-12T01:19:13.860423  / # #
    2023-05-12T01:19:13.965232  export SHELL=3D/bin/sh
    2023-05-12T01:19:13.966148  #
    2023-05-12T01:19:13.966605  / # <3>[   14.449465] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-05-12T01:19:14.069071  export SHELL=3D/bin/sh. /lava-3577691/envir=
onment
    2023-05-12T01:19:14.069454  =

    2023-05-12T01:19:14.170630  / # . /lava-3577691/environment/lava-357769=
1/bin/lava-test-runner /lava-3577691/1
    2023-05-12T01:19:14.171160   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645d94a0138a88340d2e86ab

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d94a0138a88340d2e86b0
        failing since 114 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-12T01:21:23.756396  <8>[   15.674409] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3577789_1.5.2.4.1>
    2023-05-12T01:21:23.868098  / # #
    2023-05-12T01:21:23.969879  export SHELL=3D/bin/sh
    2023-05-12T01:21:23.970383  #
    2023-05-12T01:21:23.970685  / # <3>[   15.808865] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-05-12T01:21:24.072017  export SHELL=3D/bin/sh. /lava-3577789/envir=
onment
    2023-05-12T01:21:24.072530  =

    2023-05-12T01:21:24.174341  / # . /lava-3577789/environment/lava-357778=
9/bin/lava-test-runner /lava-3577789/1
    2023-05-12T01:21:24.175088  =

    2023-05-12T01:21:24.179776  / # /lava-3577789/bin/lava-test-runner /lav=
a-3577789/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645d954768040527272e865e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d954768040527272e8663
        failing since 114 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-12T01:23:54.855247  <8>[   16.898883] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3577811_1.5.2.4.1>
    2023-05-12T01:23:54.965495  / # #
    2023-05-12T01:23:55.068618  export SHELL=3D/bin/sh
    2023-05-12T01:23:55.069890  #
    2023-05-12T01:23:55.172457  / # export SHELL=3D/bin/sh. /lava-3577811/e=
nvironment
    2023-05-12T01:23:55.173068  =

    2023-05-12T01:23:55.274701  / # . /lava-3577811/environment/lava-357781=
1/bin/lava-test-runner /lava-3577811/1
    2023-05-12T01:23:55.275156  =

    2023-05-12T01:23:55.280225  / # /lava-3577811/bin/lava-test-runner /lav=
a-3577811/1
    2023-05-12T01:23:55.361895  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645d95fb459afea7232e860b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d95fb459afea7232e8610
        failing since 114 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-05-12T01:27:00.527467  <8>[   20.688010] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3577893_1.5.2.4.1>
    2023-05-12T01:27:00.633924  / # #
    2023-05-12T01:27:00.735378  export SHELL=3D/bin/sh
    2023-05-12T01:27:00.735741  #
    2023-05-12T01:27:00.836865  / # export SHELL=3D/bin/sh. /lava-3577893/e=
nvironment
    2023-05-12T01:27:00.837218  =

    2023-05-12T01:27:00.938401  / # . /lava-3577893/environment/lava-357789=
3/bin/lava-test-runner /lava-3577893/1
    2023-05-12T01:27:00.938917  =

    2023-05-12T01:27:00.943979  / # /lava-3577893/bin/lava-test-runner /lav=
a-3577893/1
    2023-05-12T01:27:01.043176  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/645d910c05b7a137cc2e8620

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d910c05b7a13=
7cc2e8627
        failing since 70 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-05-12T01:04:54.964703  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4c78200 pointer offset 4 size 512
    2023-05-12T01:04:54.994981  kern  :alert : Register r9 information: non=
-paged memory
    2023-05-12T01:04:54.995597  kern  :alert : Register r10 information: NU=
LL pointer
    2023-05-12T01:04:54.995883  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2da000 allocated at load_module+0x6b0/0=
x1954
    2023-05-12T01:04:54.998551  kern  :alert : Register r12 information: no=
n-paged memory
    2023-05-12T01:04:55.102201  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-05-12T01:04:55.102624  kern  :emerg : Process udevd (pid: 70, stac=
k limit =3D 0xe981c5bc)
    2023-05-12T01:04:55.102955  kern  :emerg : Stack: (0xc88f9cf8 to 0xc88f=
a000)
    2023-05-12T01:04:55.103501  kern  :emerg : 9ce0:                       =
                                c4c78200 c0777860
    2023-05-12T01:04:55.103800  kern  :emerg : 9d00: 00000000 c03b02b8 0000=
0000 789699ee 0000005d 789699ee c0777860 bf2da220 =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d910c05b7a13=
7cc2e8628
        failing since 473 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-05-12T01:04:54.915692  kern  :alert : 8<--- cut here ---
    2023-05-12T01:04:54.916317  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-05-12T01:04:54.916950  kern  :alert : [00000060] *pgd=3Dc4a4e831, =
*pte=3D00000000, *ppte=3D00000000
    2023-05-12T01:04:54.917500  kern  :alert : Register r0 information: non=
-paged memory
    2023-05-12T01:04:54.918013  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88f8000 allocated at kernel_clone+0x98/0x=
3a0
    2023-05-12T01:04:54.919270  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-05-12T01:04:54.959819  kern  :alert : Register r3 information: non=
-paged memory
    2023-05-12T01:04:54.960487  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4c78200 pointer offset 0 size 512
    2023-05-12T01:04:54.961109  kern  :alert : Register r5 information: non=
-slab/vmalloc me<8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail=
 UNITS=3Dlines MEASUREMENT=3D16>
    2023-05-12T01:04:54.961658  mory =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8fd049c73c66082e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8fd049c73c66082e85eb
        failing since 44 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:00:55.392642  + set +x

    2023-05-12T01:00:55.398786  <8>[   10.799435] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10288992_1.4.2.3.1>

    2023-05-12T01:00:55.503617  / # #

    2023-05-12T01:00:55.604374  export SHELL=3D/bin/sh

    2023-05-12T01:00:55.604575  #

    2023-05-12T01:00:55.705098  / # export SHELL=3D/bin/sh. /lava-10288992/=
environment

    2023-05-12T01:00:55.705302  =


    2023-05-12T01:00:55.805862  / # . /lava-10288992/environment/lava-10288=
992/bin/lava-test-runner /lava-10288992/1

    2023-05-12T01:00:55.806143  =


    2023-05-12T01:00:55.811030  / # /lava-10288992/bin/lava-test-runner /la=
va-10288992/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92818ddc8b7c282e8607

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92818ddc8b7c282e860c
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-12T01:12:09.918505  + set +x<8>[   18.731726] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10289103_1.4.2.3.1>

    2023-05-12T01:12:09.918623  =


    2023-05-12T01:12:10.025264  / # #

    2023-05-12T01:12:10.125945  export SHELL=3D/bin/sh

    2023-05-12T01:12:10.126139  #

    2023-05-12T01:12:10.226675  / # export SHELL=3D/bin/sh. /lava-10289103/=
environment

    2023-05-12T01:12:10.226911  =


    2023-05-12T01:12:10.327415  / # . /lava-10289103/environment/lava-10289=
103/bin/lava-test-runner /lava-10289103/1

    2023-05-12T01:12:10.327681  =


    2023-05-12T01:12:10.332445  / # /lava-10289103/bin/lava-test-runner /la=
va-10289103/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92d2fd2374f6652e8617

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92d2fd2374f6652e861c
        failing since 44 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:13:39.319739  + set +x

    2023-05-12T01:13:39.326320  <8>[   10.374447] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289214_1.4.2.3.1>

    2023-05-12T01:13:39.430336  / # #

    2023-05-12T01:13:39.530917  export SHELL=3D/bin/sh

    2023-05-12T01:13:39.531214  #

    2023-05-12T01:13:39.631814  / # export SHELL=3D/bin/sh. /lava-10289214/=
environment

    2023-05-12T01:13:39.632015  =


    2023-05-12T01:13:39.732573  / # . /lava-10289214/environment/lava-10289=
214/bin/lava-test-runner /lava-10289214/1

    2023-05-12T01:13:39.732931  =


    2023-05-12T01:13:39.737731  / # /lava-10289214/bin/lava-test-runner /la=
va-10289214/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8fdab14ccd3c972e85fe

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8fdab14ccd3c972e8603
        failing since 44 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:01:03.910937  <8>[   10.627918] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10288990_1.4.2.3.1>

    2023-05-12T01:01:03.913404  + set +x

    2023-05-12T01:01:04.018297  / # #

    2023-05-12T01:01:04.119105  export SHELL=3D/bin/sh

    2023-05-12T01:01:04.119347  #

    2023-05-12T01:01:04.219964  / # export SHELL=3D/bin/sh. /lava-10288990/=
environment

    2023-05-12T01:01:04.220203  =


    2023-05-12T01:01:04.320834  / # . /lava-10288990/environment/lava-10288=
990/bin/lava-test-runner /lava-10288990/1

    2023-05-12T01:01:04.321226  =


    2023-05-12T01:01:04.326150  / # /lava-10288990/bin/lava-test-runner /la=
va-10288990/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9260423ec273a32e860b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d9260423ec273a32e8610
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-12T01:11:40.690583  + <8>[   20.054470] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10289102_1.4.2.3.1>

    2023-05-12T01:11:40.690667  set +x

    2023-05-12T01:11:40.794857  / # #

    2023-05-12T01:11:40.895512  export SHELL=3D/bin/sh

    2023-05-12T01:11:40.895714  #

    2023-05-12T01:11:40.996230  / # export SHELL=3D/bin/sh. /lava-10289102/=
environment

    2023-05-12T01:11:40.996419  =


    2023-05-12T01:11:41.096960  / # . /lava-10289102/environment/lava-10289=
102/bin/lava-test-runner /lava-10289102/1

    2023-05-12T01:11:41.097238  =


    2023-05-12T01:11:41.102363  / # /lava-10289102/bin/lava-test-runner /la=
va-10289102/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9297a71dfe54272e866c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d9297a71dfe54272e8671
        failing since 44 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:12:42.647544  + set +x

    2023-05-12T01:12:42.653732  <8>[   10.588915] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289204_1.4.2.3.1>

    2023-05-12T01:12:42.759165  / # #

    2023-05-12T01:12:42.860060  export SHELL=3D/bin/sh

    2023-05-12T01:12:42.860349  #

    2023-05-12T01:12:42.960997  / # export SHELL=3D/bin/sh. /lava-10289204/=
environment

    2023-05-12T01:12:42.961281  =


    2023-05-12T01:12:43.061955  / # . /lava-10289204/environment/lava-10289=
204/bin/lava-test-runner /lava-10289204/1

    2023-05-12T01:12:43.062241  =


    2023-05-12T01:12:43.067228  / # /lava-10289204/bin/lava-test-runner /la=
va-10289204/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8fde49c73c66082e8629

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8fde49c73c66082e862e
        failing since 44 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:00:57.554832  + set<8>[   11.515105] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10288998_1.4.2.3.1>

    2023-05-12T01:00:57.554940   +x

    2023-05-12T01:00:57.659368  / # #

    2023-05-12T01:00:57.760012  export SHELL=3D/bin/sh

    2023-05-12T01:00:57.760288  #

    2023-05-12T01:00:57.860781  / # export SHELL=3D/bin/sh. /lava-10288998/=
environment

    2023-05-12T01:00:57.860973  =


    2023-05-12T01:00:57.961460  / # . /lava-10288998/environment/lava-10288=
998/bin/lava-test-runner /lava-10288998/1

    2023-05-12T01:00:57.961803  =


    2023-05-12T01:00:57.966322  / # /lava-10288998/bin/lava-test-runner /la=
va-10288998/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d928c8ddc8b7c282e868c

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d928c8ddc8b7c282e8691
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-12T01:12:18.165999  + set +x

    2023-05-12T01:12:18.172207  <8>[   14.304540] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289148_1.4.2.3.1>

    2023-05-12T01:12:18.276741  / # #

    2023-05-12T01:12:18.379360  export SHELL=3D/bin/sh

    2023-05-12T01:12:18.380110  #

    2023-05-12T01:12:18.481639  / # export SHELL=3D/bin/sh. /lava-10289148/=
environment

    2023-05-12T01:12:18.482401  =


    2023-05-12T01:12:18.583916  / # . /lava-10289148/environment/lava-10289=
148/bin/lava-test-runner /lava-10289148/1

    2023-05-12T01:12:18.585123  =


    2023-05-12T01:12:18.590227  / # /lava-10289148/bin/lava-test-runner /la=
va-10289148/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92a890f6ef3f742e862b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92a890f6ef3f742e8630
        failing since 44 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:12:53.812550  + set +x<8>[   11.021533] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10289196_1.4.2.3.1>

    2023-05-12T01:12:53.812989  =


    2023-05-12T01:12:53.921651  / # #

    2023-05-12T01:12:54.022424  export SHELL=3D/bin/sh

    2023-05-12T01:12:54.023011  #

    2023-05-12T01:12:54.124235  / # export SHELL=3D/bin/sh. /lava-10289196/=
environment

    2023-05-12T01:12:54.124887  =


    2023-05-12T01:12:54.226262  / # . /lava-10289196/environment/lava-10289=
196/bin/lava-test-runner /lava-10289196/1

    2023-05-12T01:12:54.227341  =


    2023-05-12T01:12:54.231952  / # /lava-10289196/bin/lava-test-runner /la=
va-10289196/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9492138a88340d2e8633

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d9492138a88340d2e8636
        failing since 127 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-05-12T01:20:24.405515  / # #
    2023-05-12T01:20:25.565762  export SHELL=3D/bin/sh
    2023-05-12T01:20:25.571436  #
    2023-05-12T01:20:27.118866  / # export SHELL=3D/bin/sh. /lava-1219349/e=
nvironment
    2023-05-12T01:20:27.124352  =

    2023-05-12T01:20:29.945603  / # . /lava-1219349/environment/lava-121934=
9/bin/lava-test-runner /lava-1219349/1
    2023-05-12T01:20:29.951635  =

    2023-05-12T01:20:29.958619  / # /lava-1219349/bin/lava-test-runner /lav=
a-1219349/1
    2023-05-12T01:20:30.047617  + export 'TESTRUN_ID=3D1_bootrr'
    2023-05-12T01:20:30.048107  + cd /lava-1219349/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645d955823cfde9d7e2e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d955823cfde9d7e2e85ea
        failing since 127 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-05-12T01:23:19.247875  + set +x<8>[   56.520425] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1219347_1.5.2.4.1>
    2023-05-12T01:23:19.248135  =

    2023-05-12T01:23:19.357534  / # #
    2023-05-12T01:23:20.517515  export SHELL=3D/bin/sh
    2023-05-12T01:23:20.523220  #
    2023-05-12T01:23:20.523534  / # export SHELL=3D/bin/sh
    2023-05-12T01:23:22.070894  / # . /lava-1219347/environment
    2023-05-12T01:23:24.898301  /lava-1219347/bin/lava-test-runner /lava-12=
19347/1
    2023-05-12T01:23:24.904421  . /lava-1219347/environment
    2023-05-12T01:23:24.904700  / # /lava-1219347/bin/lava-test-runner /lav=
a-1219347/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d95d46f05e822442e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d95d46f05e822442e8=
5f5
        failing since 377 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645d909a240ae70a732e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d909a240ae70a732e85eb
        failing since 15 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-05-12T01:03:45.658274  <8>[    7.637523] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3577575_1.5.2.4.1>
    2023-05-12T01:03:45.764385  / # #
    2023-05-12T01:03:45.865883  export SHELL=3D/bin/sh
    2023-05-12T01:03:45.866758  #
    2023-05-12T01:03:45.968678  / # export SHELL=3D/bin/sh. /lava-3577575/e=
nvironment
    2023-05-12T01:03:45.969014  =

    2023-05-12T01:03:46.070631  / # . /lava-3577575/environment/lava-357757=
5/bin/lava-test-runner /lava-3577575/1
    2023-05-12T01:03:46.071790  =

    2023-05-12T01:03:46.090208  / # /lava-3577575/bin/lava-test-runner /lav=
a-3577575/1
    2023-05-12T01:03:46.134346  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9172662d6974d82e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am6=
25-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am6=
25-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d9172662d6974d82e85ec
        failing since 1 day (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first f=
ail: v6.4-rc1-166-g16fe96af4971)

    2023-05-12T01:07:43.368617  <8>[   13.293658] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3577600_1.5.2.4.1>
    2023-05-12T01:07:43.487753  / # #
    2023-05-12T01:07:43.589383  export SHELL=3D/bin/sh
    2023-05-12T01:07:43.589849  #
    2023-05-12T01:07:43.691136  / # export SHELL=3D/bin/sh. /lava-3577600/e=
nvironment
    2023-05-12T01:07:43.691563  =

    2023-05-12T01:07:43.792772  / # . /lava-3577600/environment/lava-357760=
0/bin/lava-test-runner /lava-3577600/1
    2023-05-12T01:07:43.796927  =

    2023-05-12T01:07:43.817631  / # /lava-3577600/bin/lava-test-runner /lav=
a-3577600/1
    2023-05-12T01:07:43.845693  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92d3fd2374f6652e862d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92d3fd2374f6652e8632
        failing since 3 days (last pass: v6.3-rc7-210-g884374c58391a, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)

    2023-05-12T01:13:30.454113  <8>[    7.591687] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3577733_1.5.2.4.1>
    2023-05-12T01:13:30.565387  / # #
    2023-05-12T01:13:30.669452  export SHELL=3D/bin/sh
    2023-05-12T01:13:30.670008  #
    2023-05-12T01:13:30.778193  / # export SHELL=3D/bin/sh. /lava-3577733/e=
nvironment
    2023-05-12T01:13:30.778628  =

    2023-05-12T01:13:30.885384  / # . /lava-3577733/env/lava-3577733/bin/la=
va-test-runner /lava-3577733/1
    2023-05-12T01:13:30.885991  ironment
    2023-05-12T01:13:30.930132  / # /lava-3577733/bin/lava-test-runner /lav=
a-3577733/1
    2023-05-12T01:13:30.939603  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/645d934588137096c42e863f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-=
sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-=
sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d934588137096c42e8644
        failing since 13 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)

    2023-05-12T01:15:15.238518  <8>[    7.545508] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3577850_1.5.2.4.1>
    2023-05-12T01:15:15.345090  / # #
    2023-05-12T01:15:15.448355  export SHELL=3D/bin/sh
    2023-05-12T01:15:15.449312  #
    2023-05-12T01:15:15.551827  / # export SHELL=3D/bin/sh. /lava-3577850/e=
nvironment
    2023-05-12T01:15:15.552830  =

    2023-05-12T01:15:15.655138  / # . /lava-3577850/environment/lava-357785=
0/bin/lava-test-runner /lava-3577850/1
    2023-05-12T01:15:15.656706  =

    2023-05-12T01:15:15.670661  / # /lava-3577850/bin/lava-test-runner /lav=
a-3577850/1
    2023-05-12T01:15:15.715591  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d96ca839bd34b072e85f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d96ca839bd34b072e85f6
        failing since 15 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-05-12T01:30:14.276411  <8>[    7.618974] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3578014_1.5.2.4.1>
    2023-05-12T01:30:14.400114  / # #
    2023-05-12T01:30:14.505379  export SHELL=3D/bin/sh
    2023-05-12T01:30:14.505678  #
    2023-05-12T01:30:14.606882  / # export SHELL=3D/bin/sh. /lava-3578014/e=
nvironment
    2023-05-12T01:30:14.607763  =

    2023-05-12T01:30:14.709959  / # . /lava-3578014/environment/lava-357801=
4/bin/lava-test-runner /lava-3578014/1
    2023-05-12T01:30:14.713544  =

    2023-05-12T01:30:14.724793  / # /lava-3578014/bin/lava-test-runner /lav=
a-3578014/1
    2023-05-12T01:30:14.768762  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/645d9053f1d5ef236d2e8650

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d9053f1d5ef236d2e8653
        new failure (last pass: v6.4-rc1-141-gb95366eba58e)

    2023-05-12T01:03:05.268441  / # #
    2023-05-12T01:03:05.371154  export SHELL=3D/bin/sh
    2023-05-12T01:03:05.371901  #
    2023-05-12T01:03:05.473836  / # export SHELL=3D/bin/sh. /lava-335156/en=
vironment
    2023-05-12T01:03:05.474214  =

    2023-05-12T01:03:05.575636  / # . /lava-335156/environment/lava-335156/=
bin/lava-test-runner /lava-335156/1
    2023-05-12T01:03:05.576891  =

    2023-05-12T01:03:05.595278  / # /lava-335156/bin/lava-test-runner /lava=
-335156/1
    2023-05-12T01:03:05.610310  + export 'TESTRUN_ID=3D1_bootrr'
    2023-05-12T01:03:05.650084  + cd /l<8>[   15.255792] <LAVA_SIGNAL_START=
RUN 1_bootrr 335156_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/645=
d9053f1d5ef236d2e8663
        new failure (last pass: v6.4-rc1-141-gb95366eba58e)

    2023-05-12T01:03:08.037153  /lava-335156/1/../bin/lava-test-case
    2023-05-12T01:03:08.037684  <8>[   17.740353] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-05-12T01:03:08.038093  /lava-335156/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8fc2f7ec373d0f2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8fc2f7ec373d0f2e85eb
        failing since 44 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:00:39.928969  + set +x<8>[   11.645290] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10288981_1.4.2.3.1>

    2023-05-12T01:00:39.929055  =


    2023-05-12T01:00:40.033347  / # #

    2023-05-12T01:00:40.133883  export SHELL=3D/bin/sh

    2023-05-12T01:00:40.134120  #

    2023-05-12T01:00:40.234720  / # export SHELL=3D/bin/sh. /lava-10288981/=
environment

    2023-05-12T01:00:40.234923  =


    2023-05-12T01:00:40.335461  / # . /lava-10288981/environment/lava-10288=
981/bin/lava-test-runner /lava-10288981/1

    2023-05-12T01:00:40.335773  =


    2023-05-12T01:00:40.340337  / # /lava-10288981/bin/lava-test-runner /la=
va-10288981/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92624a26cc76132e860c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92624a26cc76132e8611
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-12T01:11:51.602166  + <8>[   13.745412] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10289123_1.4.2.3.1>

    2023-05-12T01:11:51.602246  set +x

    2023-05-12T01:11:51.707255  / # #

    2023-05-12T01:11:51.807847  export SHELL=3D/bin/sh

    2023-05-12T01:11:51.808037  #

    2023-05-12T01:11:51.908517  / # export SHELL=3D/bin/sh. /lava-10289123/=
environment

    2023-05-12T01:11:51.908713  =


    2023-05-12T01:11:52.009402  / # . /lava-10289123/environment/lava-10289=
123/bin/lava-test-runner /lava-10289123/1

    2023-05-12T01:11:52.010061  =


    2023-05-12T01:11:52.014758  / # /lava-10289123/bin/lava-test-runner /la=
va-10289123/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92b5ed90d5a0f22e85ef

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d92b5ed90d5a0f22e85f4
        failing since 44 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-12T01:13:00.187095  + set<8>[    9.230805] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10289222_1.4.2.3.1>

    2023-05-12T01:13:00.187234   +x

    2023-05-12T01:13:00.291159  / # #

    2023-05-12T01:13:00.392662  export SHELL=3D/bin/sh

    2023-05-12T01:13:00.392949  #

    2023-05-12T01:13:00.493616  / # export SHELL=3D/bin/sh. /lava-10289222/=
environment

    2023-05-12T01:13:00.493846  =


    2023-05-12T01:13:00.594501  / # . /lava-10289222/environment/lava-10289=
222/bin/lava-test-runner /lava-10289222/1

    2023-05-12T01:13:00.594992  =


    2023-05-12T01:13:00.599900  / # /lava-10289222/bin/lava-test-runner /la=
va-10289222/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645d90b741c36bdae82e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d90b741c36bdae82e8=
600
        new failure (last pass: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645d915b65a1bee3722e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d915b65a1bee3722e8=
5fd
        failing since 1 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9319a79cb438302e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d9319a79cb438302e8=
5ff
        failing since 1 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/645d93aff758e363d52e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d93aff758e363d52e8=
600
        failing since 13 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d971fed82529b132e8619

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d971fed82529b132e8=
61a
        failing since 15 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d95c6d4ed5d87182e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d95c6d4ed5d87182e8=
60d
        failing since 107 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9440d9c26661012e86b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d9440d9c26661012e8=
6b9
        failing since 3 days (last pass: v6.3-rc7-226-gf05a2341f2478, first=
 fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d95ca60be566d0a2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d95ca60be566d0a2e8=
5e7
        failing since 93 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645d97894b46c9cbf62e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d97894b46c9cbf62e8=
617
        failing since 15 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645d958c5948ec58e72e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d958c5948ec58e72e8=
5f5
        failing since 3 days (last pass: v6.3-rc7-226-gf05a2341f2478, first=
 fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d95cf6f05e822442e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d95cf6f05e822442e8=
5ef
        failing since 93 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645d987078dcf7c7e32e8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d987078dcf7c7e32e8=
633
        failing since 15 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9fff919a9222402e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d9fff919a9222402e8=
5f4
        failing since 93 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/645d9191b6923d41842e86cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d9191b6923d41842e8=
6cd
        new failure (last pass: v6.4-rc1-206-g1360b04fa3df) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645d908739cbbf880d2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d908739cbbf880d2e8=
5f9
        failing since 13 days (last pass: v6.3-8745-gc94d3163e00b, first fa=
il: v6.3-10703-gb3f869e79cdf) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d96340d8095d8442e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d96340d8095d8442e8=
628
        failing since 147 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d942c536b2c553a2e8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d942c536b2c553a2e8=
632
        failing since 147 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/645d93dfbe47125c8e2e85e9

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d93dfbe47125=
c8e2e8640
        failing since 3 days (last pass: v6.3-rc7-226-gf05a2341f2478, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-12T01:17:52.757965  at virtual address 0000000000000008

    2023-05-12T01:17:52.760935  kern  :alert : Mem abort info:

    2023-05-12T01:17:52.764375  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-12T01:17:52.770533  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-12T01:17:52.774269  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-12T01:17:52.776990  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-12T01:17:52.783158  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-12T01:17:52.785837  kern  :alert : Data abort info:

    2023-05-12T01:17:52.790456  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-12T01:17:52.800575  kern  :<8>[   18.473314] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d93dfbe47125=
c8e2e8641
        failing since 3 days (last pass: v6.3-rc7-226-gf05a2341f2478, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-12T01:17:52.714755  <8>[   18.389441] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-12T01:17:52.753266  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   18.428764] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d95e160be566d0a2e884b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d95e160be566d0a2e8=
84c
        failing since 93 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/645d96965520213a7d2e8666

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d96965520213=
a7d2e86bd
        failing since 15 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-12T01:29:25.850410  kern  :alert : Mem abort in<8>[   19.196555=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-05-12T01:29:25.850788  fo:

    2023-05-12T01:29:25.853626  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-12T01:29:25.860018  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-12T01:29:25.863027  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-12T01:29:25.866462  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-12T01:29:25.871529  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-12T01:29:25.875309  kern  :alert : Data abort info:

    2023-05-12T01:29:25.879150  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-12T01:29:25.889257  kern  :<8>[   19.242114] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d96965520213=
a7d2e86be
        failing since 15 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-12T01:29:25.837131  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/645d9075e59023e8832e8663

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d9075e59023e=
8832e866a
        failing since 14 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-12T01:03:33.505168  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-12T01:03:33.505482  kern  :emerg : Code: 97fa8110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-12T01:03:33.515096  <8>[   21.633951] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-12T01:03:33.515459  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d9075e59023e=
8832e866b
        failing since 14 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-12T01:03:33.482345  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-12T01:03:33.485438  kern  :alert : Mem abort info:
    2023-05-12T01:03:33.485806  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-12T01:03:33.489056  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-12T01:03:33.492244  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-12T01:03:33.492608  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-12T01:03:33.495308  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-12T01:03:33.497848  kern  :alert : Data abort info:
    2023-05-12T01:03:33.499627  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-12T01:03:33.499982  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/645d90eda8efa1fb1d2e85f2

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d90eda8efa1fb1d2e85f7
        new failure (last pass: v6.4-rc1-166-g16fe96af4971)

    2023-05-12T01:05:36.041356  <8>[   23.975244] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 429851_1.5.2.4.1>
    2023-05-12T01:05:36.148776  / # #
    2023-05-12T01:05:36.252311  export SHELL=3D/bin/sh
    2023-05-12T01:05:36.252782  #
    2023-05-12T01:05:36.354218  / # export SHELL=3D/bin/sh. /lava-429851/en=
vironment
    2023-05-12T01:05:36.354829  =

    2023-05-12T01:05:36.456376  / # . /lava-429851/environment/lava-429851/=
bin/lava-test-runner /lava-429851/1
    2023-05-12T01:05:36.457282  =

    2023-05-12T01:05:36.461154  / # /lava-429851/bin/lava-test-runner /lava=
-429851/1
    2023-05-12T01:05:36.509226  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d90eda8efa1f=
b1d2e85f9
        failing since 6 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.3-13708-gfd7527bf42e6)
        2 lines

    2023-05-12T01:05:36.027974  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-12T01:05:36.029499  kern  :emerg : Code: 97fe3110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-12T01:05:36.039223  <8>[   23.972756] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-12T01:05:36.039657  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d90eda8efa1f=
b1d2e85fa
        failing since 6 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.3-13708-gfd7527bf42e6)
        12 lines

    2023-05-12T01:05:36.000956  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-12T01:05:36.002229  kern  :alert : Mem abort info:
    2023-05-12T01:05:36.002602  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-12T01:05:36.003372  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-12T01:05:36.004702  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-12T01:05:36.005063  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-12T01:05:36.005770  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-12T01:05:36.006972  kern  :alert : Data abort info:
    2023-05-12T01:05:36.007331  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-12T01:05:36.007892  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645d93beb74588fc1a2e862e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d93beb74588f=
c1a2e8635
        failing since 3 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-12T01:17:28.827220  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-12T01:17:28.828564  kern  :emerg : Code: 97fe8510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-12T01:17:28.841960  <8>[   19.310757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-12T01:17:28.842323  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d93beb74588f=
c1a2e8636
        failing since 3 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-12T01:17:28.799507  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-12T01:17:28.800737  kern  :alert : Mem abort info:
    2023-05-12T01:17:28.801090  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-12T01:17:28.801954  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-12T01:17:28.803182  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-12T01:17:28.803545  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-12T01:17:28.804359  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-12T01:17:28.805631  kern  :alert : Data abort info:
    2023-05-12T01:17:28.805983  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-12T01:17:28.806846  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/645d9435536b2c553a2e868b

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-=
pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-=
pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d9435536b2c5=
53a2e8692
        failing since 13 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-12T01:19:30.457600  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-12T01:19:30.458966  kern  :emerg : Code: 97fc8110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-12T01:19:30.469610  <8>[   21.652528] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-12T01:19:30.469981  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d9435536b2c5=
53a2e8693
        failing since 13 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-12T01:19:30.430549  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-12T01:19:30.432253  kern  :alert : Mem abort info:
    2023-05-12T01:19:30.432626  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-12T01:19:30.434182  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-12T01:19:30.436573  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-12T01:19:30.436936  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-12T01:19:30.438597  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-12T01:19:30.440369  kern  :alert : Data abort info:
    2023-05-12T01:19:30.440743  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-12T01:19:30.442049  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/645d96b56d3fcec7962e860e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d96b56d3fcec=
7962e8615
        failing since 14 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-12T01:30:15.925552  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-12T01:30:15.927146  kern  :emerg : Code: 97fd9910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-12T01:30:15.936906  <8>[   21.745773] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-12T01:30:15.937406  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d96b56d3fcec=
7962e8616
        failing since 14 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-12T01:30:15.899262  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-12T01:30:15.900443  kern  :alert : Mem abort info:
    2023-05-12T01:30:15.900898  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-12T01:30:15.902164  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-12T01:30:15.903119  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-12T01:30:15.903510  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-12T01:30:15.904441  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-12T01:30:15.905388  kern  :alert : Data abort info:
    2023-05-12T01:30:15.905904  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-12T01:30:15.907004  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/645d908b3f0fb4caf12e85ed

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d908b3f0fb4c=
af12e85f4
        failing since 15 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-12T01:03:56.394067  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-12T01:03:56.394603  kern  :emerg : Code: 94041510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-12T01:03:56.394948  <8>[   23.373005] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-12T01:03:56.395271  + set +x

    2023-05-12T01:03:56.395579  <8>[   23.374985] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289033_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d908b3f0fb4c=
af12e85f5
        failing since 15 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-12T01:03:56.365069  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-12T01:03:56.365604  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-12T01:03:56.365920  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078def000

    2023-05-12T01:03:56.366217  kern  :alert : [0000000000000008] pgd=3D080=
0000078df5003, p4d=3D0800000078df5003, pud=3D0800000078df6003, pmd=3D000000=
0000000000

    2023-05-12T01:03:56.366507  <8>[   23.345808] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/645d931eb832ba375b2e85e8

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d931eb832ba3=
75b2e85ef
        failing since 13 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-12T01:14:49.262291  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-12T01:14:49.262812  kern  :emerg : Code: 97fd6910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-12T01:14:49.263150  <8>[   23.170590] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-12T01:14:49.263466  + set +x

    2023-05-12T01:14:49.263771  <8>[   23.172473] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289259_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d931eb832ba3=
75b2e85f0
        failing since 13 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-12T01:14:49.213059  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-12T01:14:49.213611  kern  :alert : Mem abort info:

    2023-05-12T01:14:49.213947  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-12T01:14:49.214258  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-12T01:14:49.214558  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-12T01:14:49.214850  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-12T01:14:49.215138  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-12T01:14:49.215420  kern  :alert : Data abort info:

    2023-05-12T01:14:49.215696  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-12T01:14:49.215976  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645d938bae22dbd2432e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d938bae22dbd2432e8=
5e7
        new failure (last pass: v6.4-rc1-206-g1360b04fa3df) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/645d96cb839bd34b072e85fc

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d96cb839bd34=
b072e8603
        failing since 15 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-12T01:30:30.952425  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-12T01:30:30.952956  kern  :emerg : Code: 97f89510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-12T01:30:30.953330  <8>[   23.969312] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-12T01:30:30.953660  + set +x

    2023-05-12T01:30:30.953974  <8>[   23.971189] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10289457_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d96cb839bd34=
b072e8604
        failing since 15 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-12T01:30:30.908426  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-12T01:30:30.908960  kern  :alert : Mem abort info:

    2023-05-12T01:30:30.909335  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-12T01:30:30.909661  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-12T01:30:30.909970  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-12T01:30:30.910270  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-12T01:30:30.910561  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-12T01:30:30.910852  kern  :alert : Data abort info:

    2023-05-12T01:30:30.911134  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-12T01:30:30.911421  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645d95cb6f05e822442e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d95cb6f05e822442e8=
5ec
        failing since 93 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645d97dc897be840702e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pi=
ne64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pi=
ne64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d97dc897be840702e8=
609
        new failure (last pass: v6.4-rc1-206-g1360b04fa3df) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645d922b68ff14332d2e865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d922b68ff14332d2e8=
65f
        failing since 6 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.3-13708-gfd7527bf42e6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645d92bc519507b8142e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-lib=
retech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-lib=
retech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d92bc519507b8142e8=
606
        new failure (last pass: v6.4-rc1-206-g1360b04fa3df) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645d98fb79d6f953bd2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d98fb79d6f953bd2e8=
5e7
        failing since 1 day (last pass: v6.4-rc1-141-gb95366eba58e, first f=
ail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/645d940f368f23a3342e8622

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-o=
rangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-o=
rangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d940f368f23a3342e8=
623
        new failure (last pass: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8e7bfbc5d5ef422e85ff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8e7bfbc5d5ef422e8604
        failing since 99 days (last pass: v6.0-12387-ge54e01f1826aa, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-05-12T00:53:30.445877  / # #
    2023-05-12T00:53:30.551456  export SHELL=3D/bin/sh
    2023-05-12T00:53:30.552981  #
    2023-05-12T00:53:30.656463  / # export SHELL=3D/bin/sh. /lava-3577535/e=
nvironment
    2023-05-12T00:53:30.658161  =

    2023-05-12T00:53:30.761773  / # . /lava-3577535/environment/lava-357753=
5/bin/lava-test-runner /lava-3577535/1
    2023-05-12T00:53:30.764413  =

    2023-05-12T00:53:30.770951  / # /lava-3577535/bin/lava-test-runner /lav=
a-3577535/1
    2023-05-12T00:53:30.897734  + export 'TESTRUN_ID=3D1_bootrr'
    2023-05-12T00:53:30.898818  + cd /lava-3577535/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8edfaab9657fce2e8611

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d8edfaab9657fce2e8615
        failing since 70 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-05-12T00:53:44.201034  / # #
    2023-05-12T00:53:44.306600  export SHELL=3D/bin/sh
    2023-05-12T00:53:44.308108  #
    2023-05-12T00:53:44.411483  / # export SHELL=3D/bin/sh. /lava-3577538/e=
nvironment
    2023-05-12T00:53:44.412996  =

    2023-05-12T00:53:44.516442  / # . /lava-3577538/environment/lava-357753=
8/bin/lava-test-runner /lava-3577538/1
    2023-05-12T00:53:44.519140  =

    2023-05-12T00:53:44.526208  / # /lava-3577538/bin/lava-test-runner /lav=
a-3577538/1
    2023-05-12T00:53:44.683788  + export 'TESTRUN_ID=3D1_bootrr'
    2023-05-12T00:53:44.684844  + cd /lava-3577538/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645d8e44fbc5d5ef422e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-b=
ananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-26=
0-g4cffd190aeed9/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-b=
ananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d8e44fbc5d5ef422e8=
5ea
        failing since 14 days (last pass: v6.3-5614-gbe56a31d3d65, first fa=
il: v6.3-8745-gc94d3163e00b) =

 =20
