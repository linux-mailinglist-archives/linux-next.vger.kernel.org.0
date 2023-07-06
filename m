Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 002407494F6
	for <lists+linux-next@lfdr.de>; Thu,  6 Jul 2023 07:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbjGFFTQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Jul 2023 01:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjGFFTP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jul 2023 01:19:15 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D620219B
        for <linux-next@vger.kernel.org>; Wed,  5 Jul 2023 22:19:12 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5577905ef38so96020a12.0
        for <linux-next@vger.kernel.org>; Wed, 05 Jul 2023 22:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688620752; x=1691212752;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2UnTyOMjmM9vIoZ5zBk3K32DyhgfkzsAiPxHNC7gLHA=;
        b=WyX9v7b7VPKHghHK0fbI/vJdW23nG90gyvlYdG//jP2n2fnH+e4n0PrArKt4Kuo9vt
         Ueg2ZLkMk7S2r8+Ibp5vxsU7KjO09tCURsrvF+75f/1TsGHMYKIbt7lgiVl/0eV1Pyp0
         ilEuf4XBAqWgjcZXa5wy+PBAuoIIvGtxVEMCrz0v7rHIL5+JgcpORgZM0QFFZuaDzckB
         7HPVONIqlIotcct27tiRrbKWMH5ojP+6CL89FOqOU4PDX+oyRQyc6xlw/SErVaeVpTTB
         zDp4i7l0uBTXSbrKJdzr3UwWuA3wfM6ik4viNrYaoBEIXCsJHDFFimTfckFDcWSilIcP
         ChKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688620752; x=1691212752;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UnTyOMjmM9vIoZ5zBk3K32DyhgfkzsAiPxHNC7gLHA=;
        b=aEOvt7v7NeZeLxnI79qk67C4TfhzccjOHe8dPoqRfWXaYvI0VpvdKmxssngdrB/DW+
         B1FEafDwMvAk0DLQW4KseYW88nbNN0uMZAAte2tjCjB9jyfS3tcc3UkwfQixUqd7m/rY
         DlhYAdg9y5bdcOqHMaSjX78a8OeUmm3qP/oct62IBgwamXJADXZk28hvvCQ55tysN8GQ
         fb+W8gM6ZWaLcybkScLh7SVo1bpgXQYtG1xLIGMhtLW32t7fHg/uPRaioI5x80gf23dv
         jM+MFr0FUyNHyPwMMCl6p7Oy2YRW93Mm/gFLURZGrueUKGO3s7FKFfs312QMcVHZzc3M
         ALDg==
X-Gm-Message-State: ABy/qLarwnZmwjgmQW06rKrYHDj1UBWFXGAyXmC+7mmcQedkNnDG6LZh
        cbqxdVxCudAG8qN1OxvfwVLS1wJis+yPtydfI31ung==
X-Google-Smtp-Source: APBJJlEcP9poNS3DRzYhrOY5TnKBJvDuTtszefHHQib8fLIo+dAaPKXsgSDjwhVwX1uvbC/8S1AYow==
X-Received: by 2002:a05:6a20:b284:b0:12e:5d45:82e0 with SMTP id ei4-20020a056a20b28400b0012e5d4582e0mr696811pzb.29.1688620750820;
        Wed, 05 Jul 2023 22:19:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902eac600b001b1c4d875f5sm399915pld.44.2023.07.05.22.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 22:19:10 -0700 (PDT)
Message-ID: <64a64ece.170a0220.be77d.0d52@mx.google.com>
Date:   Wed, 05 Jul 2023 22:19:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.4-12115-gc3dae9b3ad97
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 175 runs,
 15 regressions (v6.4-12115-gc3dae9b3ad97)
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

next/pending-fixes baseline: 175 runs, 15 regressions (v6.4-12115-gc3dae9b3=
ad97)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-12115-gc3dae9b3ad97/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-12115-gc3dae9b3ad97
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c3dae9b3ad970aea1e47295d0f2d913f676ff3ba =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a61cb0141c00e21cbb2a95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-acer-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-acer-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a61cb0141c00e21cbb2=
a96
        failing since 1 day (last pass: v6.4-11141-g4556f2dbce0d, first fai=
l: v6.4-11652-gcd77f0c9fecc) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6199ca18378311ebb2a9d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a6199ca18378311ebb2aa2
        failing since 99 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:31:56.019023  <8>[   10.399683] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11024263_1.4.2.3.1>

    2023-07-06T01:31:56.022734  + set +x

    2023-07-06T01:31:56.124001  #

    2023-07-06T01:31:56.124398  =


    2023-07-06T01:31:56.224974  / # #export SHELL=3D/bin/sh

    2023-07-06T01:31:56.225199  =


    2023-07-06T01:31:56.325840  / # export SHELL=3D/bin/sh. /lava-11024263/=
environment

    2023-07-06T01:31:56.326056  =


    2023-07-06T01:31:56.426566  / # . /lava-11024263/environment/lava-11024=
263/bin/lava-test-runner /lava-11024263/1

    2023-07-06T01:31:56.426903  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a61c6cd35ade37e7bb2a93

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a61c6cd35ade37e7bb2a98
        failing since 99 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:44:05.470907  + set +x

    2023-07-06T01:44:05.477413  <8>[   10.888624] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11024400_1.4.2.3.1>

    2023-07-06T01:44:05.583056  #

    2023-07-06T01:44:05.683907  / # #export SHELL=3D/bin/sh

    2023-07-06T01:44:05.684089  =


    2023-07-06T01:44:05.784597  / # export SHELL=3D/bin/sh. /lava-11024400/=
environment

    2023-07-06T01:44:05.784790  =


    2023-07-06T01:44:05.885314  / # . /lava-11024400/environment/lava-11024=
400/bin/lava-test-runner /lava-11024400/1

    2023-07-06T01:44:05.885645  =


    2023-07-06T01:44:05.891124  / # /lava-11024400/bin/lava-test-runner /la=
va-11024400/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a619a5522479ac50bb2a99

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a619a5522479ac50bb2a9e
        failing since 99 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:32:11.235622  + set<8>[    9.028496] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11024308_1.4.2.3.1>

    2023-07-06T01:32:11.235731   +x

    2023-07-06T01:32:11.340210  / # #

    2023-07-06T01:32:11.440925  export SHELL=3D/bin/sh

    2023-07-06T01:32:11.441200  #

    2023-07-06T01:32:11.541709  / # export SHELL=3D/bin/sh. /lava-11024308/=
environment

    2023-07-06T01:32:11.541914  =


    2023-07-06T01:32:11.642467  / # . /lava-11024308/environment/lava-11024=
308/bin/lava-test-runner /lava-11024308/1

    2023-07-06T01:32:11.642780  =


    2023-07-06T01:32:11.647837  / # /lava-11024308/bin/lava-test-runner /la=
va-11024308/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a61c756490c161f2bb2a90

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a61c756490c161f2bb2a95
        failing since 99 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:44:16.499816  + set<8>[   11.400154] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11024424_1.4.2.3.1>

    2023-07-06T01:44:16.500248   +x

    2023-07-06T01:44:16.607581  / # #

    2023-07-06T01:44:16.709882  export SHELL=3D/bin/sh

    2023-07-06T01:44:16.710590  #

    2023-07-06T01:44:16.811966  / # export SHELL=3D/bin/sh. /lava-11024424/=
environment

    2023-07-06T01:44:16.812689  =


    2023-07-06T01:44:16.914289  / # . /lava-11024424/environment/lava-11024=
424/bin/lava-test-runner /lava-11024424/1

    2023-07-06T01:44:16.915443  =


    2023-07-06T01:44:16.920131  / # /lava-11024424/bin/lava-test-runner /la=
va-11024424/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a619a851311b04dabb2a8c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a619a851311b04dabb2a91
        failing since 99 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:32:07.327261  <8>[   12.612922] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11024239_1.4.2.3.1>

    2023-07-06T01:32:07.330406  + set +x

    2023-07-06T01:32:07.432068  #

    2023-07-06T01:32:07.432845  =


    2023-07-06T01:32:07.534020  / # #export SHELL=3D/bin/sh

    2023-07-06T01:32:07.534963  =


    2023-07-06T01:32:07.636441  / # export SHELL=3D/bin/sh. /lava-11024239/=
environment

    2023-07-06T01:32:07.636687  =


    2023-07-06T01:32:07.737257  / # . /lava-11024239/environment/lava-11024=
239/bin/lava-test-runner /lava-11024239/1

    2023-07-06T01:32:07.737662  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a61c637537d8fc0ebb2a7b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a61c637537d8fc0ebb2a80
        failing since 99 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:43:44.062550  <8>[    8.431774] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11024410_1.4.2.3.1>

    2023-07-06T01:43:44.066110  + set +x

    2023-07-06T01:43:44.171286  #

    2023-07-06T01:43:44.273878  / # #export SHELL=3D/bin/sh

    2023-07-06T01:43:44.274673  =


    2023-07-06T01:43:44.376125  / # export SHELL=3D/bin/sh. /lava-11024410/=
environment

    2023-07-06T01:43:44.376816  =


    2023-07-06T01:43:44.478310  / # . /lava-11024410/environment/lava-11024=
410/bin/lava-test-runner /lava-11024410/1

    2023-07-06T01:43:44.479423  =


    2023-07-06T01:43:44.484394  / # /lava-11024410/bin/lava-test-runner /la=
va-11024410/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6198927142221d3bb2abb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a6198927142221d3bb2ac0
        failing since 99 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:31:50.400969  + set +x

    2023-07-06T01:31:50.407504  <8>[    8.030968] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11024292_1.4.2.3.1>

    2023-07-06T01:31:50.511942  / # #

    2023-07-06T01:31:50.612610  export SHELL=3D/bin/sh

    2023-07-06T01:31:50.612850  #

    2023-07-06T01:31:50.713407  / # export SHELL=3D/bin/sh. /lava-11024292/=
environment

    2023-07-06T01:31:50.713668  =


    2023-07-06T01:31:50.814262  / # . /lava-11024292/environment/lava-11024=
292/bin/lava-test-runner /lava-11024292/1

    2023-07-06T01:31:50.814588  =


    2023-07-06T01:31:50.819320  / # /lava-11024292/bin/lava-test-runner /la=
va-11024292/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a61ce643f07f03aebb2a9f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a61ce643f07f03aebb2aa4
        failing since 99 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:46:05.190259  + set +x

    2023-07-06T01:46:05.196716  <8>[   10.357561] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11024415_1.4.2.3.1>

    2023-07-06T01:46:05.304804  / # #

    2023-07-06T01:46:05.407080  export SHELL=3D/bin/sh

    2023-07-06T01:46:05.407793  #

    2023-07-06T01:46:05.509417  / # export SHELL=3D/bin/sh. /lava-11024415/=
environment

    2023-07-06T01:46:05.510148  =


    2023-07-06T01:46:05.611680  / # . /lava-11024415/environment/lava-11024=
415/bin/lava-test-runner /lava-11024415/1

    2023-07-06T01:46:05.612996  =


    2023-07-06T01:46:05.617963  / # /lava-11024415/bin/lava-test-runner /la=
va-11024415/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6198427142221d3bb2a9f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a6198427142221d3bb2aa4
        failing since 99 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:31:38.253882  + set<8>[   10.718559] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11024259_1.4.2.3.1>

    2023-07-06T01:31:38.253994   +x

    2023-07-06T01:31:38.356215  /#

    2023-07-06T01:31:38.457132   # #export SHELL=3D/bin/sh

    2023-07-06T01:31:38.457368  =


    2023-07-06T01:31:38.557927  / # export SHELL=3D/bin/sh. /lava-11024259/=
environment

    2023-07-06T01:31:38.558148  =


    2023-07-06T01:31:38.658701  / # . /lava-11024259/environment/lava-11024=
259/bin/lava-test-runner /lava-11024259/1

    2023-07-06T01:31:38.659055  =


    2023-07-06T01:31:38.664557  / # /lava-11024259/bin/lava-test-runner /la=
va-11024259/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a61c611985102508bb2a85

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a61c611985102508bb2a8a
        failing since 99 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:43:58.896678  + set +x<8>[   10.167605] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11024418_1.4.2.3.1>

    2023-07-06T01:43:58.896777  =


    2023-07-06T01:43:58.998352  #

    2023-07-06T01:43:59.099154  / # #export SHELL=3D/bin/sh

    2023-07-06T01:43:59.099368  =


    2023-07-06T01:43:59.199946  / # export SHELL=3D/bin/sh. /lava-11024418/=
environment

    2023-07-06T01:43:59.200175  =


    2023-07-06T01:43:59.300676  / # . /lava-11024418/environment/lava-11024=
418/bin/lava-test-runner /lava-11024418/1

    2023-07-06T01:43:59.300998  =


    2023-07-06T01:43:59.305617  / # /lava-11024418/bin/lava-test-runner /la=
va-11024418/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6199dab311082b2bb2aa0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a6199dab311082b2bb2aa5
        failing since 99 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:31:52.260196  + set<8>[   11.190679] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11024271_1.4.2.3.1>

    2023-07-06T01:31:52.260311   +x

    2023-07-06T01:31:52.365031  / # #

    2023-07-06T01:31:52.465750  export SHELL=3D/bin/sh

    2023-07-06T01:31:52.465983  #

    2023-07-06T01:31:52.566535  / # export SHELL=3D/bin/sh. /lava-11024271/=
environment

    2023-07-06T01:31:52.566758  =


    2023-07-06T01:31:52.667318  / # . /lava-11024271/environment/lava-11024=
271/bin/lava-test-runner /lava-11024271/1

    2023-07-06T01:31:52.667661  =


    2023-07-06T01:31:52.671969  / # /lava-11024271/bin/lava-test-runner /la=
va-11024271/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a61c654ff617fbf3bb2a87

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a61c654ff617fbf3bb2a8c
        failing since 99 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:43:53.315297  + set<8>[   11.560493] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11024381_1.4.2.3.1>

    2023-07-06T01:43:53.315384   +x

    2023-07-06T01:43:53.418927  / # #

    2023-07-06T01:43:53.519603  export SHELL=3D/bin/sh

    2023-07-06T01:43:53.519832  #

    2023-07-06T01:43:53.620625  / # export SHELL=3D/bin/sh. /lava-11024381/=
environment

    2023-07-06T01:43:53.621363  =


    2023-07-06T01:43:53.722746  / # . /lava-11024381/environment/lava-11024=
381/bin/lava-test-runner /lava-11024381/1

    2023-07-06T01:43:53.723106  =


    2023-07-06T01:43:53.728166  / # /lava-11024381/bin/lava-test-runner /la=
va-11024381/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a61993a18378311ebb2a75

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a61993a18378311ebb2a7a
        failing since 99 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:32:00.623131  + <8>[   11.908285] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11024231_1.4.2.3.1>

    2023-07-06T01:32:00.623220  set +x

    2023-07-06T01:32:00.727929  / # #

    2023-07-06T01:32:00.828915  export SHELL=3D/bin/sh

    2023-07-06T01:32:00.829215  #

    2023-07-06T01:32:00.929874  / # export SHELL=3D/bin/sh. /lava-11024231/=
environment

    2023-07-06T01:32:00.930117  =


    2023-07-06T01:32:01.030692  / # . /lava-11024231/environment/lava-11024=
231/bin/lava-test-runner /lava-11024231/1

    2023-07-06T01:32:01.031076  =


    2023-07-06T01:32:01.035831  / # /lava-11024231/bin/lava-test-runner /la=
va-11024231/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a61c586d95348bc2bb2a7e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12115-=
gc3dae9b3ad97/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a61c586d95348bc2bb2a83
        failing since 99 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-06T01:43:46.403094  + <8>[   11.216607] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11024431_1.4.2.3.1>

    2023-07-06T01:43:46.403189  set +x

    2023-07-06T01:43:46.507526  / # #

    2023-07-06T01:43:46.608212  export SHELL=3D/bin/sh

    2023-07-06T01:43:46.608406  #

    2023-07-06T01:43:46.708936  / # export SHELL=3D/bin/sh. /lava-11024431/=
environment

    2023-07-06T01:43:46.709124  =


    2023-07-06T01:43:46.809645  / # . /lava-11024431/environment/lava-11024=
431/bin/lava-test-runner /lava-11024431/1

    2023-07-06T01:43:46.809920  =


    2023-07-06T01:43:46.815217  / # /lava-11024431/bin/lava-test-runner /la=
va-11024431/1
 =

    ... (12 line(s) more)  =

 =20
