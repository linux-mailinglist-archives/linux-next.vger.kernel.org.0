Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0671A332003
	for <lists+linux-next@lfdr.de>; Tue,  9 Mar 2021 08:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhCIHmd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 02:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhCIHm3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Mar 2021 02:42:29 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339F0C06174A
        for <linux-next@vger.kernel.org>; Mon,  8 Mar 2021 23:42:29 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id jx13so437292pjb.1
        for <linux-next@vger.kernel.org>; Mon, 08 Mar 2021 23:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ifKaJhLB77n3v8/I6oXj64pPKAj9c5TZ3dgIcNMMAbw=;
        b=POOuWNh3mdOfqA/GUBWzqrNSf5mDoIDd7rvy2wsWdKv3ToTzzrLT0F2FOJgRMLhbI+
         /mQybQtJyAvUk4xRSILomhNm6BnCMqPzUPi3+VzaNbviKUCnG3ToOVVvpBFCRY7JdmXA
         dL8bHITwFoR8Kd1UoKOEM6rNiZGOyrFr79FLbLomJjtHx/8pNznpqJ9Tb2uEjJxXy+rD
         8RxjJsTNFj03dnHkPLt1I5j0GJtJFlHIhm1iojWi/HGqzURuFucHPFzMcVYg+jfZGoVS
         AD+mKBRZGnIeVPW1OXcoRMmdlYMhB6QJTwZASpZVrAnwK+jBX5UO9uDCrfB9xgOPsXax
         r7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ifKaJhLB77n3v8/I6oXj64pPKAj9c5TZ3dgIcNMMAbw=;
        b=Cfoj8BBddGg51OqWD2glGlwZjL7L9QIeXJG1ssXpbkUJ7ltWvPLaht/gyOTw63hlY2
         PJxuFsTbFz8NHtq5tdlxtLGhCKx1+ll3l+KwW781cEDTRG7+rL+zTZ6PGwzpny0nRrLH
         a4fMEArvIN/tEgDgml1g7faCCQvHA/McBUvnCxm+/3Iu6c9SW4Gmv4TWHYB8bvQ6ovZi
         e1FC36lmkdFJbi+AjtvP4cN6JqJbeNgRkY1UJPEJa1nXxptcTbotXq0bm9PehKIPuEqR
         MZ82kQ3GLL40pu/hY9eM894HUfqNT7aNfTB5l43N9Zpl+g+YnTC3Xq3RRXV6ZrRJfXSy
         KgLw==
X-Gm-Message-State: AOAM5314TYsuvgKQrvvRRzEzxj3AEFiFBzuP6G8YyIYI16b8F4L6Py7/
        F5w9Vyhvk1cYAD3Y7tD84HS8zbU+jL5c7I/u
X-Google-Smtp-Source: ABdhPJyrLDC5a//KwisNJ/+MY3BauGS7nE0dLHasWlQTdN1dzrsJOSOo5kt6ZnyYcuy67tf/UsnIwg==
X-Received: by 2002:a17:902:82c7:b029:e4:74ad:9450 with SMTP id u7-20020a17090282c7b02900e474ad9450mr24962195plz.58.1615275748580;
        Mon, 08 Mar 2021 23:42:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x9sm1738507pjp.3.2021.03.08.23.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 23:42:28 -0800 (PST)
Message-ID: <604726e4.1c69fb81.4e23d.56e6@mx.google.com>
Date:   Mon, 08 Mar 2021 23:42:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-483-g82dc092edcd0
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 222 runs,
 4 regressions (v5.12-rc2-483-g82dc092edcd0)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 222 runs, 4 regressions (v5.12-rc2-483-g82dc09=
2edcd0)

Regressions Summary
-------------------

platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc2-483-g82dc092edcd0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc2-483-g82dc092edcd0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      82dc092edcd0603508d4f82cd5df238a52c114a7 =



Test Regressions
---------------- =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/6046f3cce0fd5af2e4addd09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-4=
83-g82dc092edcd0/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-4=
83-g82dc092edcd0/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6046f3cce0fd5af2e4add=
d0a
        failing since 112 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/6046eb0a7eb4055a80addcda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-4=
83-g82dc092edcd0/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-4=
83-g82dc092edcd0/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6046eb0a7eb4055a80add=
cdb
        failing since 112 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/6046eaaa9da2ad7fd4addcb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-4=
83-g82dc092edcd0/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-4=
83-g82dc092edcd0/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6046eaab9da2ad7fd4add=
cb9
        failing since 112 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/6046eaadc3df4aefe2addcb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-4=
83-g82dc092edcd0/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-4=
83-g82dc092edcd0/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6046eaadc3df4aefe2add=
cb9
        failing since 112 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
