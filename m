Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0896FB568
	for <lists+linux-next@lfdr.de>; Mon,  8 May 2023 18:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbjEHQmt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 May 2023 12:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbjEHQmq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 May 2023 12:42:46 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E522729
        for <linux-next@vger.kernel.org>; Mon,  8 May 2023 09:42:39 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-517c01edaaaso3051556a12.3
        for <linux-next@vger.kernel.org>; Mon, 08 May 2023 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683564158; x=1686156158;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ejwkPo5z37pYecfql/Z/RgiohLmmPgyF9AoVnUVDzfE=;
        b=TL9rjcn9oDJnPTz0sODkSw99HKan98TiFfj16u5NjwNdaE/ASO2mmsl0Tjm4wtq/jM
         ZjcFNrSfrnR6M8ifBSS8Yk1eESw3OTYZ14F0jTv23bfWaDPUQ/TVMbGtJQPHmcrFVnNM
         QfGBxHeBhQ8CJtHxIYmU9S+Nk8+M8sI2Jz6CuHQbxMJrnzg2+xdGLB0eQQcsYmLFL0sC
         TgvcbDyxQCCAtdd1RWNoJGyWQB822LXX/O1TVnxA/J2RscayoW6tPLLD+llXwly92XMH
         yjAiS9I1q4pBoFV7lbsPUBGHdVCanIs44KdqCNm3Dwh0rT4s3tT9Rm203RuFUR9X+2g/
         XEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683564158; x=1686156158;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejwkPo5z37pYecfql/Z/RgiohLmmPgyF9AoVnUVDzfE=;
        b=RBM+5ntwHvHEQqJbFT72B9NuBVxZ85qZ8j26eeEVax8myh0bTKZ0QQthBGCztXsUbK
         E8YlsGNfbse1NxEM+byufAjWQbe37TW4rhry1D4n1tR3rcSfY7LjQ5K5HhVm3lTZ7JP4
         lATKEfwpBWV6mlKUB3g32HfpmP3xTJvQ5OlPB/8FQptfc4jBw+qaUAmqrLCkZefSQ83M
         Bn86vElfn6pUuwQHBloPSuj9HsB0ZWps0qAOp+Zd7RlO07jC+KY8z3SKYGbfZLpt41A8
         /kvhn/iiNJZMxgk1PNyksvSEO0p6MRAST1Nw/GheT829whJpVegXdLp4jZGCmuZQ6XFB
         fMpw==
X-Gm-Message-State: AC+VfDwUmwBQI01BCFsIj/uat0dpD2gVazrb+zk5uDWUPACOU6nMcWa9
        wBrgzBUaFJvWVjYB50Sz95g1xx9wpZ7agM0hjUPjpQ==
X-Google-Smtp-Source: ACHHUZ44f7MrBS95hB/kDD0lScxQzZ1HY/tbObBLX7wEzeZjOzgJ8aUZlyKgVF8FZSnXypLZF7sJEg==
X-Received: by 2002:a05:6a20:12cd:b0:f2:31d7:f3c5 with SMTP id v13-20020a056a2012cd00b000f231d7f3c5mr14784822pzg.12.1683564156739;
        Mon, 08 May 2023 09:42:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u5-20020a62ed05000000b006437c0edf9csm218179pfh.16.2023.05.08.09.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 09:42:36 -0700 (PDT)
Message-ID: <6459267c.620a0220.783f5.10fa@mx.google.com>
Date:   Mon, 08 May 2023 09:42:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.4-rc1-91-g2f19ff6b99223
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 496 runs,
 46 regressions (v6.4-rc1-91-g2f19ff6b99223)
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

next/pending-fixes baseline: 496 runs, 46 regressions (v6.4-rc1-91-g2f19ff6=
b99223)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc1-91-g2f19ff6b99223/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc1-91-g2f19ff6b99223
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2f19ff6b9922383447d43420bf4e9efce76f39ee =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee3135cde86e342e8636

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee3135cde86e342e863b
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:42:15.988805  + set +x

    2023-05-08T12:42:15.995258  <8>[   11.252335] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238344_1.4.2.3.1>

    2023-05-08T12:42:16.102259  =


    2023-05-08T12:42:16.202981  / # #export SHELL=3D/bin/sh

    2023-05-08T12:42:16.203374  =


    2023-05-08T12:42:16.304318  / # export SHELL=3D/bin/sh. /lava-10238344/=
environment

    2023-05-08T12:42:16.305071  =


    2023-05-08T12:42:16.406717  / # . /lava-10238344/environment/lava-10238=
344/bin/lava-test-runner /lava-10238344/1

    2023-05-08T12:42:16.406999  =


    2023-05-08T12:42:16.412897  / # /lava-10238344/bin/lava-test-runner /la=
va-10238344/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458eead53fa11ec692e861c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458eead53fa11ec692e8621
        failing since 40 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:44:11.235949  <8>[   10.742764] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238436_1.4.2.3.1>

    2023-05-08T12:44:11.239222  + set +x

    2023-05-08T12:44:11.343911  / # #

    2023-05-08T12:44:11.444624  export SHELL=3D/bin/sh

    2023-05-08T12:44:11.444810  #

    2023-05-08T12:44:11.545297  / # export SHELL=3D/bin/sh. /lava-10238436/=
environment

    2023-05-08T12:44:11.545533  =


    2023-05-08T12:44:11.646078  / # . /lava-10238436/environment/lava-10238=
436/bin/lava-test-runner /lava-10238436/1

    2023-05-08T12:44:11.646385  =


    2023-05-08T12:44:11.651950  / # /lava-10238436/bin/lava-test-runner /la=
va-10238436/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee32906824070a2e860e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee32906824070a2e8613
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:42:08.499526  + set +x<8>[    8.937114] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10238292_1.4.2.3.1>

    2023-05-08T12:42:08.500103  =


    2023-05-08T12:42:08.609527  / # #

    2023-05-08T12:42:08.712379  export SHELL=3D/bin/sh

    2023-05-08T12:42:08.713340  #

    2023-05-08T12:42:08.814971  / # export SHELL=3D/bin/sh. /lava-10238292/=
environment

    2023-05-08T12:42:08.815883  =


    2023-05-08T12:42:08.917775  / # . /lava-10238292/environment/lava-10238=
292/bin/lava-test-runner /lava-10238292/1

    2023-05-08T12:42:08.919170  =


    2023-05-08T12:42:08.923930  / # /lava-10238292/bin/lava-test-runner /la=
va-10238292/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458eea553fa11ec692e85fe

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458eea553fa11ec692e8603
        failing since 40 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:44:13.026322  + set +x<8>[   11.653892] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10238418_1.4.2.3.1>

    2023-05-08T12:44:13.026909  =


    2023-05-08T12:44:13.135260  / # #

    2023-05-08T12:44:13.237922  export SHELL=3D/bin/sh

    2023-05-08T12:44:13.238731  #

    2023-05-08T12:44:13.340355  / # export SHELL=3D/bin/sh. /lava-10238418/=
environment

    2023-05-08T12:44:13.341158  =


    2023-05-08T12:44:13.443157  / # . /lava-10238418/environment/lava-10238=
418/bin/lava-test-runner /lava-10238418/1

    2023-05-08T12:44:13.444417  =


    2023-05-08T12:44:13.449473  / # /lava-10238418/bin/lava-test-runner /la=
va-10238418/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee336c6f7e0c962e85f2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee336c6f7e0c962e85f7
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:42:12.281073  <8>[   11.550662] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238337_1.4.2.3.1>

    2023-05-08T12:42:12.284920  + set +x

    2023-05-08T12:42:12.390309  =


    2023-05-08T12:42:12.491997  / # #export SHELL=3D/bin/sh

    2023-05-08T12:42:12.492784  =


    2023-05-08T12:42:12.594251  / # export SHELL=3D/bin/sh. /lava-10238337/=
environment

    2023-05-08T12:42:12.594912  =


    2023-05-08T12:42:12.696231  / # . /lava-10238337/environment/lava-10238=
337/bin/lava-test-runner /lava-10238337/1

    2023-05-08T12:42:12.697255  =


    2023-05-08T12:42:12.702029  / # /lava-10238337/bin/lava-test-runner /la=
va-10238337/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458eead4dd58ee8e22e8644

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458eead4dd58ee8e22e8649
        failing since 40 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:44:20.794357  <8>[   10.853963] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238525_1.4.2.3.1>

    2023-05-08T12:44:20.797805  + set +x

    2023-05-08T12:44:20.899304  =


    2023-05-08T12:44:20.999952  / # #export SHELL=3D/bin/sh

    2023-05-08T12:44:21.000148  =


    2023-05-08T12:44:21.100698  / # export SHELL=3D/bin/sh. /lava-10238525/=
environment

    2023-05-08T12:44:21.100853  =


    2023-05-08T12:44:21.201386  / # . /lava-10238525/environment/lava-10238=
525/bin/lava-test-runner /lava-10238525/1

    2023-05-08T12:44:21.201688  =


    2023-05-08T12:44:21.206533  / # /lava-10238525/bin/lava-test-runner /la=
va-10238525/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e936347d48733a2e85fe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458e936347d48733a2e8603
        failing since 116 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-05-08T12:20:46.611650  / # #

    2023-05-08T12:20:46.713774  export SHELL=3D/bin/sh

    2023-05-08T12:20:46.714486  #

    2023-05-08T12:20:46.815903  / # export SHELL=3D/bin/sh. /lava-10238078/=
environment

    2023-05-08T12:20:46.816620  =


    2023-05-08T12:20:46.918070  / # . /lava-10238078/environment/lava-10238=
078/bin/lava-test-runner /lava-10238078/1

    2023-05-08T12:20:46.919162  =


    2023-05-08T12:20:46.935615  / # /lava-10238078/bin/lava-test-runner /la=
va-10238078/1

    2023-05-08T12:20:47.043788  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-08T12:20:47.044308  + cd /lava-10238078/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ef11b28c41a4d02e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458ef11b28c41a4d02e8=
62c
        failing since 70 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee2f51d74f2e332e861b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee2f51d74f2e332e8620
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:42:02.241640  + set +x

    2023-05-08T12:42:02.248417  <8>[   13.208337] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238331_1.4.2.3.1>

    2023-05-08T12:42:02.352868  / # #

    2023-05-08T12:42:02.453550  export SHELL=3D/bin/sh

    2023-05-08T12:42:02.453747  #

    2023-05-08T12:42:02.554286  / # export SHELL=3D/bin/sh. /lava-10238331/=
environment

    2023-05-08T12:42:02.554523  =


    2023-05-08T12:42:02.655065  / # . /lava-10238331/environment/lava-10238=
331/bin/lava-test-runner /lava-10238331/1

    2023-05-08T12:42:02.655375  =


    2023-05-08T12:42:02.659850  / # /lava-10238331/bin/lava-test-runner /la=
va-10238331/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458eeab53fa11ec692e860b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458eeab53fa11ec692e8610
        failing since 40 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:44:01.118908  + set +x

    2023-05-08T12:44:01.125791  <8>[   14.518081] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238399_1.4.2.3.1>

    2023-05-08T12:44:01.229545  / # #

    2023-05-08T12:44:01.330174  export SHELL=3D/bin/sh

    2023-05-08T12:44:01.330394  #

    2023-05-08T12:44:01.430903  / # export SHELL=3D/bin/sh. /lava-10238399/=
environment

    2023-05-08T12:44:01.431121  =


    2023-05-08T12:44:01.531624  / # . /lava-10238399/environment/lava-10238=
399/bin/lava-test-runner /lava-10238399/1

    2023-05-08T12:44:01.531966  =


    2023-05-08T12:44:01.536122  / # /lava-10238399/bin/lava-test-runner /la=
va-10238399/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee15f8f0c0de242e8709

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee15f8f0c0de242e870e
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:41:45.763383  <8>[   10.612713] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238287_1.4.2.3.1>

    2023-05-08T12:41:45.766631  + set +x

    2023-05-08T12:41:45.869495  /#

    2023-05-08T12:41:45.970330   # #export SHELL=3D/bin/sh

    2023-05-08T12:41:45.970537  =


    2023-05-08T12:41:46.071081  / # export SHELL=3D/bin/sh. /lava-10238287/=
environment

    2023-05-08T12:41:46.071276  =


    2023-05-08T12:41:46.171891  / # . /lava-10238287/environment/lava-10238=
287/bin/lava-test-runner /lava-10238287/1

    2023-05-08T12:41:46.172166  =


    2023-05-08T12:41:46.177086  / # /lava-10238287/bin/lava-test-runner /la=
va-10238287/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee8d03fb69b4312e8654

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee8d03fb69b4312e8659
        failing since 40 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:43:46.292361  + set +x

    2023-05-08T12:43:46.298858  <8>[   10.416739] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238530_1.4.2.3.1>

    2023-05-08T12:43:46.400734  =


    2023-05-08T12:43:46.501336  / # #export SHELL=3D/bin/sh

    2023-05-08T12:43:46.501549  =


    2023-05-08T12:43:46.602115  / # export SHELL=3D/bin/sh. /lava-10238530/=
environment

    2023-05-08T12:43:46.602328  =


    2023-05-08T12:43:46.702845  / # . /lava-10238530/environment/lava-10238=
530/bin/lava-test-runner /lava-10238530/1

    2023-05-08T12:43:46.703166  =


    2023-05-08T12:43:46.708233  / # /lava-10238530/bin/lava-test-runner /la=
va-10238530/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee3435cde86e342e865e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee3435cde86e342e8663
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:42:11.284402  + <8>[   11.467172] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10238313_1.4.2.3.1>

    2023-05-08T12:42:11.284493  set +x

    2023-05-08T12:42:11.388596  / # #

    2023-05-08T12:42:11.489248  export SHELL=3D/bin/sh

    2023-05-08T12:42:11.489486  #

    2023-05-08T12:42:11.590076  / # export SHELL=3D/bin/sh. /lava-10238313/=
environment

    2023-05-08T12:42:11.590295  =


    2023-05-08T12:42:11.690844  / # . /lava-10238313/environment/lava-10238=
313/bin/lava-test-runner /lava-10238313/1

    2023-05-08T12:42:11.691183  =


    2023-05-08T12:42:11.695265  / # /lava-10238313/bin/lava-test-runner /la=
va-10238313/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458eeb76f8773e2742e8608

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458eeb86f8773e2742e860d
        failing since 40 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:44:21.309149  + <8>[   11.395590] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10238504_1.4.2.3.1>

    2023-05-08T12:44:21.309625  set +x

    2023-05-08T12:44:21.417149  / # #

    2023-05-08T12:44:21.519153  export SHELL=3D/bin/sh

    2023-05-08T12:44:21.520025  #

    2023-05-08T12:44:21.621598  / # export SHELL=3D/bin/sh. /lava-10238504/=
environment

    2023-05-08T12:44:21.622411  =


    2023-05-08T12:44:21.723831  / # . /lava-10238504/environment/lava-10238=
504/bin/lava-test-runner /lava-10238504/1

    2023-05-08T12:44:21.724843  =


    2023-05-08T12:44:21.729247  / # /lava-10238504/bin/lava-test-runner /la=
va-10238504/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6458eddde25d0968082e8617

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458eddde25d0968082e861c
        failing since 98 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-08T12:40:36.200958  + set +x
    2023-05-08T12:40:36.201116  [   13.119185] <LAVA_SIGNAL_ENDRUN 0_dmesg =
943453_1.5.2.3.1>
    2023-05-08T12:40:36.308945  / # #
    2023-05-08T12:40:36.410632  export SHELL=3D/bin/sh
    2023-05-08T12:40:36.411162  #
    2023-05-08T12:40:36.512418  / # export SHELL=3D/bin/sh. /lava-943453/en=
vironment
    2023-05-08T12:40:36.512932  =

    2023-05-08T12:40:36.614302  / # . /lava-943453/environment/lava-943453/=
bin/lava-test-runner /lava-943453/1
    2023-05-08T12:40:36.614979  =

    2023-05-08T12:40:36.618237  / # /lava-943453/bin/lava-test-runner /lava=
-943453/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee2c906824070a2e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee2c906824070a2e85f8
        failing since 98 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-08T12:42:05.799674  + set +x
    2023-05-08T12:42:05.799854  [   12.866931] <LAVA_SIGNAL_ENDRUN 0_dmesg =
943458_1.5.2.3.1>
    2023-05-08T12:42:05.907695  / # #
    2023-05-08T12:42:06.009545  export SHELL=3D/bin/sh
    2023-05-08T12:42:06.010047  #
    2023-05-08T12:42:06.111323  / # export SHELL=3D/bin/sh. /lava-943458/en=
vironment
    2023-05-08T12:42:06.111841  =

    2023-05-08T12:42:06.213218  / # . /lava-943458/environment/lava-943458/=
bin/lava-test-runner /lava-943458/1
    2023-05-08T12:42:06.213984  =

    2023-05-08T12:42:06.216910  / # /lava-943458/bin/lava-test-runner /lava=
-943458/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f04759d78b71a52e861a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f04759d78b71a52e861f
        failing since 98 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-08T12:50:56.812814  + set +x
    2023-05-08T12:50:56.812976  [   14.359695] <LAVA_SIGNAL_ENDRUN 0_dmesg =
943478_1.5.2.3.1>
    2023-05-08T12:50:56.920436  / # #
    2023-05-08T12:50:57.022253  export SHELL=3D/bin/sh
    2023-05-08T12:50:57.022759  #
    2023-05-08T12:50:57.124084  / # export SHELL=3D/bin/sh. /lava-943478/en=
vironment
    2023-05-08T12:50:57.124567  =

    2023-05-08T12:50:57.225836  / # . /lava-943478/environment/lava-943478/=
bin/lava-test-runner /lava-943478/1
    2023-05-08T12:50:57.226511  =

    2023-05-08T12:50:57.229664  / # /lava-943478/bin/lava-test-runner /lava=
-943478/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f098d81789cdcb2e85fb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f098d81789cdcb2e8600
        failing since 98 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-08T12:52:18.287330  + set +x
    2023-05-08T12:52:18.287479  [   13.197611] <LAVA_SIGNAL_ENDRUN 0_dmesg =
943486_1.5.2.3.1>
    2023-05-08T12:52:18.395109  / # #
    2023-05-08T12:52:18.496550  export SHELL=3D/bin/sh
    2023-05-08T12:52:18.496945  #
    2023-05-08T12:52:18.598160  / # export SHELL=3D/bin/sh. /lava-943486/en=
vironment
    2023-05-08T12:52:18.598603  =

    2023-05-08T12:52:18.699999  / # . /lava-943486/environment/lava-943486/=
bin/lava-test-runner /lava-943486/1
    2023-05-08T12:52:18.700549  =

    2023-05-08T12:52:18.704028  / # /lava-943486/bin/lava-test-runner /lava=
-943486/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f1eb54337ae5402e85f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f1eb54337ae5402e85fc
        failing since 98 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-08T12:57:54.365492  + set +x
    2023-05-08T12:57:54.365683  [   12.152211] <LAVA_SIGNAL_ENDRUN 0_dmesg =
943503_1.5.2.3.1>
    2023-05-08T12:57:54.472812  / # #
    2023-05-08T12:57:54.574464  export SHELL=3D/bin/sh
    2023-05-08T12:57:54.575016  #
    2023-05-08T12:57:54.676309  / # export SHELL=3D/bin/sh. /lava-943503/en=
vironment
    2023-05-08T12:57:54.676909  =

    2023-05-08T12:57:54.778316  / # . /lava-943503/environment/lava-943503/=
bin/lava-test-runner /lava-943503/1
    2023-05-08T12:57:54.778870  =

    2023-05-08T12:57:54.782200  / # /lava-943503/bin/lava-test-runner /lava=
-943503/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f08b1a2585aa912e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f08b1a2585aa912e85f7
        failing since 123 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-05-08T12:51:50.353023  / # #
    2023-05-08T12:51:51.513792  export SHELL=3D/bin/sh
    2023-05-08T12:51:51.519516  #
    2023-05-08T12:51:53.067639  / # export SHELL=3D/bin/sh. /lava-1215907/e=
nvironment
    2023-05-08T12:51:53.073588  =

    2023-05-08T12:51:55.896905  / # . /lava-1215907/environment/lava-121590=
7/bin/lava-test-runner /lava-1215907/1
    2023-05-08T12:51:55.903019  =

    2023-05-08T12:51:55.908027  / # /lava-1215907/bin/lava-test-runner /lav=
a-1215907/1
    2023-05-08T12:51:55.997111  + export 'TESTRUN_ID=3D1_bootrr'
    2023-05-08T12:51:55.997479  + cd /lava-1215907/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f0994473bf6f582e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f0994473bf6f582e85f7
        failing since 123 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-05-08T12:52:18.043859  + set +x
    2023-05-08T12:52:18.045002  <8>[   56.461689] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1215908_1.5.2.4.1>
    2023-05-08T12:52:18.153682  / # #
    2023-05-08T12:52:19.314020  export SHELL=3D/bin/sh
    2023-05-08T12:52:19.319727  #
    2023-05-08T12:52:19.320045  / # export SHELL=3D/bin/sh
    2023-05-08T12:52:20.867757  / # . /lava-1215908/environment
    2023-05-08T12:52:23.694914  /lava-1215908/bin/lava-test-runner /lava-12=
15908/1
    2023-05-08T12:52:23.701151  . /lava-1215908/environment
    2023-05-08T12:52:23.701531  / # /lava-1215908/bin/lava-test-runner /lav=
a-1215908/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee1aa0fb2d93d72e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee1aa0fb2d93d72e85ed
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:41:49.513547  <8>[   12.227422] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238327_1.4.2.3.1>

    2023-05-08T12:41:49.618024  / # #

    2023-05-08T12:41:49.718638  export SHELL=3D/bin/sh

    2023-05-08T12:41:49.718785  #

    2023-05-08T12:41:49.819233  / # export SHELL=3D/bin/sh. /lava-10238327/=
environment

    2023-05-08T12:41:49.819376  =


    2023-05-08T12:41:49.919856  / # . /lava-10238327/environment/lava-10238=
327/bin/lava-test-runner /lava-10238327/1

    2023-05-08T12:41:49.920090  =


    2023-05-08T12:41:49.924333  / # /lava-10238327/bin/lava-test-runner /la=
va-10238327/1

    2023-05-08T12:41:49.930608  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee9b4dd58ee8e22e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458ee9b4dd58ee8e22e85f0
        failing since 40 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-08T12:43:58.301060  + set +x<8>[   11.708565] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10238508_1.4.2.3.1>

    2023-05-08T12:43:58.301172  =


    2023-05-08T12:43:58.405782  / # #

    2023-05-08T12:43:58.506507  export SHELL=3D/bin/sh

    2023-05-08T12:43:58.506707  #

    2023-05-08T12:43:58.607198  / # export SHELL=3D/bin/sh. /lava-10238508/=
environment

    2023-05-08T12:43:58.607450  =


    2023-05-08T12:43:58.708045  / # . /lava-10238508/environment/lava-10238=
508/bin/lava-test-runner /lava-10238508/1

    2023-05-08T12:43:58.708431  =


    2023-05-08T12:43:58.712769  / # /lava-10238508/bin/lava-test-runner /la=
va-10238508/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6458efc095f9350fac2e8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458efc095f9350fac2e8=
645
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6458efbe327cc838782e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458efbe327cc838782e8=
5e7
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6458eaf9e0b88b67832e8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458eaf9e0b88b67832e8=
649
        new failure (last pass: v6.3-13708-gfd7527bf42e6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6458eae9e0b88b67832e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458eae9e0b88b67832e8=
5f2
        failing since 9 days (last pass: v6.3-8745-gc94d3163e00b, first fai=
l: v6.3-10703-gb3f869e79cdf) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ee2051d74f2e332e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458ee2051d74f2e332e8=
5f4
        failing since 144 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ed1c322d9f80622e861c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458ed1c322d9f80622e8=
61d
        failing since 144 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6458eee6ac3bbb90912e8662

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458eee6ac3bbb9=
0912e86b9
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)
        2 lines

    2023-05-08T12:44:50.465493  at virtual address 0000000000000008

    2023-05-08T12:44:50.467966  kern  :alert : Mem abort info:

    2023-05-08T12:44:50.472411  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-08T12:44:50.478237  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-08T12:44:50.481739  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-08T12:44:50.485422  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-08T12:44:50.491049  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-08T12:44:50.493153  kern  :alert : Data abort info:

    2023-05-08T12:44:50.498058  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-08T12:44:50.507803  kern  :<8>[   18.027886] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458eee6ac3bbb9=
0912e86ba
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)
        12 lines

    2023-05-08T12:44:50.461326  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   17.986569] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6458ed6d86a40a30b72e866d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458ed6d86a40a3=
0b72e8674
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f)
        2 lines

    2023-05-08T12:38:49.608114  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-08T12:38:49.609374  kern  :emerg : Code: 97feb510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-08T12:38:49.617182  <8>[   21.613329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458ed6d86a40a3=
0b72e8675
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f)
        12 lines

    2023-05-08T12:38:49.586202  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-08T12:38:49.588003  kern  :alert : Mem abort info:
    2023-05-08T12:38:49.588360  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-08T12:38:49.590073  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-08T12:38:49.591846  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-08T12:38:49.592202  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-08T12:38:49.593605  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-08T12:38:49.595359  kern  :alert : Data abort info:
    2023-05-08T12:38:49.595726  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-08T12:38:49.597123  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/6458edd09bc15afd1e2e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458edd09bc15af=
d1e2e85ed
        failing since 9 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-08T12:40:34.647923  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-08T12:40:34.649291  kern  :emerg : Code: 97ff1d10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-08T12:40:34.660080  <8>[   21.644689] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-08T12:40:34.660451  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458edd09bc15af=
d1e2e85ee
        failing since 9 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-08T12:40:34.621093  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-08T12:40:34.622363  kern  :alert : Mem abort info:
    2023-05-08T12:40:34.622732  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-08T12:40:34.623593  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-08T12:40:34.625427  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-08T12:40:34.625790  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-08T12:40:34.627158  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-08T12:40:34.628772  kern  :alert : Data abort info:
    2023-05-08T12:40:34.629124  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-08T12:40:34.630349  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6458eee9408b6fb1b12e8622

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-=
roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-=
roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458eee9408b6fb=
1b12e8629
        failing since 11 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-08T12:45:11.273686  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-08T12:45:11.274027  kern  :emerg : Code: 97fe6910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-08T12:45:11.286681  <8>[   21.498724] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-08T12:45:11.287036  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458eee9408b6fb=
1b12e862a
        failing since 11 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-08T12:45:11.244672  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-08T12:45:11.246043  kern  :alert : Mem abort info:
    2023-05-08T12:45:11.246309  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-08T12:45:11.247414  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-08T12:45:11.248956  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-08T12:45:11.249222  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-08T12:45:11.250331  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-08T12:45:11.251689  kern  :alert : Data abort info:
    2023-05-08T12:45:11.251946  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-08T12:45:11.253045  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6458ed81620022a8f82e86a6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458ed81620022a=
8f82e86ad
        new failure (last pass: v6.3-1432-g527c4dda86b8)
        2 lines

    2023-05-08T12:39:09.738290  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-08T12:39:09.738864  kern  :emerg : Code: 97fd0910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-08T12:39:09.739242  <8>[   21.703706] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-08T12:39:09.739596  + set +x

    2023-05-08T12:39:09.739931  <8>[   21.706542] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238230_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458ed81620022a=
8f82e86ae
        new failure (last pass: v6.3-1432-g527c4dda86b8)
        12 lines

    2023-05-08T12:39:09.707500  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-08T12:39:09.708073  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-08T12:39:09.708447  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078e17000

    2023-05-08T12:39:09.708798  kern  :alert : [0000000000000008] pgd=3D080=
0000078d0c003, p4d=3D0800000078d0c003, pud=3D0800000078e1b003, pmd=3D000000=
0000000000

    2023-05-08T12:39:09.709134  <8>[   21.674999] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/6458ee00228e828f842e8608

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458ee00228e828=
f842e860f
        failing since 9 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first =
fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-08T12:41:16.723990  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-08T12:41:16.724523  kern  :emerg : Code: 97f20d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-08T12:41:16.724873  <8>[   21.220141] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-08T12:41:16.725196  + set +x

    2023-05-08T12:41:16.725538  <8>[   21.222418] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238251_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458ee00228e828=
f842e8610
        failing since 9 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first =
fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-08T12:41:16.698792  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-08T12:41:16.699326  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-08T12:41:16.699667  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007927a000

    2023-05-08T12:41:16.699985  kern  :alert : [0000000000000008] pgd=3D080=
00000793de003, p4d=3D08000000793de003, pud=3D08000000793df003, pmd=3D000000=
0000000000

    2023-05-08T12:41:16.700297  <8>[   21.196631] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6458ee6fbad8bc8bb72e8628

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458ee6fbad8bc8=
bb72e862f
        failing since 11 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-08T12:43:07.882722  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-08T12:43:07.883248  kern  :emerg : Code: 97f9d510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-08T12:43:07.883592  <8>[   21.779247] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-08T12:43:07.883913  + set +x

    2023-05-08T12:43:07.884221  <8>[   21.781356] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238353_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458ee6fbad8bc8=
bb72e8630
        failing since 11 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-08T12:43:07.834830  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-08T12:43:07.835361  kern  :alert : Mem abort info:

    2023-05-08T12:43:07.835702  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-08T12:43:07.836015  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-08T12:43:07.836319  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-08T12:43:07.836615  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-08T12:43:07.836906  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-08T12:43:07.837194  kern  :alert : Data abort info:

    2023-05-08T12:43:07.837509  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-08T12:43:07.837797  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6458fa310b806910802e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458fa310b806910802e8=
5e9
        failing since 2 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.3-13708-gfd7527bf42e6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f1e6215fec5e5b2e8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h5-=
libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h5-=
libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f1e6215fec5e5b2e8=
649
        new failure (last pass: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f000c3042c32c42e8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-91=
-g2f19ff6b99223/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f000c3042c32c42e8=
649
        failing since 10 days (last pass: v6.3-5614-gbe56a31d3d65, first fa=
il: v6.3-8745-gc94d3163e00b) =

 =20
