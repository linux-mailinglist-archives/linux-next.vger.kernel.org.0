Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57DAD73F5D8
	for <lists+linux-next@lfdr.de>; Tue, 27 Jun 2023 09:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbjF0Hjq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Jun 2023 03:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjF0Hjp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Jun 2023 03:39:45 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC50E196
        for <linux-next@vger.kernel.org>; Tue, 27 Jun 2023 00:39:42 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-668704a5b5bso3876240b3a.0
        for <linux-next@vger.kernel.org>; Tue, 27 Jun 2023 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687851582; x=1690443582;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u/ntRTnXTGA+qDYStboarTzvBC2xVZtldWSWGkPDWLA=;
        b=VbG/S7NT5N3zNzm/8oJOYyh+OxFtn2EJfo9RI2acfG/4+XmxGhsBVJHe2UjaxkbSbz
         wsh/Hu8wQSYNhl4imdhKbEYLBVUf5LoZ4y/FlkdcFctIpLjWTX/SnM22FZ47inxqS2TR
         QZwXqtdQiyJZTn1AijfcX+4BgyIaPg4UTaTsiO6XYW734Oku/XSgn+e+OLBWKv0karjd
         kd5Z0UlyUSc0qUKFF547aeCUcdcFrMrmZdSHxIgmoe/HNlgCxic0z8H1bzYsdjU2uImd
         fnBH3rXFavLdc7QYv66i4NOjhRDOSF9IbL2WqWU4HF9vB3DnsNAZK7hFjJT6dktYqaih
         iacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687851582; x=1690443582;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/ntRTnXTGA+qDYStboarTzvBC2xVZtldWSWGkPDWLA=;
        b=Jqjl+DaCaiwBo9DUWtqVdE+1pP6+Y844vd37YAUn24dlQZmzEg5TCVer75hPygAEmh
         J/loEt8mRV5eH6juh/+R6Gja6oNj7WVatCnbE7hvLU5Y3/nQ14Dn5+sgXBTOkmIYbygq
         yqv0iUToW2GceTlLgQrNuIZDJDEKlyxAab72z4U4vHDOTKPRAbeYOJm4OScwcxoVscK0
         i9/6YOySmnPzu0T3Gw0yzGkXgYNigB2rfDrPsvjIDg51TSRoiucYKacyZZ/z7aip3MN0
         qG9L1MyttGtc5sIRyCdHxFJeUqwF7cFqVWurlJFsOlWoZxTK6CNxPhbCjd5l7qtrON8l
         JheQ==
X-Gm-Message-State: AC+VfDzKs6EulxQSSzwuw6cwv1+PBVURKT4pX2glsFHNHPCzC2SWdoyl
        q5JTYt/ng91L9RqC/wPPW+dxJzGEWshHtBUlkeevDQ==
X-Google-Smtp-Source: ACHHUZ6X3T14YjIbOJrdLKSoEGxQSxIgGH9D1g02GpDtY+luuHqAju/vblgenFz6pAujb77ijw474w==
X-Received: by 2002:a05:6a00:2191:b0:667:85e6:4d1 with SMTP id h17-20020a056a00219100b0066785e604d1mr35871104pfi.33.1687851581009;
        Tue, 27 Jun 2023 00:39:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s24-20020aa78d58000000b0064ff855751fsm4850190pfe.4.2023.06.27.00.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:39:40 -0700 (PDT)
Message-ID: <649a923c.a70a0220.9e97e.8e5c@mx.google.com>
Date:   Tue, 27 Jun 2023 00:39:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-1651-gf52dd2890422
Subject: next/pending-fixes baseline: 239 runs,
 17 regressions (v6.4-1651-gf52dd2890422)
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

next/pending-fixes baseline: 239 runs, 17 regressions (v6.4-1651-gf52dd2890=
422)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-1651-gf52dd2890422/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-1651-gf52dd2890422
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f52dd2890422fd694da3946920d60543d750b804 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5a952d99f1312430614a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5a952d99f13124306153
        failing since 90 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-27T03:42:07.454918  <8>[   10.257574] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10916633_1.4.2.3.1>

    2023-06-27T03:42:07.458345  + set +x

    2023-06-27T03:42:07.566317  / # #

    2023-06-27T03:42:07.668746  export SHELL=3D/bin/sh

    2023-06-27T03:42:07.669537  #

    2023-06-27T03:42:07.771113  / # export SHELL=3D/bin/sh. /lava-10916633/=
environment

    2023-06-27T03:42:07.771930  =


    2023-06-27T03:42:07.873742  / # . /lava-10916633/environment/lava-10916=
633/bin/lava-test-runner /lava-10916633/1

    2023-06-27T03:42:07.874953  =


    2023-06-27T03:42:07.880580  / # /lava-10916633/bin/lava-test-runner /la=
va-10916633/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5a870a16d208223061b8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5a870a16d208223061c1
        failing since 90 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-27T03:41:44.006834  + <8>[   11.860086] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10916630_1.4.2.3.1>

    2023-06-27T03:41:44.006947  set +x

    2023-06-27T03:41:44.111255  / # #

    2023-06-27T03:41:44.211761  export SHELL=3D/bin/sh

    2023-06-27T03:41:44.211932  #

    2023-06-27T03:41:44.312436  / # export SHELL=3D/bin/sh. /lava-10916630/=
environment

    2023-06-27T03:41:44.312577  =


    2023-06-27T03:41:44.413036  / # . /lava-10916630/environment/lava-10916=
630/bin/lava-test-runner /lava-10916630/1

    2023-06-27T03:41:44.413319  =


    2023-06-27T03:41:44.417596  / # /lava-10916630/bin/lava-test-runner /la=
va-10916630/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5a972d99f13124306167

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5a972d99f13124306170
        failing since 90 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-27T03:42:08.617327  <8>[   15.336744] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10916643_1.4.2.3.1>

    2023-06-27T03:42:08.620599  + set +x

    2023-06-27T03:42:08.725622  #

    2023-06-27T03:42:08.726933  =


    2023-06-27T03:42:08.828602  / # #export SHELL=3D/bin/sh

    2023-06-27T03:42:08.829421  =


    2023-06-27T03:42:08.930626  / # export SHELL=3D/bin/sh. /lava-10916643/=
environment

    2023-06-27T03:42:08.930896  =


    2023-06-27T03:42:09.031431  / # . /lava-10916643/environment/lava-10916=
643/bin/lava-test-runner /lava-10916643/1

    2023-06-27T03:42:09.031778  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5ecd320c6ae2e830618a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649a5ecd320c6ae2e8306=
18b
        failing since 120 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5a7976b2cb21c630613d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5a7976b2cb21c6306146
        failing since 90 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-27T03:41:42.194911  + set +x

    2023-06-27T03:41:42.202025  <8>[   10.474361] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10916608_1.4.2.3.1>

    2023-06-27T03:41:42.311727  / # #

    2023-06-27T03:41:42.412519  export SHELL=3D/bin/sh

    2023-06-27T03:41:42.413242  #

    2023-06-27T03:41:42.514927  / # export SHELL=3D/bin/sh. /lava-10916608/=
environment

    2023-06-27T03:41:42.515794  =


    2023-06-27T03:41:42.617415  / # . /lava-10916608/environment/lava-10916=
608/bin/lava-test-runner /lava-10916608/1

    2023-06-27T03:41:42.618816  =


    2023-06-27T03:41:42.623715  / # /lava-10916608/bin/lava-test-runner /la=
va-10916608/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5a6f76b2cb21c630612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5a6f76b2cb21c6306137
        failing since 90 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-27T03:41:21.796224  <8>[   10.742312] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10916592_1.4.2.3.1>

    2023-06-27T03:41:21.799277  + set +x

    2023-06-27T03:41:21.907208  / # #

    2023-06-27T03:41:22.009343  export SHELL=3D/bin/sh

    2023-06-27T03:41:22.009969  #

    2023-06-27T03:41:22.111316  / # export SHELL=3D/bin/sh. /lava-10916592/=
environment

    2023-06-27T03:41:22.111931  =


    2023-06-27T03:41:22.213499  / # . /lava-10916592/environment/lava-10916=
592/bin/lava-test-runner /lava-10916592/1

    2023-06-27T03:41:22.214499  =


    2023-06-27T03:41:22.219887  / # /lava-10916592/bin/lava-test-runner /la=
va-10916592/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5a900a16d208223061e5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5a900a16d208223061ee
        failing since 90 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-27T03:41:48.298823  + set<8>[   10.878207] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10916623_1.4.2.3.1>

    2023-06-27T03:41:48.299353   +x

    2023-06-27T03:41:48.406886  / # #

    2023-06-27T03:41:48.509335  export SHELL=3D/bin/sh

    2023-06-27T03:41:48.510175  #

    2023-06-27T03:41:48.611722  / # export SHELL=3D/bin/sh. /lava-10916623/=
environment

    2023-06-27T03:41:48.612547  =


    2023-06-27T03:41:48.714220  / # . /lava-10916623/environment/lava-10916=
623/bin/lava-test-runner /lava-10916623/1

    2023-06-27T03:41:48.715488  =


    2023-06-27T03:41:48.721340  / # /lava-10916623/bin/lava-test-runner /la=
va-10916623/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5beddfe4ed8bb730621d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5beddfe4ed8bb7306226
        failing since 148 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-27T03:47:33.963206  + set +x
    2023-06-27T03:47:33.963371  [   14.402535] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988692_1.5.2.3.1>
    2023-06-27T03:47:34.071028  / # #
    2023-06-27T03:47:34.172560  export SHELL=3D/bin/sh
    2023-06-27T03:47:34.172927  #
    2023-06-27T03:47:34.274104  / # export SHELL=3D/bin/sh. /lava-988692/en=
vironment
    2023-06-27T03:47:34.274506  =

    2023-06-27T03:47:34.375712  / # . /lava-988692/environment/lava-988692/=
bin/lava-test-runner /lava-988692/1
    2023-06-27T03:47:34.376199  =

    2023-06-27T03:47:34.379404  / # /lava-988692/bin/lava-test-runner /lava=
-988692/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5d41431b49be263061a2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5d41431b49be263061ab
        failing since 148 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-27T03:53:12.315094  + set +x
    2023-06-27T03:53:12.315321  [   12.904317] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988704_1.5.2.3.1>
    2023-06-27T03:53:12.423175  / # #
    2023-06-27T03:53:12.525480  export SHELL=3D/bin/sh
    2023-06-27T03:53:12.525977  #
    2023-06-27T03:53:12.627213  / # export SHELL=3D/bin/sh. /lava-988704/en=
vironment
    2023-06-27T03:53:12.627626  =

    2023-06-27T03:53:12.728978  / # . /lava-988704/environment/lava-988704/=
bin/lava-test-runner /lava-988704/1
    2023-06-27T03:53:12.729581  =

    2023-06-27T03:53:12.732692  / # /lava-988704/bin/lava-test-runner /lava=
-988704/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5d91898b524de730613a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5d91898b524de7306143
        failing since 148 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-27T03:54:31.705745  + set +x
    2023-06-27T03:54:31.705933  [   12.257483] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988710_1.5.2.3.1>
    2023-06-27T03:54:31.813186  / # #
    2023-06-27T03:54:31.915086  export SHELL=3D/bin/sh
    2023-06-27T03:54:31.915556  #
    2023-06-27T03:54:32.016793  / # export SHELL=3D/bin/sh. /lava-988710/en=
vironment
    2023-06-27T03:54:32.017330  =

    2023-06-27T03:54:32.118729  / # . /lava-988710/environment/lava-988710/=
bin/lava-test-runner /lava-988710/1
    2023-06-27T03:54:32.119393  =

    2023-06-27T03:54:32.122423  / # /lava-988710/bin/lava-test-runner /lava=
-988710/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5a7c0a16d20822306153

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5a7c0a16d2082230615c
        failing since 90 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-27T03:41:39.104092  + <8>[   11.527952] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10916614_1.4.2.3.1>

    2023-06-27T03:41:39.104259  set +x

    2023-06-27T03:41:39.209258  / # #

    2023-06-27T03:41:39.310924  export SHELL=3D/bin/sh

    2023-06-27T03:41:39.311544  #

    2023-06-27T03:41:39.412629  / # export SHELL=3D/bin/sh. /lava-10916614/=
environment

    2023-06-27T03:41:39.412834  =


    2023-06-27T03:41:39.513390  / # . /lava-10916614/environment/lava-10916=
614/bin/lava-test-runner /lava-10916614/1

    2023-06-27T03:41:39.513660  =


    2023-06-27T03:41:39.518125  / # /lava-10916614/bin/lava-test-runner /la=
va-10916614/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/649a608695171e9cdb30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649a608695171e9cdb306=
12f
        failing since 49 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/649a60a7ba41cd313c306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649a60a7ba41cd313c306=
135
        failing since 49 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5cd43494c754ab3061e5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5cd43494c754ab3061ed
        failing since 146 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-06-27T03:51:23.671854  [   28.631047] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3693621_1.5.2.4.1>
    2023-06-27T03:51:23.776292  =

    2023-06-27T03:51:23.877842  / # #export SHELL=3D/bin/sh
    2023-06-27T03:51:23.878621  =

    2023-06-27T03:51:23.980545  / # export SHELL=3D/bin/sh. /lava-3693621/e=
nvironment
    2023-06-27T03:51:23.981114  =

    2023-06-27T03:51:24.082711  / # . /lava-3693621/environment/lava-369362=
1/bin/lava-test-runner /lava-3693621/1
    2023-06-27T03:51:24.083572  =

    2023-06-27T03:51:24.087120  / # /lava-3693621/bin/lava-test-runner /lav=
a-3693621/1
    2023-06-27T03:51:24.123348  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5d3695af8bdc2130612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649a5d3695af8bdc21306137
        failing since 146 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-27T03:53:05.366874  [   28.768369] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3693675_1.5.2.4.1>
    2023-06-27T03:53:05.471084  =

    2023-06-27T03:53:05.572628  / # #export SHELL=3D/bin/sh
    2023-06-27T03:53:05.573077  =

    2023-06-27T03:53:05.674474  / # export SHELL=3D/bin/sh. /lava-3693675/e=
nvironment
    2023-06-27T03:53:05.675287  =

    2023-06-27T03:53:05.777162  / # . /lava-3693675/environment/lava-369367=
5/bin/lava-test-runner /lava-3693675/1
    2023-06-27T03:53:05.777891  =

    2023-06-27T03:53:05.781310  / # /lava-3693675/bin/lava-test-runner /lav=
a-3693675/1
    2023-06-27T03:53:05.817142  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649a5dfa8084f1577c306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora=
/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora=
/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649a5dfa8084f1577c306=
144
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649a606919c650bb70306132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-1651-g=
f52dd2890422/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649a606919c650bb70306=
133
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =20
