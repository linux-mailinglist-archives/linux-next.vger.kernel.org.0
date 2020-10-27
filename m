Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF70329A90F
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 11:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388587AbgJ0KGu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Oct 2020 06:06:50 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:34647 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733255AbgJ0KGs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Oct 2020 06:06:48 -0400
Received: by mail-pl1-f182.google.com with SMTP id r3so507412plo.1
        for <linux-next@vger.kernel.org>; Tue, 27 Oct 2020 03:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ay0NjprJZt901ilPGdZ5Usam0oYsyTiU49+6ZmQC/vc=;
        b=ho5KG+RC5+qN6nHKcH5UaPyvpCSPn4aC49MfffJ5T5KTGgdK0u9f7dBBAWom9gcWKQ
         XWmjYC9zOCsYt6v6TV8uHiC3tRVKt+OXlNokzzl5ls6//7kLCoDMuh/YdxhyaoIPUWs2
         rG5ISKduoX091GUUfkxYqsH1gJjaHvJ+24SZ7zg2mKnVxuBDwgqgRaGCckQaZwvRdl4t
         nU2oIYtkuiEaEJoCi+1lPBbNyTG+tCVk4QVyUK0dfmlEYzz/XdJyVi6Hx6sGvH9dOQXZ
         R5oaR9N+PSlzQT3MzKhETQc6fn8aTHVTSm7vEvarq68U9B0UETNhwsYyptGqxsWveu9w
         bSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ay0NjprJZt901ilPGdZ5Usam0oYsyTiU49+6ZmQC/vc=;
        b=lxUSdrd7PVuKsN6F9PZKJN58bFqp3+nRaRePN25uoWVd6+knS9/I894tix6kdv2zpZ
         27AjVbZsG9yk3nTiLB89NzHsQe40JMUyHTeF7BSsaG/WLVDttyjgiysmfJn/Ii2PbEOM
         qB6w+YFvNg+RdunbWNR4yl12wzP2/91Ke9DoUNJZlKNOMHWlwFyWjIF9iK6mS6m+uT1z
         pTc9EX/P1t6vmkd1LOozQ2XnMQVFjOTpJEf7DEG0tcQ5be1qwtRW3YwLitr1tgf1IHV7
         q2ljPwKhbf8fvf7DpDj5/txg3MpZ4I5L4XvV4QrGp3Yn/5cUGQG95Uly7uQYSKllS9wr
         z92w==
X-Gm-Message-State: AOAM532cGkqmKjCXAGZzA5nG0iAI/P+Rq7ax9wJ2n+n+UsJVj8fWCHTj
        4jmL5XqIZsY+THlpKGpMWu8nxjHwjJhxiw==
X-Google-Smtp-Source: ABdhPJxZRUj8nk4IJ0dmhKlpb/EkcIapdizrj5E6IoroBdS2mBQB5ZWhunWx9h8aXxhf/aXjUC6zLQ==
X-Received: by 2002:a17:902:6b84:b029:d5:ef85:1a79 with SMTP id p4-20020a1709026b84b02900d5ef851a79mr1851092plk.32.1603793206638;
        Tue, 27 Oct 2020 03:06:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6sm1725476pfj.48.2020.10.27.03.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:06:45 -0700 (PDT)
Message-ID: <5f97f135.1c69fb81.97b6.340b@mx.google.com>
Date:   Tue, 27 Oct 2020 03:06:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20201027
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 232 runs, 5 regressions (next-20201027)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 232 runs, 5 regressions (next-20201027)

Regressions Summary
-------------------

platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained    | arm  | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 1          =

bcm2836-rpi-2-b          | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

panda                    | arm  | lab-collabora | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201027/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201027
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0dec50edcc9216535f82b1987c0a51efb3e23674 =



Test Regressions
---------------- =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained    | arm  | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/5f97b64ec441ce9775381048

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201027/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201027/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f97b64ec441ce9775381=
049
        failing since 181 days (last pass: next-20200424, first fail: next-=
20200428) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b          | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f97baa7505d720dfa381013

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201027/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201027/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f97baa7505d720dfa381=
014
        failing since 26 days (last pass: next-20200929, first fail: next-2=
0200930) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f97ba56fe277cbcca38101c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201027/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201027/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f97ba56fe277cbcca381=
01d
        failing since 1 day (last pass: next-20201023, first fail: next-202=
01026) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f97b96d5acf55c67d38102e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201027/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201027/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f97b96d5acf55c67d381=
02f
        new failure (last pass: next-20201026) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
panda                    | arm  | lab-collabora | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f97b8c9eaa8a8becd38102a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201027/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201027/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f97b8c9eaa8a8becd381=
02b
        failing since 97 days (last pass: next-20200706, first fail: next-2=
0200721) =

 =20
