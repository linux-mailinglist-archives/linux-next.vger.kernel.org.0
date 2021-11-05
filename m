Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD83446202
	for <lists+linux-next@lfdr.de>; Fri,  5 Nov 2021 11:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbhKEKRa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 06:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhKEKR3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Nov 2021 06:17:29 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FD0C061714
        for <linux-next@vger.kernel.org>; Fri,  5 Nov 2021 03:14:50 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n36-20020a17090a5aa700b0019fa884ab85so2973644pji.5
        for <linux-next@vger.kernel.org>; Fri, 05 Nov 2021 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Q/a6d5EXOmVO4B5Tc+IGq22tYgYlSMiBcv8tNH9JDLU=;
        b=zrcpc+jXVIyDtAMRtStYxz5IXySPF7LOY6svCRuOb5ZRQlYAH3FLFeTqY/RrcFT7Rf
         3k1wxHAO3gq80mDb2uvano6kqftLELvCeXDeFLzC4OBlOe91tvkrFiSZPLgcsy7v+Rj5
         D182jCvbHprmMQdk93ZTAEE2lN7cbxZwSIK+D1YQ30cyCliBd759jpdJ1WOHnB7aaDjY
         IZSIWIh0a5nCBfC4iunpJR6ZNz2Z6xiZ/BnudsZY/mxhDVL+3HxZg5AiQrXANQhrG+Nd
         EIsZo349l9JG3Qzc8pBpBH7m7fl3+lxPPUdbsr/l+nYKweuYZuJ6N40uBPdQRq2QQw+7
         I6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Q/a6d5EXOmVO4B5Tc+IGq22tYgYlSMiBcv8tNH9JDLU=;
        b=R4CVeu5aAO9l0KX12Gaocdqd7i0rYvgRzjja3YxQR58di7Z8lihOuIB71ndGL56zAT
         L6+lt3807iCvN/V2cOyuz5koQaTfqyHetklclYgLxSgJg0n/aKalnaIFnlcnCSQU45Jb
         CxzpqIoG3r6JU7mUzpcIjbe0lr1SNWHSczmXAfb8SsYSuBPJ6XqB33WxIjO3MKlcbIaQ
         JGCZS3KoCo3n35d9MX776d6iy3Y5UslxPa1AKdCX/VkTC6HaTC9JAhCXhnDBuXp1T0gb
         79Q6Mf4dIaCzODnCIGdzX4MpgGWQHRNtgXNzJkPEJ/qNhnsR32ImlttwpdcNZHUcj3kV
         foCg==
X-Gm-Message-State: AOAM531TDE+J6bE+F382LFpFwdzHl9nwA/R2zavOSQq76e11Kez0S+Gh
        cY4uXdeFqOfMfDNPjxSTzq4sqMJDeLgO4NvI
X-Google-Smtp-Source: ABdhPJwcyz39kj5eThRmvbbnwx8r6ZmQlZHA0zjGglYWn6kgZxrAfQYu1YB+PnuaaQkTcGEsK25CNw==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id oo15mr28739281pjb.169.1636107289532;
        Fri, 05 Nov 2021 03:14:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e14sm5766216pga.76.2021.11.05.03.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 03:14:49 -0700 (PDT)
Message-ID: <61850419.1c69fb81.a6c95.387a@mx.google.com>
Date:   Fri, 05 Nov 2021 03:14:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211105
X-Kernelci-Report-Type: test
Subject: next/master baseline: 660 runs, 2 regressions (next-20211105)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 660 runs, 2 regressions (next-20211105)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig          | re=
gressions
----------------+-------+--------------+----------+--------------------+---=
---------
beagle-xm       | arm   | lab-baylibre | clang-13 | multi_v7_defconfig | 1 =
         =

fsl-ls1043a-rdb | arm64 | lab-nxp      | gcc-10   | defconfig+ima      | 1 =
         =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211105/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211105
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b477ae38e81579a32caca7f4fb428275cb6b46c1 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig          | re=
gressions
----------------+-------+--------------+----------+--------------------+---=
---------
beagle-xm       | arm   | lab-baylibre | clang-13 | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6184cbb888be65388c3358f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211029101439+08e3a=
5ccd952-1~exp1~20211029222017.20)
  Plain log:   https://storage.kernelci.org//next/master/next-20211105/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211105/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6184cbb888be65388c335=
8f5
        failing since 8 days (last pass: next-20211026, first fail: next-20=
211027) =

 =



platform        | arch  | lab          | compiler | defconfig          | re=
gressions
----------------+-------+--------------+----------+--------------------+---=
---------
fsl-ls1043a-rdb | arm64 | lab-nxp      | gcc-10   | defconfig+ima      | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6184ca64c199f915d3335916

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211105/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211105/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6184ca64c199f915d3335=
917
        new failure (last pass: next-20211104) =

 =20
