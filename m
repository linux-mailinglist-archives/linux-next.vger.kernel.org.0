Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A825C7DDF66
	for <lists+linux-next@lfdr.de>; Wed,  1 Nov 2023 11:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbjKAKa1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Nov 2023 06:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbjKAKa0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Nov 2023 06:30:26 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1D592
        for <linux-next@vger.kernel.org>; Wed,  1 Nov 2023 03:30:21 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1eb6c559ab4so4006854fac.0
        for <linux-next@vger.kernel.org>; Wed, 01 Nov 2023 03:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698834620; x=1699439420; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=INu0GT4ebMMq+w8v7dSP005xPGnBrlqQwxWd+jGEbaU=;
        b=RQ3xcvGmsdFRuFgFRot9CmP8MOqdA8kTHaYUm80jzpvtr5ZTECHjFkURHE8cxrnbgH
         qhlSAzhr1z+ONVPghXO7cwolsbWkg30F0QXUP6Yfzmd4BDqzY0gs9ycKpV8dT3Kziz2G
         hniooJqJTHrT7Tta3jfd0gDSDWJgbN5MDEyKlb6VTUdO9dz4OiIFOg68Twgn4/CWgHKg
         7QPdMph9iOf6v6V6sFd59Hu1N/5s1zFFH6Uqw5MPIalWyyplBQXgm4YiFaZ/xAEtISDs
         WpicY4uGsTUDAJw1IUeWTF2aTV5tcV7NWlO2YkpfmDbjrgwy2wx7JNne9AB0lq5146Zu
         /NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698834620; x=1699439420;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INu0GT4ebMMq+w8v7dSP005xPGnBrlqQwxWd+jGEbaU=;
        b=uQmNLPD7Uu24ObaT3UyQr5XLHP3S30am8ybkXL1NhvqlT8hlmIzgM8QtSHqC+KeXDA
         ZAb0J0Lt61MQyLtyGqVhqgVniVSkRecjNf7kP37xGC+t4KBZbaXNRU2VXGu+0Oda56Kw
         hftAZFHdW+dLbU3C5C3HyzEreDGS5xnw1JP3/GxE7oeP3xjsvCMK1JKZ2xYgzUgiUJKG
         Ujnqg0eyFEPjs4I2DUpcfxpTKglwAkbbqQ9R6EQrO1fJVpupwVCgjF8R3cx0JN+49CP7
         MTlX3BxgGrv224qEK9BFoRKPwh/swrWv0kvI794LFYg0olJ3e/F6dwT0bv2urW6Mn0cd
         QjgQ==
X-Gm-Message-State: AOJu0Yzv4Ik05wOSDg+JM/X8KXVbDDvIDuPF4xdVNox1pp/VI7+KUTDs
        jP0mlu9663cAVRp1IsPVmJUx+cCm3pUivHQAV0Z14A==
X-Google-Smtp-Source: AGHT+IGx9fA7UQMbrO5UGnED1ZQmyayVcvR5Fgzl5Z2Q8wFaA86Bg89yD7V/ypWNXgtM1sLvYqnRmw==
X-Received: by 2002:a05:6870:b013:b0:1e9:9742:7dfd with SMTP id y19-20020a056870b01300b001e997427dfdmr17020131oae.31.1698834619788;
        Wed, 01 Nov 2023 03:30:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z127-20020a633385000000b005b67d666159sm2293192pgz.53.2023.11.01.03.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 03:30:19 -0700 (PDT)
Message-ID: <654228bb.630a0220.5fb1b.5ee5@mx.google.com>
Date:   Wed, 01 Nov 2023 03:30:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231101
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 315 runs, 2 regressions (next-20231101)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 315 runs, 2 regressions (next-20231101)

Regressions Summary
-------------------

platform                     | arch  | lab        | compiler | defconfig   =
        | regressions
-----------------------------+-------+------------+----------+-------------=
--------+------------
jh7100-starfi...isionfive-v1 | riscv | lab-clabbe | gcc-10   | defconfig+ks=
elftest | 1          =

zynqmp-zcu102                | arm64 | lab-cip    | gcc-10   | defconfig+de=
bug     | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231101/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231101
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fa7d0c17278644aa691f96d08bef8001b762f9cd =



Test Regressions
---------------- =



platform                     | arch  | lab        | compiler | defconfig   =
        | regressions
-----------------------------+-------+------------+----------+-------------=
--------+------------
jh7100-starfi...isionfive-v1 | riscv | lab-clabbe | gcc-10   | defconfig+ks=
elftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6541ec80b507dbf5b0efcf7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231101/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231101/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6541ec80b507dbf5b0efc=
f7d
        failing since 266 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab        | compiler | defconfig   =
        | regressions
-----------------------------+-------+------------+----------+-------------=
--------+------------
zynqmp-zcu102                | arm64 | lab-cip    | gcc-10   | defconfig+de=
bug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6541f2745bdb2a3a80efcf6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231101/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231101/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6541f2745bdb2a3a80efc=
f6f
        new failure (last pass: next-20231030) =

 =20
