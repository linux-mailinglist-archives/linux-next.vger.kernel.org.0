Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1F67EA981
	for <lists+linux-next@lfdr.de>; Tue, 14 Nov 2023 05:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjKNE2T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Nov 2023 23:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjKNE2S (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2023 23:28:18 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841F7D45
        for <linux-next@vger.kernel.org>; Mon, 13 Nov 2023 20:28:14 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6b20a48522fso4322027b3a.1
        for <linux-next@vger.kernel.org>; Mon, 13 Nov 2023 20:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699936093; x=1700540893; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cm5GwOapNYp2yjImugr54WQWXpxuDaxMa6NrlupaKD0=;
        b=n/iHPHDCP/JDQKFDVkxqfDxhda6+C1Tv2ke+S3GdzImbCER3JwvF97KnvSBMEFTVyC
         agImLeZwFKGw1CkzujR1SStQ7SGW88Lxp67ocxWnb4gM643YaBKYL0+bgTsQkqaapPBp
         Dc9fTzhTp6cVxx1S6tLIbbniM2TqSUF2frxA9U5VSFoITnLF2D2mHCtoGNQRhO16pZs9
         aK25Szcf+XfqJwWgXGqHx/SC5q2F8ptiDTnr9eCjwZPN5vB29SmuJPYWv0gbd1MhNZa8
         znQJlBhW71VZlcp0AdVY0zS9hUNiPU+sQ1G/ZQKZyg34BmFspp7NXvN2k/zoIekrQGqz
         rLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699936093; x=1700540893;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cm5GwOapNYp2yjImugr54WQWXpxuDaxMa6NrlupaKD0=;
        b=WKL+ydX9Vsw7ec4Sx7kgtbgxM+TSHyE+h7n+l5xaCAaLYj0LqgIYB8dK2e/s8ZNArt
         oj+C0n09CGzIfkG8hWwXG7Q8WixM6UrLZBL2sjqjWsQODMaG8bmUWVs2PrYxBWxzy1Z4
         HO8lJeS32REvCmKm/qcnXJkPs+BhSv9HydI++t3A5Kqnk8M7sCrbTaTcQIv/wrwUJIIg
         YayMYJt48MBmGuJOXCpPAd6rwMxhizMiyzYjCBRYaSbncVXJL5O00sPBNnMFM08LqPUA
         b8AXeHrN3cDejOexjvyX6koYwsz3g4enVhqCAdV3Apq9qsUdpMIzfMI/jKybZun+J5oy
         hb0A==
X-Gm-Message-State: AOJu0YyuXWG49GfBTbmWl2zIRgcHk2I6hKuDfbpPCWMaj14l0l9+Y1S+
        vEjI1ehagCSKgkXsIp5RCSMp1I9txNGo6E3e3Fi6Eg==
X-Google-Smtp-Source: AGHT+IF0XzzYy0s+sIyxgyktCSY2V4xuuGzpybkC3/sS5oCBlcx5q4EFxG/prn9It0U7G8GFjU3oOQ==
X-Received: by 2002:a05:6a20:9382:b0:135:8a04:9045 with SMTP id x2-20020a056a20938200b001358a049045mr8143402pzh.1.1699936093536;
        Mon, 13 Nov 2023 20:28:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ik12-20020a170902ab0c00b001c55db80b14sm4931399plb.221.2023.11.13.20.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 20:28:12 -0800 (PST)
Message-ID: <6552f75c.170a0220.52846.b897@mx.google.com>
Date:   Mon, 13 Nov 2023 20:28:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc1-105-g3e62c2378662
Subject: next/pending-fixes baseline: 107 runs,
 2 regressions (v6.7-rc1-105-g3e62c2378662)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 107 runs, 2 regressions (v6.7-rc1-105-g3e62c23=
78662)

Regressions Summary
-------------------

platform                | arch  | lab        | compiler | defconfig        =
  | regressions
------------------------+-------+------------+----------+------------------=
--+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe | gcc-10   | defconfig        =
  | 1          =

sun7i-a20-cubieboard2   | arm   | lab-clabbe | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc1-105-g3e62c2378662/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc1-105-g3e62c2378662
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3e62c237866283141aed0ba96610eebbbf2c2833 =



Test Regressions
---------------- =



platform                | arch  | lab        | compiler | defconfig        =
  | regressions
------------------------+-------+------------+----------+------------------=
--+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe | gcc-10   | defconfig        =
  | 1          =


  Details:     https://kernelci.org/test/plan/id/6552c783b4c8f5c6bb7e4bbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-10=
5-g3e62c2378662/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-10=
5-g3e62c2378662/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552c783b4c8f5c6bb7e4=
bbc
        new failure (last pass: v6.6-16289-gf5a0c9203230) =

 =



platform                | arch  | lab        | compiler | defconfig        =
  | regressions
------------------------+-------+------------+----------+------------------=
--+------------
sun7i-a20-cubieboard2   | arm   | lab-clabbe | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6552c6fbd3b46cd4917e4a7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-10=
5-g3e62c2378662/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20=
-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-10=
5-g3e62c2378662/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20=
-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552c6fbd3b46cd4917e4=
a80
        new failure (last pass: v6.4-rc5-210-gef2d89b88456f) =

 =20
