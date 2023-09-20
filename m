Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455CE7A75FF
	for <lists+linux-next@lfdr.de>; Wed, 20 Sep 2023 10:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbjITIhj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Sep 2023 04:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbjITIhi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Sep 2023 04:37:38 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2559390
        for <linux-next@vger.kernel.org>; Wed, 20 Sep 2023 01:37:32 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68fb85afef4so6066505b3a.1
        for <linux-next@vger.kernel.org>; Wed, 20 Sep 2023 01:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695199051; x=1695803851; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/2A8sh6VoTGP8IVze+jzcgGhyEvU8mJfEOscmMYr880=;
        b=C6S58KAoeNAM7D6brNirMxA0Yxj5QloofH2DIzG575plfNIbTjHNGxTT/tsRL5hDF2
         N1tVkd3vd2R81T6LXnaJaXMY2TywqYTUBtfF3IdMYMMLcxvM0Too5bb2C91hJaMO+IY5
         YcAXkit/9YVeoidw9m5qeAoCON2Dg+am2/1gMBoCnYOgmukBLqOQXyf51BsbrPIWJkn6
         +v1iWNkjl/Uz4sc6huoCb/158quof0YkJ4+nS4EX4dzNAcjwGk6RZ/Wb4bvD2x4rWUOa
         Q0LMGM80Kb202f/dR/ty1XexlZWqbUk0kwoksa+kT7He/TBxTKagL01ZoDVXeFGV2FLF
         7AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695199051; x=1695803851;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2A8sh6VoTGP8IVze+jzcgGhyEvU8mJfEOscmMYr880=;
        b=f3sSR2ed/ut7Y5Om5fgQonIbDLDswkn9ur1qctWX1tDI8TRN59r+751bGA1m8wtHGE
         ZR4/mnSWCu571hWU5jv6Qi54FoT+9f0m2XqDGygXHpzTtdmHTSuw+TL/F7ogTRmfOAEz
         q8NQpW+CiQrlLYaQdVFvywecujORdo9Yl6l0WSYp1yHKcpKsTGHbL41oQzVvUYFWvZAN
         /jIokFrl50vuzmLbPPoiLef9WmvdfD+/Qi7eQRMRtXIkgzka0wUb5iy2Yd9qcglBVGHI
         2J9HI9kRkULDev6GgqB06w9F17Z3nCJoo5T+UVSqUV1vJnN9qI7Q/TyLcH/YBs22K1gT
         oJvw==
X-Gm-Message-State: AOJu0YzOhqqZ6Ytm1fs8gJMO/FkWh+O0QIKy4ax9aYaSPlq/j9oO7YBj
        KefWnJEuEJecClnrPafkBnsglleLFmxlcWpCq91yyQ==
X-Google-Smtp-Source: AGHT+IFQXSKo+sqxzQSLAiOU5PP36vqrAV2u/VPNofcamXjzrmFdCrHfCBoQtsk58LNbH2tlOksITQ==
X-Received: by 2002:a05:6a20:974b:b0:14d:4126:b293 with SMTP id hs11-20020a056a20974b00b0014d4126b293mr1661903pzc.56.1695199051168;
        Wed, 20 Sep 2023 01:37:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l20-20020a170903005400b001c420afa03bsm10239951pla.109.2023.09.20.01.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 01:37:30 -0700 (PDT)
Message-ID: <650aaf4a.170a0220.12d2c.3b29@mx.google.com>
Date:   Wed, 20 Sep 2023 01:37:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc2-403-g51a4070c505b
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 53 runs,
 1 regressions (v6.6-rc2-403-g51a4070c505b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 53 runs, 1 regressions (v6.6-rc2-403-g51a4070c=
505b)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc2-403-g51a4070c505b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc2-403-g51a4070c505b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      51a4070c505b5b958250e95ce78e9c58c7043200 =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/650a7dcbfbfae02f2d8a0a8e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-40=
3-g51a4070c505b/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-40=
3-g51a4070c505b/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650a7dcbfbfae02f2d8a0a97
        failing since 15 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-20T05:06:07.740139  + set<8>[   27.708521] <LAVA_SIGNAL_ENDRUN =
0_dmesg 119289_1.5.2.4.1>
    2023-09-20T05:06:07.740639   +x
    2023-09-20T05:06:07.850785  / # #
    2023-09-20T05:06:09.013168  export SHELL=3D/bin/sh
    2023-09-20T05:06:09.018819  #
    2023-09-20T05:06:10.510935  / # export SHELL=3D/bin/sh. /lava-119289/en=
vironment
    2023-09-20T05:06:10.516602  =

    2023-09-20T05:06:13.229675  / # . /lava-119289/environment/lava-119289/=
bin/lava-test-runner /lava-119289/1
    2023-09-20T05:06:13.236477  =

    2023-09-20T05:06:13.244000  / # /lava-119289/bin/lava-test-runner /lava=
-119289/1 =

    ... (12 line(s) more)  =

 =20
