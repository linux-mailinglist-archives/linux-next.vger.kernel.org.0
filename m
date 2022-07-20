Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613E357BCEE
	for <lists+linux-next@lfdr.de>; Wed, 20 Jul 2022 19:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiGTRlj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jul 2022 13:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbiGTRli (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jul 2022 13:41:38 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D875C43E46
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 10:41:36 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id w7so15618356ply.12
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 10:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SB08HK0cddEKwM7SQsTBTn5UlwSYZ6C4dXIjH/S20XQ=;
        b=Cg6iOAgBHpm9aN0lwOa6NphlsWx7K8n8HP8fJ+/b+3zU5wb4wGm0RqQhP7vQsGEWyd
         lDB6yZekpo2NwdUh8xz7gwZ+//PTDwDQuqlCk/VZ6PNk1Xc44wlSs0Cg2naj8dNFrElJ
         dX2nQpFYHEz2z1XeqOET2YO44U9lqRx4/Vtd+q4UpdX+iMPdc+BAGdtJtLAfhYVu9spR
         cm7k1XiGGaY7YCx5Qdovsn1bGlaBPdbWwOHmTJJaafd8Ir7qtmkyGMt7mEYYGoFauxTW
         orur11D1i8UIw6Xo5n2kgZVLY/tAz2opIM1+3IA5naa2MN0pogMeryaBCnI59KjEUJrY
         dD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SB08HK0cddEKwM7SQsTBTn5UlwSYZ6C4dXIjH/S20XQ=;
        b=p6b4Xx9sHy2nWa9Z+MA9Sfl59+xZ6oPFPbax/1CR5J+nkFdJiyOoxLoBwICtS6cziy
         0QzpjeN2OBolRXxQB5456mYzVWlXqPpG7gsVVZ0VDmfw3g4lo0tMlwH1PAzTcPn9UMMD
         o65uKu6NTspPSlJv2njtWxzewrGAZknCNzQ9mVPLQdG3/ngdNC4JSwmVofgr3IXNEEVe
         aB7j2em/FWn9xtfTrvE21RcALgvM0tEyyeDW4bX7zOwbX8kLtn+oTc8r/iDhSo/7zzUO
         Efych06FMmGZHs9uB6oz2ZgITNFg3nRkDu5bn3P7Pc7VQQM/a30VNQAHS226p5emo2kX
         rPPg==
X-Gm-Message-State: AJIora9WJor/uSsSD/1nCDyOxq2vd+XUjoT4REMbJ7HkVx0msDSjbvNf
        v3Lkkxzp7RazvdQEKP2u1dz0M3M3H7fSok5c8k4=
X-Google-Smtp-Source: AGRyM1tm0nW1+wewoPi6rLDmsyVNSCzQV1vmJGFeS+mWkYAcGSQY8IDzjekFyrJngwkcO7OdEgTTcA==
X-Received: by 2002:a17:90b:4ac1:b0:1ef:c1ba:e73e with SMTP id mh1-20020a17090b4ac100b001efc1bae73emr6679904pjb.47.1658338896115;
        Wed, 20 Jul 2022 10:41:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f80-20020a623853000000b00528d620eb58sm14222681pfa.17.2022.07.20.10.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 10:41:35 -0700 (PDT)
Message-ID: <62d83e4f.1c69fb81.6641e.554e@mx.google.com>
Date:   Wed, 20 Jul 2022 10:41:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220720
Subject: next/master baseline: 67 runs, 6 regressions (next-20220720)
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

next/master baseline: 67 runs, 6 regressions (next-20220720)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 3          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220720/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220720
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4ee7eaa411ee24d07fa83d97ca03fa6725c40d04 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62d80d6af2018c33c5daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220720/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220720/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d80d6af2018c33c5daf=
057
        failing since 6 days (last pass: next-20220705, first fail: next-20=
220714) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62d80e71747418bf43daf086

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220720/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220720/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d80e71747418bf43daf=
087
        failing since 69 days (last pass: next-20220506, first fail: next-2=
0220512) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/62d81065dc5fd7c779daf07c

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220720/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220720/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62d81065dc5fd7c779daf0c1
        failing since 84 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-07-20T14:25:21.336715  /lava-6854382/1/../bin/lava-test-case
    2022-07-20T14:25:21.348741  <8>[   39.168105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62d81065dc5fd7c779daf0c2
        failing since 84 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-07-20T14:25:20.288772  /lava-6854382/1/../bin/lava-test-case
    2022-07-20T14:25:20.304761  <8>[   38.123592] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62d81065dc5fd7c779daf0c3
        failing since 84 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-07-20T14:25:19.242795  /lava-6854382/1/../bin/lava-test-case
    2022-07-20T14:25:19.255785  <8>[   37.074813] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62d80d7e52127b5879daf05d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220720/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220720/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d80d7e52127b5879daf=
05e
        new failure (last pass: next-20220719) =

 =20
