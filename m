Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D744CF0C1
	for <lists+linux-next@lfdr.de>; Mon,  7 Mar 2022 05:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbiCGExc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Mar 2022 23:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235198AbiCGExb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Mar 2022 23:53:31 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27ED11C34
        for <linux-next@vger.kernel.org>; Sun,  6 Mar 2022 20:52:36 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id o8so12590882pgf.9
        for <linux-next@vger.kernel.org>; Sun, 06 Mar 2022 20:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1dVdL1Of2CZRsy/nfbMF/amCtS3JcoQR6oK73AfZj0g=;
        b=yMBM8XM4aod/mvEpZjEocn8AmBZsMcFq5GQLd1SM0YKhTkMF0totrChjKuPtSNeXpg
         wggQ8TRgmbqIoMicFN2178V/ZVfFTT5bK6sGht9bFhcNFitp6lquS8c7+W/Surha5YYy
         ER/IKjw/WrMkukqK/wrdRf1RSZEF41FsyaWazs1rEltId2x44dfe4G7vw/fzKLSTZOBR
         A5q2vMdx66f+HY+f6VkeSaxr9b6FCi3NPoBelKWN+EKgQ/SLuSx4o3B1HCHphUd20IG9
         3zd+X0+zI1oVyCz1oWh5YJCnGEB/3LWHZ/0vWNIGnj5bFdJ9Pudd+u7GewK3P/pk2WcH
         JDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1dVdL1Of2CZRsy/nfbMF/amCtS3JcoQR6oK73AfZj0g=;
        b=Zd6H551fkHu8nRB47+gUILA5nDLmL9qFOf/lS4pgOoU7wQGj0+RKOsyMLgs1G83G3B
         a5qlEEn5hTQjXIgWFaT66gxCns/peyO4jT9TUorku6K4k5Yk4HFEeaax1QlxO2yg50dd
         +rkIYyt+vYymDJdbpdMPm0+gTSWNNIehERcqlVu29tkCPJVk8j35O8fb1s2WI7nrAQU9
         j3wmGTPX6tI4K/4bqEUhZw9eel/df0RChVurrb+3zvwwjS59gzWupheWB18OyDXWmMJ2
         RDOxvK8CLaR/tVOb/XAgEanXS6EvkWO10xzkxkN85vgp3vFjfuWwtrB+up2jqfMWB3Kp
         k2Rw==
X-Gm-Message-State: AOAM533gneNuNG4RhWc0uzro2fSI5jCkZI9Ny1v60jSwloUynzLkF5gn
        GICT/RWLYetlXc812H27FgAaxBSUVm3Ri2TAqOo=
X-Google-Smtp-Source: ABdhPJz9Fcigj6qg4aIJzuL0fTc+gHX3A+Gl4nsmCFnYTkquyI5GLuahxojUdHHzyp/DOznrx+/eOw==
X-Received: by 2002:a05:6a00:280c:b0:4f6:fc52:7b6a with SMTP id bl12-20020a056a00280c00b004f6fc527b6amr3650950pfb.39.1646628755869;
        Sun, 06 Mar 2022 20:52:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p17-20020a056a000b5100b004f70db04218sm372283pfo.33.2022.03.06.20.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 20:52:35 -0800 (PST)
Message-ID: <62258f93.1c69fb81.f822d.1313@mx.google.com>
Date:   Sun, 06 Mar 2022 20:52:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc6-376-g477ac50bab9c
Subject: next/pending-fixes baseline: 408 runs,
 8 regressions (v5.17-rc6-376-g477ac50bab9c)
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

next/pending-fixes baseline: 408 runs, 8 regressions (v5.17-rc6-376-g477ac5=
0bab9c)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-collabora | gcc-10   | defconfig=
+ima                | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc6-376-g477ac50bab9c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc6-376-g477ac50bab9c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      477ac50bab9ca99572b9a89e5ed7b3730c6355b1 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-collabora | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62255a4343dbdd02adc62a28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-bcm2711-=
rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-bcm2711-=
rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62255a4343dbdd02adc62=
a29
        new failure (last pass: v5.17-rc6-278-g34490bca674f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/622559b201612d079bc6296c

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/622=
559b201612d079bc62983
        new failure (last pass: v5.17-rc6-278-g34490bca674f)

    2022-03-07T01:02:19.358300  /lava-95998/1/../bin/lava-test-case
    2022-03-07T01:02:19.358590  <8>[   11.350680] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-03-07T01:02:19.358743  /lava-95998/1/../bin/lava-test-case
    2022-03-07T01:02:19.358890  <8>[   11.370398] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-03-07T01:02:19.359036  /lava-95998/1/../bin/lava-test-case
    2022-03-07T01:02:19.359179  <8>[   11.391572] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-03-07T01:02:19.359320  /lava-95998/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622561af7dfee466d1c6296e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622561af7dfee466d1c62=
96f
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/622559e52852753925c62989

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/622559e528527539=
25c6298c
        new failure (last pass: v5.17-rc4-173-gecf2acb68532)
        1 lines

    2022-03-07T01:03:16.036075  / # =

    2022-03-07T01:03:16.140857  #
    2022-03-07T01:03:16.242826  export SHELL=3D/bin/sh
    2022-03-07T01:03:16.243356  =

    2022-03-07T01:03:16.243607  / # #
    2022-03-07T01:03:16.344961  / # export SHELL=3D/bin/sh. /lava-1654182/e=
nvironment
    2022-03-07T01:03:16.446382  /lava-1654182/bin/lava-test-runner /lava-16=
54182/0
    2022-03-07T01:03:16.447919  =

    2022-03-07T01:03:16.448178  / # . /lava-1654182/environment
    2022-03-07T01:03:16.459964  / # /lava-1654182/bin/lava-test-runner /lav=
a-1654182/0 =

    ... (8 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/622559e52852753=
925c6298e
        new failure (last pass: v5.17-rc4-173-gecf2acb68532)
        2 lines

    2022-03-07T01:03:16.580991  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2022-03-07T01:03:16.581511  kern  :emerg : Code: d2800028 d2e02809 f2e0=
0808 17ffffd1 (d4210000<8>[   16.682164] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-03-07T01:03:16.581762  ) =

    2022-03-07T01:03:16.581989  + set <8>[   16.691037] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 1654182_1.5.2.4.1>
    2022-03-07T01:03:16.582213  +x   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62255e09c685c0ce3bc6296a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/62255e09c685c0ce=
3bc6296d
        new failure (last pass: v5.16-11577-gffd79fec234d)
        1 lines

    2022-03-07T01:20:55.139174  / # =

    2022-03-07T01:20:55.262244  #
    2022-03-07T01:20:55.373206  export SHELL=3D/bin/sh
    2022-03-07T01:20:55.375536  =

    2022-03-07T01:20:55.376875  / # #
    2022-03-07T01:20:55.480991  / # export SHELL=3D/bin/sh. /lava-1654189/e=
nvironment
    2022-03-07T01:20:55.585291  /lava-1654189/bin/lava-test-runner /lava-16=
54189/0
    2022-03-07T01:20:55.592229  =

    2022-03-07T01:20:55.593538  / # . /lava-1654189/environment
    2022-03-07T01:20:55.602043  / # /lava-1654189/bin/lava-test-runner /lav=
a-1654189/0 =

    ... (9 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62255e09c685c0c=
e3bc6296f
        new failure (last pass: v5.16-11577-gffd79fec234d)
        2 lines

    2022-03-07T01:20:55.738510  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2022-03-07T01:20:55.739827  kern  :emerg : Code: d2800028 d2e02809 f2e0=
0808 17ffffd1 (d4210000<8>[   16.598340] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-03-07T01:20:55.741156  ) =

    2022-03-07T01:20:55.742516  + set +x<8>[   16.607419] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1654189_1.5.2.4.1>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62255ac75fbce6a6aec6297d

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-3=
76-g477ac50bab9c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62255ac75fbce6a6aec629a3
        failing since 6 days (last pass: v5.17-rc5-244-gd77a1b37f796, first=
 fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-07T01:06:50.471859  /lava-5827229/1/../bin/lava-test-case
    2022-03-07T01:06:50.482812  <8>[   34.007010] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
