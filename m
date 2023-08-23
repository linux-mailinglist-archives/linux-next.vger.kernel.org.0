Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56547856F0
	for <lists+linux-next@lfdr.de>; Wed, 23 Aug 2023 13:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjHWLoT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Aug 2023 07:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjHWLoT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Aug 2023 07:44:19 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B522EE4E
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 04:44:15 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68a56401b9aso2163710b3a.1
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 04:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692791055; x=1693395855;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FJRf0QULpy/VM4g+U0pSS7npaPqscua5HzDsO3lxapY=;
        b=OMJ2Vhd/f3aPJuAkV5QS+ZOxl0GtqNCKMFud7rKkfj3yp/xtthwHNGPKfshroVm+Sc
         Kly1x7/ppa5VVmp+itmD89kcc9okp9GZ3OJitKdUZGO3qooU4JfgdSkfUMgUs19anwJv
         K1Z+6uCwC3sjBQxoyvKPW4BPqV0XQqVJ7J4Ggw184OeuV+AByhYW8QhKPQw+mrIgqkUo
         3IGc5uh5+r9N3mtrlLQGrLCavj7J1NaArDv/Z3LdzBnnrtdur3rYZ48BKQUu/mPBeg9p
         yofsbrLByAqeGJqkwgNdOk6UbX0n6im7thV3UG5dObXF9zYI8rWsZamF6MSRbTStTvWl
         mUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692791055; x=1693395855;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJRf0QULpy/VM4g+U0pSS7npaPqscua5HzDsO3lxapY=;
        b=B/hqs8QnKbd8O8llFBh6h97UAMKfNjfouOjI5mPoqfK0Bg7jgqhWmQ/sM50NvFkilV
         0RyHn36UxaeJKXONM/bMbvnu778p5r81Ka4OMmiZS3X0uCy86cNSC+q1kekGp3j4MoJy
         Syah5CZpQXW8BJhjZRnlVqc+5QYJQZpYTTFL5VeQe5eTOl3wxKYvRol0ACkuMP2WUMY2
         oJZTFGPtwvpTEE84MMaAdN+lAS831ooJOHguGNExmDQAL76TDmQtt5hsrJlQt4zpFMii
         iAU4nT4/Czyatd7Gf5HXAlNKO/Fz+v9cFdJNW1UwPp9Fn8PzvSokNdPYltiU801VGDEj
         /DyA==
X-Gm-Message-State: AOJu0YxbcHVhT607eHHoJGjRgzC1neJyJZbawJgAS1q3a2SQWyApB+SL
        FkU7iF6025G1mucreP2zOQhvhMu/InDIsW0di+c=
X-Google-Smtp-Source: AGHT+IH9eZMApavoOXBqzXf3bgk8M3ZY15HDmI+A5W5TwAjmn12Ic3dy36iP1nWfrfZ1epxfKj3QwQ==
X-Received: by 2002:a05:6a20:72a0:b0:132:c07d:9dd2 with SMTP id o32-20020a056a2072a000b00132c07d9dd2mr11381099pzk.39.1692791054509;
        Wed, 23 Aug 2023 04:44:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t7-20020a63b707000000b00553b9e0510esm8476108pgf.60.2023.08.23.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:44:13 -0700 (PDT)
Message-ID: <64e5f10d.630a0220.e726a.f3ba@mx.google.com>
Date:   Wed, 23 Aug 2023 04:44:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230823
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 353 runs, 19 regressions (next-20230823)
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

next/master baseline: 353 runs, 19 regressions (next-20230823)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-R721T-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

acer-cbv514-1h-34uz-brya   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

acer-chromebox-cxi4-puff   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

asus-CM1400CXA-dalboz      | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

hp-14-db0003na-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

imx8mp-evk                 | arm64  | lab-broonie   | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64  | lab-broonie   | clang-17 | defconfig =
                   | 1          =

imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig =
                   | 1          =

imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m         | arm64  | lab-kontron   | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =

mt8192-asurada-spherion-r0 | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

mt8195-cherry-tomato-r2    | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

qemu_mips-malta            | mips   | lab-collabora | gcc-10   | malta_defc=
onfig              | 1          =

r8a774c0-ek874             | arm64  | lab-cip       | clang-17 | defconfig =
                   | 1          =

r8a779m1-ulcb              | arm64  | lab-collabora | clang-17 | defconfig =
                   | 1          =

sun50i-h6-pine-h64         | arm64  | lab-collabora | clang-17 | defconfig =
                   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230823/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230823
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-R721T-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b3eab24a629721b1e436

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5b3eab24a629721b1e=
437
        failing since 98 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-cbv514-1h-34uz-brya   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b6aba388ca94c9b1e3ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-cbv51=
4-1h-34uz-brya.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-cbv51=
4-1h-34uz-brya.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5b6aba388ca94c9b1e=
3ef
        new failure (last pass: next-20230822) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-chromebox-cxi4-puff   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b5ef8903b5f36eb1e3d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5b5ef8903b5f36eb1e=
3d1
        new failure (last pass: next-20230822) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-CM1400CXA-dalboz      | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b3e70ebb3d3794b1e3c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5b3e70ebb3d3794b1e=
3c1
        failing since 98 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b3cdf48a062506b1e47a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5b3cdf48a062506b1e=
47b
        failing since 98 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-14-db0003na-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b3d76457903e59b1e3d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5b3d76457903e59b1e=
3d9
        failing since 98 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-x360-14a-cb0001xx-zork  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b3ef0ebb3d3794b1e3d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5b3ef0ebb3d3794b1e=
3d1
        failing since 98 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-broonie   | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b6bdefd9ce5040b1e3ba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e5b6bdefd9ce5040b1e3bf
        failing since 7 days (last pass: next-20230807, first fail: next-20=
230815)

    2023-08-23T07:35:04.663119  + set<8>[   29.561558] <LAVA_SIGNAL_ENDRUN =
0_dmesg 65387_1.5.2.4.1>
    2023-08-23T07:35:04.663700   +x
    2023-08-23T07:35:04.772278  / # #
    2023-08-23T07:35:05.938352  export SHELL=3D/bin/sh
    2023-08-23T07:35:05.944463  #
    2023-08-23T07:35:07.387961  / # export SHELL=3D/bin/sh. /lava-65387/env=
ironment
    2023-08-23T07:35:07.393979  =

    2023-08-23T07:35:10.006368  / # . /lava-65387/environment/lava-65387/bi=
n/lava-test-runner /lava-65387/1
    2023-08-23T07:35:10.013141  =

    2023-08-23T07:35:10.021877  / # /lava-65387/bin/lava-test-runner /lava-=
65387/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-broonie   | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5bc364e3c6e9ab4b1e41e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e5bc364e3c6e9ab4b1e423
        failing since 7 days (last pass: next-20230807, first fail: next-20=
230815)

    2023-08-23T07:58:32.778700  + set<8>[   28.403943] <LAVA_SIGNAL_ENDRUN =
0_dmesg 65465_1.5.2.4.1>
    2023-08-23T07:58:32.779277   +x
    2023-08-23T07:58:32.887773  / # #
    2023-08-23T07:58:34.053657  export SHELL=3D/bin/sh
    2023-08-23T07:58:34.059764  #
    2023-08-23T07:58:35.502815  / # export SHELL=3D/bin/sh. /lava-65465/env=
ironment
    2023-08-23T07:58:35.508991  =

    2023-08-23T07:58:38.120600  / # . /lava-65465/environment/lava-65465/bi=
n/lava-test-runner /lava-65465/1
    2023-08-23T07:58:38.127294  =

    2023-08-23T07:58:38.137439  / # /lava-65465/bin/lava-test-runner /lava-=
65465/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b63179840a011eb1e3bb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e5b63179840a011eb1e3c0
        failing since 7 days (last pass: next-20230809, first fail: next-20=
230815)

    2023-08-23T07:32:35.579290  / # #
    2023-08-23T07:32:36.744830  export SHELL=3D/bin/sh
    2023-08-23T07:32:36.750943  #
    2023-08-23T07:32:38.194430  / # export SHELL=3D/bin/sh. /lava-65373/env=
ironment
    2023-08-23T07:32:38.200561  =

    2023-08-23T07:32:40.813009  / # . /lava-65373/environment/lava-65373/bi=
n/lava-test-runner /lava-65373/1
    2023-08-23T07:32:40.819750  =

    2023-08-23T07:32:40.833210  / # /lava-65373/bin/lava-test-runner /lava-=
65373/1
    2023-08-23T07:32:40.846581  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-23T07:32:40.862541  + cd /l<8>[   34.553043] <LAVA_SIGNAL_START=
RUN 1_bootrr 65373_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b9014d6efb8c7cb1e3af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e5b9014d6efb8c7cb1e3b4
        failing since 7 days (last pass: next-20230809, first fail: next-20=
230815)

    2023-08-23T07:44:41.854966  + set<8>[   27.521203] <LAVA_SIGNAL_ENDRUN =
0_dmesg 65427_1.5.2.4.1>
    2023-08-23T07:44:41.855556   +x
    2023-08-23T07:44:41.964161  / #
    2023-08-23T07:44:43.130058  # #export SHELL=3D/bin/sh
    2023-08-23T07:44:43.136162  =

    2023-08-23T07:44:44.579758  / # export SHELL=3D/bin/sh. /lava-65427/env=
ironment
    2023-08-23T07:44:44.585828  =

    2023-08-23T07:44:47.198328  / # . /lava-65427/environment/lava-65427/bi=
n/lava-test-runner /lava-65427/1
    2023-08-23T07:44:47.205209  =

    2023-08-23T07:44:47.212379  / # /lava-65427/bin/lava-test-runner /lava-=
65427/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m         | arm64  | lab-kontron   | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b62ab6318961ecb1e41f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5b62ab6318961ecb1e=
420
        failing since 21 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
lenovo-TPad-C13-Yoga-zork  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b3d86457903e59b1e3e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5b3d86457903e59b1e=
3e1
        failing since 98 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
mt8192-asurada-spherion-r0 | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5bbd4b6bb99b9b1b1e48e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5bbd4b6bb99b9b1b1e=
48f
        new failure (last pass: next-20230822) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
mt8195-cherry-tomato-r2    | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5bbe327ecf82304b1e3b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e5bbe327ecf82304b1e=
3b1
        failing since 0 day (last pass: next-20230816, first fail: next-202=
30822) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_mips-malta            | mips   | lab-collabora | gcc-10   | malta_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5b48d083b30c050b1e3c7

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64e5b48d083b30c=
050b1e3cf
        new failure (last pass: next-20230822)
        1 lines

    2023-08-23T07:25:49.703933  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 00026538, epc =3D=3D 802047cc, ra =3D=
=3D 802047bc
    2023-08-23T07:25:49.704310  =


    2023-08-23T07:25:49.771273  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-08-23T07:25:49.771670  =

   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a774c0-ek874             | arm64  | lab-cip       | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5bca79b4009943eb1e41c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e5bca79b4009943eb1e41f
        failing since 28 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-23T08:00:26.810225  / # #
    2023-08-23T08:00:28.269400  export SHELL=3D/bin/sh
    2023-08-23T08:00:28.289831  #
    2023-08-23T08:00:28.290017  / # export SHELL=3D/bin/sh
    2023-08-23T08:00:30.171594  / # . /lava-999648/environment
    2023-08-23T08:00:33.623140  /lava-999648/bin/lava-test-runner /lava-999=
648/1
    2023-08-23T08:00:33.643829  . /lava-999648/environment
    2023-08-23T08:00:33.643933  / # /lava-999648/bin/lava-test-runner /lava=
-999648/1
    2023-08-23T08:00:33.725694  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-23T08:00:33.725835  + cd /lava-999648/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a779m1-ulcb              | arm64  | lab-collabora | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5bc2af9b340cffcb1e3ce

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e5bc2af9b340cffcb1e3d3
        failing since 28 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-23T07:59:22.454628  / # #

    2023-08-23T07:59:23.534622  export SHELL=3D/bin/sh

    2023-08-23T07:59:23.536424  #

    2023-08-23T07:59:25.026096  / # export SHELL=3D/bin/sh. /lava-11335947/=
environment

    2023-08-23T07:59:25.027917  =


    2023-08-23T07:59:27.751430  / # . /lava-11335947/environment/lava-11335=
947/bin/lava-test-runner /lava-11335947/1

    2023-08-23T07:59:27.753958  =


    2023-08-23T07:59:27.760401  / # /lava-11335947/bin/lava-test-runner /la=
va-11335947/1

    2023-08-23T07:59:27.823076  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-23T07:59:27.823589  + cd /lav<8>[   28.546638] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11335947_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64         | arm64  | lab-collabora | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/64e5bc21c68c003459b1e443

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230823/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e5bc21c68c003459b1e448
        failing since 28 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-23T07:59:42.396043  / # #

    2023-08-23T07:59:42.497804  export SHELL=3D/bin/sh

    2023-08-23T07:59:42.498396  #

    2023-08-23T07:59:42.599488  / # export SHELL=3D/bin/sh. /lava-11335949/=
environment

    2023-08-23T07:59:42.600209  =


    2023-08-23T07:59:42.701778  / # . /lava-11335949/environment/lava-11335=
949/bin/lava-test-runner /lava-11335949/1

    2023-08-23T07:59:42.702869  =


    2023-08-23T07:59:42.745416  / # /lava-11335949/bin/lava-test-runner /la=
va-11335949/1

    2023-08-23T07:59:42.789899  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-23T07:59:42.790360  + cd /lava-11335949/1/te<8>[   17.091528] <=
LAVA_SIGNAL_STARTRUN 1_bootrr 11335949_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
