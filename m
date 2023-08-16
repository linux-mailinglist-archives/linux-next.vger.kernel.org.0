Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F00277E1A1
	for <lists+linux-next@lfdr.de>; Wed, 16 Aug 2023 14:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbjHPM3D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Aug 2023 08:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245305AbjHPM2z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Aug 2023 08:28:55 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E0F2716
        for <linux-next@vger.kernel.org>; Wed, 16 Aug 2023 05:28:33 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-688787570ccso829653b3a.2
        for <linux-next@vger.kernel.org>; Wed, 16 Aug 2023 05:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692188913; x=1692793713;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zXDaX/93qFC9kLX6Bgg9i0HLQ/oXfdjWnjnQLBUjDq4=;
        b=sfHL1iUrkhmFCoPfNPH7oayQHGLi6z8KmNP7CZu2uC9GB+k9Tp2Z0WTtuxafP6RhWw
         TNF2mTna5oRVxq6e86e3JBYOyxOpSYNY/o8CI7n41tkGPT+ogWZv0OJI98l22zcVb1Ak
         DeSO1l2sQhPIOqWOxjm7iJczCJ1SKUe5t5CldhifroU8KuIyyBPniAc2H5Ujgomf8JsI
         MZ1ImQk4YeN3p65cQrfkEVyXlQ+teJ8HyOt8IKQhiKE8LIDLINLJKob1dzKCbvttvLn9
         3V43neHbrAMAf4BRCewSIPn/+vTnCwBf357BRC1o/n49F9Zhddwhxf5vc28Bl8RsRM2s
         htEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692188913; x=1692793713;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXDaX/93qFC9kLX6Bgg9i0HLQ/oXfdjWnjnQLBUjDq4=;
        b=Ej30czkeoxSDpktcmpGYVBGhWE8Wjvw1bymvrhxkx1T37ZIQW6qCUie7fFzB0sTgeb
         YGmZ0p6qmjJrr9rXpRrCrpROzoQQBstZjxApFqrx7yAnj+KGzO9m0ApQKaZ0fLbjfu8i
         SDMf7wpx6jEqG7jUi6M40tt5N8zgz52F1OoaB83akQK58mPHp7Pk4+9YUhUQ2yMfZTTc
         KFAOMAZgt7UE33A/8P741IVMoNKOKtfletecrRpmvqu41uaLkguInJ/Yjo314pn2X6+r
         Coy+t3T6suCcui5vkRF3iwM9L6HyzE2u7ZPRgltawbXuxgUUYtZ7ZEQqeJZSdE2frZPb
         M1rQ==
X-Gm-Message-State: AOJu0YzyoA5/LHLjrin6QIUrPKs2iRGPBvHolEzCHOIHDID/eeZiShRk
        EFzBL1kTn1QXNCBqXCFI/Zqy6HMoNSZoPI8mpnfhtg==
X-Google-Smtp-Source: AGHT+IFQynqP9fim3UIUAY1dq6atQGlvZnyqr4VFTZybmWbdScWao8vDfbKxKO+zx9qd+cYDbUZd9w==
X-Received: by 2002:a05:6a20:258c:b0:134:e14c:851b with SMTP id k12-20020a056a20258c00b00134e14c851bmr1679371pzd.23.1692188912577;
        Wed, 16 Aug 2023 05:28:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z18-20020aa791d2000000b006875493da20sm11029167pfa.3.2023.08.16.05.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 05:28:32 -0700 (PDT)
Message-ID: <64dcc0f0.a70a0220.81d1.46fe@mx.google.com>
Date:   Wed, 16 Aug 2023 05:28:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230816
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 285 runs, 16 regressions (next-20230816)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 285 runs, 16 regressions (next-20230816)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-R721T-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

acer-chromebox-cxi4-puff   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

asus-CM1400CXA-dalboz      | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

fsl-ls1088a-rdb            | arm64  | lab-nxp       | gcc-10   | defconfig+=
debug              | 1          =

hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

hp-14-db0003na-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig+=
videodec           | 1          =

imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

mt8173-elm-hana            | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 2          =

mt8192-asurada-spherion-r0 | arm64  | lab-collabora | gcc-10   | defconfig+=
arm...ook+videodec | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64  | lab-cip       | gcc-10   | defconfig+=
videodec           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230816/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230816
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ef66bf8aeb91fd331cf8f5dca8f9d7bca9ab2849 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-R721T-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc8516352cb54a4535b222

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc8516352cb54a4535b=
223
        failing since 91 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-chromebox-cxi4-puff   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc8932718cc174d235b22a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc8932718cc174d235b=
22b
        new failure (last pass: next-20230815) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-CM1400CXA-dalboz      | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc851987c915894035b1e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc851987c915894035b=
1e8
        failing since 91 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb            | arm64  | lab-nxp       | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc8da7419d4bf7b335b206

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc8da7419d4bf7b335b=
207
        failing since 205 days (last pass: next-20230120, first fail: next-=
20230123) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc85047d8a60d33235b1dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc85047d8a60d33235b=
1dd
        failing since 91 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-14-db0003na-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc8505352cb54a4535b1d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc8505352cb54a4535b=
1da
        failing since 91 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-x360-14a-cb0001xx-zork  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc85177d8a60d33235b1f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc85177d8a60d33235b=
1f3
        failing since 91 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc86b424d91723fa35b1df

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64dc86b424d91723fa35b1e4
        failing since 0 day (last pass: next-20230809, first fail: next-202=
30815)

    2023-08-16T08:19:42.906435  + set<8>[   29.197682] <LAVA_SIGNAL_ENDRUN =
0_dmesg 56339_1.5.2.4.1>
    2023-08-16T08:19:42.907038   +x
    2023-08-16T08:19:43.026129  / # #
    2023-08-16T08:19:44.192326  export SHELL=3D/bin/sh
    2023-08-16T08:19:44.198481  #
    2023-08-16T08:19:45.642178  / # export SHELL=3D/bin/sh. /lava-56339/env=
ironment
    2023-08-16T08:19:45.648232  =

    2023-08-16T08:19:48.260628  / # . /lava-56339/environment/lava-56339/bi=
n/lava-test-runner /lava-56339/1
    2023-08-16T08:19:48.267514  =

    2023-08-16T08:19:48.279909  / # /lava-56339/bin/lava-test-runner /lava-=
56339/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc8a115e57c1b49335b23e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64dc8a115e57c1b49335b243
        failing since 0 day (last pass: next-20230809, first fail: next-202=
30815)

    2023-08-16T08:34:03.638541  + set<8>[   29.284823] <LAVA_SIGNAL_ENDRUN =
0_dmesg 56415_1.5.2.4.1>
    2023-08-16T08:34:03.639151   +x
    2023-08-16T08:34:03.749284  / # #
    2023-08-16T08:34:04.915372  export SHELL=3D/bin/sh
    2023-08-16T08:34:04.921464  #
    2023-08-16T08:34:06.364642  / # export SHELL=3D/bin/sh. /lava-56415/env=
ironment
    2023-08-16T08:34:06.370830  =

    2023-08-16T08:34:08.981698  / # . /lava-56415/environment/lava-56415/bi=
n/lava-test-runner /lava-56415/1
    2023-08-16T08:34:08.988461  =

    2023-08-16T08:34:08.997044  / # /lava-56415/bin/lava-test-runner /lava-=
56415/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
lenovo-TPad-C13-Yoga-zork  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc8503d32a04ed5335b208

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc8503d32a04ed5335b=
209
        failing since 91 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
mt8173-elm-hana            | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/64dc8983afe14aff4835b22b

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64dc8983afe14af=
f4835b249
        new failure (last pass: next-20230815)
        2 lines

    2023-08-16T08:31:47.019262  ter dereference at virtual address 00000000=
00000000

    2023-08-16T08:31:47.021509  kern  :alert : Mem abort info:

    2023-08-16T08:31:47.026106  kern  :alert :   ESR =3D 0x0000000096000006
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64dc8983afe14af=
f4835b24a
        new failure (last pass: next-20230815)
        13 lines

    2023-08-16T08:31:47.015401  kern  :alert : Unable to handle kernel NULL=
 poin<8>[   46.239806] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D13>
   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
mt8192-asurada-spherion-r0 | arm64  | lab-collabora | gcc-10   | defconfig+=
arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc8669cec076ec4635b1ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc8669cec076ec4635b=
1ee
        new failure (last pass: next-20230815) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc8dfa43100c996d35b1ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc8dfa43100c996d35b=
1eb
        new failure (last pass: next-20230815) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc8d332f2461160035b21b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dc8d332f2461160035b=
21c
        failing since 0 day (last pass: next-20230809, first fail: next-202=
30815) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64  | lab-cip       | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64dc85ba4bb9bb2afc35b1d9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230816/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64dc85ba4bb9bb2afc35b1dc
        failing since 8 days (last pass: next-20230710, first fail: next-20=
230808)

    2023-08-16T08:15:43.334213  + set +x
    2023-08-16T08:15:43.334778  <8>[   27.410916] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 997716_1.5.2.4.1>
    2023-08-16T08:15:43.443806  / # #
    2023-08-16T08:15:44.914724  export SHELL=3D/bin/sh
    2023-08-16T08:15:44.935965  #
    2023-08-16T08:15:44.936527  / # export SHELL=3D/bin/sh
    2023-08-16T08:15:46.831923  / # . /lava-997716/environment
    2023-08-16T08:15:50.307493  /lava-997716/bin/lava-test-runner /lava-997=
716/1
    2023-08-16T08:15:50.329435  . /lava-997716/environment
    2023-08-16T08:15:50.329886  / # /lava-997716/bin/lava-test-runner /lava=
-997716/1 =

    ... (27 line(s) more)  =

 =20
