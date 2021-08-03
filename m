Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EC23DE491
	for <lists+linux-next@lfdr.de>; Tue,  3 Aug 2021 04:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbhHCC7E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Aug 2021 22:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233537AbhHCC7D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Aug 2021 22:59:03 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA5BC06175F
        for <linux-next@vger.kernel.org>; Mon,  2 Aug 2021 19:58:52 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id dw2-20020a17090b0942b0290177cb475142so1903773pjb.2
        for <linux-next@vger.kernel.org>; Mon, 02 Aug 2021 19:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9nGTnBqZhva5klmk82kfpcvyk+o1/eSmpFzZSNFsDvY=;
        b=NmjE9WhyWTqHB1ppn3c2uDYFIk5EtErfHpcVC7xO+XNTaus00Q9F2J25PxwEg5xI/d
         LFf36Go91Tyr/Nj7J49Sk792pWC4qw5nd6iDSs6w2tcP4zqZexpI6UZdaSFWzzjNMabM
         9CkP5Rvc2JPMAKNWtH4Ou5B52IB4fSslw32QBpB8sOXfO3fByh8uBktdT5HHvS9nRPQo
         rf9zhiBnlZjogmwLe4uXNor9yO+2qpaaLkzMzSrvJIXTHxzPosPoxoJ8wvwL8rM9Yot9
         RaBSeRPxrNts8HclglytbuxoAKWN+Zm2sVfc1rpYkSaGxNDikXKs/Q+U8yzKxGtrgQCK
         EpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9nGTnBqZhva5klmk82kfpcvyk+o1/eSmpFzZSNFsDvY=;
        b=YSWseJPAHR8k5Jq+4hS9Wyk5SXWr0vNmg+td3F2gWdLL7pcfrKliAG8DURVkehmXnk
         +v7GblmKkUesdHQBWI7cplMusxifZW4w0dEKWIQiGoBo1I+numu3NSnqcEujND3+hhT2
         IeRdIVid061GfQIRRekH24qsHg6ExQ5IerZJYttgRbk8TYUQV38FYq9UkhIACyCPSutT
         RrrjK66L6uxo/+7WLJETecPLqOlhbKl90SLj4V5DUwObiRjRhOXhLD2Ebx77VwO6pbkR
         Xsnx0VyXyJYQp+u2dloS0mm8wK4yEgzb52Z5Z0TFfAy9aSIczJF2NsBkHtJe19LaH+lp
         CGNA==
X-Gm-Message-State: AOAM532eMjVjqnyvwcuBla+Y273Lbk1qn+wFLJS3OuyAmSUYAS4mqCV0
        AN0WO6JT2lSkSXQdnGzRt+qpNnrv1VAV87c+
X-Google-Smtp-Source: ABdhPJzDLA0xUtL3yPZzJ7P27U4z16t46FpLeLtShJBDhThcYq9KT1tpzplBrC5fclPxsi0Eo5ob1A==
X-Received: by 2002:a17:902:ab4a:b029:12c:4a36:1561 with SMTP id ij10-20020a170902ab4ab029012c4a361561mr16863291plb.8.1627959531860;
        Mon, 02 Aug 2021 19:58:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mq7sm809616pjb.50.2021.08.02.19.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 19:58:51 -0700 (PDT)
Message-ID: <6108b0eb.1c69fb81.2af6b.4421@mx.google.com>
Date:   Mon, 02 Aug 2021 19:58:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.14-rc4-249-ga6e430e3f3af
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 423 runs,
 17 regressions (v5.14-rc4-249-ga6e430e3f3af)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 423 runs, 17 regressions (v5.14-rc4-249-ga6e43=
0e3f3af)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =

fsl-ls1012a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =

fsl-ls1043a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =

fsl-lx2160a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 1          =

imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =

rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+ima =
               | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-rc4-249-ga6e430e3f3af/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-rc4-249-ga6e430e3f3af
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a6e430e3f3afc0e34d27584015b1a7f110200ab8 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61087b714fa3b971f2b1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61087b714fa3b971f2b13=
670
        failing since 179 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/610878221b1ec70824b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610878221b1ec70824b13=
66f
        failing since 27 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/61087566e077b74de1b136ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61087566e077b74de1b13=
6cf
        failing since 27 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1012a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/610882c1043c6b9e46b13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1012a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1012a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610882c1043c6b9e46b13=
679
        new failure (last pass: v5.14-rc3-353-gf8730f66145e) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1043a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/610881f752cbeaf7d6b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610881f752cbeaf7d6b13=
662
        new failure (last pass: v5.14-rc4-200-g928b53f6fae6) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-lx2160a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/61087aef16257152d3b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-lx2160a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-lx2160a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61087aef16257152d3b13=
66f
        new failure (last pass: v5.14-rc3-353-gf8730f66145e) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61088d3c81ff76ee25b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61088d3c81ff76ee25b13=
662
        failing since 32 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61087a28d7ed454d25b13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61087a28d7ed454d25b13=
666
        failing since 280 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61087bcb6dd55064b4b13669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61087bcb6dd55064b4b13=
66a
        new failure (last pass: v5.14-rc4-200-g928b53f6fae6) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/610880bb06d4593825b13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610880bb06d4593825b13=
679
        failing since 4 days (last pass: v5.14-rc3-199-g011c1b80c7a5, first=
 fail: v5.14-rc3-302-g1c47cc89bed6) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6108737776ceacb933b1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108737776ceacb933b13=
67b
        failing since 259 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610878d32a89d664aab1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610878d32a89d664aab13=
680
        failing since 259 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6108729ba427d48f61b13669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108729ba427d48f61b13=
66a
        failing since 259 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610872b47fdeb98596b1367d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610872b47fdeb98596b13=
67e
        failing since 259 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/610877b52bc13bbe28b13671

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/610877b52bc13bbe28b1367b
        failing since 21 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-08-02T22:54:29.977892  /lava-4312231/1/../bin/lava-test-case
    2021-08-02T22:54:29.988948  <8>[   25.030063] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/610877b52bc13bbe28b1367c
        failing since 21 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-08-02T22:54:28.940714  /lava-4312231/1/../bin/lava-test-case
    2021-08-02T22:54:28.952891  <8>[   23.993520] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6108783d57f89abca9b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
49-ga6e430e3f3af/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108783d57f89abca9b13=
662
        new failure (last pass: v5.14-rc4-200-g928b53f6fae6) =

 =20
