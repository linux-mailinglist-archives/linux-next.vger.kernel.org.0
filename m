Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1E97A44EE
	for <lists+linux-next@lfdr.de>; Mon, 18 Sep 2023 10:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbjIRIjo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Sep 2023 04:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234644AbjIRIjR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Sep 2023 04:39:17 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F74FAD
        for <linux-next@vger.kernel.org>; Mon, 18 Sep 2023 01:39:11 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68fc1bbc94eso3704734b3a.3
        for <linux-next@vger.kernel.org>; Mon, 18 Sep 2023 01:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695026350; x=1695631150; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RD0j84tHE+b/8l9OEwba5K2PDjNzomM2InCaVm1wR90=;
        b=SJXKobtaKOEvHREGvj0f2yicGEkEXr/ubmU5jHulocJqtehMCbqkjSMqdj97UM7+Qo
         tyxhdTX97mMAKaNI9LzGQSgr4+Hb6o3dFa6O88I1203pFugvSEN7g9AP1g7wPsFLcDIu
         zSEjxY2HG63NMXetvw8w4gK89k86d9TNWjVjAoI2Kn4xB1gNTZtv/5LoK990bbwk9Qnc
         AoQ488kwZSea9o8CLCelf2BWTPye1epk48N96EsDprPpYTXTtp8cRX91k4MnplPqRtob
         rx63ZSdUcNWr++e+a9ekV+YAD1G/Z/QBKtEB+i8aFoI9uFc24BtGNW0byw0qAHEQsxVD
         dMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695026350; x=1695631150;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RD0j84tHE+b/8l9OEwba5K2PDjNzomM2InCaVm1wR90=;
        b=c0nsdFLzDYL8Fn53FKdLcRjJOxNGDEDm2p8bf8nyDlLjDCCpGLJKVdZqbDdjoh3o1T
         f+Llxcs2KYa6eAeBlEG5bPQT6E7SnbqhRztA/RBlIFXlEQAQqX7WTf7nH9/nK1uTy6d1
         LyuYEIaXLKlifgZdzp7f70A1Zv0AjyZGhg9cA3qflrXzqwJBsaQc1Qaoz1/bQ69rFtNP
         JngbiK6rAQO46s9qz+3JMKbqTfGIw3o0tm5sbUSrhzHsq79OXIIpmeH/j7xevA7PRSmN
         1OTVISX/pnvcxPa5i0Gl3FaQYKXFMuqsbbd0vl5+sZecDBkJr3oCFTKc9moMppD1HPhm
         zXRA==
X-Gm-Message-State: AOJu0Yxm3Cw0aIt2X4Hchey/f3z1/WOOzvNJlMcOri776ZimcmwFlBQ6
        2bl29tJySb4GWdIEoRv/IvIVPd0AnIuoX5l+flzywA==
X-Google-Smtp-Source: AGHT+IGdoTRlMld0fy2YliCuqTUGqtk5LyqSTefYeEXMvBwpdnR4dNYRXLtdAT/OhcDnnkwu9d3B2g==
X-Received: by 2002:a05:6a00:1588:b0:68a:5e5b:e450 with SMTP id u8-20020a056a00158800b0068a5e5be450mr10607416pfk.26.1695026350576;
        Mon, 18 Sep 2023 01:39:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a8-20020a62bd08000000b0068a0b5df6b2sm6703140pff.196.2023.09.18.01.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 01:39:09 -0700 (PDT)
Message-ID: <65080cad.620a0220.5ac6e.6fe7@mx.google.com>
Date:   Mon, 18 Sep 2023 01:39:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc2-351-g529304bb5b40
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 51 runs,
 2 regressions (v6.6-rc2-351-g529304bb5b40)
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

next/pending-fixes baseline: 51 runs, 2 regressions (v6.6-rc2-351-g529304bb=
5b40)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =

imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc2-351-g529304bb5b40/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc2-351-g529304bb5b40
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      529304bb5b40818cadc0ab9c7a41035528c5e4df =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6507daea77a7aec3b18a0aaf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-35=
1-g529304bb5b40/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-35=
1-g529304bb5b40/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6507daea77a7aec3b18a0=
ab0
        new failure (last pass: v6.6-rc1-445-g66b45e71c969) =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6507db0c155fd59b038a0a45

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-35=
1-g529304bb5b40/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-35=
1-g529304bb5b40/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6507db0c155fd59b038a0a4e
        failing since 13 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-18T05:07:06.225560  + set<8>[   27.572530] <LAVA_SIGNAL_ENDRUN =
0_dmesg 114233_1.5.2.4.1>
    2023-09-18T05:07:06.226039   +x
    2023-09-18T05:07:06.334627  / # #
    2023-09-18T05:07:07.497414  export SHELL=3D/bin/sh
    2023-09-18T05:07:07.503360  #
    2023-09-18T05:07:08.996929  / # export SHELL=3D/bin/sh. /lava-114233/en=
vironment
    2023-09-18T05:07:09.003018  =

    2023-09-18T05:07:11.723031  / # . /lava-114233/environment/lava-114233/=
bin/lava-test-runner /lava-114233/1
    2023-09-18T05:07:11.729782  =

    2023-09-18T05:07:11.745100  / # /lava-114233/bin/lava-test-runner /lava=
-114233/1 =

    ... (12 line(s) more)  =

 =20
