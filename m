Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F45C4C3559
	for <lists+linux-next@lfdr.de>; Thu, 24 Feb 2022 20:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbiBXTIk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Feb 2022 14:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbiBXTIj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Feb 2022 14:08:39 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709A818C7A1
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 11:08:09 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id z2so2642473plg.8
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 11:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=O2pdPJew9vHa/xSM20ssIb0POFUsC0tR4AHIIGzoUjM=;
        b=kK4A6dO/XQMPLeoEqJD2paMx8AjNWmy9ql3ETw6qYh2/tCq/PWIeqNQf21SOLfyUq2
         /sBN/P8t+mwMLpL2Q1+XMuvrixBdXUl9PZpkfkghxprlyknNAad49AcOboGNtyUQY8aW
         5GtBO2KlUKEh3uVJAgAhNDFDMgaA/O8kM3rknql3Fw8sKNt7gB2aQqCPI+7GyXv13BXu
         rFPPwTxZ8zpP434nZk5BIbXstc/hYtzyEo+OdD0/yKUHPFj1Q3Kxyhmz6ctnNnafOCoT
         eFaIHk5Fk2nnU4VGjC8UR/jdp9wyRhXC71M/zPvW3EKGHRhUfQDuupId2U0yPD7X4O0T
         bdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=O2pdPJew9vHa/xSM20ssIb0POFUsC0tR4AHIIGzoUjM=;
        b=q4/Tmk0ZmwJJwHA/ACWTwBbf51cH2NFp6+uTKBR4sUT1B/kAHWOHK8KONPtekyXh8r
         8gKN9+urF6OTVZBVSbNkl3Y4sfzUH/15/0scCgUjjA+LxYjKdwzOHqMLgfWCc7XnJqb+
         IBSweJuCZBGZ6CMqTCEIP8Bf8vK2VLMwcdYjxVPunkGjSxwFsALOlHTmcem+HU5qXxlB
         G5lIl+Bpeoeg12+fJXAsH3Y16H1kbJRcbg5mB3xlT++nVT1ULV8rLlrQotcAXHTMjrut
         zFxxlfUEZZHgX+7ObE/T+PIcjjxXoxYR1vFXQfqtXDduvtbMGpFHE5+CI7jDpvpT12BP
         OUFw==
X-Gm-Message-State: AOAM533+1/RUlMRsjRGBJ6FINdUXRcqCsGVBIlzNGgU2DAjf+x/nNIlD
        WGslxpwMcvy0IZIpoxJW0w5yanWWA1vNaxIcEf4=
X-Google-Smtp-Source: ABdhPJzJYQ5GSBedtG3LPPVqtwtsKvZKUkoNx/VNQ/0YXjIJTHcqnYBVeANtonjOn7nAQDo3diMRzQ==
X-Received: by 2002:a17:902:e88e:b0:150:25e3:739c with SMTP id w14-20020a170902e88e00b0015025e3739cmr474635plg.13.1645729688725;
        Thu, 24 Feb 2022 11:08:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v65-20020a632f44000000b00375ed63b2fasm228511pgv.86.2022.02.24.11.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 11:08:08 -0800 (PST)
Message-ID: <6217d798.1c69fb81.8f870.0f48@mx.google.com>
Date:   Thu, 24 Feb 2022 11:08:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc5-317-g24650335a6e9
Subject: next/pending-fixes baseline: 232 runs,
 2 regressions (v5.17-rc5-317-g24650335a6e9)
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

next/pending-fixes baseline: 232 runs, 2 regressions (v5.17-rc5-317-g246503=
35a6e9)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
           | regressions
-------------------------+--------+---------------+----------+-------------=
-----------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig  | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc5-317-g24650335a6e9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc5-317-g24650335a6e9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      24650335a6e9a5f15253bbf7db5dc79301a17eb5 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
           | regressions
-------------------------+--------+---------------+----------+-------------=
-----------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig  | 1          =


  Details:     https://kernelci.org/test/plan/id/62179c8833e0367e85c62975

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
17-g24650335a6e9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
17-g24650335a6e9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62179c8833e0367=
e85c62979
        failing since 31 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-24T14:55:46.313103  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-24T14:55:46.313419  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-24T14:55:46.313627  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-24T14:55:46.355289  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
           | regressions
-------------------------+--------+---------------+----------+-------------=
-----------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/62179e548a0eab231cc629c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
17-g24650335a6e9/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
17-g24650335a6e9/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62179e548a0eab231cc62=
9c7
        new failure (last pass: v5.17-rc5-215-ge61abe3bd006) =

 =20
