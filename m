Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D946A27F2F2
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 22:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729767AbgI3UFA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 16:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgI3UFA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2020 16:05:00 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C644FC061755
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 13:04:58 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id w7so1966509pfi.4
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 13:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oegtEeTsNZVTlXBOeFLGC+vm75wXNXAJoEuEXURhq6Y=;
        b=zpJ+x1mS3gYtBZjcSAebaMHTZFwS8rHrDh5pIbkHkZU2vqcszbPXpMsxvyXhc2azOG
         MudpWfwBjszaBxfZ4DtFpjeHnMUj5Kmxnt6Zb7sGl08C5DjqeXNwRWLMVXGgsd2OJ3dJ
         rSKVp/EeTuWPNvmCIVZtv/4GmWEcB3Y+BjYBjqM/n3NvvKua9FA7VRo63Kg8EwMnPI0I
         3EjovfSkmmVJGVX/isdb3ayFNZLYrv5yBpmn7naJf1jWvfOoAVou7To+cJMQLF++4MbL
         R8JCa74EI9imlCeZraXqp/BWUz8EAP2+jB4j8grSiGSIkGe7SvDMoYrZ+mHhNvmxK9tp
         1rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oegtEeTsNZVTlXBOeFLGC+vm75wXNXAJoEuEXURhq6Y=;
        b=JTnVkmsGtkPEz94uR/EY9yGf7miSr5aS3kTCMoiEobjj/7P+ODLuIIZJ3Qunvm6zBJ
         /Xjqez3sQ+1OFrG2UK3r3B9vVF3Hby2xxvp6wbi4uGeUpSiiKZDCizPibFRRmhqCbr0H
         EJOfQ3qZzlVs1h91vK5XZgSs8YyUNkhkZGRjt9bya6wz+jBsNQJezYgQqS5JSAHVei7u
         pfQx8qIk6mSwOnzCypi33f2Y+CPZZI71UH5cHOI6/yqpjWsyroiAQgQKeSl6liC7QLP9
         RgkSD+dgb2Pf8dwblqEbsbYPXVAb+I/L+uYENL/cBiE5e+BHLtBCz4a0GrC16q7Dbzc8
         ONKw==
X-Gm-Message-State: AOAM5319zGwyHLehPOhQxIugPrBOiNROZkWaRO8fz2vsBCGB1OSswYg6
        tRXo+pLzmFBq5Lv4mWMgm75ONykY+xDMdw==
X-Google-Smtp-Source: ABdhPJylThACY2JU3a7X1HGEZmVz+a1ekDGqQdg5jvlZ9VwxSy9kwjPMDcX/IHGexf0+KNgbQ3eDvA==
X-Received: by 2002:a17:902:684f:b029:d2:4345:716 with SMTP id f15-20020a170902684fb02900d243450716mr4063594pln.27.1601496297847;
        Wed, 30 Sep 2020 13:04:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bv7sm3051191pjb.55.2020.09.30.13.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 13:04:57 -0700 (PDT)
Message-ID: <5f74e4e9.1c69fb81.3bd89.6319@mx.google.com>
Date:   Wed, 30 Sep 2020 13:04:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200930
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 482 runs, 6 regressions (next-20200930)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 482 runs, 6 regressions (next-20200930)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3288-veyron-jaq     | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 67/69  =

rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200930/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200930
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      de69ee6df1cfbf3c67787d8504fd21b59da39572 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f74b0a14239a9ebd5877197

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200930/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200930/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f74b0a14239a9ebd5877=
198
      failing since 155 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f74b17cad9a4687f7877182

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200930/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200930/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f74b17cad9a4687f7877=
183
      new failure (last pass: next-20200929)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f74b56fdb0985cb3d87718d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200930/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200930/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f74b56fdb0985cb3d877=
18e
      failing since 70 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3288-veyron-jaq     | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f74dd74858b864c4587716e

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200930/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200930/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f74dd74858b864=
c458771b4
      failing since 5 days (last pass: next-20200924, first fail: next-2020=
0925)
      4 lines

    2020-09-30 19:33:02.221000  kern  :alert : pgd =3D 8293cda2
    2020-09-30 19:33:02.221000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f74dd74858b=
864c458771b5
      failing since 5 days (last pass: next-20200924, first fail: next-2020=
0925)
      41 lines

    2020-09-30 19:33:02.239000  kern  :emerg : Process kworker/0:4 (pid: 46=
, stack limit =3D 0xa659131c)
    2020-09-30 19:33:02.251000  kern  :emerg : Stack: (0xc2963d80 to 0xc296=
4000)
    2020-09-30 19:33:02.251000  kern  :emerg : 3d80: c2963db2 ffffffb6 ffff=
ffff c0700394 c2963e00 ffffff04 ffff0a00 c0c76418
    2020-09-30 19:33:02.264000  kern  :emerg : 3da0: 00000016 c30b8000 c296=
3db2 c30b8000 c14b7d78 c07041f0 c14b7d78 ffffff04
    2020-09-30 19:33:02.276000  kern  :emerg : 3dc0: ffff0a00 c09c28d0 a000=
0093 c30b8000 3cf47fff c1804048 ffffe000 ffffff04
    2020-09-30 19:33:02.289000  kern  :emerg : 3de0: ffff0a00 22d84c88 0000=
004a c1804048 c1804048 00000002 c30b8000 c308e020
    2020-09-30 19:33:02.290000  kern  :emerg : 3e00: c19f5dcc c308e000 c31b=
8000 c0704564 c2963e28 22d84c88 c30b8000 00000000
    2020-09-30 19:33:02.301000  kern  :emerg : 3e20: c0ca697c c14b7d78 003b=
ffc4 22d84c88 ffff0a00 22d84c88 003bffc4 22d84c88
    2020-09-30 19:33:02.314000  kern  :emerg : 3e40: c1804048 c19f4c50 c30b=
8000 0000004a c31b8000 c31b8000 c30b8000 c148f8c0
    2020-09-30 19:33:02.327000  kern  :emerg : 3e60: c31b8000 c0ca6a20 0000=
000f 00000000 c308e020 c308e000 c31b8000 c0ca6c18
    ... (30 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f74ae10e89272646e877190

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200930/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200930/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f74ae10e89272646e877=
191
      failing since 1 day (last pass: next-20200928, first fail: next-20200=
929)  =20
