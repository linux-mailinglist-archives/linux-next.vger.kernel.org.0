Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD5A44C907E
	for <lists+linux-next@lfdr.de>; Tue,  1 Mar 2022 17:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234481AbiCAQg7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Mar 2022 11:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbiCAQg5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2022 11:36:57 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274812AC6C
        for <linux-next@vger.kernel.org>; Tue,  1 Mar 2022 08:36:16 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id ev16-20020a17090aead000b001bc3835fea8so2677701pjb.0
        for <linux-next@vger.kernel.org>; Tue, 01 Mar 2022 08:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aGrNno4Mf5yO2O4+7O5RIhllH/y8TDjqkDWro1cKlnU=;
        b=S2f40YIc795SmOpH3jUA/getZeatGdx09JaFktS89VhUkBbcrq5XXMF+VmIM5LvRDL
         BBusdIu/2USHhnlAyL6Ope2FqUHuyDimH/Pi+UTVNG9Wq95wuax/q65DF0dgjnwXLiuM
         5S5gop5wKGaeaJUDkkWWVIV8w4gS12VF4RsZ6VO0wWBF7mpzLy63nxWAXpQ6xYs4uRaM
         7vnypbtFFye8jW5OL0aDGdDTXYOC7j/D2ypIf1Le1hsoQ8bXsjeUmrV1ZMKDVFi8B5gW
         cUH+6P763gGqg+q3cNrXxmOGwL+ri7ECHS6xYz+utZdiShbsj9ZNCLQaJJIIo9adnJ3E
         CFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aGrNno4Mf5yO2O4+7O5RIhllH/y8TDjqkDWro1cKlnU=;
        b=JTF+C1IswajxO+XuFWbxQ+yqTUNSKPUbfmYV7xwR3azgFSw+RlSu0Rr8oGR5RoDCix
         VBOclWkhzzw0DmtBqkPuxIKP4/fej625uohNA8FSMy/kW39XvPSm8E1zBduvdz2rZTRD
         /MciIQd+ygcl96Da8sXZPZ4LceaOR0jzabWzDTv4hZjiNzkw5nZjmXYoC8sBrF3A8lrj
         IQx+iaRZ+PmMUOaSzRIbK0pibXT/Vn848D1btmleRRWnyeQEA0E/kzw62P7swFEMJ9Tr
         L2ERSDGeLbQa1ik2llEnzjk/3vv61E+UHeKUrBgWwg5AzUz43Bs4snqUjSwFVu6ye86d
         bpnA==
X-Gm-Message-State: AOAM532+hsCSv1QYuFbNrUhR1wiLh+83tXkxkb5zIrWklyfg8wQG1Df3
        t8tZmGM8hgPQEWtp/4I/6el2JyLV9u1KZwCt/qo=
X-Google-Smtp-Source: ABdhPJxlhPlEZ5wb8+k5UMKAXTShLFcPH73wCcjEARY/OI/dXjJkqsDryG8Exb63wGajMnGqs6Ixig==
X-Received: by 2002:a17:902:8bcc:b0:14f:2294:232e with SMTP id r12-20020a1709028bcc00b0014f2294232emr26053590plo.105.1646152575435;
        Tue, 01 Mar 2022 08:36:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y16-20020a056a00181000b004de90b16516sm19135329pfa.72.2022.03.01.08.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:36:15 -0800 (PST)
Message-ID: <621e4b7f.1c69fb81.7534c.0019@mx.google.com>
Date:   Tue, 01 Mar 2022 08:36:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc6-208-gaea6d79fce16
Subject: next/pending-fixes baseline: 224 runs,
 4 regressions (v5.17-rc6-208-gaea6d79fce16)
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

next/pending-fixes baseline: 224 runs, 4 regressions (v5.17-rc6-208-gaea6d7=
9fce16)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
               | regressions
-------------------------+--------+---------------+----------+-------------=
---------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig      | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug     | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig   =
               | 1          =

rk3399-gru-kevin         | arm64  | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc6-208-gaea6d79fce16/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc6-208-gaea6d79fce16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aea6d79fce16b867a4e9192ef808e95fdc38a721 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
               | regressions
-------------------------+--------+---------------+----------+-------------=
---------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/621e1063c109aeff72c62986

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
08-gaea6d79fce16/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
08-gaea6d79fce16/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/621e1063c109aef=
f72c6298a
        failing since 36 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-01T12:23:42.672413  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-01T12:23:42.672669  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-01T12:23:42.672856  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-01T12:23:42.716200  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
               | regressions
-------------------------+--------+---------------+----------+-------------=
---------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/621e0e18db34126fb7c629a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
08-gaea6d79fce16/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
08-gaea6d79fce16/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621e0e18db34126fb7c62=
9a4
        new failure (last pass: v5.17-rc5-388-geb90b11d71c0) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
               | regressions
-------------------------+--------+---------------+----------+-------------=
---------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig   =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/621e19c8f5193a2100c6299d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
08-gaea6d79fce16/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
08-gaea6d79fce16/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621e19c8f5193a2100c62=
99e
        new failure (last pass: v5.17-rc6-176-gb4e03e0dde48) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
               | regressions
-------------------------+--------+---------------+----------+-------------=
---------------+------------
rk3399-gru-kevin         | arm64  | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/621e134f84a3d071eec6296a

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
08-gaea6d79fce16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
08-gaea6d79fce16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/621e134f84a3d071eec62990
        failing since 1 day (last pass: v5.17-rc5-244-gd77a1b37f796, first =
fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-01T12:36:05.856409  /lava-5798513/1/../bin/lava-test-case   =

 =20
