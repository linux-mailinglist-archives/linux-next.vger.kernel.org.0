Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5DD94E3DCD
	for <lists+linux-next@lfdr.de>; Tue, 22 Mar 2022 12:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234389AbiCVLug (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Mar 2022 07:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbiCVLuf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Mar 2022 07:50:35 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9E88022A
        for <linux-next@vger.kernel.org>; Tue, 22 Mar 2022 04:49:08 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id o8so12444734pgf.9
        for <linux-next@vger.kernel.org>; Tue, 22 Mar 2022 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FlGXz4hIS3xMpx9AUzs+DhJopK8v+h4tQ/AtCF6kJKU=;
        b=Z8vDBBt8uIYNIgwOl07k9StKiK3rhO8z8CqwUSLIlJ0Pcd8t5fPUxnnyqdLqMuUIEY
         5EnLr9k3IChWjynpyyu4RojxqAE1XtOrTIo1QSwEOJzFOyx5JTOQGNoYmfOa8G6NNY/t
         zRCxIW/orYBGwel9FKAsHDbXcvaF8e0CZu7sIcxzaA1vwYwfH78QHCWiEZKkGgQvH3mS
         u1i+sA0+9/yo2/T5Lfc5tQYqmBFPCTEJO6tjWmTXm5jpjyMR8/Armxsl1I1rDQBrXy2T
         5dNFOcpH6rRUlE/TImrz/tAaPlJ/08HRBf08MM6hF4/VivdiXzqBmb5pXcsRJVW6DZBN
         RZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FlGXz4hIS3xMpx9AUzs+DhJopK8v+h4tQ/AtCF6kJKU=;
        b=Y1D9qaY7MGotJZ0xnc2VlM0XP5BFOAw334kzn9PNEzzfjJ5YA//g3jE8hWRCqJ2E45
         j3IT58qR4iqdvWdy7lJikXptEFU9K4RegRj8Q+7gKzVtzQYfg4pIo/rfK58PUqFQ28Yo
         XI2v2JMWmbk44b7A8OYBHPV9KGzxbewVOK5fW/QfH+DobyEUrKWO1tucv+ydnU9Bpszr
         QkVtTvDEUUrzVQsvd6vYn1AMOyOUEoATNMXPx+aLPtT9xtG9Gxxc4Eiga7gKTJj49Dxi
         G6OYPatqOMMZUx88/YROJoJOwfy1JQwcLsK5D3VM26vWyCvFRenGU2Jz8VYOt0Bzym6m
         rk9Q==
X-Gm-Message-State: AOAM533ypRuFmYW/447GPQOajK+3BMpyQwx9wq0HBkc84ei9IQ7zI0jZ
        jcEnzvxOKSpv1udlgp+lwxQEA+kGykvRNVYY/uI=
X-Google-Smtp-Source: ABdhPJy4pq17gcjapaZNiVnc3kAsTYvN86EUrIiUWgEttcj0gm5W5+LzfTsiXX5R5G3AlkWNQtRe6g==
X-Received: by 2002:a63:4c5c:0:b0:383:1b87:2d20 with SMTP id m28-20020a634c5c000000b003831b872d20mr2995856pgl.294.1647949746665;
        Tue, 22 Mar 2022 04:49:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id qe15-20020a17090b4f8f00b001c6f4991cd4sm2678128pjb.45.2022.03.22.04.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 04:49:06 -0700 (PDT)
Message-ID: <6239b7b2.1c69fb81.644db.721f@mx.google.com>
Date:   Tue, 22 Mar 2022 04:49:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-1379-g27610c0a0ca2
Subject: next/pending-fixes baseline: 333 runs,
 7 regressions (v5.17-1379-g27610c0a0ca2)
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

next/pending-fixes baseline: 333 runs, 7 regressions (v5.17-1379-g27610c0a0=
ca2)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

bcm2836-rpi-2-b           | arm    | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                | arm    | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

rk3399-gru-kevin          | arm64  | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-1379-g27610c0a0ca2/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-1379-g27610c0a0ca2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      27610c0a0ca278e3cf262241c8820abbda25838d =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62398555cf22f313dc2172e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62398555cf22f313dc217=
2e2
        failing since 6 days (last pass: v5.17-rc7-200-gfb8a41b34095, first=
 fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/623988c3d7ebc073c52172d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623988c3d7ebc073c5217=
2d9
        failing since 7 days (last pass: v5.17-rc7-220-g483b57a0f972, first=
 fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b           | arm    | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6239a831adc5d58df02172b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6239a831adc5d58df0217=
2ba
        failing since 33 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
da850-lcdk                | arm    | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/623981b9990968f3232172c4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/623981b9990968f=
3232172cc
        failing since 57 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-22T07:58:27.917176  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-03-22T07:58:28.038295  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-22T07:58:28.038621  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-22T07:58:28.038803  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-22T07:58:28.081103  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6239843d2cee722ddd2172d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6239843d2cee722ddd217=
2d4
        failing since 6 days (last pass: v5.17-rc7-200-gfb8a41b34095, first=
 fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6239882e40fc3b9d682172e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6239882e40fc3b9d68217=
2e3
        failing since 7 days (last pass: v5.17-rc7-220-g483b57a0f972, first=
 fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
rk3399-gru-kevin          | arm64  | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62398445ccbc453f382172bd

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-1379-=
g27610c0a0ca2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62398445ccbc453f382172df
        failing since 22 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-22T08:09:25.321205  /lava-5922383/1/../bin/lava-test-case   =

 =20
