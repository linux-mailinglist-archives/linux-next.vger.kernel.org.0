Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71167D69B3
	for <lists+linux-next@lfdr.de>; Wed, 25 Oct 2023 13:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbjJYLDN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Oct 2023 07:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjJYLDM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Oct 2023 07:03:12 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91662A6
        for <linux-next@vger.kernel.org>; Wed, 25 Oct 2023 04:03:10 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1ca052ec63bso47917555ad.1
        for <linux-next@vger.kernel.org>; Wed, 25 Oct 2023 04:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698231789; x=1698836589; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GtEAprv/eErWWUcs44ep1VvGjpv02CMgw+ZCB1wX2qw=;
        b=ZQWl46iUNKPEa9a619j7gSylasRaJhjr3jm81iCVP+O2z/G2v0Hv8jkRdf/QJJP4yJ
         A9FEMP11BaT6kTNsdjziUaUOacmyRlplk8/BpAqUVFo6kiyaKLc1ehRDhTv1djrmAU0e
         yitWgUcXodHTBEkRjKQZM5KiN883b0Xt0B78fPs0F6leYdJd1BJ7bb8wqvtjCvbXYYau
         dHwYlfPq7dPhXiqj0eXlW5nJu23vDvy32w/6PRn+b0iNkBrMxnSh9UTR5/XkFItgai5o
         hMfQmFoIbIWB+h5VIZvVpkVnGbCQBHV/SonwEl9HesYjHPLRrMfVY4I7h1+JzHs2L023
         VxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698231789; x=1698836589;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtEAprv/eErWWUcs44ep1VvGjpv02CMgw+ZCB1wX2qw=;
        b=R7CdOcME9WpW50X1ZSyjE2ibBGt8QfdLlIBTQTRXDqe2aJESBmtj//0T+kiwe+G3Hr
         hYT2CIuHA+5nWR1vfWFxCAThF/Q11zlrjlNfEmQB6NZf4xwbhpUOiQ2hBlmKuqll6kI3
         d2/12BfQlCzohS2LB9eU7TMgKY52IL4391ORQ7lIgDsZ5m3llWMpMyXbEh0d4Okay5mW
         fRFtbontqOlhCzz+Wi844fI96/oByXRzZDHPUoWbSXT93s0JeDf8BIdQkedYlmlj17RU
         FY5hbpQFS3YM4P9lTffnMDnOvWI+oyh0sxGwaQENdzfulmJ3d4tGBcy97AP0Rmxstx3w
         v7Lw==
X-Gm-Message-State: AOJu0YxdpURrNHiSThCTm0ZMU0sMaoS5uHsn94/FR95HH2WBt2xM6CzE
        NLJTzG+yukamIzItKlIgqqZP7cFAKNPGOMOOgaQ=
X-Google-Smtp-Source: AGHT+IGEd5nFJCYoCHdDwf/NGULOSw85wOuiM8Q4h5X/ct/q/RuIZRTS3DPU2wiqgEcXILVTo0OpmQ==
X-Received: by 2002:a17:903:2342:b0:1ca:e7f9:a49b with SMTP id c2-20020a170903234200b001cae7f9a49bmr10589174plh.23.1698231789661;
        Wed, 25 Oct 2023 04:03:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ju22-20020a170903429600b001c625d6ffccsm8920746plb.129.2023.10.25.04.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:03:08 -0700 (PDT)
Message-ID: <6538f5ec.170a0220.afaed.d5b0@mx.google.com>
Date:   Wed, 25 Oct 2023 04:03:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc7-167-g7faf794fb380
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 82 runs,
 2 regressions (v6.6-rc7-167-g7faf794fb380)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 82 runs, 2 regressions (v6.6-rc7-167-g7faf794f=
b380)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig | regr=
essions
----------------------+-------+---------------+----------+-----------+-----=
-------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre  | gcc-10   | defconfig | 1   =
       =

rk3399-rock-pi-4b     | arm64 | lab-collabora | gcc-10   | defconfig | 1   =
       =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc7-167-g7faf794fb380/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc7-167-g7faf794fb380
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7faf794fb38079ec6de86f2231d60b506b52fe3e =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig | regr=
essions
----------------------+-------+---------------+----------+-----------+-----=
-------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre  | gcc-10   | defconfig | 1   =
       =


  Details:     https://kernelci.org/test/plan/id/6538c60e71026c9186efcf05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc7-16=
7-g7faf794fb380/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khad=
as-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc7-16=
7-g7faf794fb380/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khad=
as-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6538c60e71026c9186efc=
f06
        new failure (last pass: v6.6-rc6-484-g284bb784f987) =

 =



platform              | arch  | lab           | compiler | defconfig | regr=
essions
----------------------+-------+---------------+----------+-----------+-----=
-------
rk3399-rock-pi-4b     | arm64 | lab-collabora | gcc-10   | defconfig | 1   =
       =


  Details:     https://kernelci.org/test/plan/id/6538c5f7e5801e1e84efcf34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc7-16=
7-g7faf794fb380/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc7-16=
7-g7faf794fb380/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6538c5f7e5801e1e84efc=
f35
        new failure (last pass: v6.6-rc6-484-g284bb784f987) =

 =20
