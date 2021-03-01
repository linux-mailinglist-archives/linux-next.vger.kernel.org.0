Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4286327630
	for <lists+linux-next@lfdr.de>; Mon,  1 Mar 2021 03:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhCACt6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Feb 2021 21:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbhCACtw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Feb 2021 21:49:52 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7656FC06174A
        for <linux-next@vger.kernel.org>; Sun, 28 Feb 2021 18:49:12 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id b8so6156538plh.0
        for <linux-next@vger.kernel.org>; Sun, 28 Feb 2021 18:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IawScpXs9b9tg67ZdnI2DgXCSXP8SLA3vDY7B2sq7I0=;
        b=QJSqx0g3KxM3ehRuFLneE/HFRWpVylDXJzzbbScZ3lf5XLjTNTBtXwtC7VHKJpCLYp
         +8CkVDR/nmtWBXE0ETbFQGW3xIBswmMuT2QECTuY1hWYeY84tT8uLtZtYqd03kOjNG1P
         mobYMOQQAmd7H+xcGZJvhVUgsA15G6djYr+KWZXOh371hdTu9fiuOMxukjeXxT9ZSsmv
         FxF1Y9qKiQByV6ZQ9UPRkp2xMAbHHRdlfXrlCIzszrq/o4WYayerdShoYCoA3yr6hu6H
         2Dd574fA2jQZf9FkOZK+NcZhswAu9/ngppzzc2lIpXqKmslLHFhi60edTK/4ilPWsob/
         Su9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IawScpXs9b9tg67ZdnI2DgXCSXP8SLA3vDY7B2sq7I0=;
        b=FQMr7he/Pja7097G4PUg6EZGlLn6cvhVtQA3b3hyJankcVb+iDBpNFZz/93YpZWoFS
         ftnmbIpmTbGgDjRCjXYJE3vX7hRwVB7Kmq5u2omMxOMZqWrm0BFmWWekUtSFi2hYGzc6
         BNVFh5EiNXyK41NvYVAdg8Jo0U6DYWyUErthcG+guSEhbB/ED4lllrW2dJq2i1bh3Vm2
         9Q18sSCvwLO9VKY7A+2BmB6j2UIwQgYKsTDZxWhMTnY7mbqpcQJ/ot/lco6E8eo7NweO
         jOqxzF4piorwETlyn+FzcW+YI7bR0j2YntNwMBmmGFhC+UwuhYExln10ZtErW3gS6p2Q
         r75w==
X-Gm-Message-State: AOAM530rdiWsaRMoygIJaWDmWQwSyR1jaeEvpzp8l35VTmSDcsNNhD9d
        o0FvakW+cOzUaAwu6lZGsu8xdQfi8Jg67g==
X-Google-Smtp-Source: ABdhPJxHGw7wYeK5sbSV7oNIq8S3AGDbN0x9iuFfMtX+LJP+uwT0d0LzYpeKAN0qNgzlq3ARRwRctA==
X-Received: by 2002:a17:90a:fb8e:: with SMTP id cp14mr2686580pjb.52.1614566951846;
        Sun, 28 Feb 2021 18:49:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 134sm16004753pfc.113.2021.02.28.18.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 18:49:11 -0800 (PST)
Message-ID: <603c5627.1c69fb81.199ee.66a8@mx.google.com>
Date:   Sun, 28 Feb 2021 18:49:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-11896-g31549ef5d561
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 171 runs,
 4 regressions (v5.11-11896-g31549ef5d561)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 171 runs, 4 regressions (v5.11-11896-g31549ef5=
d561)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-11896-g31549ef5d561/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-11896-g31549ef5d561
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      31549ef5d561013e04f6f90cb7f417dc4a7930ba =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c27c18b5d5d1536addcc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11896=
-g31549ef5d561/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11896=
-g31549ef5d561/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c27c18b5d5d1536add=
cc1
        new failure (last pass: v5.11-11308-g1e0436e950f3) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c2443ebc0707a2baddce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11896=
-g31549ef5d561/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11896=
-g31549ef5d561/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c2443ebc0707a2badd=
ce4
        failing since 10 days (last pass: v5.11-629-gdcd372394d935, first f=
ail: v5.11-2286-g3c15bb8df3365) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c244debc0707a2baddcef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11896=
-g31549ef5d561/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11896=
-g31549ef5d561/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c244debc0707a2badd=
cf0
        failing since 10 days (last pass: v5.11-629-gdcd372394d935, first f=
ail: v5.11-2286-g3c15bb8df3365) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774c0-ek874             | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c2453ebc0707a2baddcf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11896=
-g31549ef5d561/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11896=
-g31549ef5d561/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c2453ebc0707a2badd=
cf3
        failing since 10 days (last pass: v5.11-629-gdcd372394d935, first f=
ail: v5.11-2286-g3c15bb8df3365) =

 =20
