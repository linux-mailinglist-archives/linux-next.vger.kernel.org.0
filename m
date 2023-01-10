Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3929A663D4E
	for <lists+linux-next@lfdr.de>; Tue, 10 Jan 2023 10:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238253AbjAJJwS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Jan 2023 04:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238270AbjAJJwQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Jan 2023 04:52:16 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59A8120A7
        for <linux-next@vger.kernel.org>; Tue, 10 Jan 2023 01:52:13 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id f3so7857713pgc.2
        for <linux-next@vger.kernel.org>; Tue, 10 Jan 2023 01:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JJiNrPVLyi+T++0eUDmfunxuo10grYMUlJgSSANRdTY=;
        b=XMlV+ZQByWr+qtUQkv3PKekrcCwKmgN8KqDiqZZ1GmK2DT5xTDQNjPMAc/MpEeTgN+
         nKdyWuJrMiwFo7nuIlyZza6OqNEzCeeIJSUfFcdp7I3oImDoXbW1Gm+abZkalMeQwJD/
         +Yyyd/jK06rIFhzJKThR8hJ3U/t9G8x7S6/rgrDJlrmxrsXUPMlI9yAUr6hdVT6w5rv8
         xY/B22ljqmGmjnLRE6HPfj7VBjU/zKJ5g36b1FLB/cDYcrQRFLI7eOUXt9lSdiuiLKFK
         vuPbErXlYTOaBtZDpIbKYGysboC6iu7xkIGerdAgZbR93ZxklrnuinmLc3KgA3yAm+mU
         DswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJiNrPVLyi+T++0eUDmfunxuo10grYMUlJgSSANRdTY=;
        b=Tj1GgE5Orkha2biFgDTQffDx73WeMKdwZms1QYdFi97JyuDqf8XrJqyK/6F6kavchU
         6FlvT9oVQ2CPyRigs7CZE4y0Yj6SV7/603xFEzyUT8ON8NHY9RWx0IjnT5HL6nA3FqSl
         dyT7n1C1eUG75Cz6dSRU2mYfAg/zysWNjd667T9hcxzZi23t3f1Pnqe+lL2QiPR6pzmk
         9ivdNynxhvUD/202TE2BkHmQCVY0fnNEsRTypMYVM9GxN5gGiJsflIFITPM+eOJr9KkW
         jaxUqCxExl65BbOlpQVQpxriFVGWC2UdWjp7xf9NkdOlWuFF4rYujZVevs0uDj7k0C5K
         4Ekg==
X-Gm-Message-State: AFqh2kqrGYwdg1QS20/xbuaNuwdwb/T4Y7SlDsXVVcjCu9i9VlxYY+ld
        2DiRjg26Y/VfcY6erPhKB8hMGB5AWDpiz/yySzjLSQ==
X-Google-Smtp-Source: AMrXdXt6APWKuFqu7gc5sB29mGicPP38XSxDNbhJmwD8JdufroiDAuTl3foJtHp5vG5lkbrcogRPRg==
X-Received: by 2002:a62:f203:0:b0:576:b8d0:6034 with SMTP id m3-20020a62f203000000b00576b8d06034mr68094645pfh.31.1673344332556;
        Tue, 10 Jan 2023 01:52:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w9-20020a628209000000b0058a72925687sm1232039pfd.212.2023.01.10.01.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 01:52:12 -0800 (PST)
Message-ID: <63bd354c.620a0220.d26ef.20ac@mx.google.com>
Date:   Tue, 10 Jan 2023 01:52:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc3-243-g3145d9dfed32
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 314 runs,
 31 regressions (v6.2-rc3-243-g3145d9dfed32)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 314 runs, 31 regressions (v6.2-rc3-243-g3145d9=
dfed32)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+debug              | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc3-243-g3145d9dfed32/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc3-243-g3145d9dfed32
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3145d9dfed323d5a82d40670e333de58fb1a9e65 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcf9df7dc0ed7a491d39e0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcf9df7dc0ed7a491d39e5
        new failure (last pass: v6.2-rc3-217-gcf5f49e41cd4e)

    2023-01-10T05:38:19.480864  + set +x
    2023-01-10T05:38:19.484581  <8>[   15.925081] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 80994_1.5.2.4.1>
    2023-01-10T05:38:19.597986  / # #
    2023-01-10T05:38:19.700218  export SHELL=3D/bin/sh
    2023-01-10T05:38:19.700833  #
    2023-01-10T05:38:19.802809  / # export SHELL=3D/bin/sh. /lava-80994/env=
ironment
    2023-01-10T05:38:19.803441  =

    2023-01-10T05:38:19.905356  / # . /lava-80994/environment/lava-80994/bi=
n/lava-test-runner /lava-80994/1
    2023-01-10T05:38:19.906277  =

    2023-01-10T05:38:19.912788  / # /lava-80994/bin/lava-test-runner /lava-=
80994/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd013c52994213651d3a29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd013c52994213651d3=
a2a
        failing since 15 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfefba0cfefb8c21d39dc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfefba0cfefb8c21d39e1
        new failure (last pass: v6.2-rc3-217-gcf5f49e41cd4e)

    2023-01-10T06:00:08.717422  / # #
    2023-01-10T06:00:08.833052  export SHELL=3D/bin/sh
    2023-01-10T06:00:08.835414  #
    2023-01-10T06:00:08.961421  / # export SHELL=3D/bin/sh. /lava-875928/en=
vironment
    2023-01-10T06:00:08.962429  =

    2023-01-10T06:00:09.066967  / # . /lava-875928/environment/lava-875928/=
bin/lava-test-runner /lava-875928/1
    2023-01-10T06:00:09.068030  =

    2023-01-10T06:00:09.073190  / # /lava-875928/bin/lava-test-runner /lava=
-875928/1
    2023-01-10T06:00:09.149132  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-10T06:00:09.149668  + cd /lava-875928/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfcc3569caccaba1d3a1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfcc3569caccaba1d3=
a1b
        failing since 124 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfd524eb27ce5001d39ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfd524eb27ce5001d3=
9eb
        failing since 126 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfcc6719b62c45a1d39c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfcc6719b62c45a1d3=
9c5
        failing since 126 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfea3502bacee4d1d3a8c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfea3502bacee4d1d3a8f
        failing since 5 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-10T05:58:21.726078  / # #
    2023-01-10T05:58:22.886429  export SHELL=3D/bin/sh
    2023-01-10T05:58:22.892123  #
    2023-01-10T05:58:24.440174  / # export SHELL=3D/bin/sh. /lava-1134019/e=
nvironment
    2023-01-10T05:58:24.445875  =

    2023-01-10T05:58:27.268482  / # . /lava-1134019/environment/lava-113401=
9/bin/lava-test-runner /lava-1134019/1
    2023-01-10T05:58:27.274529  =

    2023-01-10T05:58:27.274786  / # /lava-1134019/bin/l<4>[   33.865606] pw=
m-backlight backlight-display: supply power not found, using dummy regulator
    2023-01-10T05:58:27.275048  a<4>[   33.885273] etnaviv-gpu 1800000.gpu:=
 deferred probe timeout, ignoring dependency
    2023-01-10T05:58:27.275279  <4>[   33.893019] etnaviv-gpu: probe of 180=
0000.gpu failed with error -110 =

    ... (32 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfcb3569caccaba1d39cf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfcb3569caccaba1d39d4
        failing since 5 days (last pass: v6.1-rc6-391-gf445421fe4c7, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-10T05:50:13.806439  + set<8>[   17.511150] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1134018_1.5.2.4.1>
    2023-01-10T05:50:13.806689   +x
    2023-01-10T05:50:13.911705  / # #
    2023-01-10T05:50:15.071314  export SHELL=3D/bin/sh
    2023-01-10T05:50:15.076796  #
    2023-01-10T05:50:16.623500  / # export SHELL=3D/bin/sh. /lava-1134018/e=
nvironment
    2023-01-10T05:50:16.629071  =

    2023-01-10T05:50:19.450655  / # . /lava-1134018/environment/lava-113401=
8/bin/lava-test-runner /lava-1134018/1
    2023-01-10T05:50:19.456752  =

    2023-01-10T05:50:19.457118  / # /lava-1134018/bin/lava-t<4>[   21.70147=
6] usb_phy_generic usbphynop3: deferred probe timeout, ignoring dependency =

    ... (34 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfcd88f058f42ef1d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfcd88f058f42ef1d3=
9c4
        failing since 159 days (last pass: v5.19-1483-gffa33bbcf63ea, first=
 fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfea6666565cc8f1d39cf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfea6666565cc8f1d39d2
        failing since 5 days (last pass: v6.1-rc6-391-gf445421fe4c7, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-10T05:58:49.777361  + set +x<8>[   33.631850] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1134020_1.5.2.4.1>
    2023-01-10T05:58:49.777673  =

    2023-01-10T05:58:49.885167  / # #
    2023-01-10T05:58:51.044890  export SHELL=3D/bin/sh
    2023-01-10T05:58:51.050552  #
    2023-01-10T05:58:51.050794  / # export SHELL=3D/bin/sh
    2023-01-10T05:58:52.597397  / # . /lava-1134020/environment
    2023-01-10T05:58:55.423553  /lava-1134020/bin/lava-test-runner /lava-11=
34020/1
    2023-01-10T05:58:55.429589  . /lava-1134020/environment
    2023-01-10T05:58:55.429837  / # /lava-1134020/bin/lava-test-runner /lav=
a-1134020/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd0074e64219032f1d39db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd0074e64219032f1d3=
9dc
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd009cedb3db8a9f1d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd009cedb3db8a9f1d3=
9cb
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd05d5c23e45bbe11d39f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-=
qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-=
qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd05d5c23e45bbe11d3=
9f2
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd00ccffad34fe551d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd00ccffad34fe551d3=
9c4
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd00e1dadf3528e61d3a13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd00e1dadf3528e61d3=
a14
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd001ee2842278e11d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd001ee2842278e11d3=
9d2
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd0069e64219032f1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd0069e64219032f1d3=
9c3
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd001de2842278e11d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd001de2842278e11d3=
9cc
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd00ceffad34fe551d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd00ceffad34fe551d3=
9c7
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfbe93f3657c8131d39dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfbe93f3657c8131d3=
9dd
        failing since 27 days (last pass: v6.1-2435-g5c02e5d167d0, first fa=
il: v6.1-6378-g44d433ee7540) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd00ba116bed8e071d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd00ba116bed8e071d3=
9cb
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd0268ea98a47bf51d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd0268ea98a47bf51d3=
9c3
        new failure (last pass: v6.2-rc2-415-g7dcb1029a6d41) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd026889c5658c7e1d39cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd026889c5658c7e1d3=
9ce
        new failure (last pass: v6.2-rc2-415-g7dcb1029a6d41) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd018814444ee5fe1d39cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd018814444ee5fe1d3=
9ce
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd009bedb3db8a9f1d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd009bedb3db8a9f1d3=
9c6
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcf9c040787f99e21d3a1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcf9c040787f99e21d3a1f
        failing since 5 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-10T05:37:43.811486  / # #
    2023-01-10T05:37:43.913869  export SHELL=3D/bin/sh
    2023-01-10T05:37:43.914579  #
    2023-01-10T05:37:44.016263  / # export SHELL=3D/bin/sh. /lava-376669/en=
vironment
    2023-01-10T05:37:44.016952  =

    2023-01-10T05:37:44.118608  / # . /lava-376669/environment/lava-376669/=
bin/lava-test-runner /lava-376669/1
    2023-01-10T05:37:44.119688  =

    2023-01-10T05:37:44.135105  / # /lava-376669/bin/lava-test-runner /lava=
-376669/1
    2023-01-10T05:37:44.251202  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-10T05:37:44.251949  + cd /lava-376669/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfbdadd740d68451d39d0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfbdadd740d68451d39d3
        failing since 5 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-10T05:46:35.587910  / # #
    2023-01-10T05:46:35.690093  export SHELL=3D/bin/sh
    2023-01-10T05:46:35.690702  [   18.676222] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-10T05:46:35.691142  [   18.684568] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-10T05:46:35.691450  [   18.698070] usbcore: registered new inte=
rface driver uas
    2023-01-10T05:46:35.691742  #
    2023-01-10T05:46:35.793107  / # export SHELL=3D/bin/sh. /lava-376680/en=
vironment
    2023-01-10T05:46:35.793772  =

    2023-01-10T05:46:35.895365  / # . /lava-376680/environment/lava-376680/=
bin/lava-test-runner /lava-376680/1
    2023-01-10T05:46:35.896420   =

    ... (25 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfc2cd7482b01e01d39f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfc2cd7482b01e01d39f4
        failing since 5 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-10T05:48:19.599203  / # #
    2023-01-10T05:48:19.701092  export SHELL=3D/bin/sh
    2023-01-10T05:48:19.701842  [   20.398147] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-10T05:48:19.702113  [   20.406794] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-10T05:48:19.702317  [   20.420905] usbcore: registered new inte=
rface driver uas
    2023-01-10T05:48:19.702512  #
    2023-01-10T05:48:19.803870  / # export SHELL=3D/bin/sh. /lava-376686/en=
vironment
    2023-01-10T05:48:19.804630  =

    2023-01-10T05:48:19.906117  / # . /lava-376686/environment/lava-376686/=
bin/lava-test-runner /lava-376686/1
    2023-01-10T05:48:19.907126   =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfc8e75ed7031fb1d39ce

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfc8e75ed7031fb1d39d1
        failing since 5 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-10T05:49:45.389067  [   20.091620] <LAVA_SIGNAL_ENDRUN 0_dmesg =
376688_1.5.2.4.1>
    2023-01-10T05:49:45.495494  / # #
    2023-01-10T05:49:45.598053  export SHELL=3D/bin/sh
    2023-01-10T05:49:45.598770  [   20.148824] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-10T05:49:45.599147  [   20.157652] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-10T05:49:45.599446  [   20.173361] usbcore: registered new inte=
rface driver uas
    2023-01-10T05:49:45.599735  #
    2023-01-10T05:49:45.701097  / # export SHELL=3D/bin/sh. /lava-376688/en=
vironment
    2023-01-10T05:49:45.701746  =

    2023-01-10T05:49:45.803694  / # . /lava-376688/environment/lava-376688/=
bin/lava-test-runner /lava-376688/1 =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcf90a6f6864b3511d3a4f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcf90a6f6864b3511d3a52
        failing since 5 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-10T05:34:47.964463  / # #
    2023-01-10T05:34:48.067116  export SHELL=3D/bin/sh
    2023-01-10T05:34:48.067740  #
    2023-01-10T05:34:48.169605  / # export SHELL=3D/bin/sh. /lava-376661/en=
vironment
    2023-01-10T05:34:48.170263  =

    2023-01-10T05:34:48.271922  / # . /lava-376661/environment/lava-376661/=
bin/lava-test-runner /lava-376661/1
    2023-01-10T05:34:48.273014  =

    2023-01-10T05:34:48.288131  / # /lava-376661/bin/lava-test-runner /lava=
-376661/1
    2023-01-10T05:34:48.396225  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-10T05:34:48.396964  + cd /lava-376661/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd0072c93164e02d1d39ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-24=
3-g3145d9dfed32/arm64/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd0072c93164e02d1d3=
9ee
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e) =

 =20
