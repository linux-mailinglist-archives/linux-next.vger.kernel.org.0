Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 119BB7B1137
	for <lists+linux-next@lfdr.de>; Thu, 28 Sep 2023 05:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjI1De3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Sep 2023 23:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjI1De3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Sep 2023 23:34:29 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A828494
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2023 20:34:27 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-69335ddbe16so2284743b3a.1
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2023 20:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695872066; x=1696476866; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CPovVJUvEjSC7lLn0ysbI6ypRLwt7hxINSOS0AkOsTQ=;
        b=E1RVa4mRvSerH3fKZ11ot53h+tXgA5Liah8CbbMclHBnsgv83XJooe3XyIPxFP9ef+
         vH2bPc1uong7HJi9Iq6xYxi9Y6GZTxmonlPCPdFLptnn9l0zKmBRn/C+ASOZrOKRuhmZ
         XwhR1t7c7oLXEsl5JsIwWAL0KtWbZ6IKXhLcfekErXBdHRMqDzitHq6jYlpEEQb2g/sv
         RzBtIbZ8whu2DtUPH/K+vkL/8seQg2pkCBPCTvQ1HAtu+09n0y0OTd397A1MZQvYtZNQ
         sgN/Jr5NbaxokXjQXQoNrm8se9iSXExLU5Vmlf3C/6fdfNeAYznpYWKulckvNXo/5nhQ
         KOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695872066; x=1696476866;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPovVJUvEjSC7lLn0ysbI6ypRLwt7hxINSOS0AkOsTQ=;
        b=ZuClT2NRbTPiXIl5NRowfmT2ZACUHunCclZioXgYSNyWvgNzuhDm8ZJeSpolRK+GL9
         UHLMhEnghMw6PrCY9GvG3HfecKauv6Brlzl/m/n1bAvsv5SGoOwLcrXSXg1T1eQbnoj7
         iRTWW5rmH/nvmO5UJakPCBJrdobc486ZPuwGN5bxf9lNfl94E6O21gfzbNi9gzq1Le6x
         08ZBoojM5lup890qJDgeY3w6LXRlSCeGzQbq+0KgULJm86C8YPEEeW29yp5lzVH8ELDX
         Ujci+f1VzZgY2AW9ylFB4Pa8J+zZbSZUmsmVlqSOU5UWoWZdfa4C5jaqivmwhrzH5Vfg
         0elA==
X-Gm-Message-State: AOJu0YxpID+82OxL9534My2HsJFec539PTekaTAdLQq+P0R/GWLqaATM
        OUGMwigTNPNPf9TBpjBC3CCnDAJROUorpOqueDndgA==
X-Google-Smtp-Source: AGHT+IEZNh2GbA8lL6lE2K5Pnn+6dHrZtbUeW4fCjuWMdJ99pwPkxG9bqjF+fHhgj1M2WpW8UYHsvQ==
X-Received: by 2002:a05:6a20:3cab:b0:161:25f7:40ce with SMTP id b43-20020a056a203cab00b0016125f740cemr96710pzj.27.1695872066576;
        Wed, 27 Sep 2023 20:34:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b001b9c5e07bc3sm14004345plx.238.2023.09.27.20.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 20:34:25 -0700 (PDT)
Message-ID: <6514f441.170a0220.8b8a4.aad9@mx.google.com>
Date:   Wed, 27 Sep 2023 20:34:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-321-gad82df6ef94b
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 49 runs,
 1 regressions (v6.6-rc3-321-gad82df6ef94b)
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

next/pending-fixes baseline: 49 runs, 1 regressions (v6.6-rc3-321-gad82df6e=
f94b)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc3-321-gad82df6ef94b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc3-321-gad82df6ef94b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ad82df6ef94b32608e7ebccd610c0457faed505e =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6514c4302aac2d605d8a0b6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-32=
1-gad82df6ef94b/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-32=
1-gad82df6ef94b/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6514c4302aac2d605d8a0b76
        failing since 22 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-28T00:08:59.803986  + set<8>[   28.601765] <LAVA_SIGNAL_ENDRUN =
0_dmesg 136988_1.5.2.4.1>
    2023-09-28T00:08:59.804661   +x
    2023-09-28T00:08:59.916394  / # #
    2023-09-28T00:09:01.078479  export SHELL=3D/bin/sh
    2023-09-28T00:09:01.084146  #
    2023-09-28T00:09:02.577790  / # export SHELL=3D/bin/sh. /lava-136988/en=
vironment
    2023-09-28T00:09:02.583785  =

    2023-09-28T00:09:05.298292  / # . /lava-136988/environment/lava-136988/=
bin/lava-test-runner /lava-136988/1
    2023-09-28T00:09:05.303979  =

    2023-09-28T00:09:05.307373  / # /lava-136988/bin/lava-test-runner /lava=
-136988/1 =

    ... (13 line(s) more)  =

 =20
