Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5247E1A35
	for <lists+linux-next@lfdr.de>; Mon,  6 Nov 2023 07:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjKFGXm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Nov 2023 01:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbjKFGXj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Nov 2023 01:23:39 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636B2D61
        for <linux-next@vger.kernel.org>; Sun,  5 Nov 2023 22:23:36 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc2f17ab26so27736665ad.0
        for <linux-next@vger.kernel.org>; Sun, 05 Nov 2023 22:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699251815; x=1699856615; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O99L/i9V17A5s9CkOiWI6jFO6i+W4p6jFtQhYkg0rno=;
        b=u6qz+Vp+zLf+RRBsVgwFZdD9SyjGtywXXhMIrRtzM7Wo06sP3W30Qfcqv6VL0uV9kX
         3QCdQRzue1MOqMBFHYNaCWPfR9ypwU6XwqPCeS2SbfmUicotvGtZYXOxAOkrku9wHIZr
         NNeOqr+lDMnFhg+chXfRMJdCWoD3m+KKOCUAvYs14y7mKvmEioJnQiVBIHLucIRXj0+1
         VQnuV1Ibq/1ludT1BbzaY+LA3w/7kKBab6LGpsNqiwBg2e32GAvRuGDG1Cz29AM2ZdrG
         ai5AGwEYimtEae0fKgurnUUXMu5sYnPyCPjvGWhaCfi7660CAkKKyQeTh+Pjkh5cp7fb
         c8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699251815; x=1699856615;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O99L/i9V17A5s9CkOiWI6jFO6i+W4p6jFtQhYkg0rno=;
        b=TB4+tie4sqStWv7JGcoL/Z5DbRt8DohcyJ+Me8HeaV5HdLdu/zh2J92QIw3P1j8a1c
         tqSXGFbygyjnvwi03LHc1mGx4WN1hCFUyBa5+r0wyirFcC/8kE1cTogt42xeejuSvpRv
         DBp7kw1TnWiLZUJTGtCH1/rJRntkfPRtp5u6+nUU3oN195H1wnIXlaeWONApQhg7PNiC
         /6b+Idi3YmvLRxXq3f/0yWLvs80uEvYbBYb8I6hn3tVInyj/VOxYqDsQsLuiOsE3Az9t
         BKBcKQhmSYQfn8LQyxBAOyjcKfDmxnsTBsVKAJv35cu6IAiZ7j5haVWjlObCNh4eHByz
         Cpzg==
X-Gm-Message-State: AOJu0YxgZuOnDePHLa63b0n7JtCWq9x+W7FUrKDeK/u8VD9Ps9psUMwV
        5qrRd3m3cZN2hmzYEj47V53eJ5tinZ5bieNQFVdGdw==
X-Google-Smtp-Source: AGHT+IFk+p5oZEI8n6oMiNkpjPowodmRZmoH96KiBWwwbUybikxaqD0SDat2z+wpUZVgr2cQCI3zoA==
X-Received: by 2002:a17:902:ecc5:b0:1cc:54cc:2fc1 with SMTP id a5-20020a170902ecc500b001cc54cc2fc1mr17115904plh.65.1699251815263;
        Sun, 05 Nov 2023 22:23:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c4-20020a170903234400b001cc31dcec49sm5084302plh.146.2023.11.05.22.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 22:23:34 -0800 (PST)
Message-ID: <65488666.170a0220.baccd.ac7d@mx.google.com>
Date:   Sun, 05 Nov 2023 22:23:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231106
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 388 runs, 8 regressions (next-20231106)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 388 runs, 8 regressions (next-20231106)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_i386-uefi             | i386  | lab-broonie     | gcc-10   | i386_defc=
onfig+debug         | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-10   | defconfig=
+videodec           | 1          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231106/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231106
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3ff7a5781ceee3befb9224d29cef6e6a4766c5fe =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6548519960c2775ac2efcf7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6548519960c2775ac2efc=
f7d
        failing since 2 days (last pass: next-20231102, first fail: next-20=
231103) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/654851d3baeb460f58efcf00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654851d3baeb460f58efc=
f01
        new failure (last pass: next-20231101) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/654851e3f1ce02c88aefcf12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654851e3f1ce02c88aefc=
f13
        new failure (last pass: next-20231101) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/654851d10c9e4c0e55efcf20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654851d10c9e4c0e55efc=
f21
        new failure (last pass: next-20231101) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/654851e2baeb460f58efcf66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654851e2baeb460f58efc=
f67
        new failure (last pass: next-20231101) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-broonie     | gcc-10   | i386_defc=
onfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/65484ad2f3e80e2904efcf06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231106/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231106/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65484ad2f3e80e2904efc=
f07
        new failure (last pass: next-20231103) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6548594f195877bc14efcef7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6548594f195877bc14efcf00
        failing since 89 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-11-06T03:10:56.735091  + set +x
    2023-11-06T03:10:56.738295  <8>[   28.337788] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1034140_1.5.2.4.1>
    2023-11-06T03:10:56.844631  / # #
    2023-11-06T03:10:58.299130  export SHELL=3D/bin/sh
    2023-11-06T03:10:58.319624  #
    2023-11-06T03:10:58.319848  / # export SHELL=3D/bin/sh
    2023-11-06T03:11:00.264815  / # . /lava-1034140/environment
    2023-11-06T03:11:03.843350  /lava-1034140/bin/lava-test-runner /lava-10=
34140/1
    2023-11-06T03:11:03.863907  . /lava-1034140/environment
    2023-11-06T03:11:03.864033  / # /lava-1034140/bin/lava-test-runner /lav=
a-1034140/1 =

    ... (27 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65484dd0369f347686efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65484dd0369f347686efc=
ef4
        new failure (last pass: next-20231103) =

 =20
