Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC786454279
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 09:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhKQIVt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 03:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhKQIVs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 03:21:48 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC74C061570
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 00:18:50 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id gt5so1752383pjb.1
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 00:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tw7DlbRZkCj5u76SIU/6JClesVIj3Gl84inacIyDDgg=;
        b=OkudznHcS6KAT2l2RSDzk91EG6b05vYAbMvavsuetPS/JdpV3KViRiYP0KIuWGLkK4
         rYFDpciMf1IYZ+YUgCfn8Zps7QhBfNJnO64rjXmK2mtpjpvCkPQii03pGFG8CaOV7boZ
         n3CAJOXOcYFtw8lhYBJlmQY0HF1T3tKO60g4Glue2Q8qpqhYIpB13gFcn/QdvgW5GJG+
         nPtbxVIEBnvV0KH7ocnnt4n6qCuLtWrNjZ/8WuMCGmKfoka1+LiCQ67uNkSYVVbysPsH
         dl9S09II494DPQpIja/hEHqDaWNOHCCB0NnPo8wTKKlPUAC/ExLHnB4ePc85ipPcrNJK
         raKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tw7DlbRZkCj5u76SIU/6JClesVIj3Gl84inacIyDDgg=;
        b=4qyP+0sXOofxiuuJk4qqKLrrPd1X+snabcoEHuo+ZIHV/srXhB1+GaexU14V0D+56f
         fowov2qdp3hGnS1Ve6sJ4na8SH0RxusSJtOmtafSE6KMDVJ3wo27e+a1GDjhMiOKKKe3
         Ue85xJrlMd7cgjOqV4YS8Bt1rc33hoiv1BdqqgExfCBc3wvPhD9fzHT0ZlxI7gt+FsUE
         bpnTVDsqjdMBG68Y/nyNPsrhT/PAhEtGuBd9rFUlxnXKH83ypZXyefi8ZxvFV7XI4p1n
         yyppkZ4g0Z8cCZQNTKKNEpXxapinktqi5jMWKWCKCFf0Oy17AWH31cr8pgLm4njYck8/
         AvIw==
X-Gm-Message-State: AOAM530ZEHY7XncI+87ErYsaZJ38DZrqioI4QdNk/m3+j/HGCKDSzZoA
        vJJgeDlcANOPrWbDJprfE7MKc4FbWH1CmCUP
X-Google-Smtp-Source: ABdhPJwO3hRfMYKChmi+USlmycNeVt2A5FQc3rWGvbIZKPQTqC7zRT3fwDGFPwVGwpwNvN1QjQJIRA==
X-Received: by 2002:a17:90b:2502:: with SMTP id ns2mr7173463pjb.51.1637137129693;
        Wed, 17 Nov 2021 00:18:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t8sm17085822pgk.66.2021.11.17.00.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 00:18:49 -0800 (PST)
Message-ID: <6194bae9.1c69fb81.97778.168a@mx.google.com>
Date:   Wed, 17 Nov 2021 00:18:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-rc1-213-g610c9ac03d76
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 424 runs,
 4 regressions (v5.16-rc1-213-g610c9ac03d76)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 424 runs, 4 regressions (v5.16-rc1-213-g610c9a=
c03d76)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc1-213-g610c9ac03d76/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc1-213-g610c9ac03d76
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      610c9ac03d7682c01ac98d9c59f6ebbd77af765b =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6194870c51ee7e3cd53358f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-2=
13-g610c9ac03d76/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-2=
13-g610c9ac03d76/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6194870c51ee7e3cd5335=
8f9
        new failure (last pass: v5.15-13240-g86fd312d9a30) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619482658d317020263358e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-2=
13-g610c9ac03d76/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-2=
13-g610c9ac03d76/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619482658d31702026335=
8e2
        new failure (last pass: v5.16-rc1-155-g6eea4f2d44ab6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6194854f566f0f4ae73358f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-2=
13-g610c9ac03d76/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-mt818=
3-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-2=
13-g610c9ac03d76/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-mt818=
3-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6194854f566f0f4ae7335=
8f6
        new failure (last pass: v5.16-rc1-155-g6eea4f2d44ab6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619485ec352123d00f335903

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-2=
13-g610c9ac03d76/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-2=
13-g610c9ac03d76/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619485ec352123d00f335=
904
        new failure (last pass: v5.16-rc1-155-g6eea4f2d44ab6) =

 =20
