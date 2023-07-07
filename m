Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7D674A974
	for <lists+linux-next@lfdr.de>; Fri,  7 Jul 2023 05:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjGGDvG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Jul 2023 23:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjGGDvF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jul 2023 23:51:05 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE59D1FC9
        for <linux-next@vger.kernel.org>; Thu,  6 Jul 2023 20:51:01 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7658430eb5dso149062185a.2
        for <linux-next@vger.kernel.org>; Thu, 06 Jul 2023 20:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688701860; x=1691293860;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SL+w7qUbBemdndH/TD13zsoNacLaMIVuu+lf5yiG4bk=;
        b=Pwv2DuVIbbt8Nwdbdv8U6H9GrDWQIGwy/v0KNiAdcshoPw5AbRXv0SuEgbeiHplOw4
         lHbUFvdo/da7e7ocUF6HpEj/vVl3uPBTTh1LhtjSyin4rxd8WsMgXw8mBPDemrN41HAF
         rI/b0czcyJPOV/wAaT8PLKfVNisWV/Bdck/mES2EY6bF3K3rNqwPqPSezVW+K4VH5fv8
         sI8nDmsn14lKsZxrSmUCH7Tpm6w0pDlVuGID92WHr1a2GEOIN8nDj1Jt/sjk8lGJRFoL
         J/qy83dGVIna4ZAl8rSy7vUEbvE9uualiI4wtGhNQsHIhinmr1PKATHMyYVItpTCJGBx
         5rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688701860; x=1691293860;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL+w7qUbBemdndH/TD13zsoNacLaMIVuu+lf5yiG4bk=;
        b=BKkD6S3s+MIqZTLKBG496s9MgUHwu19XIDVTn1KbosYIWEJJRkPVOzgi9L2N4dV2XC
         O8zmnCoSGllzGG1v971qn+iw02bde6NFsuJb74zzLzy+X3ZerD0gYsmPlElig5IOrZEO
         Bg/9UxiplyfySpOMUVFIUMjEAeSjQ/+oPvnJimDAhB9ExClvYGriHkeGSiz6nxIvsxou
         LiSSI/Un0lB3ruFS48sqZrkO8hf+VFVftCA750aVmXbhn02V+ubQ6Po0nIqw2NvFAEnY
         1LZEGEuk2rs3wjCo3eCssnruEQENDImKShWO1tth51PuEvsjRH7vNtrcSnlOr0lRC8+N
         BgZQ==
X-Gm-Message-State: ABy/qLYECKCbktkgsqweFS5pJ+xJX2xy/o1q1GH8UZJswxXUi6RmzTP5
        3tbM584e/lKCgcqYGRbCQJv5TC7I5Vb9mlTaT2wCXIH+
X-Google-Smtp-Source: APBJJlHHFZJOtLRQPzVW6ZOdy1H5c+8CES6YoasjMXrVtMEd/HMj49+67TZATmY1CpUJ+YBuF3zwIA==
X-Received: by 2002:a05:620a:4450:b0:767:276:3c9c with SMTP id w16-20020a05620a445000b0076702763c9cmr4830473qkp.14.1688701859966;
        Thu, 06 Jul 2023 20:50:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q16-20020a62e110000000b00682a27905b9sm2006918pfh.13.2023.07.06.20.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 20:50:59 -0700 (PDT)
Message-ID: <64a78ba3.620a0220.99fc.46d1@mx.google.com>
Date:   Thu, 06 Jul 2023 20:50:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.4-12294-g066a64c121be
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 169 runs,
 30 regressions (v6.4-12294-g066a64c121be)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 169 runs, 30 regressions (v6.4-12294-g066a64c1=
21be)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-12294-g066a64c121be/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-12294-g066a64c121be
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      066a64c121be85ce2c5ec794bc3def83454f2ddb =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75be1538b35f4a0bb2a76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75be1538b35f4a0bb2=
a77
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75ba65f755270edbb2a8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75ba65f755270edbb2=
a8e
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75ba3af76fd5919bb2a77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75ba3af76fd5919bb2=
a78
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75b9a5f755270edbb2a7d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75b9a5f755270edbb2=
a7e
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75abf73e799ea05bb2a78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75abf73e799ea05bb2=
a79
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75c146688f08f59bb2a99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75c146688f08f59bb2=
a9a
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75d360ec80da156bb2a7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75d360ec80da156bb2=
a7c
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75ba55f755270edbb2a84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75ba55f755270edbb2=
a85
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75c4651f33630a7bb2a83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75c4651f33630a7bb2=
a84
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75b746541facfeebb2a97

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a75b746541facfeebb2a9c
        failing since 97 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-07-07T00:25:12.038222  + set +x

    2023-07-07T00:25:12.044929  <8>[   13.352771] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11032024_1.4.2.3.1>

    2023-07-07T00:25:12.149532  / # #

    2023-07-07T00:25:12.250158  export SHELL=3D/bin/sh

    2023-07-07T00:25:12.250351  #

    2023-07-07T00:25:12.350900  / # export SHELL=3D/bin/sh. /lava-11032024/=
environment

    2023-07-07T00:25:12.351135  =


    2023-07-07T00:25:12.451668  / # . /lava-11032024/environment/lava-11032=
024/bin/lava-test-runner /lava-11032024/1

    2023-07-07T00:25:12.451979  =


    2023-07-07T00:25:12.456763  / # /lava-11032024/bin/lava-test-runner /la=
va-11032024/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75aac0a39d16bf5bb2a79

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a75aac0a39d16bf5bb2a7e
        failing since 97 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-07-07T00:22:22.340794  + set<8>[   13.572183] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11032010_1.4.2.3.1>

    2023-07-07T00:22:22.340879   +x

    2023-07-07T00:22:22.442613  =


    2023-07-07T00:22:22.543222  / # #export SHELL=3D/bin/sh

    2023-07-07T00:22:22.543411  =


    2023-07-07T00:22:22.643942  / # export SHELL=3D/bin/sh. /lava-11032010/=
environment

    2023-07-07T00:22:22.644156  =


    2023-07-07T00:22:22.744674  / # . /lava-11032010/environment/lava-11032=
010/bin/lava-test-runner /lava-11032010/1

    2023-07-07T00:22:22.745066  =


    2023-07-07T00:22:22.749677  / # /lava-11032010/bin/lava-test-runner /la=
va-11032010/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75ab787d4200866bb2ac0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75ab787d4200866bb2=
ac1
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75976c10742aadebb2a79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am6=
25-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am6=
25-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a75976c10742aadebb2a7e
        failing since 71 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.3-5614-gbe56a31d3d65)

    2023-07-07T00:16:46.422247  + set +x
    2023-07-07T00:16:46.425899  <8>[   14.155915] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3714307_1.5.2.4.1>
    2023-07-07T00:16:46.535641  / # #
    2023-07-07T00:16:46.639103  export SHELL=3D/bin/sh
    2023-07-07T00:16:46.640202  #
    2023-07-07T00:16:46.742703  / # export SHELL=3D/bin/sh. /lava-3714307/e=
nvironment
    2023-07-07T00:16:46.743828  =

    2023-07-07T00:16:46.846292  / # . /lava-3714307/environment/lava-371430=
7/bin/lava-test-runner /lava-3714307/1
    2023-07-07T00:16:46.848136  =

    2023-07-07T00:16:46.889652  / # /lava-3714307/bin/lava-test-runner /lav=
a-3714307/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75a6954303bb13bbb2aa1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a75a6954303bb13bbb2aa6
        failing since 71 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-07-07T00:20:44.212127  <8>[    7.845687] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3714330_1.5.2.4.1>
    2023-07-07T00:20:44.315893  / #
    2023-07-07T00:20:44.417690  # #export SHELL=3D/bin/sh
    2023-07-07T00:20:44.418084  =

    2023-07-07T00:20:44.519230  / # export SHELL=3D/bin/sh. /lava-3714330/e=
nvironment
    2023-07-07T00:20:44.519618  =

    2023-07-07T00:20:44.620824  / # . /lava-3714330/environment/lava-371433=
0/bin/lava-test-runner /lava-3714330/1
    2023-07-07T00:20:44.621476  =

    2023-07-07T00:20:44.665030  / # /lava-3714330/bin/lava-test-runner /lav=
a-3714330/1
    2023-07-07T00:20:44.676099  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75b9a6541facfeebb2b06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75b9a6541facfeebb2=
b07
        failing since 7 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75a48ab820484babb2aa3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75a48ab820484babb2=
aa4
        failing since 149 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75b6c4c02d65d6abb2a98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75b6c4c02d65d6abb2=
a99
        failing since 149 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75a49163c676755bb2a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75a49163c676755bb2=
a7b
        failing since 137 days (last pass: v6.2-rc8-150-g30cd52e17d48, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75d1d0ec80da156bb2a76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75d1d0ec80da156bb2=
a77
        failing since 149 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75a66f13c07e32dbb2b44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75a66f13c07e32dbb2=
b45
        failing since 149 days (last pass: v6.2-rc6-351-gf42837eac380f, fir=
st fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75af4a9ccb67bb1bb2afc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75af4a9ccb67bb1bb2=
afd
        failing since 149 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75a4aab820484babb2aa9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75a4aab820484babb2=
aaa
        failing since 149 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64a7589209bcdd72a8bb2ad7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a7589209bcdd72a8bb2=
ad8
        failing since 15 days (last pass: v6.4-rc7-164-g1f02f25057f7, first=
 fail: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64a7586a336649ad6fbb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a7586a336649ad6fbb2=
a76
        failing since 15 days (last pass: v6.4-rc7-164-g1f02f25057f7, first=
 fail: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75a5e163c676755bb2aad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75a5e163c676755bb2=
aae
        failing since 149 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75e356c76e14dd1bb2a7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75e356c76e14dd1bb2=
a7f
        failing since 6 days (last pass: v6.4-1651-gf52dd2890422, first fai=
l: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75a90c33979baffbb2ab9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75a90c33979baffbb2=
aba
        failing since 149 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75be6538b35f4a0bb2a85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75be6538b35f4a0bb2=
a86
        failing since 6 days (last pass: v6.4-1651-gf52dd2890422, first fai=
l: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75a7cb17440b974bb2a95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75a7cb17440b974bb2=
a96
        failing since 149 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a75a51163c676755bb2a80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-12294-=
g066a64c121be/arm64/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a75a51163c676755bb2=
a81
        failing since 6 days (last pass: v6.4-rc7-235-g8d8d57edb1481, first=
 fail: v6.4-8718-g6b8b1f7dba504) =

 =20
