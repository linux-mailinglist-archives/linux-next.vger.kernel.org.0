Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAD57B76E7
	for <lists+linux-next@lfdr.de>; Wed,  4 Oct 2023 05:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbjJDDhv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Oct 2023 23:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbjJDDht (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Oct 2023 23:37:49 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B0EA7
        for <linux-next@vger.kernel.org>; Tue,  3 Oct 2023 20:37:44 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5859e22c7daso1099034a12.1
        for <linux-next@vger.kernel.org>; Tue, 03 Oct 2023 20:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696390664; x=1696995464; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SpprbXTZO94TePr4T3YNED+Jpzled+9NKbG0DWRL0O0=;
        b=QEpObSj8HTv8lCzu4d8m9ZccgnN+xPgY0WRVIudXNL2+5pLp08VGIn9xWCG8srj4jK
         m8416RjIF7dNAKETeLKYFmCtbSDb+I3Rl2C6KE3WvBZr/l0Xznt3lrgjSK77HJ0dqNWe
         +fSoNa33qK8d//3WjMDnejeUy0YKSy58lR3tzJCTEAS6TK46qyppfaZ2GIxWLemY+KRQ
         oB4/0cW5C27SAZnGime2ZvI5437fim6XmjhiWpJT1eSAKBQNKdssjzJ/17RII153yAQI
         bux0pcNQoxNQa1Zh8177w1Nl29HXeG584xXHD+B2er/bEKtNYk5rggPBLxJiq9ZUZKli
         W0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696390664; x=1696995464;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpprbXTZO94TePr4T3YNED+Jpzled+9NKbG0DWRL0O0=;
        b=UXy34oRGztRxU2jOJ+otKhi6C9cfDMNQ1EabvzzbtLUWlx4Waz5+5y9Mr0uOTRfJJs
         +VeFtLVSAafvq/fmHpiU0hCR1UbxWPmZFF6pzrpME3EChDnaob+PN633LMN6C+K1wS41
         2PgnpacU/Xgj9nLxZyAThAfIoKwwJ0mCfNox+XdOEtPsHAx9tfftOF6KYYcmkYja8oyy
         mH3rT6F0BgCcTGntUqKMSrBKdSSukgHBHwCuC/QAI27gVwhI3WqXr1TfoIQzLIh+KWFN
         KVRTpn0yiS/jKdsXd8kXpXNr5bFhJAo3Jth9ZUFfX6xXOPQKrDr0znw9CoIUUBG5FaW4
         i4Cg==
X-Gm-Message-State: AOJu0YyyPycK1Wc5soOy0ayIrlqSwj0dAgN4en8ueoc5H6FRIWZuXDiQ
        wykUYGmggMB0Bf/IPFMsevg1bt3lgnQ4COCiNrjghA==
X-Google-Smtp-Source: AGHT+IHjIGLl/bnnXwq1kOoDOk7CdNp5o1TT9UWimg5dSzKlM8RQ3M2GOQCSjjjK+XsGt72e3e0wtQ==
X-Received: by 2002:a17:90b:895:b0:279:47d0:d92a with SMTP id bj21-20020a17090b089500b0027947d0d92amr1181136pjb.17.1696390663483;
        Tue, 03 Oct 2023 20:37:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 102-20020a17090a09ef00b0026801e06ac1sm409951pjo.30.2023.10.03.20.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 20:37:42 -0700 (PDT)
Message-ID: <651cde06.170a0220.9346e.1326@mx.google.com>
Date:   Tue, 03 Oct 2023 20:37:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc4-304-g4bafb81eae31
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 34 runs,
 11 regressions (v6.6-rc4-304-g4bafb81eae31)
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

next/pending-fixes baseline: 34 runs, 11 regressions (v6.6-rc4-304-g4bafb81=
eae31)

Regressions Summary
-------------------

platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_arm-virt-gicv2      | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig | 1          =

qemu_arm-virt-gicv3      | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig | 1          =

qemu_i386                | i386   | lab-baylibre | gcc-10   | i386_defconfi=
g     | 1          =

qemu_i386-uefi           | i386   | lab-baylibre | gcc-10   | i386_defconfi=
g     | 1          =

qemu_riscv64             | riscv  | lab-baylibre | gcc-10   | defconfig    =
      | 1          =

qemu_smp8_riscv64        | riscv  | lab-baylibre | gcc-10   | defconfig    =
      | 1          =

qemu_x86_64              | x86_64 | lab-baylibre | gcc-10   | x86_64_defcon=
fig   | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre | gcc-10   | x86_64_defcon=
fig   | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre | gcc-10   | x86_64_defcon=
fig   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc4-304-g4bafb81eae31/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc4-304-g4bafb81eae31
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4bafb81eae31686d759aacc6243c8cb499496f2a =



Test Regressions
---------------- =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_arm-virt-gicv2      | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651cac621836e4c0eb8a0a49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651cac621836e4c0eb8a0=
a4a
        failing since 5 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651cac601836e4c0eb8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651cac601836e4c0eb8a0=
a43
        failing since 5 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_arm-virt-gicv3      | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651cac6174440c723d8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651cac6174440c723d8a0=
a43
        failing since 5 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651cac6374440c723d8a0a48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651cac6374440c723d8a0=
a49
        failing since 5 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_i386                | i386   | lab-baylibre | gcc-10   | i386_defconfi=
g     | 1          =


  Details:     https://kernelci.org/test/plan/id/651ca738f993a3f00a8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ca738f993a3f00a8a0=
a43
        failing since 5 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_i386-uefi           | i386   | lab-baylibre | gcc-10   | i386_defconfi=
g     | 1          =


  Details:     https://kernelci.org/test/plan/id/651ca7399c3d5ba1fd8a0a50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ca7399c3d5ba1fd8a0=
a51
        failing since 5 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_riscv64             | riscv  | lab-baylibre | gcc-10   | defconfig    =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/651ca969487035ab788a0a5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ca969487035ab788a0=
a60
        failing since 5 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_smp8_riscv64        | riscv  | lab-baylibre | gcc-10   | defconfig    =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/651ca96817e775bdb68a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ca96817e775bdb68a0=
a45
        failing since 5 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_x86_64              | x86_64 | lab-baylibre | gcc-10   | x86_64_defcon=
fig   | 1          =


  Details:     https://kernelci.org/test/plan/id/651ca816f467ebd5f68a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ca816f467ebd5f68a0=
a54
        failing since 5 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre | gcc-10   | x86_64_defcon=
fig   | 1          =


  Details:     https://kernelci.org/test/plan/id/651ca814ee32572eeb8a0a49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ca814ee32572eeb8a0=
a4a
        failing since 5 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
      | regressions
-------------------------+--------+--------------+----------+--------------=
------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre | gcc-10   | x86_64_defcon=
fig   | 1          =


  Details:     https://kernelci.org/test/plan/id/651ca815f467ebd5f68a0a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-30=
4-g4bafb81eae31/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ca815f467ebd5f68a0=
a50
        failing since 5 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =20
