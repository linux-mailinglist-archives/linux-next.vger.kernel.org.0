Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F26F4D94EA
	for <lists+linux-next@lfdr.de>; Tue, 15 Mar 2022 07:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbiCOG6P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Mar 2022 02:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242365AbiCOG6O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Mar 2022 02:58:14 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04FA48E68
        for <linux-next@vger.kernel.org>; Mon, 14 Mar 2022 23:57:02 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d18so366267plr.6
        for <linux-next@vger.kernel.org>; Mon, 14 Mar 2022 23:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OmWls/Fd1ue7yZtumptsEGLizseJKlVMWrVTwbOhiSY=;
        b=l42Fvj49+CQ2vpAh0FPW5nzLgwUnSIFGn1kGPUxNhBmiKGJrpjIeWt1LuzAzKyt4oz
         lykPaczeYioazhOxNw5oxJF/YhVcK/PzMcBL4I+dO48gef+CDp2b2cppEHnxCWvZmb/k
         zzzo6xSubfVphox9WYS1u2zkTgIiBFEVMm1pXt69Ygd1V78BXBMy0eK7+oNo9mIVIgtX
         9zm3HMP3+04AkNNWR/gHV0VfXGnGfBs9ikzggc+7wDjq5TcrLia3BA/Ml0N/2HFMXHFT
         M9SlsNRbXWyGns/L1rhoFWOrh10cxJTX0vvPX279KEMGLqenbPEaO46lgdLD0AgZXXWi
         G6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OmWls/Fd1ue7yZtumptsEGLizseJKlVMWrVTwbOhiSY=;
        b=VEma9NgZwa2zYv4KdDlGM73B47lbdKpFvw+OE9mbFBODq+gbXxtn9JS6Sw4eYcCuf5
         vjesDt4u8ITeWCA1v3f+fX/HS090ec33/tNOzOttC0G4o4afpoMlZc8ZWroASpV61hkH
         Ztb8J/GMcsWgIBH2T5Tpgj9XyWTxM6IrIr8+jAuNTWag7KJZ7Kgz6YOXiXtalctDJtdM
         QJUfAd+G2DheeHMbH7aEaGztNr/Y5qin3kt2rnNEv8Mx18UIbh53j/BLEQkitVQ1Isp1
         Ccz2FhU41x+AwDikmt7zMzUp8PtCdkAtrGRWs5r1EfgoahqwxpkjpZ674ajxyDFUoT8i
         g3pg==
X-Gm-Message-State: AOAM5303f2hCe+O84U6egHiI6bU2dvWtiyF91wPT5ijZQQYdcyj0gEqA
        JtwVW+DD0zJqMDok++PBch4sq6w8GQIxUiG0JKU=
X-Google-Smtp-Source: ABdhPJxCzffyQ3kjgnmuFPb0BvjBlg/PI9sRJOHKXeLmIXXFDc//El9xb9CtPDNgLm+Xmcu3ZOISpQ==
X-Received: by 2002:a17:90b:4d89:b0:1c6:1047:ce4f with SMTP id oj9-20020a17090b4d8900b001c61047ce4fmr3031371pjb.78.1647327421955;
        Mon, 14 Mar 2022 23:57:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d20-20020a056a0010d400b004f7093700c4sm23058657pfu.76.2022.03.14.23.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 23:57:01 -0700 (PDT)
Message-ID: <623038bd.1c69fb81.89ca4.abcf@mx.google.com>
Date:   Mon, 14 Mar 2022 23:57:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc8-96-g702087d7e205
Subject: next/pending-fixes baseline: 198 runs,
 4 regressions (v5.17-rc8-96-g702087d7e205)
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

next/pending-fixes baseline: 198 runs, 4 regressions (v5.17-rc8-96-g702087d=
7e205)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

da850-lcdk                | arm    | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

r8a77950-salvator-x       | arm64  | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc8-96-g702087d7e205/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc8-96-g702087d7e205
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      702087d7e20599c30a80ee782f856f020992bc34 =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/622fffd15d67b63184c62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-9=
6-g702087d7e205/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-9=
6-g702087d7e205/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622fffd15d67b63184c62=
982
        new failure (last pass: v5.17-rc7-220-g483b57a0f972) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
da850-lcdk                | arm    | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/622ffffb412837f6aac62973

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-9=
6-g702087d7e205/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-9=
6-g702087d7e205/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/622ffffb412837f=
6aac62977
        failing since 50 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-15T02:54:27.648382  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-15T02:54:27.648665  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-15T02:54:27.648845  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-15T02:54:27.692187  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/623000587eeb1425f1c6298d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-9=
6-g702087d7e205/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-9=
6-g702087d7e205/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623000587eeb1425f1c62=
98e
        new failure (last pass: v5.17-rc7-220-g483b57a0f972) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
r8a77950-salvator-x       | arm64  | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/623015e081dfa0528dc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-9=
6-g702087d7e205/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-9=
6-g702087d7e205/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623015e081dfa0528dc62=
969
        new failure (last pass: v5.17-rc7-273-g090ff5ac1521) =

 =20
