Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039044A5D69
	for <lists+linux-next@lfdr.de>; Tue,  1 Feb 2022 14:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238435AbiBAN2E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Feb 2022 08:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237996AbiBAN2C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Feb 2022 08:28:02 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCCBC061714
        for <linux-next@vger.kernel.org>; Tue,  1 Feb 2022 05:28:02 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id q63so17112667pja.1
        for <linux-next@vger.kernel.org>; Tue, 01 Feb 2022 05:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=T9fmYOMPbZqS8lB2QmjEmDyUhuoj596P6xu2sHjUYcw=;
        b=bOZwcNLTlzNPVJDmO0jsWfIyl9XGFFuY+PMcankzcAMZHg96OA7EQxuej4hDR2DWVD
         AhQb4lDaBehMzlI7cVO5rWqtEwrAsqZspH1esZR/XxC8l7clT6seZCYZwtngz3cFrZ4c
         XgxjSh9LqYRnYTh2Tij2o35FMkxjBusJm4JxycxHCVN1u4rn2Azk77ew8d+RwIYvZczv
         QsS48QsLhLAvtNRgttExafhI647aUb0IZFwf4bYaI/JMOKW3ZFlnIH8vzaaDIq56TgNg
         pMmk7zWTca4shOXRP2bGamPSsJLN0A82C5Gx0n9FPtfnMpuzfRqWIdvYfkifB6rZphjN
         PwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=T9fmYOMPbZqS8lB2QmjEmDyUhuoj596P6xu2sHjUYcw=;
        b=bMuX+72ZFTucpOWYUXdXLs3j7/onTe4QbGfIxVdg1OcaGJCMzcoQoPizW4HmROkehf
         2LQ8JiFQCp7Mu9MbXIdeR/YceXEcmyX/Glk63K5v6VDl8f/cMXYFk4VvOXCegozG1qI0
         lCJPBXQHcecxS6RGXD7LsJbj4xGqMX1AttKOJrhwLp7k1/wOPZS4qzGlt8T19KluFLJj
         dUYrk9raF+Siw7p1r6WNZyS+hLToH/+ByyrpafvBGkt8f/033/K2g742aN4chS1wLH+3
         bn7acXPCQm2APbW5JLe/GxdbBgEF2glTOUdcqJHOi5I1/F9nd1/anb7DYhYsPaq7mJzU
         neCA==
X-Gm-Message-State: AOAM531LgDN0B9j8kQcvMe69bmzwpAREppsgZcExNyMNqLrUx7Qu8Xxg
        kw2ptCCDX1SHrkUTnqH4UWevDxPzGE2GLfM2
X-Google-Smtp-Source: ABdhPJzHH3szD9hafOJDE03KDejc2ElvRStThr/qxMAAqk9SKtfowrgabAIOH76zKbie7LL9RyHPqQ==
X-Received: by 2002:a17:90a:f485:: with SMTP id bx5mr2331199pjb.46.1643722081868;
        Tue, 01 Feb 2022 05:28:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u2sm24326808pfk.15.2022.02.01.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 05:28:01 -0800 (PST)
Message-ID: <61f93561.1c69fb81.f85a0.e79f@mx.google.com>
Date:   Tue, 01 Feb 2022 05:28:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.17-rc2-228-ga7fc3604a297
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 481 runs,
 3 regressions (v5.17-rc2-228-ga7fc3604a297)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 481 runs, 3 regressions (v5.17-rc2-228-ga7fc36=
04a297)

Regressions Summary
-------------------

platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b          | arm  | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug     | 1          =

imx6ul-14x14-evk         | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc2-228-ga7fc3604a297/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc2-228-ga7fc3604a297
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a7fc3604a297400b1140adf29cc29de7bf17e4f3 =



Test Regressions
---------------- =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b          | arm  | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f905c63d7b4c099d5d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-2=
28-ga7fc3604a297/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-2=
28-ga7fc3604a297/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f905c63d7b4c099d5d6=
ee9
        failing since 83 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/61f901a3ae89490d555d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-2=
28-ga7fc3604a297/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-2=
28-ga7fc3604a297/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f901a3ae89490d555d6=
ee9
        new failure (last pass: v5.17-rc1-385-g87ced262c135) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6ul-14x14-evk         | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61f8fe8ccf4ee1adac5d6ef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-2=
28-ga7fc3604a297/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-2=
28-ga7fc3604a297/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f8fe8ccf4ee1adac5d6=
ef6
        failing since 12 days (last pass: v5.16-7998-gbeebf0a29205, first f=
ail: v5.16-11408-ga51e80162547) =

 =20
