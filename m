Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B138D43F587
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 05:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbhJ2DuZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 23:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbhJ2DuY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 23:50:24 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDA3C061570
        for <linux-next@vger.kernel.org>; Thu, 28 Oct 2021 20:47:56 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id n36-20020a17090a5aa700b0019fa884ab85so9554193pji.5
        for <linux-next@vger.kernel.org>; Thu, 28 Oct 2021 20:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9wIQmQck0wCY6F1J1Te6/1/xGIpB07Ftc9XVpp/ImE4=;
        b=bdYmWDV8pHAc2KR8Z9CdEr0L4fUx9o84rHyZjIfcvHxLQWlJPQwkD207iupVSF53xh
         rEa4dYSCfb0Hcgl56c0QxBxNgmPvRghHnR2c0EWpTT1kLfiVIq1FNbwvjGMJjLqSn6af
         O4RDRq21NtXnt6HCV3Jl6Dp7hL1Skgt813RnMi+FEBejorNpd4Aw6Psd0S7zlGkjlSM4
         OhVNk6bJ8W4pN8vNoc9jyeW3ChcYwDrsWsxkL3ezzk70QKV9h69dxmAvn+oWqt+3TQTb
         0H4dMfBdmjQjLGjnMRkGtJu7jWk7nsbVTxBoJXAHCG6nKXssP1gIXlFAdYtrvrezAnB+
         eINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9wIQmQck0wCY6F1J1Te6/1/xGIpB07Ftc9XVpp/ImE4=;
        b=lwg5bps1g1fds30FEPetHFTqDtTMJMV1uAN5WvUpSf9noezGyt50ueeXLXmzA1S94c
         J1u1M4Gf9Aei/AON88Udn+a5sisUQn/TPL+aTtPFLHfqab84YJ4z0qihJytsiID/PCv8
         1AMjq7ZHisR5XKUsoKh9sg8m9TNikBc4MCHdlkznW2071XzzUpqVT97A0shM3TA6zLda
         YNuM1lC04okRMZ7zH66udp0OylS/yMPrbDbcdhmgKkelL7PTWBbg5T537HvRAiEXCYxq
         9NI78mcZv+mt5enOBSfFGYrVfV5WiAW8GYbt0bVgkLo/GWCHvyN3hyQXHc3ZXKC+c/Ym
         kuXA==
X-Gm-Message-State: AOAM530g9Dn5J0/zcWeO2YA9dKlMb4YfdtsIEB+h98ZvsPho/5FGqR8U
        JLIErHjLi4j/SoX3/Nq0jPZUubQM6a84vMYD
X-Google-Smtp-Source: ABdhPJw/A02fzexscZ1q+7ebdFKbww8M8QeQL8R1rr5SD8tXC5RKk1J2FPWNSU0nVbRCfHgY8XXrBg==
X-Received: by 2002:a17:90b:3b85:: with SMTP id pc5mr8892225pjb.74.1635479276226;
        Thu, 28 Oct 2021 20:47:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q13sm5526314pfj.26.2021.10.28.20.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 20:47:55 -0700 (PDT)
Message-ID: <617b6eeb.1c69fb81.84d7b.1187@mx.google.com>
Date:   Thu, 28 Oct 2021 20:47:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-rc7-550-g923cde4b8abd
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 569 runs,
 2 regressions (v5.15-rc7-550-g923cde4b8abd)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 569 runs, 2 regressions (v5.15-rc7-550-g923cde=
4b8abd)

Regressions Summary
-------------------

platform      | arch  | lab          | compiler | defconfig                =
    | regressions
--------------+-------+--------------+----------+--------------------------=
----+------------
rk3328-rock64 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMIZE_BAS=
E=3Dy | 1          =

rk3328-rock64 | arm64 | lab-baylibre | gcc-10   | defconfig                =
    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc7-550-g923cde4b8abd/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc7-550-g923cde4b8abd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      923cde4b8abd403c3ca5a4693900627b43d66646 =



Test Regressions
---------------- =



platform      | arch  | lab          | compiler | defconfig                =
    | regressions
--------------+-------+--------------+----------+--------------------------=
----+------------
rk3328-rock64 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMIZE_BAS=
E=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/617b389517f5151ecb335927

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-5=
50-g923cde4b8abd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-5=
50-g923cde4b8abd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/617b389517f5151ecb335=
928
        failing since 0 day (last pass: v5.15-rc7-176-gbfbd58926fc5, first =
fail: v5.15-rc7-202-gc79631111e0b) =

 =



platform      | arch  | lab          | compiler | defconfig                =
    | regressions
--------------+-------+--------------+----------+--------------------------=
----+------------
rk3328-rock64 | arm64 | lab-baylibre | gcc-10   | defconfig                =
    | 1          =


  Details:     https://kernelci.org/test/plan/id/617b3b2a7985754aa833591b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-5=
50-g923cde4b8abd/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-5=
50-g923cde4b8abd/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/617b3b2a7985754aa8335=
91c
        failing since 0 day (last pass: v5.15-rc7-176-gbfbd58926fc5, first =
fail: v5.15-rc7-202-gc79631111e0b) =

 =20
