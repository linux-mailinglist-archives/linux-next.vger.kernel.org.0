Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACCA7DEF27
	for <lists+linux-next@lfdr.de>; Thu,  2 Nov 2023 10:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345713AbjKBJrS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Nov 2023 05:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345524AbjKBJrR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Nov 2023 05:47:17 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC56125
        for <linux-next@vger.kernel.org>; Thu,  2 Nov 2023 02:47:11 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso736952b3a.2
        for <linux-next@vger.kernel.org>; Thu, 02 Nov 2023 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698918431; x=1699523231; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=byap4oIkrZ3aEeHyWKj8bi+0h3lgQPr5fwV8GU8Kivo=;
        b=Vj5dazyqLVx+IVh0yK9mgV7SbW2C0rEGAzJYUpgh+S4jj7lDEr54n3ENnb8J3ItDkl
         36c+a9lNJ1fYew0KBg05KNxD9qhEdCD1Yv6IqRbIIhK+iiJwKcf759YghGumRDsASY2u
         Wx4RzMMtgqr4p6TXc8R28pa83vXacpb+6VjKwNpsRW7zFzg+gwkFa0sKwplYCN9kX4Vn
         ilaosH2O7OoKNmqpzL8Tbz0qSYiE1jrg/HDBKxYMMdfo2+zqgG61U1ES8RTJR75tEZhk
         apjHi0HFuFGms3xuAg+SFwSBuJJHDB4tVNCwwExjY97EiYqDROCG+7N7GNtxfBtH2QTD
         +xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698918431; x=1699523231;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byap4oIkrZ3aEeHyWKj8bi+0h3lgQPr5fwV8GU8Kivo=;
        b=bMG8cALIgtiq1eizZZ4H9iNJg3cAnasyo0zREJ/9bJn7wbq5MDCRSNStKJYCL1wK1N
         RFjs2LrN5ZIKWxXx0u1rYY6+JU7dnIdTrIYkTUGEa2BA6S2fjvBm44Qh1TV+c9NtoX05
         m8YAUiWv7//hqRASbvG+HwAS49LUCI9zTCk7bO/tLbI19uoZ7GBNAF3XSVUddcV9Hslz
         6EZgTEzZWfhuqR6ioE6/XaP9LQ77DkkLk+9YPRKE1pzHFirUIlPKzGi96xkWCzybWy91
         h3o3qCBFx9A9Z4izHAMO+3dDaLt8i1pxW7RO5GJPm27o/kX3Nf+mJ4sQSk7hiRoHTSNy
         GwlA==
X-Gm-Message-State: AOJu0Yy/GTj/6GRvWSm8VV8+KEy3CzbuIXDyiAgJqFW04ClRg1kH2lyx
        s8y8QtvQV6AxxYMGec2TGOYCO47Pqkb5Tmuqa7x6Iw==
X-Google-Smtp-Source: AGHT+IEK6aH1LSdpRGQm9vmxBj5ttPKTiGiLh05WxWxgrTveWAlzLQLLm5JyMJjjofZWF61IrW2BoA==
X-Received: by 2002:a05:6a20:3ca7:b0:17b:3438:cf95 with SMTP id b39-20020a056a203ca700b0017b3438cf95mr17753923pzj.14.1698918430782;
        Thu, 02 Nov 2023 02:47:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c16-20020a056a00249000b006b5922221f4sm2498909pfv.8.2023.11.02.02.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 02:47:10 -0700 (PDT)
Message-ID: <6543701e.050a0220.9614c.6e66@mx.google.com>
Date:   Thu, 02 Nov 2023 02:47:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231102
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 377 runs, 2 regressions (next-20231102)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 377 runs, 2 regressions (next-20231102)

Regressions Summary
-------------------

platform                     | arch  | lab        | compiler | defconfig   =
        | regressions
-----------------------------+-------+------------+----------+-------------=
--------+------------
jh7100-starfi...isionfive-v1 | riscv | lab-clabbe | gcc-10   | defconfig+ks=
elftest | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip    | clang-17 | defconfig   =
        | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231102/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231102
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ab57716449b3438c0136f6f412a2e59e0cf037a9 =



Test Regressions
---------------- =



platform                     | arch  | lab        | compiler | defconfig   =
        | regressions
-----------------------------+-------+------------+----------+-------------=
--------+------------
jh7100-starfi...isionfive-v1 | riscv | lab-clabbe | gcc-10   | defconfig+ks=
elftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65432e55d2bb8dbf2aefcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231102/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231102/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65432e55d2bb8dbf2aefc=
ef4
        failing since 267 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab        | compiler | defconfig   =
        | regressions
-----------------------------+-------+------------+----------+-------------=
--------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip    | clang-17 | defconfig   =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65432d197bc68275ffefcf02

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.4 (++20231030124026+3347=
c8441588-1~exp1~20231030124042.61))
  Plain log:   https://storage.kernelci.org//next/master/next-20231102/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231102/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65432d1a7bc68275ffefcf0b
        failing since 65 days (last pass: next-20230710, first fail: next-2=
0230828)

    2023-11-02T05:00:56.717342  + set +x
    2023-11-02T05:00:56.720526  <8>[   28.619310] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1031914_1.5.2.4.1>
    2023-11-02T05:00:56.828556  / # #
    2023-11-02T05:00:58.287235  export SHELL=3D/bin/sh
    2023-11-02T05:00:58.307989  #
    2023-11-02T05:00:58.308438  / # export SHELL=3D/bin/sh
    2023-11-02T05:01:00.258235  / # . /lava-1031914/environment
    2023-11-02T05:01:03.845688  /lava-1031914/bin/lava-test-runner /lava-10=
31914/1
    2023-11-02T05:01:03.866901  . /lava-1031914/environment
    2023-11-02T05:01:03.867265  / # /lava-1031914/bin/lava-test-runner /lav=
a-1031914/1 =

    ... (27 line(s) more)  =

 =20
