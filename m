Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDB035FF0FB
	for <lists+linux-next@lfdr.de>; Fri, 14 Oct 2022 17:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiJNPSc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Oct 2022 11:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJNPS3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Oct 2022 11:18:29 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1B21D3C4F
        for <linux-next@vger.kernel.org>; Fri, 14 Oct 2022 08:18:25 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id l127so5221145vsc.3
        for <linux-next@vger.kernel.org>; Fri, 14 Oct 2022 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lZJVmdNtC1j9/mWqu/caOCjYQKYRBqpA6S7iKppwa7o=;
        b=LimdSVsDrubwkL4/XTJ04Aqy1mJlDCe5OLG8aJx9vkpbCYVGzUSfnR8qQwtnB2HxTv
         C/wVupFsKz5mhvpMaGKqco+i4ZgSRjEQt0ry9BwtASOGdksMUh8yxdEpebTWxEUEqdlg
         DCkkNicLmIc5+zIpvpEMBJNH61md/vTt80cX29ZSgEu355vKbtlJ7Usw4P1L+2fEk3fg
         A9Cugs2iD7kPX1PbBp9IipWi3MDktlEgdhZnymYMmVQO61dqSc0LfFx4MVdGqcrTnyZG
         cKdH+rSjsu3uCuO2CZVk3weVa5o1gv2fQyW0TSdIdN3mvzd1Thy6C6xD0qRtdp9JiCfa
         /HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZJVmdNtC1j9/mWqu/caOCjYQKYRBqpA6S7iKppwa7o=;
        b=OIduxe2S27Fc/QpKjMHBqSQBYm2HJVgU0icxnp7DH71Y1h1wGUicKozh7hnE9s9o5Q
         s14m8FMtMfjaElomrcgkwodfyDWCSBtgffd1y50h8xI28i3jCFc8miP5STLEuE2hrFCc
         5pdttTI5L1/ffBcvmE6hBN+DQSQA7Z5RTxRinBLeeqBpMjuazsClEfn43RD0vwWfjO7s
         vQEMKUe8R+eZgA/B7LQ6auhpNQAstM1jCBmiEu+uJq1elcv2UALBY6p9kxcIp1Zl5oUQ
         unMvITdhR7nq38r3XaOlj/8GQyt6f5M8M7ZEJzyRcqgK1C2Whli7mmCzqrVN3XenFe5f
         o9uQ==
X-Gm-Message-State: ACrzQf1iVe3KpAYt8OrXgnw+KJCraUTf47wZbnEsSw2JDWmscRVaZRNv
        rt5MuYvH+zKatQ16S+eb1cm+fd987meHiBNz
X-Google-Smtp-Source: AMsMyM6MCxxxJskZcraUhGMC0kFVyBQyyes9EPK/cuKWjuYbQ/CuTgBeYMYJTHht43hl5GUPtcSCRg==
X-Received: by 2002:a17:903:1003:b0:181:6c26:1114 with SMTP id a3-20020a170903100300b001816c261114mr5602649plb.75.1665760692005;
        Fri, 14 Oct 2022 08:18:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s6-20020a170902a50600b001767f6f04efsm1843687plq.242.2022.10.14.08.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:18:11 -0700 (PDT)
Message-ID: <63497db3.170a0220.44c59.3931@mx.google.com>
Date:   Fri, 14 Oct 2022 08:18:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.0-11963-g99eb6a4dd485
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 474 runs,
 24 regressions (v6.0-11963-g99eb6a4dd485)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 474 runs, 24 regressions (v6.0-11963-g99eb6a4d=
d485)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =

imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+debug              | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+debug              | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-11963-g99eb6a4dd485/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-11963-g99eb6a4dd485
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      99eb6a4dd485a9635ca4ef5c3617fc20ca59b640 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/634944cd5b556bcea5cab642

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/634944cd5b556bc=
ea5cab64a
        failing since 263 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-10-14T11:15:07.896223  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-10-14T11:15:07.896506  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-10-14T11:15:07.899193  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-10-14T11:15:07.947277  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6349458b3219005a6ccab8d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-ud=
oo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-ud=
oo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6349458b3219005a6ccab=
8d1
        failing since 36 days (last pass: v5.19-rc5-383-g73ad9bd963c1, firs=
t fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/634945a1542a56fbbbcab5ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udo=
o.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udo=
o.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634945a1542a56fbbbcab=
5ee
        failing since 38 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/634947851c0bb665d5cab685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634947851c0bb665d5cab=
686
        failing since 38 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6349466c4f3c893f8ccab60c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6349466c4f3c893f8ccab=
60d
        failing since 71 days (last pass: v5.19-1483-gffa33bbcf63ea, first =
fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/634944f1c94a5f65c1cab61b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634944f1c94a5f65c1cab=
61c
        failing since 21 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/634948383b0223d6abcab656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634948383b0223d6abcab=
657
        failing since 21 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63494b451f4d3b90cccab609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline=
-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline=
-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63494b451f4d3b90cccab=
60a
        failing since 17 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63494d00488a412f84cab5ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63494d00488a412f84cab=
5ee
        failing since 17 days (last pass: v6.0-rc6-280-g7faf69694280, first=
 fail: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63494e799fc8ffcddccab5ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nx=
p/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nx=
p/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63494e799fc8ffcddccab=
5f0
        failing since 21 days (last pass: v6.0-rc6-280-g7faf69694280, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63495a4e2359e134eecab602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63495a4e2359e134eecab=
603
        failing since 167 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63494fd3b8d5464f8ecab623

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63494fd3b8d5464f8ecab=
624
        failing since 3 days (last pass: v6.0-9666-g02c05e0b8d5c, first fai=
l: v6.0-10339-g565da9e84d8f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63494dcbbbfdffcd68cab607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-sl2=
8-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-sl2=
8-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63494dcbbbfdffcd68cab=
608
        failing since 3 days (last pass: v6.0-9666-g02c05e0b8d5c, first fai=
l: v6.0-10339-g565da9e84d8f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6349447284068f8456cab627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6349447284068f8456cab=
628
        failing since 69 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6349437c3fc87f640ccab602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6349437c3fc87f640ccab=
603
        failing since 2 days (last pass: v6.0-9666-g02c05e0b8d5c, first fai=
l: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63494828de90c2b54ecab5f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63494828de90c2b54ecab=
5f1
        failing since 2 days (last pass: v6.0-5324-g7871897dadfa9, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63494828de90c2b54ecab5f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63494828de90c2b54ecab=
5f8
        failing since 2 days (last pass: v6.0-5324-g7871897dadfa9, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6349481453a7d963d4cab5f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6349481453a7d963d4cab=
5f6
        failing since 2 days (last pass: v6.0-5324-g7871897dadfa9, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63494814eec00df7e6cab60e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63494814eec00df7e6cab=
60f
        failing since 2 days (last pass: v6.0-5324-g7871897dadfa9, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/634944d14b88c3fbadcab626

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/634944d14b88c3fbadcab648
        failing since 228 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-10-14T11:15:11.186637  /lava-7583246/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/634944d14b88c3fbadcab668
        failing since 136 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-10-14T11:15:08.117936  /lava-7583246/1/../bin/lava-test-case
    2022-10-14T11:15:08.131960  <8>[   46.159237] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/634944d14b88c3fbadcab669
        failing since 136 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-10-14T11:15:05.989646  <8>[   44.016495] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-10-14T11:15:07.050563  /lava-7583246/1/../bin/lava-test-case
    2022-10-14T11:15:07.067085  <8>[   45.094007] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/634944d14b88c3fbadcab66a
        failing since 136 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-10-14T11:15:05.969879  /lava-7583246/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6349498a6e17b01624cab623

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-11963-=
g99eb6a4dd485/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6349498a6e17b01624cab=
624
        failing since 2 days (last pass: v6.0-10339-g565da9e84d8f, first fa=
il: v6.0-11312-g1778d6da389c) =

 =20
