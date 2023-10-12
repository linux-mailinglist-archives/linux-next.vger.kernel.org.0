Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1B1C7C63D2
	for <lists+linux-next@lfdr.de>; Thu, 12 Oct 2023 06:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbjJLEON (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Oct 2023 00:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbjJLEOM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Oct 2023 00:14:12 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778B6A9
        for <linux-next@vger.kernel.org>; Wed, 11 Oct 2023 21:14:10 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-690fa0eea3cso463051b3a.0
        for <linux-next@vger.kernel.org>; Wed, 11 Oct 2023 21:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697084049; x=1697688849; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+n/776i+7Yc2iOl/3TDaFyYH0eLtGKYH3g67PeUOc4U=;
        b=gfTjWRg2udtt0tag4beDmCYCifjlSXtxGXlMDpfwpXPFiSo57DFbMlnLNtxMWqjDwE
         8XLJRmSzEm9Ltp5Tz0u4hFkVlrPMWglTaSDRgtLqFN1VoJBAoMO7OZSBbE3mq9t2WBgf
         wZaCLzVDupSjGm3F/aRO6o+ATpa8OzFWc2EVgzPLzvjvPSwveA3srp35TLlkG/el7qtg
         u2niRoTYDhC8eOTeVSvTZPMXifIjuSY8wWO+Diy0I/sZEOw85QrlerseY7NxOTz3pDDE
         RipRloZenuNA9YnjLLaENsBVDN0jQfmxgjQVg+J7XoTYFKDAWBZDzIrGblYa94XiXVrk
         e5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697084049; x=1697688849;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+n/776i+7Yc2iOl/3TDaFyYH0eLtGKYH3g67PeUOc4U=;
        b=tF0zrVpsIf8EXK/ORi10DdLmzw+6BZbzeWPLNDSPosbbnf56/Go5jr6UDsJDBuJnWB
         CHGXvW+6gfjD9witelI+Dka6KauqCnK3vObVO8vh5mTwDTEwpScx5WpIfk69oLw82vvp
         PJ1EJSagR4FTEOAD+MktzUpMWlwNZWh/DM+xd9ULW5chGmhSvp3G2INuRhqDDbrrnoc9
         DuZflg/ZtJnsuh+oPJ6Q6dX7ThGSHkQqhPlOhKEKPhdixDnMJ171udgvSBmZQIDIEbqW
         onb/KBo9SVTU3TnibWLDoCJrqFPZ2YKBr/0JpnRI51IjIhSp7zLYI6D8Zb3Qsxl8wdQE
         ZWug==
X-Gm-Message-State: AOJu0Ywxzi2zhMT+HWjCE0822Lj9wLpuJIwSYusOlDOpAWZ6Ik4To8lG
        iS4uKhz5BpJtH1q77nzACOL2b+FsH7ZiG95niQyR1A==
X-Google-Smtp-Source: AGHT+IEcwVZRxr/swsIV5b74QwagCAfYLB921T0DcnJaH4U8uiL2pcEPvicvdqmtBgmUeqvpMLMKhg==
X-Received: by 2002:a05:6a21:3290:b0:15d:ec88:356e with SMTP id yt16-20020a056a21329000b0015dec88356emr29253143pzb.41.1697084049365;
        Wed, 11 Oct 2023 21:14:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090a8c0b00b0026b76edd607sm763329pjo.15.2023.10.11.21.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 21:14:08 -0700 (PDT)
Message-ID: <65277290.170a0220.a66fc.36e5@mx.google.com>
Date:   Wed, 11 Oct 2023 21:14:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-359-g960f4d0f660c7
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 63 runs,
 6 regressions (v6.6-rc5-359-g960f4d0f660c7)
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

next/pending-fixes baseline: 63 runs, 6 regressions (v6.6-rc5-359-g960f4d0f=
660c7)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
| regressions
----------------------------+-------+---------------+----------+-----------=
+------------
imx8mp-evk                  | arm64 | lab-broonie   | gcc-10   | defconfig =
| 1          =

kontron-pitx-imx8m          | arm64 | lab-kontron   | gcc-10   | defconfig =
| 2          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig =
| 1          =

sun50i-h6-pine-h64          | arm64 | lab-clabbe    | gcc-10   | defconfig =
| 1          =

sun50i-h6-pine-h64          | arm64 | lab-collabora | gcc-10   | defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc5-359-g960f4d0f660c7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc5-359-g960f4d0f660c7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      960f4d0f660c7eca51d814d65d3757ead9c2ca65 =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
| regressions
----------------------------+-------+---------------+----------+-----------=
+------------
imx8mp-evk                  | arm64 | lab-broonie   | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/6527420ad27cf5fa2defcf5b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6527420ad27cf5fa2defcf64
        failing since 36 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-12T00:46:38.392659  + set<8>[   28.950481] <LAVA_SIGNAL_ENDRUN =
0_dmesg 165773_1.5.2.4.1>
    2023-10-12T00:46:38.396278   +x
    2023-10-12T00:46:38.498859  / # #
    2023-10-12T00:46:39.660647  export SHELL=3D/bin/sh
    2023-10-12T00:46:39.666829  #
    2023-10-12T00:46:41.165980  / # export SHELL=3D/bin/sh. /lava-165773/en=
vironment
    2023-10-12T00:46:41.171986  =

    2023-10-12T00:46:43.894697  / # . /lava-165773/environment/lava-165773/=
bin/lava-test-runner /lava-165773/1
    2023-10-12T00:46:43.901489  =

    2023-10-12T00:46:43.915776  / # /lava-165773/bin/lava-test-runner /lava=
-165773/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
| regressions
----------------------------+-------+---------------+----------+-----------=
+------------
kontron-pitx-imx8m          | arm64 | lab-kontron   | gcc-10   | defconfig =
| 2          =


  Details:     https://kernelci.org/test/plan/id/6527419a168aed3783efcf0d

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6527419a168aed3783efcf14
        failing since 0 day (last pass: v6.6-rc5-269-g00b249acca70, first f=
ail: v6.6-rc5-300-g24760d837661b)

    2023-10-12T00:44:51.491206  / # #
    2023-10-12T00:44:51.593440  export SHELL=3D/bin/sh
    2023-10-12T00:44:51.594213  #
    2023-10-12T00:44:51.695757  / # export SHELL=3D/bin/sh. /lava-385477/en=
vironment
    2023-10-12T00:44:51.696504  =

    2023-10-12T00:44:51.797890  / # . /lava-385477/environment/lava-385477/=
bin/lava-test-runner /lava-385477/1
    2023-10-12T00:44:51.799189  =

    2023-10-12T00:44:51.818210  / # /lava-385477/bin/lava-test-runner /lava=
-385477/1
    2023-10-12T00:44:51.858704  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-12T00:44:51.873087  + cd /l<8>[   15.719851] <LAVA_SIGNAL_START=
RUN 1_bootrr 385477_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/652=
7419a168aed3783efcf24
        failing since 0 day (last pass: v6.6-rc5-269-g00b249acca70, first f=
ail: v6.6-rc5-300-g24760d837661b)

    2023-10-12T00:44:54.258807  /lava-385477/1/../bin/lava-test-case
    2023-10-12T00:44:54.259239  <8>[   18.203903] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab           | compiler | defconfig =
| regressions
----------------------------+-------+---------------+----------+-----------=
+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/652742a37e54583ffeefcf08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652742a37e54583ffeefc=
f09
        new failure (last pass: v6.6-rc5-300-g24760d837661b) =

 =



platform                    | arch  | lab           | compiler | defconfig =
| regressions
----------------------------+-------+---------------+----------+-----------=
+------------
sun50i-h6-pine-h64          | arm64 | lab-clabbe    | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/652741a04807a1f4efefcf87

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-=
h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-=
h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652741a04807a1f4efefcf90
        failing since 0 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.6-rc5-300-g24760d837661b)

    2023-10-12T00:45:13.378903  <8>[   18.844097] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438103_1.5.2.4.1>
    2023-10-12T00:45:13.483993  / # #
    2023-10-12T00:45:13.585735  export SHELL=3D/bin/sh
    2023-10-12T00:45:13.586382  #
    2023-10-12T00:45:13.687383  / # export SHELL=3D/bin/sh. /lava-438103/en=
vironment
    2023-10-12T00:45:13.688032  =

    2023-10-12T00:45:13.789004  / # . /lava-438103/environment/lava-438103/=
bin/lava-test-runner /lava-438103/1
    2023-10-12T00:45:13.789902  =

    2023-10-12T00:45:13.794120  / # /lava-438103/bin/lava-test-runner /lava=
-438103/1
    2023-10-12T00:45:13.873125  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
| regressions
----------------------------+-------+---------------+----------+-----------=
+------------
sun50i-h6-pine-h64          | arm64 | lab-collabora | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/652741a2168aed3783efcf50

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-35=
9-g960f4d0f660c7/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652741a2168aed3783efcf59
        failing since 0 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.6-rc5-300-g24760d837661b)

    2023-10-12T00:49:34.083518  / # #

    2023-10-12T00:49:34.185651  export SHELL=3D/bin/sh

    2023-10-12T00:49:34.186351  #

    2023-10-12T00:49:34.287819  / # export SHELL=3D/bin/sh. /lava-11746531/=
environment

    2023-10-12T00:49:34.288525  =


    2023-10-12T00:49:34.390046  / # . /lava-11746531/environment/lava-11746=
531/bin/lava-test-runner /lava-11746531/1

    2023-10-12T00:49:34.391155  =


    2023-10-12T00:49:34.407557  / # /lava-11746531/bin/lava-test-runner /la=
va-11746531/1

    2023-10-12T00:49:34.476436  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-12T00:49:34.476942  + cd /lava-11746531/1/tests/1_boot<8>[   17=
.235883] <LAVA_SIGNAL_STARTRUN 1_bootrr 11746531_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
