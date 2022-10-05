Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1755F5F4EF5
	for <lists+linux-next@lfdr.de>; Wed,  5 Oct 2022 05:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiJEDvj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Oct 2022 23:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJEDvh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Oct 2022 23:51:37 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25AA419BD
        for <linux-next@vger.kernel.org>; Tue,  4 Oct 2022 20:51:35 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id f140so9565506pfa.1
        for <linux-next@vger.kernel.org>; Tue, 04 Oct 2022 20:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=txYJJ1hzVK7RUAL1cFxiJkEZJSLMIBuQba5d5feZsM4=;
        b=b7Nemp1UmCajzAwv80AHZcflUpulCxjRnHXs8dfa10kW+7QL3YxWsvsbODb/77sr19
         eCbjFNI/8s+93utST3lguG5ZMku6acXtp1ILn/BYcsPMkMdahvDVlx9Z73+TWni7l6E6
         0CRnDZYrNzWnzleerm6I/+2tBqiPapgQ4H+Sg3hgYdqVJ6lzVxbhKhT7fCjsmG9mkTQA
         NiSxeJ0DhdUFWtjEhcvjMa3nv2akSAyd50QH1DCNd08SRyzgsqgsclE4EK2ycFAo8OLS
         ZWshO9wVlmOTKIIWqGtuWBnelMFCt93hsnELDkNFBM106mWIAqDGYhRDOO002PZ2CMmm
         344Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=txYJJ1hzVK7RUAL1cFxiJkEZJSLMIBuQba5d5feZsM4=;
        b=TBkEZfnBnIAK9ciDge9UVyCeD7m2xscEkxL7AuJ2oVXwmtoYoRLiRm4XH8XVhmbyKG
         bwC/cADSsz6GeLpWSRFn+dxGkqH8Njrjv8PwQkXmgSUlZn9vjFnCX6kZWXAS6cUPqf4I
         NyOyTlwmiz2DnhQXAevb8WayKhJjH9byCgX4UX7dqQHXGyd+aXX7TlhPx0TASjDSIdYu
         yt217iTav3OgUG1M9e3C2Sz+9t3SnacVZbBpe6duMHDQcA6h0KtXxkicNb6o49iUPl9Y
         FLwfgmzizBYWx/aYTJsF/+fsaxg+nVV6fiec5rN2xAkf6u72V67Af00IMI1l3MkNhk0J
         Fuog==
X-Gm-Message-State: ACrzQf3F+l8SFtBVOBoyac/GgyfgKjn2kH3P4q3OcifmwMixulQcd3gB
        RK98vzm9tLEaChmLvjvzB8DpcTUIJTfwmL6lPUc=
X-Google-Smtp-Source: AMsMyM71GDKADP6lfSwXk/ZG5pls0lDp+jEnc8cjKsgHPvBYijqNTVljBsD5ygeAHeeGdGgChBjm1A==
X-Received: by 2002:a05:6a00:198e:b0:541:f85a:6c27 with SMTP id d14-20020a056a00198e00b00541f85a6c27mr30707399pfl.81.1664941895016;
        Tue, 04 Oct 2022 20:51:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y12-20020aa793cc000000b00561f8fdba8esm906975pff.12.2022.10.04.20.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 20:51:34 -0700 (PDT)
Message-ID: <633cff46.a70a0220.d8a6c.24a5@mx.google.com>
Date:   Tue, 04 Oct 2022 20:51:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.0-1478-g66d0b903fa341
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 364 runs,
 14 regressions (v6.0-1478-g66d0b903fa341)
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

next/pending-fixes baseline: 364 runs, 14 regressions (v6.0-1478-g66d0b903f=
a341)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-10   | defconfig =
                   | 1          =

imx6dl-udoo                  | arm   | lab-broonie  | gcc-10   | imx_v6_v7_=
defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie  | gcc-10   | imx_v6_v7_=
defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp      | gcc-10   | imx_v6_v7_=
defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | imx_v6_v7_=
defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron  | gcc-10   | defconfig+=
crypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-1478-g66d0b903fa341/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-1478-g66d0b903fa341
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      66d0b903fa341dc1df9fb15483235def3aabe752 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/633cc7a767f27ea653cab651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed=
-a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed=
-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cc7a767f27ea653cab=
652
        failing since 5 days (last pass: v6.0-rc7-155-g163b641d42e4, first =
fail: v6.0-rc7-220-gb1698cc5708bd) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx6dl-udoo                  | arm   | lab-broonie  | gcc-10   | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633cc8999695e33badcab5f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-ud=
oo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-ud=
oo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cc8999695e33badcab=
5f5
        failing since 27 days (last pass: v5.19-rc5-383-g73ad9bd963c1, firs=
t fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx6q-udoo                   | arm   | lab-broonie  | gcc-10   | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633cc9390c7a85f8aacab613

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udo=
o.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udo=
o.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cc9390c7a85f8aacab=
614
        failing since 28 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx6sx-sdb                   | arm   | lab-nxp      | gcc-10   | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633cc8869baf28952acab5fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cc8869baf28952acab=
5fc
        failing since 28 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633cc9754d26563560cab5f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cc9754d26563560cab=
5f5
        failing since 61 days (last pass: v5.19-1483-gffa33bbcf63ea, first =
fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/633cc7e62e35db026ccab603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cc7e62e35db026ccab=
604
        failing since 7 days (last pass: v6.0-rc6-280-g7faf69694280, first =
fail: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/633ccc5c8fd298982acab624

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ccc5c8fd298982acab=
625
        failing since 11 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/633ccf67cd4b2c2718cab607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ccf67cd4b2c2718cab=
608
        failing since 11 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx7ulp-evk                  | arm   | lab-nxp      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/633cd0e66e461dc486cab5f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline=
-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline=
-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cd0e66e461dc486cab=
5fa
        failing since 7 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/633cc7b835db51f1b1cab5ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-ks=
witch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-ks=
witch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cc7b835db51f1b1cab=
600
        new failure (last pass: v6.0-rc7-272-g94a8751e2e2c7) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/633ccd944b2a72fe6fcab615

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-kontro=
n-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-kontro=
n-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633ccd944b2a72fe6fcab=
616
        new failure (last pass: v6.0-854-g37b3c1c31342c) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/633cd2099f321fd237cab605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cd2099f321fd237cab=
606
        new failure (last pass: v6.0-854-g37b3c1c31342c) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/633cd529d90bbef124cab5ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/base=
line-kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/base=
line-kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633cd529d90bbef124cab=
5ef
        new failure (last pass: v6.0-rc7-272-g94a8751e2e2c7) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron  | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/633cca9cef525f41fdcab610

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-1478-g=
66d0b903fa341/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/633=
cca9cef525f41fdcab623
        new failure (last pass: v6.0-rc7-272-g94a8751e2e2c7)

    2022-10-05T00:06:45.393396  /lava-179302/1/../bin/lava-test-case
    2022-10-05T00:06:45.394096  <8>[   20.806501] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-10-05T00:06:45.394357  /lava-179302/1/../bin/lava-test-case
    2022-10-05T00:06:45.394591  <8>[   20.826616] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-10-05T00:06:45.394820  /lava-179302/1/../bin/lava-test-case
    2022-10-05T00:06:45.395039  <8>[   20.848048] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-10-05T00:06:45.395258  /lava-179302/1/../bin/lava-test-case   =

 =20
