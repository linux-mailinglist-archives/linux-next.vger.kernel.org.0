Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B594F476F
	for <lists+linux-next@lfdr.de>; Wed,  6 Apr 2022 01:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbiDEVL0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Apr 2022 17:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573510AbiDETOI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Apr 2022 15:14:08 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098DDE885A
        for <linux-next@vger.kernel.org>; Tue,  5 Apr 2022 12:12:09 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id y6so11720398plg.2
        for <linux-next@vger.kernel.org>; Tue, 05 Apr 2022 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ztdhndN9QclTcn96JlSSE6L3Kd36kFza/Qg+070oBAc=;
        b=gfw5gthArDdJA90qNRpnpury3l3qUp7D2kaD3BZfzjTnAfUmebVcsyB6bIQCIANS9k
         l+vtiY9T9TMN4cSqSaetky9AjVPvguqkB69Irf2WAKgprC4n0x6C7a3jxKzJxzixonmQ
         Iv2JcaimJzbzrW+SGI8jqiqDtpRlXzylV+RjgKGCJriuqv2IJWmW61+6WrQkl57wt8Pp
         GNtOudzTJi74WJDRTHQKKlqM8kJUBWm7/OqXnSkjXQsYqCo9sgArO7D0dD+d4B6XAWqp
         EKTOiOIale5aeCzmdwGuZQgb384Eqax9B1ihVx4QrplcW9gBnJmZdPV9cmQN71GhVEjn
         U1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ztdhndN9QclTcn96JlSSE6L3Kd36kFza/Qg+070oBAc=;
        b=C/tOs5J4imwgrXy1sONQtjub5c9SBnu/2rwUeOYBZ+AvzdDO/g+d3b7McBEaaUgPrW
         rFwFBcMzJkt1ntdNyfLc8bwkfwhzBlcu6QDRgd9KxcY0mfEKSJ3jN4WQqRDQNY6h/fyk
         29nVw/uAWh8Qo2EH/eMAFt00zUe+xXRg5ivgCiC3U+xDCsAGS0wX2U36e+/QkLElS2gG
         7usiOedmRmilR5Kq2P0DVeB5vbRK+EWedB7oGvIpTgFjR6nqgXqUk4UIVIszbE0JO9p5
         BSoTumVWd5qUO59cfAxX1DfBI2wzfl/U+C11RDB75sYiU925VxPW8SBn442UxTIe2M1N
         PtPg==
X-Gm-Message-State: AOAM533rCMMyi7/2slR2bJBCx76PGZYGAPowd+xdGbYokCV+uw8eiyyv
        9PDowzGEejaKK98qCyPBToK/szRDrSG3CEodexs=
X-Google-Smtp-Source: ABdhPJw+LTAqMkvYka/Q29Xqg6ZJBds1kOJ6qW207v+jy4c+1nbdWne2oC0h13nakwGaj7sRjMMfMg==
X-Received: by 2002:a17:902:b103:b0:156:c7bb:a852 with SMTP id q3-20020a170902b10300b00156c7bba852mr4923249plr.29.1649185928142;
        Tue, 05 Apr 2022 12:12:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v3-20020a056a00148300b004fb04acde5dsm16146364pfu.166.2022.04.05.12.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 12:12:07 -0700 (PDT)
Message-ID: <624c9487.1c69fb81.243ca.a45c@mx.google.com>
Date:   Tue, 05 Apr 2022 12:12:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220405
X-Kernelci-Report-Type: test
Subject: next/master baseline: 300 runs, 6 regressions (next-20220405)
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

next/master baseline: 300 runs, 6 regressions (next-20220405)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-C436FA-Flip-hatch     | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

hifive-unleashed-a00       | riscv  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =

imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m         | arm64  | lab-kontron   | gcc-10   | defconfig+=
crypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220405/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220405
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3ccc916812598a88b427859679ffd1641e67d4a2 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-C436FA-Flip-hatch     | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624c4c3586acb21d96ae06a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220405/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220405/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c4c3586acb21d96ae0=
6a2
        new failure (last pass: next-20220404) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00       | riscv  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/624c4c69226e72b218ae0687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220405/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220405/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c4c69226e72b218ae0=
688
        failing since 160 days (last pass: next-20211026, first fail: next-=
20211027) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/624c8a80369a9c028eae0699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220405/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220405/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c8a80369a9c028eae0=
69a
        new failure (last pass: next-20220404) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m         | arm64  | lab-kontron   | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/624c52640e85758490ae0696

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220405/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220405/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/624=
c52640e85758490ae06a9
        new failure (last pass: next-20220404)

    2022-04-05T14:29:43.927102  /lava-106079/1/../bin/lava-test-case
    2022-04-05T14:29:43.927399  <8>[   14.639602] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/624c540b057b2b0b19ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220405/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220405/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c540b057b2b0b19ae0=
67e
        failing since 55 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/624c541f057b2b0b19ae06d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220405/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220405/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c541f057b2b0b19ae0=
6d1
        failing since 55 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =20
