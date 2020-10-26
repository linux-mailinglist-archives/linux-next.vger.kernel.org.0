Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FA22985B5
	for <lists+linux-next@lfdr.de>; Mon, 26 Oct 2020 03:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389402AbgJZC7g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Oct 2020 22:59:36 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55440 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389401AbgJZC7g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 25 Oct 2020 22:59:36 -0400
Received: by mail-pj1-f67.google.com with SMTP id c17so2400737pjo.5
        for <linux-next@vger.kernel.org>; Sun, 25 Oct 2020 19:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=peI7qWg2dqxyNQHQ0rL/eBiouaUXoXtbpcIH97D0Wa0=;
        b=WS3Z86jwbDKeVtOMFj2WUt8OWH6o9D0pNdJPV2QuTpivV527kAzAfhDxKQpcUI9OmW
         QsqKiyjPHkWR9nSBdRgwG/m6qI9L3RVYK+QsN0jPL9OZPoSiZDNR9js82r0fa747EgG+
         jRDCsPyE7mVpR6yGl/chiNp77elbrv5B/UBT4Ld79floEvE7Fu9BR247IsPOIdTpeT5t
         VO0c9EuadcgFaSv93EiZg1zSC7uWxN5Tx4AKpSFm/vpJYGMZPx/RLkoMN4+exN2QeQjy
         JwEFJQn37/ldJbhmn1RWM4GqEQ/JeT+NFFVbzwIhqPHd+HCkVM06AiEHiRi3QfLqG/Yt
         MHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=peI7qWg2dqxyNQHQ0rL/eBiouaUXoXtbpcIH97D0Wa0=;
        b=bAqUQJXjM8h6Yge0Ajf6XmWnUDsZlaiYaewf6X/kd2JODQWnnYwNnIZ65uD5+EkM2p
         MMnUhr+Loc9trkYNAwwojDddDwzOlww5IrZLKvn9UPbB44QmTZ4jFND1XNRReW8YVt1p
         yG5WMbyMMgtQQnexwbHrmA2dFDinZDPC5T6GcLh1dXjL5LofHYjGuLTNorHzS5WLR+0K
         Y5dmu75duVW7k2SyBzkRLxNTHz2Ffj+ayhWIPuAd6r74dDFUivJGrxqiGSWACte5F/Fc
         tvvmOvLB1v28O/c/1sR+SXs1l0rxxHy/cJVcNVrHHfYSypiiGhRIVHB42ocQGdGi5sNJ
         BM1A==
X-Gm-Message-State: AOAM533gvyOYeuofz6kkHGSaEbyTb5BISx3TH14Db3gM7V55n3qKoCkj
        tbZOW0OfyciSWVKHGLSgw0SWCdcL0E23XA==
X-Google-Smtp-Source: ABdhPJwynvjw2qfs3hY4lw0qbMSV35KCN0oYxP3Un/Ut8ZDbJmBxEHEXwnyo485fITRJbccPiroUrg==
X-Received: by 2002:a17:90b:350a:: with SMTP id ls10mr17896469pjb.117.1603681175185;
        Sun, 25 Oct 2020 19:59:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b128sm8919064pga.80.2020.10.25.19.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 19:59:34 -0700 (PDT)
Message-ID: <5f963b96.1c69fb81.4d476.1911@mx.google.com>
Date:   Sun, 25 Oct 2020 19:59:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.9-14860-gd56fc2efcc70
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 335 runs,
 7 regressions (v5.9-14860-gd56fc2efcc70)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 335 runs, 7 regressions (v5.9-14860-gd56fc2efc=
c70)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =

imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx6qp-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-14860-gd56fc2efcc70/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-14860-gd56fc2efcc70
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d56fc2efcc70dbb69aa4c520ed21c645e1a765b6 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5f96036176f41d52a9381022

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f96036176f41d52a9381=
023
        failing since 173 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9607b98dabe0c6de38105d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9607b98dabe0c6de381=
05e
        new failure (last pass: v5.9-13195-g0281c5220c40) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f960bfcd0ca8b8c73381073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f960bfcd0ca8b8c73381=
074
        new failure (last pass: v5.9-13195-g0281c5220c40) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6qp-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f96082fd180002ea2381016

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6qp-sabresd=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6qp-sabresd=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f96082fd180002ea2381=
017
        new failure (last pass: v5.9-13195-g0281c5220c40) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9607042e9bc52c1438101c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9607042e9bc52c14381=
01d
        new failure (last pass: v5.9-13195-g0281c5220c40) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f960ad8b15d43b69238101c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f960ad8b15d43b=
692381022
        failing since 81 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35)
        60 lines

    2020-10-25 23:31:29.105000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c802
    2020-10-25 23:31:29.111000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c803
    2020-10-25 23:31:29.117000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c804
    2020-10-25 23:31:29.122000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c805
    2020-10-25 23:31:29.128000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c806
    2020-10-25 23:31:29.134000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c807
    2020-10-25 23:31:29.140000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c808
    2020-10-25 23:31:29.145000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c809
    2020-10-25 23:31:29.151000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80a
    2020-10-25 23:31:29.157000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80b =

    ... (49 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9607bc38593a5e3b38101c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-14860-=
gd56fc2efcc70/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9607bc38593a5e3b381=
01d
        failing since 81 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35) =

 =20
