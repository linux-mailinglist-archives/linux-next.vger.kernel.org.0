Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65E0D4AD818
	for <lists+linux-next@lfdr.de>; Tue,  8 Feb 2022 13:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbiBHMDZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Feb 2022 07:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbiBHMDY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Feb 2022 07:03:24 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB8BC03FEC0
        for <linux-next@vger.kernel.org>; Tue,  8 Feb 2022 04:03:22 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id e28so18491143pfj.5
        for <linux-next@vger.kernel.org>; Tue, 08 Feb 2022 04:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RsJln9JMXFkwEyG9Upcn9FDSl1KawrtEgbK6yds6nI0=;
        b=ZduYFA1/i/4OhOCDFgVn8wwIU12iPfaQ92hYeAf9YofpxxouklQyrTe5RaEdTaX2T8
         oLSC8HjyLt7wnzzfa/NkejrH5TFSjl4R2LFhG+u/A4KVZbr5yI5uFe+AJcCMq/OudXMu
         kFVgDZojYIROZBfQfRK3bUChR3n8FWyXyBD5jOTAPU4B7Z77EO5ubChHpJ4WhYm6TdoL
         UCYp4/X1S+0+Q/RzlI3BkkqOb0foj/kQ1cXSiGzHX/DBin3KyftCi3AHpAjbilJYm//E
         qESuI7PNih6557dlZ1FBty3wSJA9p8mIWkj72tFcKAEXAtuN/B61CLUfhLXW3TPT7Ji9
         gE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RsJln9JMXFkwEyG9Upcn9FDSl1KawrtEgbK6yds6nI0=;
        b=VZETN998fol23p22HoLt8PFPMhu3n7CNoj67Bi4rQltslXxKvgDp8/vUthtpeZ5Kwp
         9xf4TyYUt8LldHPBKCuz758dgzX/bKoavoKpkxOjaYCj6Uzj69X0R9XwkbGwevGmS4L2
         D11477irXE7Bm/6RGr90lvWN9TUz6uuM/TcfQ549xbeX+s0uXSDOi12p2fMDDN+PteRl
         sjSFfz1bJnKjlauNlMQdgzUIw/RKrn8B2GODc0epzSiyGH8E05J9ZPgfPO7PXQIV75CQ
         KwVqzT271OsVoSxaQnpWQUTXR5M1H9JcglO0OPKotfKPlhlYS9Jqf0wc6SPM6cRApiRn
         yyFQ==
X-Gm-Message-State: AOAM533Lzv9jUNLgIDRHLCp8noU1D8S8Iu2x5ABV6A6r2gH7WLY1DnH8
        yjMOmVdWP4RK6TKzCzF+lhdojT2mfFW8Jgkw
X-Google-Smtp-Source: ABdhPJxXwcgK3jyRmsPUc9tmNnxSdaTRJ8va51lVmcgATZv3EhcM6fzD4wvHnwRVfG2Vwb11VZM+Gw==
X-Received: by 2002:a05:6a00:17a2:: with SMTP id s34mr4040086pfg.72.1644321801071;
        Tue, 08 Feb 2022 04:03:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y193sm16690450pfb.7.2022.02.08.04.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:03:20 -0800 (PST)
Message-ID: <62025c08.1c69fb81.1e421.9eff@mx.google.com>
Date:   Tue, 08 Feb 2022 04:03:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220208
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: next/master baseline: 707 runs, 25 regressions (next-20220208)
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

next/master baseline: 707 runs, 25 regressions (next-20220208)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
i945gsex-qs              | i386   | lab-clabbe      | clang-14 | i386_defco=
nfig               | 1          =

meson-gxbb-p200          | arm64  | lab-baylibre    | gcc-10   | defconfig+=
crypto             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_i386                | i386   | lab-baylibre    | clang-14 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-broonie     | clang-14 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-cip         | clang-14 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-linaro-lkft | clang-14 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-baylibre    | clang-14 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-broonie     | clang-14 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-cip         | clang-14 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-linaro-lkft | clang-14 | i386_defco=
nfig               | 1          =

rk3399-gru-kevin         | arm64  | lab-collabora   | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

sun50i-a64-bananapi-m64  | arm64  | lab-clabbe      | clang-14 | defconfig =
                   | 1          =

sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig           | 2          =

sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 2          =

sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 2          =

sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efconfig           | 2          =

sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 2          =

sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220208/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220208
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      554f92dbda161fa073844ae6c62db257b8860a0a =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
i945gsex-qs              | i386   | lab-clabbe      | clang-14 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6202214575dda9e5c05d6f1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-clabbe/baseline-i945gsex-qs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-clabbe/baseline-i945gsex-qs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6202214575dda9e5c05d6=
f1b
        failing since 1 day (last pass: next-20220204, first fail: next-202=
20207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre    | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62022c54826b7806675d6efb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62022c54826b7806675d6=
efc
        new failure (last pass: next-20220207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62024adbcd8dc3bd325d6ef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62024adbcd8dc3bd325d6=
ef6
        new failure (last pass: next-20220207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-baylibre    | clang-14 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/62022241866fe1ddbe5d6f07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62022241866fe1ddbe5d6=
f08
        failing since 1 day (last pass: next-20220204, first fail: next-202=
20207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-broonie     | clang-14 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/62022258973901960f5d6eee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62022258973901960f5d6=
eef
        failing since 1 day (last pass: next-20220204, first fail: next-202=
20207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-cip         | clang-14 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/620222b0781f07d7805d6f1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620222b0781f07d7805d6=
f1c
        failing since 1 day (last pass: next-20220204, first fail: next-202=
20207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-linaro-lkft | clang-14 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/62023ca820961dd5285d6ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62023ca820961dd5285d6=
eea
        failing since 1 day (last pass: next-20220204, first fail: next-202=
20207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-baylibre    | clang-14 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/62022240866fe1ddbe5d6f04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62022240866fe1ddbe5d6=
f05
        failing since 1 day (last pass: next-20220204, first fail: next-202=
20207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-broonie     | clang-14 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/62022257973901960f5d6ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62022257973901960f5d6=
eea
        failing since 1 day (last pass: next-20220204, first fail: next-202=
20207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-cip         | clang-14 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/620222af0ab672c3ef5d6f03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620222af0ab672c3ef5d6=
f04
        failing since 1 day (last pass: next-20220204, first fail: next-202=
20207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-linaro-lkft | clang-14 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/62023cb8f004d885a75d6f0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62023cb8f004d885a75d6=
f0f
        failing since 1 day (last pass: next-20220204, first fail: next-202=
20207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin         | arm64  | lab-collabora   | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/620226aad7596ef1a05d6ee8

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/620226aad7596ef1a05d6f0a
        failing since 15 days (last pass: next-20220121, first fail: next-2=
0220124)

    2022-02-08T08:15:23.178571  <4>[   22.933802] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-02-08T08:15:23.564908  /lava-5640319/1/../bin/lava-test-case
    2022-02-08T08:15:23.576168  <8>[   23.333320] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun50i-a64-bananapi-m64  | arm64  | lab-clabbe      | clang-14 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/620222ae885abb35945d6efb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/arm6=
4/defconfig/clang-14/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/arm6=
4/defconfig/clang-14/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620222ae885abb35945d6=
efc
        new failure (last pass: next-20220207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/620221c0a7112b34175d6eff

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620221c0a7112b3=
4175d6f06
        new failure (last pass: next-20220128)
        16 lines

    2022-02-08T07:54:27.841517  kern  :alert : 8<--- cut here ---
    2022-02-08T07:54:27.841755  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-08T07:54:27.841931  kern  :alert : [000001a0] *pgd=3D7d<8>[   3=
7.212390] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-08T07:54:27.842084  3d0835
    2022-02-08T07:54:27.842230  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-08T07:54:27.842372  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-08T07:54:27.842535  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620221c0a7112b3=
4175d6f07
        new failure (last pass: next-20220128)
        54 lines

    2022-02-08T07:54:27.884419  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-08T07:54:27.884658  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c45d3400 pointer offset 64 size 1024
    2022-02-08T07:54:27.884798  kern  :alert : Register r5 information: sla=
b task_struct start c40bc400 pointer offset 0
    2022-02-08T07:54:27.884919  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-08T07:54:27.885033  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c45d3400 pointer offset 128 size 1024
    2022-02-08T07:54:27.885145  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-08T07:54:27.927521  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024
    2022-02-08T07:54:27.927760  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c45d4400 pointer offset 0 size 1024
    2022-02-08T07:54:27.927895  kern  :alert : Register r11 information: NU=
LL pointer
    2022-02-08T07:54:27.928015  kern  :alert : Register r12 information: sl=
ab task_struct start c40bc400 pointer offset 0 =

    ... (47 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/620222d8895357dc5e5d6f02

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620222d8895357d=
c5e5d6f09
        new failure (last pass: next-20220125)
        16 lines

    2022-02-08T07:59:04.075657  kern  :alert : 8<--- cut here ---
    2022-02-08T07:59:04.119170  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188
    2022-02-08T07:59:04.119916  kern  :alert : [00000188] *pgd=3D7d<8>[   3=
8.335289] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-08T07:59:04.120395  362835
    2022-02-08T07:59:04.120823  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-08T07:59:04.121270  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-08T07:59:04.121833  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-08T07:59:04.122242  kern  :alert : Register r3 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620222d8895357d=
c5e5d6f0a
        new failure (last pass: next-20220125)
        54 lines

    2022-02-08T07:59:04.161825  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4658400 pointer offset 64 size 1024
    2022-02-08T07:59:04.162569  kern  :alert : Register r5 information: sla=
b task_struct start c446f480 pointer offset 0
    2022-02-08T07:59:04.163205  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 16 size 1024
    2022-02-08T07:59:04.163751  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4658400 pointer offset 120 size 1024
    2022-02-08T07:59:04.164308  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-08T07:59:04.205110  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 0 size 1024
    2022-02-08T07:59:04.205854  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c43cbc00 pointer offset 0 size 1024
    2022-02-08T07:59:04.206450  kern  :alert : Register r11 information: NU=
LL pointer
    2022-02-08T07:59:04.206990  kern  :alert : Register r12 information: sl=
ab task_struct start c446f480 pointer offset 0
    2022-02-08T07:59:04.207587  kern  :emerg : Internal error: Oops: 17 [#1=
] ARM =

    ... (46 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6202242c9d38f8501a5d6ef2

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6202242c9d38f85=
01a5d6ef9
        new failure (last pass: next-20220127)
        16 lines

    2022-02-08T08:04:44.569614  kern  :alert : 8<--- cut here ---
    2022-02-08T08:04:44.612561  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-08T08:04:44.612805  kern  :alert : [000001a0] *pgd=3D7d<8>[   3=
7.509461] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-08T08:04:44.612994  139835
    2022-02-08T08:04:44.613148  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-08T08:04:44.613294  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-08T08:04:44.613455  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-08T08:04:44.613597  kern  :alert : Register r3 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6202242c9d38f85=
01a5d6efa
        new failure (last pass: next-20220127)
        54 lines

    2022-02-08T08:04:44.655607  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c45a9400 pointer offset 64 size 1024
    2022-02-08T08:04:44.656052  kern  :alert : Register r5 information: sla=
b task_struct start c408ee80 pointer offset 0
    2022-02-08T08:04:44.656474  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-08T08:04:44.656744  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c45a9400 pointer offset 128 size 1024
    2022-02-08T08:04:44.656988  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-08T08:04:44.698668  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024
    2022-02-08T08:04:44.698914  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c21b1400 pointer offset 0 size 1024
    2022-02-08T08:04:44.699130  kern  :alert : Register r11 information: NU=
LL pointer
    2022-02-08T08:04:44.699302  kern  :alert : Register r12 information: sl=
ab task_struct start c408ee80 pointer offset 0
    2022-02-08T08:04:44.699452  kern  :emerg : Internal error: Oops: 17 [#1=
] SMP THUMB2 =

    ... (39 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6202229b781f07d7805d6ef4

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6202229b781f07d=
7805d6efb
        new failure (last pass: next-20220128)
        16 lines

    2022-02-08T07:57:58.471460  kern  :alert : 8<--- cut here ---
    2022-02-08T07:57:58.482231  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-08T07:57:58.482620  kern  :alert : [000001a0] *pgd=3D7d3ae835
    2022-02-08T07:57:58.491402  kern  :alert : Register[   44.266046] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6202229b781f07d=
7805d6efc
        new failure (last pass: next-20220128)
        54 lines

    2022-02-08T07:57:58.497071   r0 information: NULL pointer
    2022-02-08T07:57:58.502473  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-08T07:57:58.506192  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-08T07:57:58.511901  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-08T07:57:58.522683  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c445d000 pointer offset 64 size 1024
    2022-02-08T07:57:58.526402  kern  :alert : Register r5 information: sla=
b task_struct start c227b300 pointer offset 0
    2022-02-08T07:57:58.537524  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-08T07:57:58.546685  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c445d000 pointer offset 128 size 1024
    2022-02-08T07:57:58.552525  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-08T07:57:58.563149  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/62022311fa3820eef45d6f25

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62022311fa3820e=
ef45d6f2c
        new failure (last pass: next-20220125)
        16 lines

    2022-02-08T07:59:58.183935  kern  :alert : 8<--- cut here ---
    2022-02-08T07:59:58.194712  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188
    2022-02-08T07:59:58.203974  kern  :alert : [00000188] *pgd=3D7d[   46.0=
53906] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-08T07:59:58.204353  352835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62022311fa3820e=
ef45d6f2d
        new failure (last pass: next-20220125)
        54 lines

    2022-02-08T07:59:58.209369  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-08T07:59:58.214929  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-08T07:59:58.218563  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-08T07:59:58.224076  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-08T07:59:58.235011  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c442a800 pointer offset 64 size 1024
    2022-02-08T07:59:58.244500  kern  :alert : Register r5 information: sla=
b task_struct start c4443480 pointer offset 0
    2022-02-08T07:59:58.249654  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 16 size 1024
    2022-02-08T07:59:58.258927  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c442a800 pointer offset 120 size 1024
    2022-02-08T07:59:58.264440  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-08T07:59:58.275364  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6202246755e412b1195d6f1d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6202246755e412b=
1195d6f24
        new failure (last pass: next-20220127)
        16 lines

    2022-02-08T08:05:40.654568  kern  :alert : 8<--- cut here ---
    2022-02-08T08:05:40.665498  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-08T08:05:40.665872  kern  :alert : [000001a0] *pgd=3D7d162835
    2022-02-08T08:05:40.674716  kern  :alert : Register[   44.114252] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6202246755e412b=
1195d6f25
        new failure (last pass: next-20220127)
        54 lines

    2022-02-08T08:05:40.680192   r0 information: NULL pointer
    2022-02-08T08:05:40.685672  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-08T08:05:40.689209  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-08T08:05:40.694850  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-08T08:05:40.705802  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4654800 pointer offset 64 size 1024
    2022-02-08T08:05:40.715006  kern  :alert : Register r5 information: sla=
b task_struct start c4581980 pointer offset 0
    2022-02-08T08:05:40.720653  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-08T08:05:40.729565  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4654800 pointer offset 128 size 1024
    2022-02-08T08:05:40.734995  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-08T08:05:40.745983  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =20
