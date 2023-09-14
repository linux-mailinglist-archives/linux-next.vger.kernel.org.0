Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C20F79FD52
	for <lists+linux-next@lfdr.de>; Thu, 14 Sep 2023 09:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbjINHh4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Sep 2023 03:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232903AbjINHhz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Sep 2023 03:37:55 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC8CF3
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 00:37:51 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68fb98745c1so488227b3a.1
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694677070; x=1695281870; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiLDUZ5R4lAe64/YKwDEw4ZLY1kDB7BktvjnKKwFfkE=;
        b=G8ZfLqk1X7rLWbY3EyqFbTjtSoQr0D95nAaNZzDeXPg7Cv8c58O8y679E7CU0SXMUK
         b70WMAlTzKzfQHiPn2ZQ/7lo1mv57b+2O47BFMM/nFV3JXJocqg/+IBQfwSNwtXPPS8Y
         X+xf0CsAzogckxQiJYNymGYrr1b8O3E9Bs/+jaBKfEJnb1OcTKvrMYBKCMuv9LZDH2xQ
         /PC6sT1O5i+xwepG/hriFoGdkib7nexZoKGeFos4xF3JfleMGqIYnQGuzv1DvMX0mnev
         CUxvdJVi1Z/tamhT9ZmvR6hnZVlgkM5D51aYzSPFdHqWjL3Ar0CtJ6Q9DVBwgcGl2zd+
         E/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694677070; x=1695281870;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiLDUZ5R4lAe64/YKwDEw4ZLY1kDB7BktvjnKKwFfkE=;
        b=OD6wy6s5/mSxFxCfKQ6+4mCIyQdse1NAaPNEmP3nlcpqcXujqfz1p6AmpZY9Rj8HAt
         n4wEHsHrHOPD6Nw9QureayRFSzXCZX0H+cvmUlH15E4ZiducfmNDW1kvIN8I4KZiUvkf
         800CUoXZZQRcYrycxAOxHvZ+utCrH1/YUwX6VotpOFtaHw87Rm75SkTatRYRp5E/JFDB
         0B7wJUuJkYBWp+z0dpfIG6+Oljm0fjgAY6WbKfKUuiTNrz8RyxDnG3/EfPmymWW7URdM
         sIvv5IF2bTAOaOhKOZJqxEIBT6Q+8Y9VVYQUkOCkMhNQbNITuOKhOKgtdVXhwgJX/08h
         MEow==
X-Gm-Message-State: AOJu0YzZCBx5QaVm8bJ601k3C2dbcP7YI0ba1a7XuU9fXeFBRVM3DrBG
        0Y1T03Bn2Su9whNiFvc+CtWN18gHuECrlIHyEtA=
X-Google-Smtp-Source: AGHT+IEne9SWMAHn50b9f5pWeC4Aikc4DXQIpvBGb0QyXmp7Y+o4JvRZi6xWr5QxMgxqk2ExkYkLog==
X-Received: by 2002:a05:6a20:b70a:b0:154:fb34:5f23 with SMTP id fg10-20020a056a20b70a00b00154fb345f23mr4025255pzb.8.1694677070363;
        Thu, 14 Sep 2023 00:37:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x20-20020a170902ea9400b001bb28b9a40dsm870350plb.11.2023.09.14.00.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 00:37:49 -0700 (PDT)
Message-ID: <6502b84d.170a0220.80569.3642@mx.google.com>
Date:   Thu, 14 Sep 2023 00:37:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc1-377-gbcfe98207530
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 52 runs,
 1 regressions (v6.6-rc1-377-gbcfe98207530)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 52 runs, 1 regressions (v6.6-rc1-377-gbcfe9820=
7530)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc1-377-gbcfe98207530/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc1-377-gbcfe98207530
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bcfe98207530e1ea0004f4e5dbd6e7e4d9eb2471 =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6502870688251107fd8a0a87

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc1-37=
7-gbcfe98207530/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc1-37=
7-gbcfe98207530/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6502870688251107fd8a0a90
        failing since 9 days (last pass: v6.5-5353-gb22935905f9c, first fai=
l: v6.5-12059-g16fdf769151b)

    2023-09-14T04:07:09.431376  + set<8>[   29.622709] <LAVA_SIGNAL_ENDRUN =
0_dmesg 106605_1.5.2.4.1>
    2023-09-14T04:07:09.431968   +x
    2023-09-14T04:07:09.540554  / # #
    2023-09-14T04:07:10.706469  export SHELL=3D/bin/sh
    2023-09-14T04:07:10.712574  #
    2023-09-14T04:07:12.211340  / # export SHELL=3D/bin/sh. /lava-106605/en=
vironment
    2023-09-14T04:07:12.217350  =

    2023-09-14T04:07:14.940709  / # . /lava-106605/environment/lava-106605/=
bin/lava-test-runner /lava-106605/1
    2023-09-14T04:07:14.947579  =

    2023-09-14T04:07:14.951266  / # /lava-106605/bin/lava-test-runner /lava=
-106605/1 =

    ... (13 line(s) more)  =

 =20
