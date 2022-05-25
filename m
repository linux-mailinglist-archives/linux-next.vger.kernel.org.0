Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70FE5533C3B
	for <lists+linux-next@lfdr.de>; Wed, 25 May 2022 14:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiEYMHF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 May 2022 08:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234048AbiEYMHE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 May 2022 08:07:04 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAD3DFC6
        for <linux-next@vger.kernel.org>; Wed, 25 May 2022 05:07:00 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 202so12044547pfu.0
        for <linux-next@vger.kernel.org>; Wed, 25 May 2022 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=codr62OuC16YgfPcqBCpQMHTPSYLwRt2/Q7celjlnqA=;
        b=6eoafhgUolZwdavtTJys41b468J7dLRWwNkxccaoNrnFkV8vBH6WyfkHcy8d25EnRl
         4KITsUD0JMQUZnx+oeSl5YfIg/lkXnXPWAH2YHjTob0AFOQU6mNGR/Y1xQ6caOWr7KbL
         Z6rkVjg+3oz7jfLicFZ8VXE9r4c6C1IS6m7wNT9XsQ969sM0a2XF0QMoaKaUA02jM/XP
         s6IqvAtgttc/u0iDuD/dNTdqNU43C/B4crtyOiA6XOLPQ492TrZ0glAwxtvHIJ5YTmdT
         g2IusILomennmnO6aXlPHlNmb0O4plsfSgGQ1CLoD/M0HI2guZMlViUyuvF6JK5jX5ZY
         sLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=codr62OuC16YgfPcqBCpQMHTPSYLwRt2/Q7celjlnqA=;
        b=NvkXplg3xaScGX3PfxUOVeBTDfIryFVBSdAY+9Rx6wjmsdjn9uTrsi8tYPEjyzZ3ab
         FYFqQgmxJGr5KgG9Qhh9F9rvbDriNXjA8RrkJAShhIbwQ8zeDALgkWnqoh1gC69qM7u/
         pw7DbidBiD/A2EXt0vU/cj3Fbszm7ggF0sraw3eG2hpXarpABFtys2XlvPQykSu98ju5
         10+KEjd4nockhco6wfh6BwFFe0dLi9Zu+LB9ub2ZaCrNIXYu2VqVvIcXcVhr+5dzkdYz
         yu7pV7SeEDtjSRdaIhWRvamTTsz+JIMTmrTqomhvU41amC3F/T+49uEoYmKlBuoLkY81
         ct7w==
X-Gm-Message-State: AOAM5327qNichWdBYLUktdTIcmwjpRSB39i/4AbgdCGrQP75lcouTWyE
        g8oXWtArhJHIRxc6EhruYZVk11bFuZzXtlB201M=
X-Google-Smtp-Source: ABdhPJxR8JWec7KBsTGIggyZz8qNKaM602Ei+XQFUFmT3/I9scE5tsuO0z/nRDXRNYloNQCB91BiGQ==
X-Received: by 2002:a05:6a00:15c2:b0:518:9911:4952 with SMTP id o2-20020a056a0015c200b0051899114952mr16025327pfu.64.1653480419896;
        Wed, 25 May 2022 05:06:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jp10-20020a17090ae44a00b001cd4989ff47sm1522049pjb.14.2022.05.25.05.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 05:06:59 -0700 (PDT)
Message-ID: <628e1be3.1c69fb81.f06ed.3732@mx.google.com>
Date:   Wed, 25 May 2022 05:06:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220525
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 47 runs, 5 regressions (next-20220525)
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

next/master baseline: 47 runs, 5 regressions (next-20220525)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 3          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220525/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220525
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8cb8311e95e3bb58bd84d6350365f14a718faa6d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/628de9394e3400107aa39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220525/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220525/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628de9394e3400107aa39=
be9
        failing since 12 days (last pass: next-20220506, first fail: next-2=
0220512) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/628de742a2d62eef85a39bf6

  Results:     73 PASS, 19 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220525/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220525/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/628de742a2d62eef85a39c4f
        failing since 27 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-05-25T08:22:01.574642  /lava-6463266/1/../bin/lava-test-case
    2022-05-25T08:22:01.587436  <8>[   25.466581] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/628dedf6fbf172ab9aa39bcd

  Results:     84 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220525/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220525/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/628dedf7fbf172ab9aa39c10
        failing since 27 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-05-25T08:50:38.567449  <8>[   58.279818] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-05-25T08:50:39.570219  /lava-6463375/1/../bin/lava-test-case
    2022-05-25T08:50:39.587206  <8>[   59.298224] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/628dedf7fbf172ab9aa39c11
        failing since 27 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-05-25T08:50:38.551997  /lava-6463375/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/628dedf7fbf172ab9aa39c12
        failing since 27 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-05-25T08:50:36.880013  <4>[   56.589864] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-05-25T08:50:37.533173  /lava-6463375/1/../bin/lava-test-case
    2022-05-25T08:50:37.546695  <8>[   57.260169] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
