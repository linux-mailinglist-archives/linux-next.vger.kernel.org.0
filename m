Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE0E717C6E
	for <lists+linux-next@lfdr.de>; Wed, 31 May 2023 11:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234862AbjEaJvt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 May 2023 05:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234371AbjEaJvs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 May 2023 05:51:48 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BDCE8
        for <linux-next@vger.kernel.org>; Wed, 31 May 2023 02:51:45 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6af6df7f93aso4120010a34.0
        for <linux-next@vger.kernel.org>; Wed, 31 May 2023 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685526704; x=1688118704;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=73S9WUNHGaLYoIzlF8D1M0ecOKERws9J4E1y0iImfn0=;
        b=fbqr6tPr74PaV0I1X3Wwn15BvNitNJNSxnQ3zoarBAqWv8vqXkK6IpkdQlKW8lixY9
         dgIzhspMI1MLZGJOYYOsyTFjLOdmKNTsJJJSH1QZ9J7PJ5/IMpTM7lybLNRgNwYqcyLe
         lZSwPmd6srt+wNctrSmWxqFdhQSnhemPJwi5ekqyuipTOzo8csfHp27za/936Ln3jqfn
         cPgflp/Su0OWwXW28hJl7cNfMy0yP6dpP4nFdOyfPzzc9yEcbbyAawAU12nT4W6QB/za
         9ZSYYOroLluO7RBm6aQ8ZgP428Xsx2gv8WxYgzrwDfyRuNrFlgOBuxj1HxfxM9LS1mX8
         ddEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526704; x=1688118704;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73S9WUNHGaLYoIzlF8D1M0ecOKERws9J4E1y0iImfn0=;
        b=iocqVtxk5s9gWcRYSjo2OD03pdG8vhugqouCpfxkMJv7Mf5++cbqBRF4+bopj8ceyU
         s0YDV5SLJxgVvHB2GxvzmqKjM9eJlMiqDltKIGMuljYWbaG7A/12XFuQOId+5v3ab/8b
         gAbrZFFLPlh7slnx3knn/gVDEm3fzhTb833UZzQ0EhJ6CoWBljacL3AANORNY4OgF05h
         kKrQ5WVd2n0EJ2g9wM9m5M/uOz164bto/tiv/4svuQ9wIvWHT8Ugcr/iTFfIJP6piJf9
         yoeLnDzmk9+tZHkPGONK1KUADeqqYtS/Fh5NHvU92GDJ0YLJDVkBAi5CrENiecwEHY8l
         stJw==
X-Gm-Message-State: AC+VfDxEEc7XDMrMQeunBI1mJuH8rl6Y/aWYWRkbM8I8p8IwEncdYRVt
        UAJe4M/pzqZx7rqseMYmx2XhzW+Ey97v9w9vu5a3/Q==
X-Google-Smtp-Source: ACHHUZ6lb6+GhutzRSD5DYb1FsoGqmWKRQtkgfPpn0zUnTgdtmzEdi6oFIxf5z3Ax+/bzujaFeP1Ww==
X-Received: by 2002:a9d:7315:0:b0:6ab:31ed:85ef with SMTP id e21-20020a9d7315000000b006ab31ed85efmr1806376otk.27.1685526704442;
        Wed, 31 May 2023 02:51:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b0063799398eaesm3002765pfi.51.2023.05.31.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 02:51:43 -0700 (PDT)
Message-ID: <647718af.a70a0220.c6d43.6551@mx.google.com>
Date:   Wed, 31 May 2023 02:51:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230531
X-Kernelci-Report-Type: test
Subject: next/master baseline: 112 runs, 9 regressions (next-20230531)
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

next/master baseline: 112 runs, 9 regressions (next-20230531)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8365-evk                   | arm64 | lab-baylibre  | clang-13 | cros://ch=
rome...avour.config | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230531/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230531
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d4cee89031c80066ec461bb77b5e13a4f37d5fd2 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6476e5332e19efea5c2e868d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6476e5332e19efea5c2e8=
68e
        failing since 6 days (last pass: next-20230519, first fail: next-20=
230524) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6476e3e70583ad8e082e8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6476e3e70583ad8e082e8=
644
        failing since 6 days (last pass: next-20230522, first fail: next-20=
230524) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6476e48b8c47dfadfb2e8617

  Results:     26 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230531/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230531/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6476e48b8c47dfadfb2e8633
        new failure (last pass: next-20230530)

    2023-05-31T06:08:43.514376   :   FSC =3D 0x06: level 2 transla<8>[   46=
.358877] <LAVA_SIGNAL_ENDRUN 0_dmesg 10537664_1.5.2.3.1>

    2023-05-31T06:08:43.517511  tion fault

    2023-05-31T06:08:43.518194  kern  :alert : Data abort info:

    2023-05-31T06:08:43.523456  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006, ISS2 =3D 0x00000000

    2023-05-31T06:08:43.528517  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0

    2023-05-31T06:08:43.534303  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0

    2023-05-31T06:08:43.540768  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000001088cc000

    2023-05-31T06:08:43.549995  kern  :alert : [0000000000000018] pgd=3D080=
00001088cd003, p4d=3D08000001088cd003, pud=3D08000001088ce003

    2023-05-31T06:08:43.555958  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-31T06:08:43.561858  kern  :emerg : Code: f9000bf5 a9024ff4 9100=
03fd f85f8008 (f9400d14) =

 =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6476e42f66515bce9d2e86bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6476e42f66515bce9d2e8=
6be
        failing since 123 days (last pass: next-20230120, first fail: next-=
20230127) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6476e3ca455e35a6272e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6476e3ca455e35a6272e8=
5fe
        failing since 126 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6476e3892c47d6a1902e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6476e3892c47d6a1902e8=
5f1
        new failure (last pass: next-20230530) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6476e3d7872971993f2e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6476e3d7872971993f2e8=
5f1
        failing since 6 days (last pass: next-20230522, first fail: next-20=
230524) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8365-evk                   | arm64 | lab-baylibre  | clang-13 | cros://ch=
rome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6476e3a82485d64f892e87b1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-mt8365-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230531/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-mt8365-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6476e3a82485d64f892e87b6
        failing since 0 day (last pass: next-20230525, first fail: next-202=
30530)

    2023-05-31T06:05:03.503868  / # #
    2023-05-31T06:05:03.607692  export SHELL=3D/bin/sh
    2023-05-31T06:05:03.608848  #
    2023-05-31T06:05:03.711273  / # export SHELL=3D/bin/sh. /lava-3633801/e=
nvironment
    2023-05-31T06:05:03.712425  =

    2023-05-31T06:05:03.814933  / # . /lava-3633801/environment/lava-363380=
1/bin/lava-test-runner /lava-3633801/1
    2023-05-31T06:05:03.816710  =

    2023-05-31T06:05:03.825637  / # /lava-3633801/bin/lava-test-runner /lav=
a-3633801/1
    2023-05-31T06:05:03.877400  + export 'TESTRUN_ID=3D1_bootrr'
    2023-05-31T06:05:03.878548  + cd /lava-3633801/1/tests/1_bootrr =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6476e3ce6af9f4a6842e85ec

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230531/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230531/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rk808-clkout-driver-present: https://kernelci.org/test/=
case/id/6476e3ce6af9f4a6842e861a
        failing since 14 days (last pass: next-20230512, first fail: next-2=
0230517)

    2023-05-31T06:05:47.567314  <8>[   32.185454] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drk3x-i2c8-probed RESULT=3Dpass>

    2023-05-31T06:05:48.585950  /lava-10537655/1/../bin/lava-test-case
   =

 =20
