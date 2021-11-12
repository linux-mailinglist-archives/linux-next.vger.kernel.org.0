Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A778A44E242
	for <lists+linux-next@lfdr.de>; Fri, 12 Nov 2021 08:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhKLHNl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Nov 2021 02:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhKLHNk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Nov 2021 02:13:40 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB5BC061766
        for <linux-next@vger.kernel.org>; Thu, 11 Nov 2021 23:10:50 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id np3so6000667pjb.4
        for <linux-next@vger.kernel.org>; Thu, 11 Nov 2021 23:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1R0ZfW86s5/ZA1rUzbEGphvm46h5lMO3Io9ndGuZQS8=;
        b=haX7/UK8AoONR3cPBPM6Y3YjOOW4c+aF5aVORXqFBFJBtJV1yu0D/PBkZ9tJKhPuMd
         Pom1PXysolwd3dGCnt9TrvjanAzSCPJ53ZiT8rESeYQLNdceCm4qQeOoNfafrikSuODv
         x7T5YeGLTSmoD/LVn0N4iUd2dIshjCLPoppWRunws1e/izbtA80DGiGMYStx4dmWAaOD
         k1GIrLZH1IQn12ZEBtEd3h3ESJcWbKYQe54OpLLkVM8VNp3GUc8oFizvjFOLIfRWFJL1
         N2d8yXXjVqbcEtdXqPnG4W6VMZbOI8g+dewIrPRZdnnPoS15PSib3X1JcYT1SkWwfDfI
         rXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1R0ZfW86s5/ZA1rUzbEGphvm46h5lMO3Io9ndGuZQS8=;
        b=G6HhRCIdgKZmxsqlXJrUMbt9btMR6kqeDRHlwchaYpmbBCOQO+V+BNErD9yGd134wl
         NW9SS6XNtQEG8C8hmKji6igyWh7UILKEARJ3X90yxrsvNg/ebeBohjNuZo+DluF+0eVj
         y3GhjU4paibqIy2xFnq7eRKkRHSfY8BvpPFSzmtvYsvMkiSvUoOZMGg5it4Or37p3Zi4
         BqZYYXCPTerVC0JxcUM/FRhpBs8Qp4XXEnuF5d1EIvptaQJX/c5NHM5QZFwdDFO5G6IQ
         DOjOOJHqUcady2P+JNYw/0sOF6uv7ULHxUageJMjUXfBRxzvG+e9UvVqY83DgO2tdQgr
         JUYQ==
X-Gm-Message-State: AOAM530x/WRxviDaHZRiLa/zhRBhpIgQ/juL6q1gmtW+CjR8grUjchEt
        /J/0ZXnjtqfOZ5a8Ha/11jCqDkVEoS2q8h+v
X-Google-Smtp-Source: ABdhPJy/vU0s9BOY8c5jYu8O0qTEzwUrbpRZ5ESkzThxH0VpR42rePM6T1g8gCcj3fE7q/kHu3pjCQ==
X-Received: by 2002:a17:90a:df14:: with SMTP id gp20mr33722752pjb.186.1636701050007;
        Thu, 11 Nov 2021 23:10:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a3sm5638202pfv.5.2021.11.11.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 23:10:49 -0800 (PST)
Message-ID: <618e1379.1c69fb81.c049.0805@mx.google.com>
Date:   Thu, 11 Nov 2021 23:10:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211112
X-Kernelci-Report-Type: test
Subject: next/master baseline: 644 runs, 1 regressions (next-20211112)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 644 runs, 1 regressions (next-20211112)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig | regres=
sions
---------------------+-------+--------------+----------+-----------+-------=
-----
meson-gxl-s905d-p230 | arm64 | lab-baylibre | clang-13 | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211112/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211112
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f2e19fd15bd7cba347ce50be71955f5cd28a6019 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig | regres=
sions
---------------------+-------+--------------+----------+-----------+-------=
-----
meson-gxl-s905d-p230 | arm64 | lab-baylibre | clang-13 | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/618de258bbf7bd35ff3358f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211105082911+21620=
0aff268-1~exp1~20211105203443.23)
  Plain log:   https://storage.kernelci.org//next/master/next-20211112/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211112/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618de258bbf7bd35ff335=
8f7
        new failure (last pass: next-20211111) =

 =20
