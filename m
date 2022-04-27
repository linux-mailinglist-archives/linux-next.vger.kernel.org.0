Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDFC0512198
	for <lists+linux-next@lfdr.de>; Wed, 27 Apr 2022 20:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbiD0SwO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Apr 2022 14:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiD0SwE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Apr 2022 14:52:04 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D91D3AD6C2
        for <linux-next@vger.kernel.org>; Wed, 27 Apr 2022 11:37:26 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id j6so2251401pfe.13
        for <linux-next@vger.kernel.org>; Wed, 27 Apr 2022 11:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8IIVGBMa1BU5mCmVVEOLRBwtkg4E6OhlRXi3Ac0LW2w=;
        b=NrL6iIkp3ASDEdE5owakG3UVWFJopuzuEQ/hY/VqaMM0mB/VvlSOy2bduchQW244kX
         mixf3YzUeVfOiPBwripdqXSgLu7cMwZFCdKziuyFP60ctAUmvCuQaEluLxXlSdUVOjM/
         Gxz5MoTQ24AfqtjrMDHK5xTztyX62q63HeDZvLIKkJABNrex0vslwAyHigxLAfwlVpvv
         t47rvrckdBHhuCUTMrEfPmhogrsMVfMgwhzibLVg4M9B/WOw3Mx+lhosks93XiwDxOtU
         c8Fn98yNEFJMIp2uWdVUr7tvydDskQ5MWlRE1bq6LIcMOrPgl0R/Q3his63ktD4oWgjD
         G72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8IIVGBMa1BU5mCmVVEOLRBwtkg4E6OhlRXi3Ac0LW2w=;
        b=jEBDV5R0KpZmNwojLOFwE509DszCmyhYJ2v7sVA6nLj74m/j/J2QHIRBaoXWsf4Z0t
         2UWTwlh8kJTz4K3+ttqsv+VXy6yCe+l94sHS6oRaldUozVvNYTBkoX9nRAdsF5UKQgkb
         IJ5IKupmlMuJ+muIVXQlEemID2UrNIFNdbVo+ciPga+DNHko2J9Zfze6t78xpvZcd9EQ
         6eqa/Mv344y9+sypi0+RRvXvoL7OtgrayMS/AioNNeIKPXQBymD4iHS9v+YmwJvzJe7G
         IpLxALIOR72KdYuYlEOscHjbMA6BdpPx2p65m3wrzh4xxHdcM94+Iaw6rGEFLlWTxK5o
         zMNw==
X-Gm-Message-State: AOAM532fNyQGK8sXbRRpYlU4DIF4hja548dvcZTXjxxZ2wMElDnlZ+7c
        rXpjuGLeiWxHZ9yTyu20V+tU0IhK8N/4mch+VFY=
X-Google-Smtp-Source: ABdhPJwfRB5Opr3KrHblJ0XmCV4RcEBOQ/zAye5JaBauGEf1pMO3klOVYRy4Y8Z21R6z1sG5zK0GqA==
X-Received: by 2002:a62:8601:0:b0:50d:7eb3:a2e3 with SMTP id x1-20020a628601000000b0050d7eb3a2e3mr5294131pfd.52.1651084645780;
        Wed, 27 Apr 2022 11:37:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h12-20020a17090a130c00b001d6a79768b6sm3379076pja.49.2022.04.27.11.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 11:37:25 -0700 (PDT)
Message-ID: <62698d65.1c69fb81.cbb92.7387@mx.google.com>
Date:   Wed, 27 Apr 2022 11:37:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.18-rc4-351-gcc8162e0f820
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 303 runs,
 1 regressions (v5.18-rc4-351-gcc8162e0f820)
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

next/pending-fixes baseline: 303 runs, 1 regressions (v5.18-rc4-351-gcc8162=
e0f820)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig             | regre=
ssions
-----------+------+--------------+----------+-----------------------+------=
------
da850-lcdk | arm  | lab-baylibre | gcc-10   | davinci_all_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc4-351-gcc8162e0f820/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc4-351-gcc8162e0f820
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cc8162e0f8207113e116a4e58cf655677b8daab7 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig             | regre=
ssions
-----------+------+--------------+----------+-----------------------+------=
------
da850-lcdk | arm  | lab-baylibre | gcc-10   | davinci_all_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/6269540518ee166870ff9467

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
51-gcc8162e0f820/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
51-gcc8162e0f820/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6269540518ee166=
870ff946b
        failing since 93 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-27T14:32:20.172634  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-27T14:32:20.172905  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-27T14:32:20.173070  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-04-27T14:32:20.215413  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =20
