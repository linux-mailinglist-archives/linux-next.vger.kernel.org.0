Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF44668A8E
	for <lists+linux-next@lfdr.de>; Fri, 13 Jan 2023 05:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjAMEKY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Jan 2023 23:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbjAMEKV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Jan 2023 23:10:21 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5760550075
        for <linux-next@vger.kernel.org>; Thu, 12 Jan 2023 20:10:19 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so25779378pjj.2
        for <linux-next@vger.kernel.org>; Thu, 12 Jan 2023 20:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PYfULNw4KmP84XApMwFvAbONXhvmT8HpmnBRev6Oz1I=;
        b=1oMXoE5rhSPb7++Zb8uT9zWTQOXg/znDuZNDbz1MnXhOUy5xHN7HlFzJxFyrLnIPou
         wBf7+LqmPYysVoYryx8sYAU7KbX0yd7H9AZBaCv6IscrAAu+9IiCNV8elxbieCQTw4sB
         x5YpqvS1ltjFH2KwsFMHKibNAHSJBEeF6rbQKwgAeTUIHj/G9QBOip/+F1FaDtYWCiqn
         FoXhjMmv7ymVnBKZcAN3ucoFefEF406MHyo5OQdeg2GGTdsPSi6rp2nmkAAMyfDW+8JS
         mV/aF+pClPhbP3naT9TVLkChMIPFXQbTgayP9vj5nKFlO+pvUgm+Rn2Z16ObN2LTliNp
         PUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYfULNw4KmP84XApMwFvAbONXhvmT8HpmnBRev6Oz1I=;
        b=XYOtpohWwqm+fQOVZR2KHwDRSVCq+gbTC2DJ+l7wPFb8Mje8XE7pYdVbBuO4hjCppb
         yN3qMLL2ON7z7k2lLE4O5NKhbo44ZjyKZ+BoLuQHvqWJaIwp47WnKPVIavrUX769wJY0
         WBBsQUpdd8rpn1Lo8rMRmC8Q6roN/6r9jqXZ3KtsFMpOVZ782BXpTEUvYd7F2bv6QiAL
         rIW6hff5kqQ+x5CCAiqc1/YyyRtTaTvCQZ/IJ7Ej+OAsukQaq0r/9W35jaeXT9pQPE3e
         +Sx8KwG0KWXARDvx5j/2xiypKQzZOzkDrKedQ4K8FgRJIbOLCJAuE77+D2NTnpzdjK8W
         dw0g==
X-Gm-Message-State: AFqh2kpmDu+IpoLqb3KSZyhv/ASXIx3kMcaeLNBWXN/EZ+59EOU+7WpR
        +Q8iVjp7UkcpNdeCQUAtlRlwlv/BVQe0njLurPkDmg==
X-Google-Smtp-Source: AMrXdXsR1C2Zg1rsvYVaUUmyMGS3mHazJ87F0R0iBUAbqjjw+oE5qQy3yc0dmqYCTdZgaGh6aJxtnA==
X-Received: by 2002:a17:902:8d81:b0:194:4339:f12e with SMTP id v1-20020a1709028d8100b001944339f12emr10692514plo.1.1673583018499;
        Thu, 12 Jan 2023 20:10:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902f7c500b0019337bf957dsm8343557plw.296.2023.01.12.20.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 20:10:18 -0800 (PST)
Message-ID: <63c0d9aa.170a0220.7156d.ec74@mx.google.com>
Date:   Thu, 12 Jan 2023 20:10:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc3-489-gb8bb47ae576b
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 290 runs,
 9 regressions (v6.2-rc3-489-gb8bb47ae576b)
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

next/pending-fixes baseline: 290 runs, 9 regressions (v6.2-rc3-489-gb8bb47a=
e576b)

Regressions Summary
-------------------

platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6dl-udoo            | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx6q-udoo             | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

qemu_mips-malta        | mips | lab-collabora | gcc-10   | malta_defconfig =
             | 1          =

r8a7743-iwg20d-q7      | arm  | lab-cip       | gcc-10   | shmobile_defconf=
ig           | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig           | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+ima       | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | sunxi_defconfig =
             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc3-489-gb8bb47ae576b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc3-489-gb8bb47ae576b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b8bb47ae576b7f1b93a2807af8d501634544fafc =



Test Regressions
---------------- =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6dl-udoo            | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0a388909d2454b41d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0a388909d2454b41d3=
9c4
        failing since 127 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6q-udoo             | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0a34c756e2bfba91d39d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0a34c756e2bfba91d3=
9d5
        failing since 128 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
qemu_mips-malta        | mips | lab-collabora | gcc-10   | malta_defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0a236068b3e3dcb1d3a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0a236068b3e3dcb1d3=
a48
        new failure (last pass: v6.2-rc3-399-g92d2cb7167c6) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
r8a7743-iwg20d-q7      | arm  | lab-cip       | gcc-10   | shmobile_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c09f48f46a0d3ded1d39f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c09f48f46a0d3ded1d3=
9f2
        new failure (last pass: v6.2-rc3-399-g92d2cb7167c6) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0a14f5e09a5bf381d39d3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c0a14f5e09a5bf381d39d6
        failing since 8 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-13T00:09:42.350563  [   18.339372] <LAVA_SIGNAL_ENDRUN 0_dmesg =
378136_1.5.2.4.1>
    2023-01-13T00:09:42.457366  / # #
    2023-01-13T00:09:42.559833  export SHELL=3D/bin/sh
    2023-01-13T00:09:42.560558  #
    2023-01-13T00:09:42.662102  / # export SHELL=3D/bin/sh. /lava-378136/en=
vironment
    2023-01-13T00:09:42.662805  =

    2023-01-13T00:09:42.764438  / # . /lava-378136/environment/lava-378136/=
bin/lava-test-runner /lava-378136/1
    2023-01-13T00:09:42.765513  =

    2023-01-13T00:09:42.781023  / # /lava-378136/bin/lava-test-runner /lava=
-378136/1
    2023-01-13T00:09:42.898415  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (23 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0a1ef418f0984c41d3a01

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c0a1ef418f0984c41d3a04
        failing since 8 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-13T00:12:24.469485  [   18.619080] <LAVA_SIGNAL_ENDRUN 0_dmesg =
378143_1.5.2.4.1>
    2023-01-13T00:12:24.576105  / # #
    2023-01-13T00:12:24.678401  export SHELL=3D/bin/sh
    2023-01-13T00:12:24.679002  [   18.679251] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-13T00:12:24.679379  [   18.688062] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-13T00:12:24.679679  [   18.702021] usbcore: registered new inte=
rface driver uas
    2023-01-13T00:12:24.679969  #
    2023-01-13T00:12:24.781505  / # export SHELL=3D/bin/sh. /lava-378143/en=
vironment
    2023-01-13T00:12:24.782115  =

    2023-01-13T00:12:24.883746  / # . /lava-378143/environment/lava-378143/=
bin/lava-test-runner /lava-378143/1 =

    ... (26 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0a380baa7b242e21d39eb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c0a380baa7b242e21d39ee
        failing since 8 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-13T00:18:54.732420  / # #
    2023-01-13T00:18:54.834880  export SHELL=3D/bin/sh
    2023-01-13T00:18:54.835526  #
    2023-01-13T00:18:54.937110  / # export SHELL=3D/bin/sh. /lava-378158/en=
vironment
    2023-01-13T00:18:54.937774  =

    2023-01-13T00:18:55.039424  / # . /lava-378158/environment/lava-378158/=
bin/lava-test-runner /lava-378158/1
    2023-01-13T00:18:55.040552  =

    2023-01-13T00:18:55.056098  / # /lava-378158/bin/lava-test-runner /lava=
-378158/1
    2023-01-13T00:18:55.136303  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-13T00:18:55.174274  + cd /lava-378158/1/tests/1_bootrr =

    ... (18 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0a3fcd8600f0bc71d39cf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c0a3fcd8600f0bc71d39d2
        failing since 8 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-13T00:20:52.022477  / # #
    2023-01-13T00:20:52.126556  export SHELL=3D/bin/sh
    2023-01-13T00:20:52.127294  [   20.516368] usb-storage 1-1.1:1.0: USB M=
ass Storage device detected
    2023-01-13T00:20:52.127567  [   20.525153] scsi host0: usb-storage 1-1.=
1:1.0
    2023-01-13T00:20:52.127770  [   20.538713] usbcore: registered new inte=
rface driver uas
    2023-01-13T00:20:52.127968  #
    2023-01-13T00:20:52.229480  / # export SHELL=3D/bin/sh. /lava-378166/en=
vironment
    2023-01-13T00:20:52.230257  =

    2023-01-13T00:20:52.331891  / # . /lava-378166/environment/lava-378166/=
bin/lava-test-runner /lava-378166/1
    2023-01-13T00:20:52.332889   =

    ... (21 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | sunxi_defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0a0ebc8b9a4a9541d39dc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-48=
9-gb8bb47ae576b/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c0a0ebc8b9a4a9541d39df
        failing since 8 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-13T00:07:51.974223  [   15.963576] <LAVA_SIGNAL_ENDRUN 0_dmesg =
378131_1.5.2.4.1>
    2023-01-13T00:07:52.080839  / # #
    2023-01-13T00:07:52.183205  export SHELL=3D/bin/sh
    2023-01-13T00:07:52.183862  #
    2023-01-13T00:07:52.285512  / # export SHELL=3D/bin/sh. /lava-378131/en=
vironment
    2023-01-13T00:07:52.286163  =

    2023-01-13T00:07:52.387788  / # . /lava-378131/environment/lava-378131/=
bin/lava-test-runner /lava-378131/1
    2023-01-13T00:07:52.388796  =

    2023-01-13T00:07:52.405136  / # /lava-378131/bin/lava-test-runner /lava=
-378131/1
    2023-01-13T00:07:52.518136  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
