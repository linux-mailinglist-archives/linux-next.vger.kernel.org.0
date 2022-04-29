Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB8CA515919
	for <lists+linux-next@lfdr.de>; Sat, 30 Apr 2022 01:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239895AbiD2XqN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Apr 2022 19:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239891AbiD2XqN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2022 19:46:13 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289E5D4C8B
        for <linux-next@vger.kernel.org>; Fri, 29 Apr 2022 16:42:53 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u9so7788980plf.6
        for <linux-next@vger.kernel.org>; Fri, 29 Apr 2022 16:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LaUFA/cc6bHYK8MHp0scL40kNeFfBjX1dI46TLdSPiA=;
        b=qMKa1Y3aeuJZM7iB8vmxmyfdITerIBy0qQ0VJCVoOVPYlALvbXWeJETlfr6kmS8owe
         LzOrt4W2v+XSEhqoqVwUD+jxJVApR//HodtrV3k1UAqy9EupTL4bi163iDM75s9Al7yX
         mfx5fQxTiIyGNtKwAY8Zpz50hXQOO1KPpmpJUPTVw3jO+EoqqF0hjZZocEnZwu0jMGwG
         BV3Q/WoJXwEP0EXycV9L0ysaGjhuIWhfR0raX7TAGeWRJYiY8gb0nB8yvLzIPgwOWrO8
         Wab6VNppdLDL8h4PMf3fQ4foXu6FMZoXlNUsNcC7irKh6IdYLpTTa8H9xTQoKpDsVDqj
         gpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LaUFA/cc6bHYK8MHp0scL40kNeFfBjX1dI46TLdSPiA=;
        b=kGKNeQhzHl+v8icNY/+QSZSHcw1+EH6cNsDqPPq6kupx+6McLvzyIIJAyZhL5ZpICk
         Y150dyFy5PMOwcjxX/xLgKqh8QA/+ZUg3nzLNrY6hxXQcIwuYrcdsFb0qnQfa3zgzk2m
         HFjdm/WNY9xwd7fL8P13W/GYUXS+OnJglVYOrg56RJ3C+ktpsw3+FGrFf1aDtUFGLTFp
         xACT+01xJeM7OBXJhldKhBy9Zfs8Qhy33QGwGaNLP4r2BGUn6KI6l3yVUEomWBsv8wnO
         WJbEZR2Av5CP7/fW2wprlYIERw1g0b8oDc6B3fxygLKx6sYL6zoseoKDJkOPjeOFHhEh
         vaeA==
X-Gm-Message-State: AOAM5315myjZA3J7Tt6++iZCF/IbWu5tGFQDtnDEtiVzpnbLVpZ9gTgE
        RESh9CI27SJJjBiWgm9AjTEj6cuavLa4Jg+ksJU=
X-Google-Smtp-Source: ABdhPJxty7kJAP3WVHaYm+CbrBADgNYomSa1JgsrfNIh27NuUq1u/XWkoH2eUxXv2LJRyshoXNArXA==
X-Received: by 2002:a17:90a:710c:b0:1d9:bf09:7004 with SMTP id h12-20020a17090a710c00b001d9bf097004mr6505461pjk.220.1651275772550;
        Fri, 29 Apr 2022 16:42:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 5-20020a630305000000b003c14af505ffsm6735713pgd.23.2022.04.29.16.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 16:42:52 -0700 (PDT)
Message-ID: <626c77fc.1c69fb81.7451d.0d7d@mx.google.com>
Date:   Fri, 29 Apr 2022 16:42:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.18-rc4-464-g425675974eb3
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 205 runs,
 3 regressions (v5.18-rc4-464-g425675974eb3)
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

next/pending-fixes baseline: 205 runs, 3 regressions (v5.18-rc4-464-g425675=
974eb3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
da850-lcdk       | arm   | lab-baylibre  | gcc-10   | davinci_all_defconfig=
        | 1          =

jetson-tk1       | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc4-464-g425675974eb3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc4-464-g425675974eb3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      425675974eb3b9f285cc9c23faf27a10aa04324c =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
da850-lcdk       | arm   | lab-baylibre  | gcc-10   | davinci_all_defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/626c3e5f7a62c88084bf6055

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
64-g425675974eb3/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
64-g425675974eb3/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/626c3e5f7a62c88=
084bf605d
        failing since 95 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-29T19:36:48.176590  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-04-29T19:36:48.302190  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-29T19:36:48.302469  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-29T19:36:48.302640  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-04-29T19:36:48.346224  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
jetson-tk1       | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/626c45755a3ef5e8bdbf5fe7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
64-g425675974eb3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
64-g425675974eb3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626c45755a3ef5e8bdbf5=
fe8
        new failure (last pass: v5.18-rc2-366-ga3e1163f7eb1a) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/626c47b0fb6d3f9e11bf6038

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
64-g425675974eb3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-4=
64-g425675974eb3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/626c47b0fb6d3f9e11bf605a
        failing since 60 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-29T20:16:29.062657  /lava-6211101/1/../bin/lava-test-case   =

 =20
