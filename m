Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744832075C7
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 16:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390033AbgFXOgT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 10:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388652AbgFXOgS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 10:36:18 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF57C061573
        for <linux-next@vger.kernel.org>; Wed, 24 Jun 2020 07:36:17 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id f3so1519316pgr.2
        for <linux-next@vger.kernel.org>; Wed, 24 Jun 2020 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7nhRv/WiUQYqvqMRG0K3y+YZw98DJufI5GY739dkl88=;
        b=W1qxQt7FVWL8MJHLaRexUimYZy0oM00OlBDPIjHGOYAuSJ4IB1gw4N1OUNCbPZk8sT
         REvmivf22cUk5t2IqrU24gJ03FRCWCl6XEa+PBdpm7nh3siD5mDChtsAnlLpSQ+KJaZQ
         zLaZ0mfAzvvlP7f1LFgMzjeq9OXDu6alqrdCOP/BKBB7irwFXHl3z/VQkRIHvT4oIe39
         LVxtQ9as3FBVaeza49NZlCTlE+HPXjknQVe2ZOXwLtSU783EZK7SBAFap6OXmmPbcNYo
         TTNdAWXjJ0QBg6zKYbyodhAG1Aonl7LO2JzthzKnx3GvUN4nWWl4dErkDqoCi/ciJn9u
         hVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7nhRv/WiUQYqvqMRG0K3y+YZw98DJufI5GY739dkl88=;
        b=LeiOwdYXJmCydhmJtwrjVtQ9rsC2nhiuzIdm6lSjMcRjknzkwwvS6NDGhSa6k7Rt3K
         oiZnwfg85vvI2azSbMb1JXzzREaG4KG0+jKuyjvC26lRCywYqSsB8euqd1iheGMfr8ol
         xQNO+3QorhTfq5fS/URGsveYR8yiWmNvDpLv8e+sagDDgMW8Xm0IyAKbcx4iB2SxHBeO
         jt4ZZ7xb+Gr6gMsTyDuBL9metTGhB0v9j63/4gRDVnhcD5Vwbha+DTteHw/FYh5P8/WA
         GI1Gr5iGipqKvOccDaNz5HtQF8LnUsBgnUKsrK66n5NbCKNlvbk4C6+W+Gmd+Ut0kyqC
         dVdw==
X-Gm-Message-State: AOAM5312sKfOfnJ3IXNwP4aFGWOJGql1WHwIuBcEOMznnB0uAq1zj/+9
        XCYEAAKUuDYu8XS9rBioFHgArcvxx7Q=
X-Google-Smtp-Source: ABdhPJyGuLL6TykZl0mcYIgq18aDwYLsFa5YvYMtTYUYAJyXFJiadRs0dGtgifNNT9dexbEbcW8g5A==
X-Received: by 2002:a65:614b:: with SMTP id o11mr21839082pgv.443.1593009375852;
        Wed, 24 Jun 2020 07:36:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j126sm20078721pfg.95.2020.06.24.07.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 07:36:14 -0700 (PDT)
Message-ID: <5ef364de.1c69fb81.1c194.b26c@mx.google.com>
Date:   Wed, 24 Jun 2020 07:36:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200624
Subject: next/master baseline: 152 runs, 4 regressions (next-20200624)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 152 runs, 4 regressions (next-20200624)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200624/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200624
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cfafde3c949cae39483639c03c5da5fd91bb234e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef32a66d5709b9cdb97bf09

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef32a66d5709b9c=
db97bf0c
      new failure (last pass: next-20200623)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ef32b71163664013b97bf0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ef32b71163664013b97b=
f0c
      new failure (last pass: next-20200623) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef325bc11f47bf3b997bf09

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200624/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200624/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef325bd11f47bf3=
b997bf0c
      failing since 18 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef325d93a1c540e9797bf0d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200624/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200624/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef325da3a1c540e=
9797bf10
      failing since 18 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
