Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828EF2AFFAF
	for <lists+linux-next@lfdr.de>; Thu, 12 Nov 2020 07:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgKLGbR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Nov 2020 01:31:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgKLGbO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2020 01:31:14 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA0CC0613D1
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 22:31:14 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id w14so3569832pfd.7
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 22:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=m4ASe4lXZlTsXKwyF9QJn65ZmyYAaQdrNJLvRlBicN0=;
        b=kmgWh0kn72hdR17gRaMaDC8WUko3tr3U8dKuAxJPfNaXtsHinjvUpssWuIOD6erISl
         Ekf+ZipRYbvkvAFnBxS0JoAJkqUNv8YM+bUxRYmJLPA/2IkQkLLd+WtbM45b57Souocq
         G4L/iwVLzxshNG0PXr7qGZH7uGO2Kjr9xExIomrxf5kaWgRW1yo67wH2f2HojjdBo83Z
         xkI4Y8oCFzx/ZFO5rRSggrTvzhdcVEMkFWouUxowaXBWs+gsjlsgtvMInyqys+8kVe0A
         NtKT8RaQ4qwTP1jcQXJQeN0mzI1FuBBQb2o53uEN6w0viI377OMhsgvbO7rumxFaQtG9
         8EZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=m4ASe4lXZlTsXKwyF9QJn65ZmyYAaQdrNJLvRlBicN0=;
        b=uLKV5baLzLsGFjhhvYEoptkUGjj4PTl9bCBXm7XkHOJKefXuUAdSingTvNxr6HhqYB
         VVvjoEQjw3fWfkJKJz9oAmGIvc3gtXxc1wk40kms8OrAa2qYB335K0NvgJLwqwrVolGx
         CUwihDeekpAGkOifhKPVlavsEAfcHdgXv+ydJGK8510ilwCkYDj5RYU8bANCZFmDetbF
         qVH0KRR1FRpJ3FTL6c8t//IWteFr5jNhf6aN3bHrX33kghb5wExXRf8L4tVmE0LNetcx
         Itq6OJKn6OlGonr+7ELl6z7pKT6YUx69yvOLameANG4WElDPwWh6j9bWXoa/9aY78afq
         mqVg==
X-Gm-Message-State: AOAM532oK5EM/fHPlL7gMB9bMa4eBtM/sN9QoJfC8fxIqldmN7k5zCeT
        NiL2Grd2Q/5UPXndRWXVqSRcXKCJBgqu4A==
X-Google-Smtp-Source: ABdhPJwA52ZicxNF1ZND4TMWWgyHxWHhigRkMZO/ArVf8hLXr3C0NzXnRvPLhY8H3R4JawtEWSvA1g==
X-Received: by 2002:a65:590e:: with SMTP id f14mr8561655pgu.58.1605162673408;
        Wed, 11 Nov 2020 22:31:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d11sm5065482pjm.18.2020.11.11.22.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 22:31:12 -0800 (PST)
Message-ID: <5facd6b0.1c69fb81.8e1e6.b0eb@mx.google.com>
Date:   Wed, 11 Nov 2020 22:31:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.10-rc3-337-ge83d2e1f2d190
Subject: next/pending-fixes baseline: 291 runs,
 2 regressions (v5.10-rc3-337-ge83d2e1f2d190)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 291 runs, 2 regressions (v5.10-rc3-337-ge83d2e=
1f2d190)

Regressions Summary
-------------------

platform                 | arch | lab          | compiler | defconfig      =
              | regressions
-------------------------+------+--------------+----------+----------------=
--------------+------------
imx6q-sabresd            | arm  | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc3-337-ge83d2e1f2d190/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc3-337-ge83d2e1f2d190
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e83d2e1f2d190ff1cfe6f218c9392804411a45e2 =



Test Regressions
---------------- =



platform                 | arch | lab          | compiler | defconfig      =
              | regressions
-------------------------+------+--------------+----------+----------------=
--------------+------------
imx6q-sabresd            | arm  | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5faca47855047ebc67db8886

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
37-ge83d2e1f2d190/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
37-ge83d2e1f2d190/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faca47855047ebc67db8=
887
        failing since 17 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch | lab          | compiler | defconfig      =
              | regressions
-------------------------+------+--------------+----------+----------------=
--------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5faca9f6b216d676aadb8875

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
37-ge83d2e1f2d190/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
37-ge83d2e1f2d190/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faca9f6b216d676aadb8=
876
        failing since 17 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =20
