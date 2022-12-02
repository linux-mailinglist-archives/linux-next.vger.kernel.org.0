Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAF964026B
	for <lists+linux-next@lfdr.de>; Fri,  2 Dec 2022 09:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbiLBIno (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Dec 2022 03:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbiLBInm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Dec 2022 03:43:42 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07CE6307
        for <linux-next@vger.kernel.org>; Fri,  2 Dec 2022 00:43:40 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id k79so4292318pfd.7
        for <linux-next@vger.kernel.org>; Fri, 02 Dec 2022 00:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U9Eflxpqt8ad/WyaS+C1EmGj3jtmspOsc+cnS7ZE8Kw=;
        b=lQfPbg0Oi3ROSWDC8OTsHJ/MKDO7ob2q4w9hPhRjf+RjetDCaTnYpfMTG5mysIKyfE
         pOHGALvF0KmPOrHp2K7bqC1UH9MPFXP5/EFZBVKLcHxkC3rJXxyUTOMGEIRxTVSAG8kx
         e3nB3ZUu60lgWki2gtmud8WN9oXnzeYFKEhZj11Cu8RYxndrT3zlm5jOT7b9jJ+iJ6qI
         35WH9ifC6MLyCdgioFF8226SaOpZUERjf13NL99pWjJND10XrBoJKxfPiEPRkTzc4r03
         FB31Ec4srGglNNzbj4XksxZpabpe2vYh1v/64+1PXQk2NZxQyc23P4YD+322RaC2mzx5
         NTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9Eflxpqt8ad/WyaS+C1EmGj3jtmspOsc+cnS7ZE8Kw=;
        b=C31P8lp2jQYR1QBjKYDntyGAPiPN53onDLHvB4tVBkqAGL5DFE+3e+yVI2Z9C7l+WG
         znB/uBuA6UlxpHEExn4aoNQzcb2NsZcbqTTimjDLRGnS+UT1W2SOta4o7nS9OjhuYDHZ
         gxuuTiYWm6pqf2dljndx/DUHoumR4/hNWbbPaEK8ql67rZv5r5E0qFlfLCQgY/6rd4o3
         Ls9jwYmB1ejH/r1KJfrgfF/1CF7sL6konNGX2HibtihsodMOryxIQ64Vqd3qLvtBcopT
         vcz91qGXkkG6wNY6Bx+ZG+tZ4DjhaRinOuHSsFPxwliu2x1ZZYHvXmidaCnTjWNgQLb9
         OMdw==
X-Gm-Message-State: ANoB5plL+xJmt2efLVIyhIgel5VV5W3Ayibygq2cif20hMQXkOq05wHv
        y8UvKpRZAcz2Pza2rbe+lsy8mZ6zrJ9pVEQfgVg=
X-Google-Smtp-Source: AA0mqf4x03nXx3H37eW8wrXKHVsnmdNYohQZr0otg1eYPeQ4fDUG4ogmDbRiuDdWVeNZtPXamzrseQ==
X-Received: by 2002:a63:b513:0:b0:477:3052:248c with SMTP id y19-20020a63b513000000b004773052248cmr50164905pge.179.1669970619992;
        Fri, 02 Dec 2022 00:43:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mm10-20020a17090b358a00b00218f9bd50c7sm4261270pjb.50.2022.12.02.00.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 00:43:39 -0800 (PST)
Message-ID: <6389babb.170a0220.d5e6b.8aa7@mx.google.com>
Date:   Fri, 02 Dec 2022 00:43:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221202
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/master baseline: 95 runs, 6 regressions (next-20221202)
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

next/master baseline: 95 runs, 6 regressions (next-20221202)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
221202/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20221202
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5be860bfc73408bc1a8af9167955e480ecebba84 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6389875cbdc5b862ad2abd02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221202/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221202/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6389875cbdc5b862ad2ab=
d03
        failing since 15 days (last pass: next-20221114, first fail: next-2=
0221116) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/638986d08b78b709872abd46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221202/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221202/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/638986d08b78b709872ab=
d47
        failing since 15 days (last pass: next-20221114, first fail: next-2=
0221116) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63898758a3660699762abcfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221202/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221202/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63898758a3660699762ab=
cff
        failing since 203 days (last pass: next-20220506, first fail: next-=
20220512) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63898619fa154fa7dd2abd42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221202/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221202/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63898619fa154fa7dd2ab=
d43
        new failure (last pass: next-20221129) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63898a8c5acdd821602abd9d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221202/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221202/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63898a8c5acdd821602ab=
d9e
        new failure (last pass: next-20221129) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6389866730da3ac2252abd05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221202/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221202/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6389866730da3ac2252ab=
d06
        failing since 7 days (last pass: next-20221123, first fail: next-20=
221124) =

 =20
