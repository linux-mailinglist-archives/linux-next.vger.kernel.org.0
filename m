Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE8F07741FF
	for <lists+linux-next@lfdr.de>; Tue,  8 Aug 2023 19:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjHHRcL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Aug 2023 13:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbjHHRb1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2023 13:31:27 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6BA7ECC
        for <linux-next@vger.kernel.org>; Tue,  8 Aug 2023 09:13:37 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-44756c21105so3806214137.1
        for <linux-next@vger.kernel.org>; Tue, 08 Aug 2023 09:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691511179; x=1692115979;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aG4Be33mMpkCNVMZIxmyY7s+TDhQZJdB16xMZkEWkTo=;
        b=gV3hjKGXrcBjSsbJkZZRKvr1DNkhK4aX1+ejZQ4OdDlbUbF6Hbt96g7WCNcwSj1xGF
         aSiXiJ17goiH0nkVSlVzBjslgVv6LGAMiY48MYhwuKusHxEcCY+jWHxO4PQ5Ochcdqku
         X3oJSmClDsby+8xFlcItwqBZ/L2BjkUcBhrtn5jEtSiGXLjmxWpMJ4dYuMhujrxX++tD
         R2jPAkQs483hhmLb8MyVDXY0wzBrGxM+Q+gYCEf3gMLn85M3J910G0RKPUB94nfVKtQ6
         dqw99ogBUFZ2LA1O+aBTecBqmhSHXhU9iRwxtwPrLlG6z89oblKrf0VbqpVR2cj1Nsny
         k5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511179; x=1692115979;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG4Be33mMpkCNVMZIxmyY7s+TDhQZJdB16xMZkEWkTo=;
        b=bNF/YvTBqc85+EpJ2NsZQRbOnxS0KaKUgIQJcBbGDoK5O5HyZLQyZKVWRF3O65pLub
         Q0LQn/zPpskzorKWFNBwMnlzFT2nXh0zstRRNC/3L+THhjcQw/KDVyQ/aSPxC3jcj80Y
         LupOYgNDpZEl+CnYgrWfAPxobM9sV3jYX+qFD2BNjBYBmR7vnoPWTAoThjXTl+O2tSAJ
         dgFIhmHMNVlkBm0N4Drf2ibTxBrZHCz+88fByjwToOCUkBtXKeowbJkcaHouDWiP/bFW
         0Q2YpP81m79SumjVtvnOnwHYJDbYVmvKuadnF2vsRTKGSKnC+fyNrQrXA+WpTUaPTtz+
         TedQ==
X-Gm-Message-State: AOJu0YwJ2e+b+hTWDX5LgV/JhxiybV5TB1tnfZC9zR4ZSVAgFsZ+3xah
        FcBv+XII95ClbD+lZ56wRWGLyXum7DiHc1SPFARKbQ==
X-Google-Smtp-Source: AGHT+IGXr+ecrP0PrAa4f0FHTqVAqjzc1Kfl2OhdXiW+qgy9D9zG8xzQLfaSRetOvkzrpEMKddfvnw==
X-Received: by 2002:a17:902:c945:b0:1bc:3908:14d with SMTP id i5-20020a170902c94500b001bc3908014dmr11852007pla.2.1691468392215;
        Mon, 07 Aug 2023 21:19:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902a40800b001b8b73da7b1sm7757656plq.227.2023.08.07.21.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 21:19:50 -0700 (PDT)
Message-ID: <64d1c266.170a0220.aed27.e2eb@mx.google.com>
Date:   Mon, 07 Aug 2023 21:19:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-rc5-223-g453869586392
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 61 runs,
 2 regressions (v6.5-rc5-223-g453869586392)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 61 runs, 2 regressions (v6.5-rc5-223-g45386958=
6392)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc5-223-g453869586392/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc5-223-g453869586392
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      453869586392a5c4f570ba90c557219a65fff41a =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:     https://kernelci.org/test/plan/id/64d1917095eada8fb435b42d

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc5-22=
3-g453869586392/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc5-22=
3-g453869586392/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d1917095eada8fb435b430
        new failure (last pass: v6.5-rc5-186-g6c8c4ff08090a)

    2023-08-08T00:50:30.786335  / # #
    2023-08-08T00:50:30.888578  export SHELL=3D/bin/sh
    2023-08-08T00:50:30.889320  #
    2023-08-08T00:50:30.990694  / # export SHELL=3D/bin/sh. /lava-373942/en=
vironment
    2023-08-08T00:50:30.991056  =

    2023-08-08T00:50:31.091731  / # . /lava-373942/environment/lava-373942/=
bin/lava-test-runner /lava-373942/1
    2023-08-08T00:50:31.092184  =

    2023-08-08T00:50:31.096998  / # /lava-373942/bin/lava-test-runner /lava=
-373942/1
    2023-08-08T00:50:31.162860  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-08T00:50:31.163001  + cd /lava-373942/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/64d=
1917095eada8fb435b440
        new failure (last pass: v6.5-rc5-186-g6c8c4ff08090a)

    2023-08-08T00:50:33.562403  /lava-373942/1/../bin/lava-test-case
    2023-08-08T00:50:33.562830  <8>[   18.280734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-08-08T00:50:33.563110  /lava-373942/1/../bin/lava-test-case   =

 =20
