Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1225D2793AF
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 23:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbgIYVkh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 17:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgIYVkh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 17:40:37 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCC7C0613CE
        for <linux-next@vger.kernel.org>; Fri, 25 Sep 2020 14:40:36 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id k13so4528132pfg.1
        for <linux-next@vger.kernel.org>; Fri, 25 Sep 2020 14:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=189fmCh5mpdUKaKoOf/wg+FTDsRzNf/fhhndParQXrM=;
        b=V5ZjlB7+P7WauPt0bXiwWvyG2GEsm7HFDO1t1hNGYFJepKN0uUv50nrw5MuRnrj3Xj
         BZBY2eRL+CawlmXn5CfY7wg/NHZu/7vZVkeAOAe4CQcCJkz/SIimZIbMyhh7jds3I+gQ
         Z2ARg55xkBq4RjcDMeKc43yS9ZMspLLN80AuDd6fT+asxvm9kH2JJZ9Qkxs4jAzaGY5P
         sUf9+lFP9LBWW86YE5CbStyMMRMZCojmZRD0GwiuOO3UGtAE7BzddLoLDQ4FMI2hovEs
         SPUCi1RDKJHcENMLdOxctIxEDHzfwp4jln05pdEWXRtZ6ytOfrp/obdJWv/QjMv2LXkI
         w1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=189fmCh5mpdUKaKoOf/wg+FTDsRzNf/fhhndParQXrM=;
        b=R1tQjAJJ9faKaB1Rb/KD7EvJgZ6Buh8ySr97kCnLvwgChTH/hd0hA/mSLisbGiVzDO
         kgpuotSCObaPLnyQzoHuk+B7RPB9zcN3ARfjAfNdcRmocS75E4Usvy3gq6sazpLKblSt
         Eq0fwjdOD8ZONu0aarJlqf6H1PHjzh7FBrKNZiNVjxrzPQnB8eQrfP5bTI9ze5vzU+Fp
         ggm+e3cWfrlmM6fJvCH+zWE3f3ZQGf1aF2djmTwjyItDlI1RPP0wr1hrrwdmCbOY6sNa
         dpmKUZuzpqz0ZxWN3mRL3JQ+VqZFcmzzsvoG1Lc3ONscPJqYnQZWjPOeUX5zuSDglvqw
         I4RQ==
X-Gm-Message-State: AOAM530eNLSYse8RK/Fv7vmoFUoIRiaB28QtI7ZtxjI5lReTujzJ4KKW
        stvLLlOsT6d96nqLL76ENx1fCcl18gCTaw==
X-Google-Smtp-Source: ABdhPJwE2pTsukpMT4hZom6M6MEaOtT2jj5s85ZZaKHNZL6cVdx4RPjeJN7dwWwcebU2MNY+QffjqA==
X-Received: by 2002:a17:902:a5ca:b029:d2:6391:a7f7 with SMTP id t10-20020a170902a5cab02900d26391a7f7mr1304422plq.9.1601070035590;
        Fri, 25 Sep 2020 14:40:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z28sm3613047pfq.81.2020.09.25.14.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 14:40:34 -0700 (PDT)
Message-ID: <5f6e63d2.1c69fb81.6ab3f.a1c6@mx.google.com>
Date:   Fri, 25 Sep 2020 14:40:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200925
Subject: next/master baseline: 454 runs, 18 regressions (next-20200925)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 454 runs, 18 regressions (next-20200925)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-baylibre    | clang-10 | multi_v7_d=
efconfig           | 2/4    =

beaglebone-black          | arm   | lab-cip         | clang-10 | multi_v7_d=
efconfig           | 3/5    =

dove-cubox                | arm   | lab-pengutronix | clang-10 | multi_v7_d=
efconfig           | 3/5    =

dove-cubox                | arm   | lab-pengutronix | gcc-8    | mvebu_v7_d=
efconfig           | 2/5    =

imx53-qsrb                | arm   | lab-pengutronix | clang-10 | multi_v7_d=
efconfig           | 3/5    =

panda                     | arm   | lab-collabora   | gcc-8    | omap2plus_=
defconfig          | 0/1    =

rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 67/69  =

rk3399-gru-kevin          | arm64 | lab-collabora   | clang-10 | defconfig =
                   | 0/1    =

sun4i-a10-olinuxino-lime  | arm   | lab-baylibre    | clang-10 | multi_v7_d=
efconfig           | 2/4    =

sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | clang-10 | multi_v7_d=
efconfig           | 2/4    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200925/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200925
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      20dc779fdefc40bf7dd9736cea01704f29228fae =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-baylibre    | clang-10 | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f6e326c9fbf841970bf9dd8

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6e326c9fbf841=
970bf9ddd
      new failure (last pass: next-20200806)
      4 lines

    2020-09-25 18:09:43.017000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-25 18:09:43.017000  kern  :alert : pgd =3D e20244fa
    2020-09-25 18:09:43.018000  kern  :alert : [0000001c] *pgd=3D9a2f2831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6e326c9fbf=
841970bf9dde
      new failure (last pass: next-20200806)
      27 lines

    2020-09-25 18:09:43.063000  kern  :emerg : Process dropbear (pid: 128, =
stack limit =3D 0x7f11a881)
    2020-09-25 18:09:43.064000  kern  :emerg : Stack: (0xd78a3e68 to 0xd78a=
4000)
    2020-09-25 18:09:43.065000  kern  :emerg : 3e60:                   c367=
b300 00000003 d78240a0 d78240a0 d78240b8 fffff000
    2020-09-25 18:09:43.065000  kern  :emerg : 3e80: 00000000 d78240c8 d782=
40b8 c03086f0 d78240b8 fffff000 0000044f fffff000
    2020-09-25 18:09:43.066000  kern  :emerg : 3ea0: d78240b8 c04f97dc d782=
40c8 d78240c0 d78a3f78 bebf9858 00001000 00000000
    2020-09-25 18:09:43.106000  kern  :emerg : 3ec0: c04f9410 00000001 c111=
1200 db252980 c1904cc8 00000000 0003d97c c0558478
    2020-09-25 18:09:43.107000  kern  :emerg : 3ee0: d789a9c0 00001000 c055=
840c bebf9858 d78a3f78 c04c94a8 3b9ab52b 00000000
    2020-09-25 18:09:43.107000  kern  :emerg : 3f00: 00000001 00000000 3b9a=
b52b 00000000 ff9a7688 ff9a7688 00000004 00000000
    2020-09-25 18:09:43.108000  kern  :emerg : 3f20: d78a3f60 bebf9858 0000=
0002 bebf9850 00000000 c04e4b40 d78a3f60 00000142
    2020-09-25 18:09:43.108000  kern  :emerg : 3f40: 00000002 00000000 0000=
0000 00000000 00000004 ff9a7688 d789a9c0 d789a9c0
    ... (16 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-cip         | clang-10 | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f6e325a9fbf841970bf9dbb

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6e325a9fbf841=
970bf9dc1
      new failure (last pass: next-20200806)
      4 lines

    2020-09-25 18:09:26.178000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-25 18:09:26.182000  kern  :alert : pgd =3D 2c58d923
    2020-09-25 18:09:26.187000  kern  :alert : [0000001c] *pgd=3D98546831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6e325a9fbf=
841970bf9dc2
      new failure (last pass: next-20200806)
      27 lines

    2020-09-25 18:09:26.222000  kern  :emerg : Process dropbear (pid: 125, =
stack limit =3D 0x9861c9a6)
    2020-09-25 18:09:26.228000  kern  :emerg : Stack: (0xc399de68 to 0xc399=
e000)
    2020-09-25 18:09:26.234000  kern  :emerg : de60:                   c367=
a200 00000003 c3719000 c3719000 c3719018 fffff000
    2020-09-25 18:09:26.243000  kern  :emerg : de80: 00000000 c3719028 c371=
9018 c03086f0 c3719018 fffff000 0000044f fffff000
    2020-09-25 18:09:26.252000  kern  :emerg : dea0: c3719018 c04f97dc c371=
9028 c3719020 c399df78 bebcf858 00001000 00000000
    2020-09-25 18:09:26.259000  kern  :emerg : dec0: c04f9410 00000001 c111=
1200 db252980 c1904cc8 00000000 0003d97c c0558478
    2020-09-25 18:09:26.269000  kern  :emerg : dee0: db437c00 00001000 c055=
840c bebcf858 c399df78 c04c94a8 3b9ab4d7 00000000
    2020-09-25 18:09:26.276000  kern  :emerg : df00: 00000001 00000000 3b9a=
b4d7 00000000 ff9a7688 ff9a7688 00000004 00000000
    2020-09-25 18:09:26.285000  kern  :emerg : df20: c399df60 bebcf858 0000=
0002 bebcf850 00000000 c04e4b40 c399df60 00000142
    2020-09-25 18:09:26.292000  kern  :emerg : df40: 00000002 00000000 0000=
0000 00000000 00000004 ff9a7688 db437c00 db437c00
    ... (16 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
dove-cubox                | arm   | lab-pengutronix | clang-10 | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f6e3249c2d82dea46bf9de6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6e3249c2d82de=
a46bf9dec
      new failure (last pass: next-20200911)
      4 lines

    2020-09-25 18:09:07.805000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-25 18:09:07.806000  kern  :alert : pgd =3D (ptrval)
    2020-09-25 18:09:07.806000  kern  :alert : [0000001c] *pgd=3D3b9be831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6e3249c2d8=
2dea46bf9ded
      new failure (last pass: next-20200911)
      27 lines

    2020-09-25 18:09:07.835000  kern  :emerg : Process dropbear (pid: 132, =
stack limit =3D 0x(ptrval))
    2020-09-25 18:09:07.836000  kern  :emerg : Stack: (0xc4277e68 to 0xc427=
8000)
    2020-09-25 18:09:07.844000  kern  :emerg : 7e60:                   eeae=
7940 00000003 eefc6000 eefc6000 eefc6018 fffff000
    2020-09-25 18:09:07.853000  kern  :emerg : 7e80: 00000000 eefc6028 eefc=
6018 c03086f0 eefc6018 fffff000 0000040b fffff000
    2020-09-25 18:09:07.862000  kern  :emerg : 7ea0: eefc6018 c04f97dc eefc=
6028 eefc6020 c4277f78 be9ef848 00001000 00000000
    2020-09-25 18:09:07.871000  kern  :emerg : 7ec0: c04f9410 00000001 c111=
1200 ee8bad80 c1904cc8 00000000 0003d97c c0558478
    2020-09-25 18:09:07.880000  kern  :emerg : 7ee0: c418ee40 00001000 c055=
840c be9ef848 c4277f78 c04c94a8 3b9ab83c 00000000
    2020-09-25 18:09:07.889000  kern  :emerg : 7f00: 00000001 00000000 3b9a=
b83c 00000000 471acfe6 471acfe6 00000004 00000000
    2020-09-25 18:09:07.890000  kern  :emerg : 7f20: c4277f60 be9ef848 0000=
0002 be9ef840 00000000 c04e4b40 c4277f60 00000142
    2020-09-25 18:09:07.898000  kern  :emerg : 7f40: 00000002 00000000 0000=
0000 00000000 00000004 471acfe6 c418ee40 c418ee40
    ... (16 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | mvebu_v7_d=
efconfig           | 2/5    =


  Details:     https://kernelci.org/test/plan/id/5f6e2ee4e3da687979bf9de4

  Results:     2 PASS, 2 FAIL, 1 SKIP
  Full config: mvebu_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6e2ee4e3da687=
979bf9dea
      failing since 11 days (last pass: next-20200911, first fail: next-202=
00914)
      4 lines

    2020-09-25 17:54:40.492000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-25 17:54:40.492000  kern  :alert : pgd =3D (ptrval)
    2020-09-25 17:54:40.493000  kern  :alert : [0000001c] *pgd=3D3fe07831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6e2ee4e3da=
687979bf9deb
      failing since 11 days (last pass: next-20200911, first fail: next-202=
00914)
      29 lines

    2020-09-25 17:54:40.528000  kern  :emerg : Process dropbear (pid: 157, =
stack limit =3D 0x(ptrval))
    2020-09-25 17:54:40.529000  kern  :emerg : Stack: (0xeebdbe30 to 0xeebd=
c000)
    2020-09-25 17:54:40.537000  kern  :emerg : be20:                       =
              00000004 c027f86c c0eab69c 00000002
    2020-09-25 17:54:40.546000  kern  :emerg : be40: c0b0260c c0b02610 eea4=
b4c8 eea4b4b0 00000003 000003c4 eea4b4c8 0000002a
    2020-09-25 17:54:40.555000  kern  :emerg : be60: 00000000 00000000 eebd=
bf78 c0107e3c eea4b4c8 0000002a 00000000 eea4b4b0
    2020-09-25 17:54:40.564000  kern  :emerg : be80: eea4b4c8 c02806e8 0000=
0000 00001000 bea9c848 eea4b4d8 00000000 c0a09dbc
    2020-09-25 17:54:40.573000  kern  :emerg : bea0: c0e2dcf4 c0b1798c 0a90=
7eb8 ef1a1f80 c028036c ef2c8cc0 bea9c848 00001000
    2020-09-25 17:54:40.582000  kern  :emerg : bec0: eebdbf78 00000001 c02d=
6190 c02d6238 eebda000 00001000 00000000 bea9c848
    2020-09-25 17:54:40.582000  kern  :emerg : bee0: ef2c8cc0 eebdbf78 0000=
0001 c0257c44 00000008 00000000 00000051 c026d034
    2020-09-25 17:54:40.591000  kern  :emerg : bf00: ffffeefc ffffffff 0000=
0001 00000000 3b9ab8fc 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
imx53-qsrb                | arm   | lab-pengutronix | clang-10 | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f6e324ec2d82dea46bf9e0c

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6e324ec2d82de=
a46bf9e12
      new failure (last pass: next-20200911)
      4 lines

    2020-09-25 18:09:13.359000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-25 18:09:13.359000  kern  :alert : pgd =3D (ptrval)
    2020-09-25 18:09:13.360000  kern  :alert : [0000001c] *pgd=3Dcb2bf831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6e324ec2d8=
2dea46bf9e13
      new failure (last pass: next-20200911)
      27 lines

    2020-09-25 18:09:13.408000  kern  :emerg : Process dropbear (pid: 128, =
stack limit =3D 0x(ptrval))
    2020-09-25 18:09:13.409000  kern  :emerg : Stack: (0xc829be68 to 0xc829=
c000)
    2020-09-25 18:09:13.417000  kern  :emerg : be60:                   c82c=
fe80 00000003 c80320a0 c80320a0 c80320b8 fffff000
    2020-09-25 18:09:13.426000  kern  :emerg : be80: 00000000 c80320c8 c803=
20b8 c03086f0 c80320b8 fffff000 00000425 fffff000
    2020-09-25 18:09:13.435000  kern  :emerg : bea0: c80320b8 c04f97dc c803=
20c8 c80320c0 c829bf78 beb3a858 00001000 00000000
    2020-09-25 18:09:13.444000  kern  :emerg : bec0: c04f9410 00000001 c111=
1200 dea06680 c1904cc8 00000000 0003d97c c0558478
    2020-09-25 18:09:13.453000  kern  :emerg : bee0: c81e4000 00001000 c055=
840c beb3a858 c829bf78 c04c94a8 3b9ab65f 00000000
    2020-09-25 18:09:13.462000  kern  :emerg : bf00: 00000001 00000000 3b9a=
b65f 00000000 0af9a192 0af9a192 00000004 00000000
    2020-09-25 18:09:13.463000  kern  :emerg : bf20: c829bf60 beb3a858 0000=
0002 beb3a850 00000000 c04e4b40 c829bf60 00000142
    2020-09-25 18:09:13.471000  kern  :emerg : bf40: 00000002 00000000 0000=
0000 00000000 00000004 0af9a192 c81e4000 c81e4000
    ... (16 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-collabora   | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6e2f75e846795b34bf9db3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6e2f75e846795b34bf9=
db4
      failing since 65 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f6e2c6e61a72396d0bf9db3

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6e2c6e61a7239=
6d0bf9df9
      new failure (last pass: next-20200924)
      4 lines

    2020-09-25 17:44:06.954000  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address 003bffc4
    2020-09-25 17:44:06.954000  kern  :alert : pgd =3D a36a1623
    2020-09-25 17:44:06.966000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6e2c6e61a7=
2396d0bf9dfa
      new failure (last pass: next-20200924)
      41 lines

    2020-09-25 17:44:06.979000  kern  :emerg : Process kworker/0:4 (pid: 46=
, stack limit =3D 0xb86b949f)
    2020-09-25 17:44:06.991000  kern  :emerg : Stack: (0xc2963d80 to 0xc296=
4000)
    2020-09-25 17:44:06.991000  kern  :emerg : 3d80: c2963db2 ffffffb6 ffff=
ffff c06c7cb4 c2963e00 ffffff04 ffff0a00 c0c0ef28
    2020-09-25 17:44:07.003000  kern  :emerg : 3da0: 00000016 c30eb000 c296=
3db2 c30eb000 c13b79c0 c06cbac8 c13b79c0 ffffff04
    2020-09-25 17:44:07.021000  kern  :emerg : 3dc0: ffff0a00 a0000093 8000=
0013 c30eb000 3cf14fff c1704048 80000013 ffffff04
    2020-09-25 17:44:07.021000  kern  :emerg : 3de0: ffff0a00 49c7abec 0000=
004a c1704048 c1704048 00000002 c30eb000 c30d2820
    2020-09-25 17:44:07.039000  kern  :emerg : 3e00: c18f45a4 c30d2800 c2f4=
0000 c06cbe3c c2963e28 49c7abec c30eb000 00000000
    2020-09-25 17:44:07.039000  kern  :emerg : 3e20: c0c3df94 c13b79c0 003b=
ffc4 49c7abec ffff0a00 49c7abec 003bffc4 49c7abec
    2020-09-25 17:44:07.049000  kern  :emerg : 3e40: c1704048 c18f3428 c30e=
b000 0000004a c2f40000 c2f40000 c30eb000 c138f51c
    2020-09-25 17:44:07.062000  kern  :emerg : 3e60: c2f40000 c0c3e038 0000=
000f 00000000 c30d2820 c30d2800 c2f40000 c0c3e230
    ... (30 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin          | arm64 | lab-collabora   | clang-10 | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6e2d62c973c176b7bf9dde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6e2d62c973c176b7bf9=
ddf
      new failure (last pass: next-20200914)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
sun4i-a10-olinuxino-lime  | arm   | lab-baylibre    | clang-10 | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f6e32ce8443356090bf9dca

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6e32ce8443356=
090bf9dcf
      new failure (last pass: next-20200911)
      4 lines

    2020-09-25 18:11:16.656000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-25 18:11:16.658000  kern  :alert : pgd =3D (ptrval)
    2020-09-25 18:11:16.659000  kern  :alert : [0000001c] *pgd=3D5bd1b831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6e32ce8443=
356090bf9dd0
      new failure (last pass: next-20200911)
      27 lines

    2020-09-25 18:11:16.700000  kern  :emerg : Process dropbear (pid: 128, =
stack limit =3D 0x(ptrval))
    2020-09-25 18:11:16.701000  kern  :emerg : Stack: (0xdbf6fe68 to 0xdbf7=
0000)
    2020-09-25 18:11:16.702000  kern  :emerg : fe60:                   db00=
3500 00000003 dbcf0000 dbcf0000 dbcf0018 fffff000
    2020-09-25 18:11:16.704000  kern  :emerg : fe80: 00000000 dbcf0028 dbcf=
0018 c03086f0 dbcf0018 fffff000 00000598 fffff000
    2020-09-25 18:11:16.705000  kern  :emerg : fea0: dbcf0018 c04f97dc dbcf=
0028 dbcf0020 dbf6ff78 bed98858 00001000 00000000
    2020-09-25 18:11:16.740000  kern  :emerg : fec0: c04f9410 00000001 c111=
1200 df1a2980 c1904cc8 00000000 0003d97c c0558478
    2020-09-25 18:11:16.743000  kern  :emerg : fee0: dbd9f540 00001000 c055=
840c bed98858 dbf6ff78 c04c94a8 3b9ab7c6 00000000
    2020-09-25 18:11:16.745000  kern  :emerg : ff00: 00000001 00000000 3b9a=
b7c6 00000000 2c5e1bf0 2c5e1bf0 00000004 00000000
    2020-09-25 18:11:16.747000  kern  :emerg : ff20: dbf6ff60 bed98858 0000=
0002 bed98850 00000000 c04e4b40 dbf6ff60 00000142
    2020-09-25 18:11:16.748000  kern  :emerg : ff40: 00000002 00000000 0000=
0000 00000000 00000004 2c5e1bf0 dbd9f540 dbd9f540
    ... (16 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | clang-10 | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f6e32cb6029a9f369bf9dc2

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200925/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6e32cb6029a9f=
369bf9dc7
      new failure (last pass: next-20200911)
      4 lines

    2020-09-25 18:11:14.290000  kern  :alert : pgd =3D (ptrval)
    2020-09-25 18:11:14.292000  kern  :alert : [0000001c] *pgd=3D45de8831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6e32cb6029=
a9f369bf9dc8
      new failure (last pass: next-20200911)
      27 lines

    2020-09-25 18:11:14.332000  kern  :emerg : Process dropbear (pid: 123, =
stack limit =3D 0x(ptrval))
    2020-09-25 18:11:14.333000  kern  :emerg : Stack: (0xc5fd3e68 to 0xc5fd=
4000)
    2020-09-25 18:11:14.335000  kern  :emerg : 3e60:                   c5a8=
9f00 00000003 c5c93000 c5c93000 c5c93018 fffff000
    2020-09-25 18:11:14.336000  kern  :emerg : 3e80: 00000000 c5c93028 c5c9=
3018 c03086f0 c5c93018 fffff000 00000352 fffff000
    2020-09-25 18:11:14.338000  kern  :emerg : 3ea0: c5c93018 c04f97dc c5c9=
3028 c5c93020 c5fd3f78 be80a858 00001000 00000000
    2020-09-25 18:11:14.373000  kern  :emerg : 3ec0: c04f9410 00000001 c111=
1200 c9106d80 c1904cc8 00000000 0003d97c c0558478
    2020-09-25 18:11:14.375000  kern  :emerg : 3ee0: c5d67000 00001000 c055=
840c be80a858 c5fd3f78 c04c94a8 3b9ab484 00000000
    2020-09-25 18:11:14.376000  kern  :emerg : 3f00: 00000001 00000000 3b9a=
b484 00000000 2c5e1bf0 2c5e1bf0 00000004 00000000
    2020-09-25 18:11:14.378000  kern  :emerg : 3f20: c5fd3f60 be80a858 0000=
0002 be80a850 00000000 c04e4b40 c5fd3f60 00000142
    2020-09-25 18:11:14.379000  kern  :emerg : 3f40: 00000002 00000000 0000=
0000 00000000 00000004 2c5e1bf0 c5d67000 c5d67000
    ... (16 line(s) more)
      =20
