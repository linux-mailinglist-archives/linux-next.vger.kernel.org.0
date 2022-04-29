Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F3B51427A
	for <lists+linux-next@lfdr.de>; Fri, 29 Apr 2022 08:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354648AbiD2Gm7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Apr 2022 02:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354651AbiD2Gm6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2022 02:42:58 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C10BB09E
        for <linux-next@vger.kernel.org>; Thu, 28 Apr 2022 23:39:38 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id n8so6361867plh.1
        for <linux-next@vger.kernel.org>; Thu, 28 Apr 2022 23:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LYYbNEDrv6UfOJKg00kmYPaM+W5xFSqZigkY14FL54E=;
        b=m6bvGakPC1TO1HkAPVDp5mbRMfo/9I7nc7iX9ryDuNpIW0csIfu6+jYl6NA6mEC3c8
         HwDTYI6M0thX7AOtvrPCOMCgwvEs1tCIfsb8A7rJzaLSrKVDBpSQH5h9FFnz4E7WarfI
         U5xMj2K9hSbGAJBICroo0RpAVtpBTNUk7iq7Gsd3ODc3Su5kb+/MFpZS0AP3P16cSd/n
         hLdxKHBPUKpl81R+GG8F88k0zdMBb48M76abWEU51IZt5RlzQb4ilRR3yw4hSNUp0glO
         GT4ClxEzLF69LwU90v87Qg91GHvBHY9uoAqaJsR3A39KEOBXs/URQ4fvGV2fn1J0tdEB
         PkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LYYbNEDrv6UfOJKg00kmYPaM+W5xFSqZigkY14FL54E=;
        b=lHb72SLeUmU9nGQTwsYG3uDwBkAchkB1Ibmf2qRWpfyTglGUs/6I32RN7+KAQItbiI
         PCvIEtjdkigNDeRayPVXeM5yDHoPs5fD16fD2dBEddRjgvg7bRtOExLR7kud3tikrNAP
         Sg1XCw2QzIPdfqUhqCjcdwO38PZMObhzstwQ+EVKli6OLb4Gm0N98G5XTAx2Gz+Ocs8k
         GvCuRoYOLQNyiDnQLWALkv0Gg9cQ24DaX8np+hnbiJ5lssGXPVppSHYEVdLphGOhFeBM
         6ZcMu5towcdzG3qVIfoxp7d8WNzgNP3AOYmebgHMqSQvAdVtBE9TRL7njKMwH1eC0Oyb
         kw6g==
X-Gm-Message-State: AOAM5335OxRwOUFZABWs2IRWloxdjO46Ja1XkAQb5O7z/RpZphLs2GYx
        b0oC8EZgCDLuLXMJR+IZkiS13SujHsWNC/RareY=
X-Google-Smtp-Source: ABdhPJya3K9TtXK6FIUehnh7JqAcz6fr/Mh72WenY9HIGuTbwGmGgkAgDXvyQILwToEbEJF5fByQzQ==
X-Received: by 2002:a17:902:7088:b0:156:1aa9:79eb with SMTP id z8-20020a170902708800b001561aa979ebmr36985787plk.71.1651214377640;
        Thu, 28 Apr 2022 23:39:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g15-20020a056a000b8f00b004fa9dbf27desm1895106pfj.55.2022.04.28.23.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 23:39:37 -0700 (PDT)
Message-ID: <626b8829.1c69fb81.b2c1.555f@mx.google.com>
Date:   Thu, 28 Apr 2022 23:39:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.18-rc4-406-gd941dcb423c7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 316 runs,
 2 regressions (v5.18-rc4-406-gd941dcb423c7)
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

next/pending-fixes baseline: 316 runs, 2 regressions (v5.18-rc4-406-gd941dc=
b423c7)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
da850-lcdk | arm  | lab-baylibre  | gcc-10   | davinci_all_defconfig       =
 | 1          =

odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KERNEL=
=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc4-406-gd941dcb423c7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc4-406-gd941dcb423c7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d941dcb423c78651680d5bf9b11725b0b1523f14 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
da850-lcdk | arm  | lab-baylibre  | gcc-10   | davinci_all_defconfig       =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/626b4ee5f123cf5f77ff946e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
06-gd941dcb423c7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
06-gd941dcb423c7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/626b4ee5f123cf5=
f77ff9476
        failing since 95 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-29T02:34:58.315919  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-04-29T02:34:58.436875  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-29T02:34:58.437184  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-29T02:34:58.437357  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800   =

 =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KERNEL=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/626b834c8c1d82f91aff9466

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
06-gd941dcb423c7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
06-gd941dcb423c7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b834c8c1d82f91aff9=
467
        failing since 50 days (last pass: v5.17-rc6-312-gf15bf60c638f, firs=
t fail: v5.17-rc7-200-gfb8a41b34095) =

 =20
