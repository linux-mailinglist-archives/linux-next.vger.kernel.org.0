Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126AB7E69BD
	for <lists+linux-next@lfdr.de>; Thu,  9 Nov 2023 12:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjKILfF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Nov 2023 06:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjKILfF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Nov 2023 06:35:05 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DFB2D69
        for <linux-next@vger.kernel.org>; Thu,  9 Nov 2023 03:35:03 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc3bc5df96so6311005ad.2
        for <linux-next@vger.kernel.org>; Thu, 09 Nov 2023 03:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699529702; x=1700134502; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GZGPiE70BCh3M7BJNg3I4P8gPq4vXFuR69e/FMEZiFU=;
        b=gDD7K6waOqGdrNr45uNmyypqP8sxHdNdb84lARdy6wNHam5p2Rwc1sccZlIlrnTucW
         2gyrAtd3g5Ifbgt2d6zO2vStzqG1ytaOOygvRu3mZsi2JshLO2OWrfCwdsxXoBJl94NU
         n21kwvIq6dO8FetXs39iV2Xgsa3EcpACjsJVeYR0Cwj4e0CAUff0APEUSLkWwvpZ0U34
         7M+2lohDG23MozNm/VkyUxIDTQPHlqCCRR+I3j0xNeVWHfOYJaVM65d+RRk5a7b4Rog0
         3vOtO5UJ0qPMCY1dRuhbwzz+mwxtmTEaU3OsokhnLgW1tPcL6l3EX5HVjGw7ZCG/UCc+
         c/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529702; x=1700134502;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZGPiE70BCh3M7BJNg3I4P8gPq4vXFuR69e/FMEZiFU=;
        b=X4kEd7m5Br2UvAzhPd8FobaL6P2E8Et4HJuG8L7I2NPEuF/FSp6zEkDfbtWV0PSZey
         83fN6XvbUmwxoY3WWZS9AmzVFVxw2pc+/Xas918v5ziZeCTI8i1B24LUGLOOhyqTgGnO
         1kEPNVYSD7KOi9t/GdB5lDR7YfQjthlKXsXAr4pFK+DgoL+7A6UpXIb0OKPyNHtfMX86
         0tS447Bt0RolEyZcYIw9h/5oYuF+Awkk+Pt6NKBjcxWAK03hA2nG5heu4fx4BElbOZHy
         nWklpwq57YIl/HFN4N91KetQgbJXZCeee7UyAjuX417xOJlVFNRqFt9fSDCGPy0utTKX
         xVQg==
X-Gm-Message-State: AOJu0YyZLZb8mlK3i69Bwoa6rSQLzD6MYegQxNtpGvysksX6ntVroMCI
        80vpyW4cDc6Y9v4diL1V+g8GBOoakw/iyS4ooHd56w==
X-Google-Smtp-Source: AGHT+IH/eftvB969/BgZw8VTj/cJwtmTOmfWlRcnwfqBbXk1UYc1ne3c8y74rEjBjFltM6Yb1nA7kQ==
X-Received: by 2002:a17:902:f684:b0:1cc:51d6:fafe with SMTP id l4-20020a170902f68400b001cc51d6fafemr5250342plg.5.1699529702216;
        Thu, 09 Nov 2023 03:35:02 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001c73f3a9b88sm3331321plb.110.2023.11.09.03.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:35:01 -0800 (PST)
Message-ID: <654cc3e5.170a0220.b8f2f.9c48@mx.google.com>
Date:   Thu, 09 Nov 2023 03:35:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231109
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 278 runs, 3 regressions (next-20231109)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 278 runs, 3 regressions (next-20231109)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
                  | 1          =

qemu_mips-malta          | mips  | lab-collabora   | gcc-10   | malta_defco=
nfig              | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231109/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231109
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b622d91ca201bf97582e9b09ebbaab005ecee86f =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/654c8628a6e22404cfefcefe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231109/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231109/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654c8628a6e22404cfefc=
eff
        new failure (last pass: next-20231102) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_mips-malta          | mips  | lab-collabora   | gcc-10   | malta_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/654c8da178210b852befcef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231109/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231109/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654c8da178210b852befc=
ef7
        new failure (last pass: next-20231106) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/654c8b7250d326e2ffefcef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/654c8b7250d326e2ffefcefc
        failing since 100 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-11-09T07:33:38.689308  + set +x
    2023-11-09T07:33:38.692530  <8>[   28.449066] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1035400_1.5.2.4.1>
    2023-11-09T07:33:38.799090  / # #
    2023-11-09T07:33:40.257083  export SHELL=3D/bin/sh
    2023-11-09T07:33:40.277804  #
    2023-11-09T07:33:40.278211  / # export SHELL=3D/bin/sh
    2023-11-09T07:33:42.227627  / # . /lava-1035400/environment
    2023-11-09T07:33:45.813836  /lava-1035400/bin/lava-test-runner /lava-10=
35400/1
    2023-11-09T07:33:45.835141  . /lava-1035400/environment
    2023-11-09T07:33:45.835513  / # /lava-1035400/bin/lava-test-runner /lav=
a-1035400/1 =

    ... (27 line(s) more)  =

 =20
