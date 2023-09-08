Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C61E79816D
	for <lists+linux-next@lfdr.de>; Fri,  8 Sep 2023 07:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238568AbjIHFFX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Sep 2023 01:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238463AbjIHFFX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Sep 2023 01:05:23 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3DE1997
        for <linux-next@vger.kernel.org>; Thu,  7 Sep 2023 22:05:18 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c364fb8a4cso15253965ad.1
        for <linux-next@vger.kernel.org>; Thu, 07 Sep 2023 22:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694149517; x=1694754317; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XXj1TNUtsB2pypT3qlIDYdPzco40vQQ1/j8UopV9LQY=;
        b=Xx5dZtiZQl0TbdGRcjo6KDL7w2P1fZHKKAY1BBc3/V3Mv0wfSu8FjPe8KkU2ETPaBl
         ce43YD9XQA2WAPq6G5gV8vGOxz9AlHaBfKUvS+EIadDTuoB+3xpU17UodIdON3GcOw7e
         mFXl2NiuD3IgiBZb8clZq+9NkCCXTgCF+S6ld7QxdcLHh5kDXwgbR/H7aTmR49efTqcO
         cVMQ/RxhXStgIJ6SBQIXihE1/dVUI8mRzhTus0VQ37V53FT52WoDkoWcMjE7238vHYZ8
         K4QwIL6I+on3rV+UYuPYPWbeYaSSkcX6DgsRzoSAYZDsJs3cvi6gb2jHXa/rHiG2f1cT
         J9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694149517; x=1694754317;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXj1TNUtsB2pypT3qlIDYdPzco40vQQ1/j8UopV9LQY=;
        b=mgDlEQhTe3Vqm4C5Kk5kZWUAq7FBTjgU9rqzeGsOd9sa8FHtewz9L+p8JTwgnzBnIe
         ZUy7w4L0TtBXURm20YjsctBz/bngZoAYIeBLEk6ZTqzK0TGG6+rXEcC78sXNgYTsuxbW
         4Qax9D0v5wlNiHVGxBXiASdV6Hpovkpxu4DTsRTr0Eef1adOKYtnGKIiDiDyVUmrAkoU
         R7wwcU0yvx0chPold9GVBUMZ9+DPdlgFWRePKJ1E94Kh9F7UOyDoy19PUolhgZcNxSj5
         KqlXyfsA47m/8WLOJdt560ZOojgDWaBZYCqRLj+73sBtn2iFzOBrWMH56ma22ZNf/+vW
         lRvA==
X-Gm-Message-State: AOJu0YzaDIa4n+Y8iG/bx2q9C/49PiZDNi7X8N55YlfAxVybUDxaujrt
        X3xPU4zYOtByEvQofk99SIz5W+gxIZ3Q7/g/Uc/88A==
X-Google-Smtp-Source: AGHT+IH0YHkvN+3q2eMkjvYcvUOXnjaB+BkkFq1lwiq+G9sZqKIxARbNTyFQkpyLAiS0EPp/C2941A==
X-Received: by 2002:a17:903:22d0:b0:1bd:ae77:42d3 with SMTP id y16-20020a17090322d000b001bdae7742d3mr1738093plg.61.1694149517333;
        Thu, 07 Sep 2023 22:05:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ix7-20020a170902f80700b001bf3bdbceb5sm602166plb.134.2023.09.07.22.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 22:05:16 -0700 (PDT)
Message-ID: <64faab8c.170a0220.f34e7.1e02@mx.google.com>
Date:   Thu, 07 Sep 2023 22:05:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-12940-g9fc05fa98a11
Subject: next/pending-fixes baseline: 52 runs,
 1 regressions (v6.5-12940-g9fc05fa98a11)
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

next/pending-fixes baseline: 52 runs, 1 regressions (v6.5-12940-g9fc05fa98a=
11)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-12940-g9fc05fa98a11/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-12940-g9fc05fa98a11
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9fc05fa98a113fe105271eacfb97c33027fcd4a3 =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64fa7ad77328fd315e286d92

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-12940-=
g9fc05fa98a11/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-12940-=
g9fc05fa98a11/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fa7ad77328fd315e286d9b
        failing since 3 days (last pass: v6.5-5353-gb22935905f9c, first fai=
l: v6.5-12059-g16fdf769151b)

    2023-09-08T01:36:58.797147  + set<8>[   28.545995] <LAVA_SIGNAL_ENDRUN =
0_dmesg 91143_1.5.2.4.1>
    2023-09-08T01:36:58.797706   +x
    2023-09-08T01:36:58.904744  / # #
    2023-09-08T01:37:00.067030  export SHELL=3D/bin/sh
    2023-09-08T01:37:00.073030  #
    2023-09-08T01:37:01.511367  / # export SHELL=3D/bin/sh. /lava-91143/env=
ironment
    2023-09-08T01:37:01.517272  =

    2023-09-08T01:37:04.127289  / # . /lava-91143/environment/lava-91143/bi=
n/lava-test-runner /lava-91143/1
    2023-09-08T01:37:04.133982  =

    2023-09-08T01:37:04.139527  / # /lava-91143/bin/lava-test-runner /lava-=
91143/1 =

    ... (12 line(s) more)  =

 =20
