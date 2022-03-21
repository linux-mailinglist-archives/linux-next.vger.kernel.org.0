Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F1D4E2E7F
	for <lists+linux-next@lfdr.de>; Mon, 21 Mar 2022 17:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbiCUQvC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Mar 2022 12:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351408AbiCUQvB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Mar 2022 12:51:01 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47F44EF6A
        for <linux-next@vger.kernel.org>; Mon, 21 Mar 2022 09:49:30 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id t5so15968955pfg.4
        for <linux-next@vger.kernel.org>; Mon, 21 Mar 2022 09:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uRbLFHFq/iErlb8nGqFsJRRyecRF9gX9QYXHsrFZF+E=;
        b=1wLrwehF999LeCBjCw5g0s/9hTAtRei5Sv4MRncTOtipdKZuZA3TZezyfvr0k/SqUn
         seay+2NWXy750LZxe5D6waQa7vTvJC58zYRAuxEXECYmtjbzB1hWPxDFseG4hJsu4PiW
         bEfveSVqCmHBKLnPSd02A4vSFl4rT+ZUSUTOyOg6hFbaNP3PPTnYu9D9ZCUqdhCtYocW
         e98KJNwhXImY7A8VANaIcN9o743ahU366aKmMMqM93ncKNVpZbS+xD6pA2Xv7YHAzFB9
         puwmMJCzny9nP/2Y2JXqeMQfGfVaH94Ame4dxc69dk8MDElVxbKXAj2nVq39M7jhYZo1
         CTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uRbLFHFq/iErlb8nGqFsJRRyecRF9gX9QYXHsrFZF+E=;
        b=wpDgesD/oSOsw2mw9dlIW5GkrvLaJkamqylzoP63O9Muf6ZB1eC7CeEs3OmazDQvPF
         jpRjI9tWrhSUUypIqy1a3dtoIyvm7R95f9K+GwSJcDYfgsh4E0U4BgdVsdmUQrbvlZ/Z
         Yyej/emnOIBVA4hFsOTf3gspUWMfRZ4IJzbAPIjhcRudqXFUqoXloPd8EGr/zz7wfvmc
         eeCBGTh4QoQUQvC6iPcuT2rQ1eeQ5pC/svm3W3/EjoP14xJWqNeG0I45QEaN61LuWtQl
         NmKqq+RMiGqmelQhFTyeUjvNMYJBl3lbzLZLPm/W5Gn+BW0BjKBQ8kWfzkitq7n9xoLu
         yslw==
X-Gm-Message-State: AOAM532M0Yf5G14kEv+MJu/5XFbE2UMSFW6/sQpak2BX8N0rTGxZ/i0v
        EH7CXlD34UVeh+/SLADEslyjA5PwUc+jl+34Wq4=
X-Google-Smtp-Source: ABdhPJxcrS2J1O2p2fUNJxFlDngQkh2V33YRNQo9LiL/66hDjxszZdpxsLLRECif7dKjm9HzARgdtw==
X-Received: by 2002:a63:5a23:0:b0:382:3f34:4748 with SMTP id o35-20020a635a23000000b003823f344748mr11087669pgb.572.1647881369906;
        Mon, 21 Mar 2022 09:49:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j13-20020a056a00130d00b004f1025a4361sm20594538pfu.202.2022.03.21.09.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 09:49:29 -0700 (PDT)
Message-ID: <6238ac99.1c69fb81.63cbc.6c35@mx.google.com>
Date:   Mon, 21 Mar 2022 09:49:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-100-gfb4e0eea8056
Subject: next/pending-fixes baseline: 226 runs,
 3 regressions (v5.17-100-gfb4e0eea8056)
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

next/pending-fixes baseline: 226 runs, 3 regressions (v5.17-100-gfb4e0eea80=
56)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

da850-lcdk                | arm    | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-100-gfb4e0eea8056/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-100-gfb4e0eea8056
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fb4e0eea8056f49d9f5e80f96021c7a906773423 =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6238747fd7911e6eaefe17b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-100-g=
fb4e0eea8056/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-100-g=
fb4e0eea8056/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6238747fd7911e6eaefe1=
7ba
        failing since 5 days (last pass: v5.17-rc7-200-gfb8a41b34095, first=
 fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
da850-lcdk                | arm    | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6238728ecd5146afc3fe17aa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-100-g=
fb4e0eea8056/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-100-g=
fb4e0eea8056/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6238728ecd5146a=
fc3fe17ae
        failing since 56 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-21T12:41:29.415534  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-21T12:41:29.415784  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-21T12:41:29.415966  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-21T12:41:29.458753  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/623872cecd5146afc3fe18d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-100-g=
fb4e0eea8056/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-100-g=
fb4e0eea8056/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623872cecd5146afc3fe1=
8d5
        failing since 5 days (last pass: v5.17-rc7-200-gfb8a41b34095, first=
 fail: v5.17-rc8-122-ge6f79dd905ae) =

 =20
