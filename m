Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2994DA55C
	for <lists+linux-next@lfdr.de>; Tue, 15 Mar 2022 23:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbiCOW2i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Mar 2022 18:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352157AbiCOW2h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Mar 2022 18:28:37 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC905C866
        for <linux-next@vger.kernel.org>; Tue, 15 Mar 2022 15:27:23 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id o6-20020a17090a9f8600b001c6562049d9so735666pjp.3
        for <linux-next@vger.kernel.org>; Tue, 15 Mar 2022 15:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CoMqlApIZLVggZNwFE5VMoBZytHe4+pMyt4TO1IQxdI=;
        b=Tiio24Rca3zcXhGI0Bw8XTLjTtrh8HYimvViMJJVfgEAW4rjk/nXVsto468VxqcW/n
         V2b81H04lZCGD/qQtuqBIoJpgYcQlNzk8ANp1+ilIKS9sASXaF1UZMR/ONrK/0aEukN+
         WD2BPBVr8r6wLOgpdMT3Gct78+eIBwie/MWfsU4E7s9xzsHet6/ahUwe3cW85rDM4gbb
         AhaQ+kZ3jBa5pD5K+O/SGNu26fUe7MTzXz74d16RoSUtyPvWg81hVO0QzwzNKUcNROzc
         jJKn94/kZo37VNf9oKMEKK+kNAPCa0FVCmTGdaf2DuV/1CF/XiBPC3ZQ8M3tCYHyj7b0
         kzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CoMqlApIZLVggZNwFE5VMoBZytHe4+pMyt4TO1IQxdI=;
        b=27dhTlptKCKsyNr/S2LX6FXwFzDFLfkSMJwIjz5E3l+OJ+OYxZs2kefGv7eDhUjkH7
         9YM2QW13TxJZJvpSOWBMwC78VsTnkJS/HsVp6PXo0fM5hjQraJEWXkwI93dOZRIBnByD
         5JdrdrPXY2ef1ebljhfwJUzXz2l4p6cGIsUeLiBJiLGWlMgq7KWLcqceBzl7W20ObDzs
         XI7w6F8fBKbNs5SHHyFQCNF5jsGl7x3hy5/cYpw9riiQs/8E8MUO71MJp9E/A8+8vOS0
         MF4zGjDx/tOS+5GJm46Qbhxv/993lx5urYgWVFyMLa6skBQMoY2AHXymeRxfkBQmbyED
         QhpA==
X-Gm-Message-State: AOAM530HstM3nI4lbS82NS4Hvv8bPkKOnX70Vj/NTmXKwxGoFHBChlom
        v2z/Xao9J2HxnVLY8gRWED7NEhC08WHGTTziNiU=
X-Google-Smtp-Source: ABdhPJyV3nFnbW1+JZ1skiC47ayuXZCJ+1uWbLydRRE5JuUrJUwvmx4ZfwGLknfXrWCh7zfb1eOt4w==
X-Received: by 2002:a17:90a:c68c:b0:1bf:a7c9:957a with SMTP id n12-20020a17090ac68c00b001bfa7c9957amr7061352pjt.177.1647383242775;
        Tue, 15 Mar 2022 15:27:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d9-20020a056a0010c900b004f774c13e96sm138085pfu.19.2022.03.15.15.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 15:27:22 -0700 (PDT)
Message-ID: <623112ca.1c69fb81.2c8a1.0833@mx.google.com>
Date:   Tue, 15 Mar 2022 15:27:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220315
Subject: next/master baseline: 306 runs, 18 regressions (next-20220315)
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

next/master baseline: 306 runs, 18 regressions (next-20220315)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

beagle-xm                    | arm    | lab-baylibre  | clang-14 | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =

da850-lcdk                   | arm    | lab-baylibre  | clang-14 | multi_v5=
_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | multi_v5=
_defconfig           | 1          =

hp-x360-12b-n4000-octopus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-n4000-octopus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =

panda                        | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =

qemu_arm-vexpress-a9         | arm    | lab-baylibre  | gcc-10   | vexpress=
_defconfig           | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre  | clang-14 | multi_v7=
_defconfig           | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220315/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220315
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a32cd981a6da2373c093d471ee4405a915e217d5 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6230da21f8bb7b3fe8c62992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230da21f8bb7b3fe8c62=
993
        new failure (last pass: next-20211224) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6230dcfbc673ebbd69c62a3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230dcfbc673ebbd69c62=
a3e
        new failure (last pass: next-20220310) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6230e169bc585b31f8c6297e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230e169bc585b31f8c62=
97f
        new failure (last pass: next-20220310) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | clang-14 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6230dc02eaf9e123a8c629fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220314103131+69ba5=
22c58d0-1~exp1~20220314103227.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230dc02eaf9e123a8c62=
9ff
        failing since 10 days (last pass: next-20220215, first fail: next-2=
0220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6230d9fdf8bb7b3fe8c62986

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230d9fdf8bb7b3fe8c62=
987
        failing since 10 days (last pass: next-20220201, first fail: next-2=
0220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | clang-14 | multi_v5=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6230d76415456a8bb5c62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220314103131+69ba5=
22c58d0-1~exp1~20220314103227.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v5_defconfig/clang-14/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v5_defconfig/clang-14/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230d76415456a8bb5c62=
972
        failing since 12 days (last pass: next-20220301, first fail: next-2=
0220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6230da39f30996b3e8c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230da39f30996b3e8c62=
969
        failing since 12 days (last pass: next-20220301, first fail: next-2=
0220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | multi_v5=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6230db8c735e88a3dec6297b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230db8c735e88a3dec62=
97c
        failing since 10 days (last pass: next-20220301, first fail: next-2=
0220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-n4000-octopus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6230dd727965784230c629a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230dd727965784230c62=
9a2
        new failure (last pass: next-20220310) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-n4000-octopus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6230e273de9eca3ebfc62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230e273de9eca3ebfc62=
972
        new failure (last pass: next-20220310) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6230e372696188cef0c6299c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230e372696188cef0c62=
99d
        new failure (last pass: next-20220310) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6230d8d01d92189f31c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230d8d01d92189f31c62=
976
        failing since 12 days (last pass: next-20220301, first fail: next-2=
0220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
panda                        | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6230dada3d1e6f9873c62995

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230dada3d1e6f9873c62=
996
        failing since 10 days (last pass: next-20220201, first fail: next-2=
0220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-baylibre  | gcc-10   | vexpress=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6230d80463abcd06ccc6296e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230d80463abcd06ccc62=
96f
        failing since 12 days (last pass: next-20220201, first fail: next-2=
0220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre  | clang-14 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6230dc6a8c9065702ec629c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220314103131+69ba5=
22c58d0-1~exp1~20220314103227.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun5i-a13-olinuxino-micro=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun5i-a13-olinuxino-micro=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230dc6a8c9065702ec62=
9c3
        failing since 12 days (last pass: next-20220301, first fail: next-2=
0220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6230de4b85afd59902c6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230de4b85afd59902c62=
98f
        failing since 10 days (last pass: next-20220301, first fail: next-2=
0220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6230e16be17b5fec4ec6299f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n5i-a13-olinuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230e16be17b5fec4ec62=
9a0
        failing since 12 days (last pass: next-20220301, first fail: next-2=
0220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6230d72d2f81b29937c62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220315/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220315/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6230d72d2f81b29937c62=
979
        failing since 12 days (last pass: next-20220201, first fail: next-2=
0220303) =

 =20
