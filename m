Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25A845A2F6
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 13:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbhKWMqj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 07:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236595AbhKWMqi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 07:46:38 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57D7C061574
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 04:43:30 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id v23so16511840pjr.5
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 04:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s/KseNrH+ZLUPHFy3h6zM4R5qC7ZV6BUQIg6fjBdGvw=;
        b=1c+Bu31/EFIqFNAG0cVIij5p6gDNyH055d8gblbNfPFwGIyY1MFHXNl0IjiD2RvKik
         ffaavTDkXFHWZG9pLFgM9kE1Trcn+NQQ5fjOyvjWua6QZtzgOZ2aXf4iw+w3uIuckdVh
         efZNwi5wIp/Td/SUeo5HErlV4e4NUpUc1Y2l40rJTGOsKdj8e9tizrh4RJKjXAG8T3KN
         XV1Dhkn6QUWYOY6Gs7xEyItyzkb1N4GPZ0bCR4MTTzoQ5a1Sbkh9iuNqfOApRdO6/iU1
         52K4DhZDG6pW67XheC53kdSYtbvZ34AoHPjTZZKCuZeqzxEPxgNnf2JhUwQa1ijEgRNI
         7XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s/KseNrH+ZLUPHFy3h6zM4R5qC7ZV6BUQIg6fjBdGvw=;
        b=ZuLk+HD3waoAswsJRxyiIradVBdO7qzjt5GH0kZeUowxxpNSuqDNRlodb25QulsZga
         G23Ezsi83XUGfdX+SBZuDCqQriZSTlFMjwNVqE57r7hGm5JV984/QTYPUWRPUHI011Ht
         NcsP4b6d6Y4C/VSnYabJC2h1FCBTfepe+SDxp0STlyZMJ99FeIYyhNOXj91+m9odePK+
         3cfD5wA31pOUvCQfCk1qs/1Fwt59ygJixIY09VONT2vJ1DzM2w1NxGB25IpU/XkKgaF/
         meFTkrl4Tt3IuM4f9EF48svFc7ezXATIvqpHlnEYKCHVYG/YDtGjyXhcuNjMFasB12t+
         X8Zg==
X-Gm-Message-State: AOAM531OwH463PY6Lll5zgft3Vwp+p3rdMv7WUy1IbAw0kcpJROGi4uO
        0lJMkHH2QXlIIh1qfxOb1paVn9NrrRmzBMva
X-Google-Smtp-Source: ABdhPJzAj1eqPG8AYMCEJ1FnszWkO48PqOUcZY76ddXmVuWLlEyk8cDOaVdvdz8OJpYfeX2n75qVjw==
X-Received: by 2002:a17:90b:33d0:: with SMTP id lk16mr2541369pjb.66.1637671410133;
        Tue, 23 Nov 2021 04:43:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h186sm12353564pfg.64.2021.11.23.04.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 04:43:29 -0800 (PST)
Message-ID: <619ce1f1.1c69fb81.e0562.234d@mx.google.com>
Date:   Tue, 23 Nov 2021 04:43:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc2-256-g4ad0ace1d376
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 577 runs,
 3 regressions (v5.16-rc2-256-g4ad0ace1d376)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 577 runs, 3 regressions (v5.16-rc2-256-g4ad0ac=
e1d376)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig        |=
 regressions
---------------------+-------+--------------+----------+------------------+=
------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-10   | defconfig+crypto |=
 1          =

meson-gxbb-p200      | arm64 | lab-baylibre | gcc-10   | defconfig+ima    |=
 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre | gcc-10   | defconfig        |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc2-256-g4ad0ace1d376/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc2-256-g4ad0ace1d376
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4ad0ace1d3766010c2d17a606bf3f722f6a1e1a6 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig        |=
 regressions
---------------------+-------+--------------+----------+------------------+=
------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-10   | defconfig+crypto |=
 1          =


  Details:     https://kernelci.org/test/plan/id/619cabcb7d7a2c0f30f2efea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-2=
56-g4ad0ace1d376/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-2=
56-g4ad0ace1d376/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619cabcb7d7a2c0f30f2e=
feb
        new failure (last pass: v5.16-rc1-328-g11d53a03cd9e) =

 =



platform             | arch  | lab          | compiler | defconfig        |=
 regressions
---------------------+-------+--------------+----------+------------------+=
------------
meson-gxbb-p200      | arm64 | lab-baylibre | gcc-10   | defconfig+ima    |=
 1          =


  Details:     https://kernelci.org/test/plan/id/619cb55074142a2339f2efa2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-2=
56-g4ad0ace1d376/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-2=
56-g4ad0ace1d376/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619cb55074142a2339f2e=
fa3
        new failure (last pass: v5.16-rc1-328-g11d53a03cd9e) =

 =



platform             | arch  | lab          | compiler | defconfig        |=
 regressions
---------------------+-------+--------------+----------+------------------+=
------------
r8a77950-salvator-x  | arm64 | lab-baylibre | gcc-10   | defconfig        |=
 1          =


  Details:     https://kernelci.org/test/plan/id/619cb0a202d2bd3699f2efb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-2=
56-g4ad0ace1d376/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-2=
56-g4ad0ace1d376/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619cb0a202d2bd3699f2e=
fb9
        new failure (last pass: v5.16-rc1-328-g11d53a03cd9e) =

 =20
