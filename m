Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54ED75F34D
	for <lists+linux-next@lfdr.de>; Mon, 24 Jul 2023 12:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjGXK3Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Jul 2023 06:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjGXK3B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Jul 2023 06:29:01 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8272955BD
        for <linux-next@vger.kernel.org>; Mon, 24 Jul 2023 03:25:37 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-668711086f4so2646828b3a.1
        for <linux-next@vger.kernel.org>; Mon, 24 Jul 2023 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690194332; x=1690799132;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aNyivwnErDl8KS++mh4HnDiVvMdkQNk/ncMGPVxNwSA=;
        b=1+yoUGQFq0s0YIE56XnqBrebtieBeWuaHLQMOvW4l290lkZNJ2ZPArY8/jfA3zSbcD
         OrqPOmiUcJQ1IaRdLxb66kRwI9k3hquFpLFnU8cs1laRrswYwLZmVC2oKK5tc/mg6FRn
         u56LQiXso7te4J56ENiSPWpLoaWE+k5vNrQmz/MthwZsOfEwzbNMjM1QlCExc4VG43DE
         vHRvBTNjE0VofeFHJgCFHE0DHya06udiaLvMa4x4kucl7LTIWVEjk9ICsUilMa6jncLf
         eGY/4rhiUoI5/K0QZ/Cn6uYyUZFn+ft9laylmRIP3zd29y9QAOXSIs1UFbN1resI4St0
         yXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690194332; x=1690799132;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNyivwnErDl8KS++mh4HnDiVvMdkQNk/ncMGPVxNwSA=;
        b=Z6SsJQLiIbqO0Pyo+yspDHl+o7F17PaqYucPRIeyF4gRVakJYWNpsYYnBIn14zRkpv
         ssP8i+nnMaPiUGSQm5+pWh5eR5Xgc254qrvV5LLhNuPhc+XnoMkSGv02Dluk7UM+FFwB
         AmpL0kka9uuG5zg1JIN6KbpB6zTR/iNbexbaa15MjtXoiejnJIxvZMfVShVBJaHDGCNJ
         K0tbwcsFX56l4X1jiIqttri7s2o169aS84SbraBtRDdJtcYstMParm28nJMlsFQnmte6
         5zNL0xze04DB6bil0riZaUMZ3J7NVstTVaclfz5e8Z86B5uI9ZX8BP4w7IOOd4h12FJC
         IL4g==
X-Gm-Message-State: ABy/qLZq1ilP7PBv22iZKy/RuCaBwIwMAbBkZwdlB4GDB9CYZnyQtoI8
        h+c6FJCFBDGofxUUwLF1FbRFZ2JLwM4w1/rcfJwk6Q==
X-Google-Smtp-Source: APBJJlE3m9bFdkMQBz4Rv+cB3Sjugf2y8SuE2gTGsg5ZZjdJSgiORrCI4HDomkTLOFI0nUsxrpzncA==
X-Received: by 2002:a05:6a00:f94:b0:666:c1ae:3b87 with SMTP id ct20-20020a056a000f9400b00666c1ae3b87mr8942431pfb.12.1690194331908;
        Mon, 24 Jul 2023 03:25:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b00528da88275bsm8160208pgc.47.2023.07.24.03.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 03:25:31 -0700 (PDT)
Message-ID: <64be519b.630a0220.6731b.db69@mx.google.com>
Date:   Mon, 24 Jul 2023 03:25:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230724
X-Kernelci-Report-Type: test
Subject: next/master baseline: 34 runs, 12 regressions (next-20230724)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 34 runs, 12 regressions (next-20230724)

Regressions Summary
-------------------

platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv2      | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv2      | arm  | lab-broonie   | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv2      | arm  | lab-collabora | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv2-uefi | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv2-uefi | arm  | lab-broonie   | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv2-uefi | arm  | lab-collabora | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv3      | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv3      | arm  | lab-broonie   | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv3      | arm  | lab-collabora | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv3-uefi | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv3-uefi | arm  | lab-broonie   | gcc-10   | multi_v7_defco=
nfig+debug | 1          =

qemu_arm-virt-gicv3-uefi | arm  | lab-collabora | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230724/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230724
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36 =



Test Regressions
---------------- =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv2      | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0dc10d11e940668ace2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0dc10d11e940668ac=
e2d
        failing since 313 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv2      | arm  | lab-broonie   | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0dc6707a87372e8ace33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0dc6707a87372e8ac=
e34
        failing since 313 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv2      | arm  | lab-collabora | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0da50d11e940668ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0da50d11e940668ac=
e21
        failing since 313 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv2-uefi | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0dc2707a87372e8ace2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0dc2707a87372e8ac=
e2b
        failing since 311 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv2-uefi | arm  | lab-broonie   | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0dc7ede301d8278ace24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0dc7ede301d8278ac=
e25
        failing since 311 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv2-uefi | arm  | lab-collabora | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0da6707a87372e8ace1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0da6707a87372e8ac=
e20
        failing since 311 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv3      | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0dc0707a87372e8ace25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0dc0707a87372e8ac=
e26
        failing since 311 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv3      | arm  | lab-broonie   | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0dc5ede301d8278ace1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0dc5ede301d8278ac=
e1f
        failing since 311 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv3      | arm  | lab-collabora | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0da40d11e940668ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0da40d11e940668ac=
e1d
        failing since 311 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv3-uefi | arm  | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0dc4707a87372e8ace2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0dc4707a87372e8ac=
e2f
        failing since 313 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv3-uefi | arm  | lab-broonie   | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0dc9707a87372e8ace39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0dc9707a87372e8ac=
e3a
        failing since 313 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch | lab           | compiler | defconfig     =
           | regressions
-------------------------+------+---------------+----------+---------------=
-----------+------------
qemu_arm-virt-gicv3-uefi | arm  | lab-collabora | gcc-10   | multi_v7_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/64be0da70d11e940668ace26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230724/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64be0da70d11e940668ac=
e27
        failing since 313 days (last pass: next-20220907, first fail: next-=
20220913) =

 =20
