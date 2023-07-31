Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5077690E0
	for <lists+linux-next@lfdr.de>; Mon, 31 Jul 2023 10:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjGaIzQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jul 2023 04:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbjGaIyi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jul 2023 04:54:38 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80E21BE1
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 01:53:41 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-686efb9ee3cso4078088b3a.3
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690793620; x=1691398420;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oB+JVx5lZgVwsk12wMRHPe3pSJ802eDbHj/qOrhYBRs=;
        b=0F+B192HFbkpNyFiocb4JUi+6Rd8s2SE1waadTCkLxNRJGTK8mqeLBMaxN+4chtcow
         ZmQripV76DpLE58YUT4DsdUA+bhJLJsBLAkM0+1de/wQ3hhhh/s0Md4JIMC5C8CSzo92
         CpFFnc7rEr50tBIMd33hWolNAynbXIXuHwypmzlJRxZyrKCFV9YXZ7IePkgdz0g5TI+5
         rdnmlOfXGeHfMKk6yzjLzMmuYB8gFKZh9EsQXIPV8gdNoLX8SOpE/pNvdCRoJBqV7qWE
         BdUFhS+dDCpDYlrQ5syugBMhqvBJrHEUMYNu73ktrS2gxJsQfhJXV/BtMNFBasfQ0og/
         9OXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793620; x=1691398420;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oB+JVx5lZgVwsk12wMRHPe3pSJ802eDbHj/qOrhYBRs=;
        b=QCJFbG+M/euWf4h2yD+PvgDtPw5Z120NTosUU9fUhjNoCkNJ/XERD8W10h5DqQSaXl
         QR5B29pGOwhsFbrT/kmBT19tQyQFf55NMPmQ/OwwX+IxQhbdIZ1qqKbRGS2BBFeWJ5xf
         S11r1u5ZgYPqG2rZMSWBGsiwMm5C0xSm08pbD6I5CXlWs4ecLef8UbgZ0dy/qhd89wnw
         aKg86Y4cnknA2+WVIzGBElO+J13qtSyjROWF4shvj+jSmbHpYIr7WmoKZZp8xZLKWAh6
         yHTJRh30lkGswVzc1qwB/EhzQe9M8shrFZeDCmoiYLk5rhD0sFemJQEcWBD1I3oPDtTZ
         48kA==
X-Gm-Message-State: ABy/qLa+77MZQYHdPEuhBppBRRmSQtDh9dBO+VbwQZT8jpDdBHWLKiQy
        H8hUJ0SR3a28mMsRIOVzfjM0nnRUvd26ScKbOit0Vw==
X-Google-Smtp-Source: APBJJlFycUX0Ao2teBeh3DGMHBmYPPm4SeIpTHJDr3pp/tG7hBj775dVKPWgcc3zt76llwIE/LrKPQ==
X-Received: by 2002:a05:6a20:1d8:b0:12c:c614:f55 with SMTP id 24-20020a056a2001d800b0012cc6140f55mr9246562pzz.43.1690793620169;
        Mon, 31 Jul 2023 01:53:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t12-20020a63b70c000000b0055bbc746272sm6793248pgf.17.2023.07.31.01.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:53:39 -0700 (PDT)
Message-ID: <64c77693.630a0220.9e0e5.bd2a@mx.google.com>
Date:   Mon, 31 Jul 2023 01:53:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230731
X-Kernelci-Report-Type: test
Subject: next/master baseline: 123 runs, 4 regressions (next-20230731)
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

next/master baseline: 123 runs, 4 regressions (next-20230731)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-chromebox-cxi4-puff   | x86_64 | lab-collabora | clang-13 | x86_64_def=
con...6-chromebook | 1          =

mt8192-asurada-spherion-r0 | arm64  | lab-collabora | clang-13 | cros://chr=
ome...4-chromebook | 1          =

mt8192-asurada-spherion-r0 | arm64  | lab-collabora | clang-13 | defconfig+=
arm64-chromebook   | 1          =

r8a774c0-ek874             | arm64  | lab-cip       | clang-13 | defconfig+=
arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230731/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230731
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ec89391563792edd11d138a853901bce76d11f44 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-chromebox-cxi4-puff   | x86_64 | lab-collabora | clang-13 | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c7412fbc006315478ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230731/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230731/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c7412fbc006315478ac=
e1d
        new failure (last pass: next-20230728) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
mt8192-asurada-spherion-r0 | arm64  | lab-collabora | clang-13 | cros://chr=
ome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c7469d99b2ace3e98ace37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230731/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230731/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c7469d99b2ace3e98ac=
e38
        failing since 4 days (last pass: next-20230721, first fail: next-20=
230726) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
mt8192-asurada-spherion-r0 | arm64  | lab-collabora | clang-13 | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c744d171e63613ad8acf90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230731/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230731/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c744d171e63613ad8ac=
f91
        new failure (last pass: next-20230728) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a774c0-ek874             | arm64  | lab-cip       | clang-13 | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c7452c2abbfb2eb28ace3c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230731/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230731/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c7452c2abbfb2eb28ace3f
        failing since 13 days (last pass: next-20230710, first fail: next-2=
0230717)

    2023-07-31T05:22:09.526603  / # #
    2023-07-31T05:22:10.986733  export SHELL=3D/bin/sh
    2023-07-31T05:22:11.007223  #
    2023-07-31T05:22:11.007391  / # export SHELL=3D/bin/sh
    2023-07-31T05:22:12.889202  / # . /lava-990930/environment
    2023-07-31T05:22:16.339718  /lava-990930/bin/lava-test-runner /lava-990=
930/1
    2023-07-31T05:22:16.360321  . /lava-990930/environment
    2023-07-31T05:22:16.360434  / # /lava-990930/bin/lava-test-runner /lava=
-990930/1
    2023-07-31T05:22:16.405994  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-31T05:22:16.444075  + cd /lava-990930/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =20
