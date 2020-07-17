Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2452232CA
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 07:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgGQFMA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 01:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgGQFMA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 01:12:00 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA502C061755
        for <linux-next@vger.kernel.org>; Thu, 16 Jul 2020 22:11:59 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id w2so6113122pgg.10
        for <linux-next@vger.kernel.org>; Thu, 16 Jul 2020 22:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=C4zTCkRTzikuZQjFF8BDYey3Fb1PqCHA0fV8UfDmlPA=;
        b=WeKCt2r0NIXmro2cm3faWmUI+w+CsrgDTCW1Yqk/vkgbYfVCBNgdYEQr/QrgOANCkT
         TJGYuIf5IK1cRGvpkr5vPzF/HI1gOk08PZb/e2ybc6PMBeD9vD+UUuN7hlhSejgt85XX
         pEpGLfBoI6Bv9aqzUMuX5CZxnWNDhrYW8mCRXqypdd8mUdiKEf1uJY5IRSGiEVKbiCTv
         YnLvlQnA8TFMAHIEmGxDzy6lwcfiKqTT4IUPvqdIslhsxmdjSUOHMXRbMAmE/b14aJ6d
         7+brZOmj/Fw0Ob+i/7OVg41UPkhX3TXXP61H4LkEEL42g3trkKIJv4RweEO83nl8rY7B
         gLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=C4zTCkRTzikuZQjFF8BDYey3Fb1PqCHA0fV8UfDmlPA=;
        b=hSoAMyTWU5D32yHW2Kccs1KHYbD80w/IvTRXXySnlSlkN/Y7cf367Ds25WDnSi90V4
         pWKw4kHncDRq2AASA2h3dXr3yNv8Zq1BNtEJpcfAlrXuROjpTFLkLkedVoUSVowC9WzY
         wHDxbO1uAbBOy1BRvzRSdkM9GX1ssFeyKyaKWLjfG4TnJ5Bg1aLzZaEKGTqb6E0+9NIW
         zS5zN0KXX1hHywc07rt2IR3JLSEibJRyy+d69cAF0Clm/cyISckdiGulmVwdaKWPR7w1
         MAmEX3iZ2ioGTIhvEWfcXSOYFbdb+6uB6nmAzw32aMthozGHM8JnPwGt8e9dn32cewtZ
         dsTA==
X-Gm-Message-State: AOAM532m8uoAlvoYPSDPGxMcL2WdZcT7RrbmijDzQstGQXh1K5zNKnrf
        HzyY+JBRuIdVjoCLxQ1Gv4Z8poEd3AY=
X-Google-Smtp-Source: ABdhPJwr+cFfRn3XBJNCNSY3H8Md0jJu5a7PaBfB5blaSCp56HWOYsRAGBKiRNIXVheKoZJ6IaZpvA==
X-Received: by 2002:a63:cc18:: with SMTP id x24mr7005493pgf.86.1594962718802;
        Thu, 16 Jul 2020 22:11:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q24sm6415762pfg.95.2020.07.16.22.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 22:11:58 -0700 (PDT)
Message-ID: <5f11331e.1c69fb81.db233.4cee@mx.google.com>
Date:   Thu, 16 Jul 2020 22:11:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-311-g3c7f84b22484
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 176 runs,
 6 regressions (v5.8-rc5-311-g3c7f84b22484)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 176 runs, 6 regressions (v5.8-rc5-311-g3c7f84b=
22484)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 4/5    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =

vexpress-v2p-ca15-tc1   | arm   | lab-baylibre  | gcc-8    | vexpress_defco=
nfig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-cip       | gcc-8    | vexpress_defco=
nfig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-collabora | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc5-311-g3c7f84b22484/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc5-311-g3c7f84b22484
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3c7f84b2248457030a903813e4af71d80141d663 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1101fe2751c081dc85bb22

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1101fe2751c081=
dc85bb25
      new failure (last pass: v5.8-rc5-262-g7be1e4d3000e)
      1 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11012c39b441b74385bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11012c39b441b74385b=
b20
      new failure (last pass: v5.8-rc5-262-g7be1e4d3000e) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1102a82f8bb7b7b485bb1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1102a82f8bb7b7b485b=
b1d
      failing since 1 day (last pass: v5.8-rc4-597-gb8976598d3c1, first fai=
l: v5.8-rc5-248-g9259f7ab5c13) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-baylibre  | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f10fd22a71f57909985bb27

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f10fd22a71f5790=
9985bb2a
      failing since 18 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-cip       | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f10fd297dd21db8cf85bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f10fd297dd21db8=
cf85bb1b
      failing since 18 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-collabora | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f10fd3176eeca9b6985bb19

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-31=
1-g3c7f84b22484/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f10fd3176eeca9b=
6985bb1c
      failing since 18 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =20
