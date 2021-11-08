Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2E2447914
	for <lists+linux-next@lfdr.de>; Mon,  8 Nov 2021 05:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237320AbhKHEHX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Nov 2021 23:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237308AbhKHEHX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 7 Nov 2021 23:07:23 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D75C061570
        for <linux-next@vger.kernel.org>; Sun,  7 Nov 2021 20:04:39 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id u11so14938504plf.3
        for <linux-next@vger.kernel.org>; Sun, 07 Nov 2021 20:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zpEiNfjOq2td6ooKbxnOSbDcACveYlZneEW4cZGMB0Y=;
        b=pKte0GgBReMG0SCtv9GEApB7Vejz2nXTSfCsJBuQ6ionihdxz1kzRDBm4jzMb1f9o4
         cPiki4caz/Ha5nE9xw8/glLqtuwPYBeryKfNd6UQJVT5tGwSrR4SjgizXh10JrCjrx5c
         0eY8H+ryWCxbmEDFEe+FhVD706O1gTvKq48mCsBoU1bishrT5vCk1lZiDpY4U9w06rt3
         JcwiYqmYWTFvwi2jUQx319E0h1oiDIX/VwM0aRwSvFzdKZJpXVgWdnT36rnR/WTfhQir
         01xa7fj8wPEoT6hI7yopX+wJbEyF7vP50iuy8NoLhmbQILFCdA9TesxzNRr9tpTJuXlt
         t6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zpEiNfjOq2td6ooKbxnOSbDcACveYlZneEW4cZGMB0Y=;
        b=0bRv8KhNqw0eRJ5KoiSkdF3zqyzwTvES8Fufv1+oU5KZhzsbLKn2qrAW+/awJXjIk5
         ws5IXNMuSFjmfCQORwjA4uZct58olrdQvwELHbG4NXeYScfd4tKrqXXBd0RJgxLGDUiA
         kJTCdlMlAGb0vDtgR7nFLuTBMtDi0jPI/J+me4PNRB8Ekq012wdY4hIOpAUURs50dO1d
         VIwLql3XcwZ3evDe0KJxbFerD/KRrmBP3qK7+1oa4HApdRPljkpZF0l5ZTwgj23PANTe
         Hd7OnNNfbzaE2UGJeBJTCtJfISfug98lg4/3oF1MGp8i4EIVSBOyYfS4vK98ZehbBY5l
         F2mw==
X-Gm-Message-State: AOAM530yyVI3AD1MYYDhVQ2JvAW5tDe2apgoO329zhE6WPnh+eGSSCnE
        UsqUozI/WZyPt4yUMUV1YGd+d+XlHrjQuh18
X-Google-Smtp-Source: ABdhPJwBuWR3kQQo5rt8BoTRXft3bNvtQI2f2/w4Oa2N/A7RZMmOWMLEsqIn8EgpUAOltoK0kvInwQ==
X-Received: by 2002:a17:90b:3511:: with SMTP id ls17mr38273140pjb.81.1636344278583;
        Sun, 07 Nov 2021 20:04:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h10sm14651859pfc.104.2021.11.07.20.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 20:04:38 -0800 (PST)
Message-ID: <6188a1d6.1c69fb81.75588.d614@mx.google.com>
Date:   Sun, 07 Nov 2021 20:04:38 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-11396-g61166c09fc60
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 507 runs,
 1 regressions (v5.15-11396-g61166c09fc60)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 507 runs, 1 regressions (v5.15-11396-g61166c09=
fc60)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-11396-g61166c09fc60/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-11396-g61166c09fc60
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      61166c09fc600988aa6ea72e8a6b8667ad8ed515 =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61886f98e55443dbf73358f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-11396=
-g61166c09fc60/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx=
8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-11396=
-g61166c09fc60/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx=
8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61886f98e55443dbf7335=
8f4
        new failure (last pass: v5.15-10251-g42298a382ab9) =

 =20
