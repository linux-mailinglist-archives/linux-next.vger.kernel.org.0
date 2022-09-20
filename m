Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78A035BE0C9
	for <lists+linux-next@lfdr.de>; Tue, 20 Sep 2022 10:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbiITIxw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Sep 2022 04:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbiITIxm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Sep 2022 04:53:42 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E75462AA4
        for <linux-next@vger.kernel.org>; Tue, 20 Sep 2022 01:53:41 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id o70-20020a17090a0a4c00b00202f898fa86so1801375pjo.2
        for <linux-next@vger.kernel.org>; Tue, 20 Sep 2022 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=r1v7ElTstuO/70pAkzC4AXanYX81zUdE4f+lG0SnU2Y=;
        b=R7LluskfF/eJcKQ9yjpFPllO5Oayn9emy9nsSrZ8DpWugtWFR7PGAmmI0vlNG3exb/
         xiVlBscFxvTlQpek+ATMX+t6KZIWNhbZhnYwvPgfvK16FFccV+jHoXAUx0PLABmFdEwj
         PRDi1Mp4IZ6oMSn8MyWoAVhBSUGYmmUI4swMuOqIoNQolLqTi+9aLsm/eOHIewaTVJuc
         S0o7WxSSG5SJPrkvzykohd2d4/kzusa3R3i97RA+WCX9V82+7M5Zfct2nORKC2uRlfju
         KxFjRuovuoEKwcpAQsJv+3Iu44fpvk0myKF87VDN7MaX/EX4vXZI8udUKMWPPRTrhLka
         jJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=r1v7ElTstuO/70pAkzC4AXanYX81zUdE4f+lG0SnU2Y=;
        b=h/k10kZeaKASCRr15sso86tHiVl7nK9E4QNW8gjFE+Hi7g06REcHZcc0lan+JNCVs+
         ejOWxH/q9REaPQ4SdlaOkl+I9kmJafAlHgXNBaJDluZbS4KDBFJ1EhVjHhUyisg/y7Rf
         tE8G88EtSI/xJUJkhJYeoKwcNRN5AwYq6PyJHlGXFtxLMFFSutAaOxHFGFpMP/t0RjeD
         QHpXg3Eva/NejDlrW3iTq6Ewc67jjB9GR+XfuKz0aSKWmO7qceWUe1vOIQRDCBkNpXBa
         Df0rN2bu/9ReJZBtJi4AHIE7g13u3alOTOCHa3wCF69CjWo5dpW2bDIz4caPiO4ZQZk+
         trGQ==
X-Gm-Message-State: ACrzQf0JzwgP/afpET9QFU0JcWobtSSyTuTbJi1KnWdjHTzRnDHvFKjP
        2/3JN1+HH4AWbTFOZT/ejs3MGxYemUMKih1pb/U=
X-Google-Smtp-Source: AMsMyM6f/XCX4nbzd1OsxsgX572WSW4yTvh1sfrNBgeMdVMz3Ij5pH9dF0fZe6YaeImBz9hN1hLTVQ==
X-Received: by 2002:a17:902:f684:b0:178:84d:ddc5 with SMTP id l4-20020a170902f68400b00178084dddc5mr3945747plg.62.1663664020367;
        Tue, 20 Sep 2022 01:53:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m10-20020a654c8a000000b004390b40b4a1sm1037369pgt.23.2022.09.20.01.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 01:53:39 -0700 (PDT)
Message-ID: <63297f93.650a0220.c608c.182b@mx.google.com>
Date:   Tue, 20 Sep 2022 01:53:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc6-212-g9e152597d89ac
Subject: next/pending-fixes baseline: 166 runs,
 2 regressions (v6.0-rc6-212-g9e152597d89ac)
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

next/pending-fixes baseline: 166 runs, 2 regressions (v6.0-rc6-212-g9e15259=
7d89ac)

Regressions Summary
-------------------

platform           | arch | lab             | compiler | defconfig         =
           | regressions
-------------------+------+-----------------+----------+-------------------=
-----------+------------
imx6ul-pico-hobbit | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig=
           | 1          =

imx6ul-pico-hobbit | arm  | lab-pengutronix | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-rc6-212-g9e152597d89ac/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-rc6-212-g9e152597d89ac
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9e152597d89ac9ca06385594634eddda9b0c2e7e =



Test Regressions
---------------- =



platform           | arch | lab             | compiler | defconfig         =
           | regressions
-------------------+------+-----------------+----------+-------------------=
-----------+------------
imx6ul-pico-hobbit | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/63294f6cb3882ae0d8355671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc6-21=
2-g9e152597d89ac/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc6-21=
2-g9e152597d89ac/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63294f6cb3882ae0d8355=
672
        failing since 86 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform           | arch | lab             | compiler | defconfig         =
           | regressions
-------------------+------+-----------------+----------+-------------------=
-----------+------------
imx6ul-pico-hobbit | arm  | lab-pengutronix | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/632952c9869b4af315355677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc6-21=
2-g9e152597d89ac/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc6-21=
2-g9e152597d89ac/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632952c9869b4af315355=
678
        failing since 112 days (last pass: v5.16-rc4-356-ga119cd39dcbf, fir=
st fail: v5.18-11575-gceccc06b624ed) =

 =20
