Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402C27D29BC
	for <lists+linux-next@lfdr.de>; Mon, 23 Oct 2023 07:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjJWFrL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Oct 2023 01:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjJWFrK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Oct 2023 01:47:10 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A460B3
        for <linux-next@vger.kernel.org>; Sun, 22 Oct 2023 22:47:08 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-57e40f0189aso1607416eaf.1
        for <linux-next@vger.kernel.org>; Sun, 22 Oct 2023 22:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698040027; x=1698644827; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=59uL1EcWd+vUjzpAsEGn0eMqOG7aNLofcLZBpblFjv4=;
        b=MYgRK5W+8c3jwRSkK5qkdhRjKKt9O3xOpAYTxTjozM8RU84nr4udmXY7Mqpop7el53
         Yhh4xMt2+C+pqFdKLBWZq0U1MgZfXKNwsK8fdcAR+187vmxaRAWa5pbkIlNDzN/ztfHd
         G+bJWbKdTTDztq7072Vv9IhtagNRR2popWbKBByDiofY/KBArC6bl3k6b8UTvz/BBgcE
         AZHqopeX4NPS5NBBbjz62diQSbXnvHZ+sxQRRhZ8eVzsozhyWyUblTgEABqH0D1tGtFP
         QpFjrKN9hIvcjUchQ5eOPCxBrKTqQcos/lC/RAa6jrSTSaAuechNcN/5Pxq9Y7kjKaVo
         qY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698040027; x=1698644827;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59uL1EcWd+vUjzpAsEGn0eMqOG7aNLofcLZBpblFjv4=;
        b=loGkaVh2ut1gktOfyMEGSvB8y1dOTkLY5OhZtNdys1DbPUVVDMd6Jr9805IaCq+2O6
         I57MeM4Mo3KQLQGU4dR8P9/ev381yiTDSTBIzj6FlAp1gWe/dwzYzjEsHMBAfp9UpvaM
         TfUtPWlZWsRHLOWu1wPdCqOM50z5IaQlJLM1beQ4tCyvfyDxfJ485gkiMnJR+xVKsQpV
         zdpmKdRCkSX/htO1LTJipgpYBPmunBkarK7dZPdi2Vj8CMJZ07zvDTaRpbkrgoAJJTzS
         CZy/owjNHL5ZWDGks3duNYzv9NsboqkKHblF1m1owW0TDDd187loRSeibbIoL+sds1GK
         3f5A==
X-Gm-Message-State: AOJu0YyR4bDHMpxEEpkNuv8pZ22/uIQNPnrItSn0ma08N14aonoswuj+
        DeBqCloraTwH5oLB9dW5E7GNzKKBaVTlVmEifIV7KQ==
X-Google-Smtp-Source: AGHT+IFgeYhzLwzdy2q3c909Ux1/uAy0AgEf3O5ykMmODBD19OqqPSMQOdlhGTL9uEQQ0oCno+Iapg==
X-Received: by 2002:a05:6358:880d:b0:166:dc89:8c9a with SMTP id hv13-20020a056358880d00b00166dc898c9amr9990976rwb.22.1698040027247;
        Sun, 22 Oct 2023 22:47:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l63-20020a638842000000b005a9b20408a7sm5145934pgd.23.2023.10.22.22.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 22:47:06 -0700 (PDT)
Message-ID: <653608da.630a0220.5e09a.f3dd@mx.google.com>
Date:   Sun, 22 Oct 2023 22:47:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc6-484-g284bb784f987
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 77 runs,
 5 regressions (v6.6-rc6-484-g284bb784f987)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 77 runs, 5 regressions (v6.6-rc6-484-g284bb784=
f987)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mn-ddr4-evk    | arm64 | lab-baylibre  | gcc-10   | defconfig | 1      =
    =

imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

rk3399-roc-pc      | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc6-484-g284bb784f987/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc6-484-g284bb784f987
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      284bb784f98758e4416e5a52ceffbea845084abe =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mn-ddr4-evk    | arm64 | lab-baylibre  | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6535d7fd385f2c8881efcefe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6535d7fd385f2c8881efcf07
        failing since 24 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b)

    2023-10-23T02:18:06.379908  / # #
    2023-10-23T02:18:07.534149  export SHELL=3D/bin/sh
    2023-10-23T02:18:07.539615  #
    2023-10-23T02:18:09.079298  / # export SHELL=3D/bin/sh. /lava-3811458/e=
nvironment
    2023-10-23T02:18:09.084749  =

    2023-10-23T02:18:11.893675  / # . /lava-3811458/environment/lava-381145=
8/bin/lava-test-runner /lava-3811458/1
    2023-10-23T02:18:11.899618  =

    2023-10-23T02:18:11.899903  / # /lava-3811458/bin/lava-t<3>[   22.41537=
2] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistan=
ce
    2023-10-23T02:18:11.903218  est-runner /lava-3811458/1
    2023-10-23T02:18:11.973829  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6535d81f4ebc24c4aaefcf3e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6535d81f4ebc24c4aaefcf47
        failing since 48 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-23T02:18:55.955090  + set<8>[   29.617893] <LAVA_SIGNAL_ENDRUN =
0_dmesg 186896_1.5.2.4.1>
    2023-10-23T02:18:55.955257   +x
    2023-10-23T02:18:56.061128  / # #
    2023-10-23T02:18:57.224281  export SHELL=3D/bin/sh
    2023-10-23T02:18:57.230418  #
    2023-10-23T02:18:58.728642  / # export SHELL=3D/bin/sh. /lava-186896/en=
vironment
    2023-10-23T02:18:58.734734  =

    2023-10-23T02:19:01.458060  / # . /lava-186896/environment/lava-186896/=
bin/lava-test-runner /lava-186896/1
    2023-10-23T02:19:01.464831  =

    2023-10-23T02:19:01.478218  / # /lava-186896/bin/lava-test-runner /lava=
-186896/1 =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
rk3399-roc-pc      | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6535d7d5b91c3c3c18efcf11

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6535d7d5b91c3c3c18efcf1a
        failing since 10 days (last pass: v6.6-rc5-359-g960f4d0f660c7, firs=
t fail: v6.6-rc5-397-g1026f1ab9e072)

    2023-10-23T02:17:47.184121  <8>[   21.660161] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439896_1.5.2.4.1>
    2023-10-23T02:17:47.289514  / # #
    2023-10-23T02:17:47.391267  export SHELL=3D/bin/sh
    2023-10-23T02:17:47.391833  #
    2023-10-23T02:17:47.492832  / # export SHELL=3D/bin/sh. /lava-439896/en=
vironment
    2023-10-23T02:17:47.493369  =

    2023-10-23T02:17:47.594379  / # . /lava-439896/environment/lava-439896/=
bin/lava-test-runner /lava-439896/1
    2023-10-23T02:17:47.595217  =

    2023-10-23T02:17:47.601332  / # /lava-439896/bin/lava-test-runner /lava=
-439896/1
    2023-10-23T02:17:47.653209  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6535d7d63f02b04aecefcf48

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h=
64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6535d7d63f02b04aecefcf51
        failing since 12 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.6-rc5-300-g24760d837661b)

    2023-10-23T02:17:42.699389  <8>[   18.911949] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439897_1.5.2.4.1>
    2023-10-23T02:17:42.804508  / # #
    2023-10-23T02:17:42.906183  export SHELL=3D/bin/sh
    2023-10-23T02:17:42.906832  #
    2023-10-23T02:17:43.007835  / # export SHELL=3D/bin/sh. /lava-439897/en=
vironment
    2023-10-23T02:17:43.008416  =

    2023-10-23T02:17:43.109471  / # . /lava-439897/environment/lava-439897/=
bin/lava-test-runner /lava-439897/1
    2023-10-23T02:17:43.110333  =

    2023-10-23T02:17:43.114602  / # /lava-439897/bin/lava-test-runner /lava=
-439897/1
    2023-10-23T02:17:43.193609  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6535d7ec33ba9986baefcfde

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-48=
4-g284bb784f987/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6535d7ec33ba9986baefcfe7
        failing since 12 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.6-rc5-300-g24760d837661b)

    2023-10-23T02:22:26.067376  / # #

    2023-10-23T02:22:26.169642  export SHELL=3D/bin/sh

    2023-10-23T02:22:26.170390  #

    2023-10-23T02:22:26.271843  / # export SHELL=3D/bin/sh. /lava-11849807/=
environment

    2023-10-23T02:22:26.272588  =


    2023-10-23T02:22:26.374083  / # . /lava-11849807/environment/lava-11849=
807/bin/lava-test-runner /lava-11849807/1

    2023-10-23T02:22:26.375223  =


    2023-10-23T02:22:26.391477  / # /lava-11849807/bin/lava-test-runner /la=
va-11849807/1

    2023-10-23T02:22:26.457489  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-23T02:22:26.457997  + cd /lava-1184980<8>[   19.359993] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11849807_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
