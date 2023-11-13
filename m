Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0AC7E96B4
	for <lists+linux-next@lfdr.de>; Mon, 13 Nov 2023 07:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjKMGe6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Nov 2023 01:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjKMGe5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2023 01:34:57 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4520BD4C
        for <linux-next@vger.kernel.org>; Sun, 12 Nov 2023 22:34:54 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc5b705769so36481985ad.0
        for <linux-next@vger.kernel.org>; Sun, 12 Nov 2023 22:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699857293; x=1700462093; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x7X8Q3bWU2dRMheKMl6znuDGTL8OYttpKeJhXGaFmHQ=;
        b=BiEzcxVqb74Sx/+uui0QzNf0oMymf4nwB+9ue3lKl/i9ChEYACH0C9t1zaNPwxTTBx
         OiVCxSpd8K908wu4uje1k7HSVXojvAMGDcoXVcSCfyksJnNpekThPO7gRzp687vOhVwI
         t60AyY2C0JfwMv12L/UEydODz9RKbQdrpd8hxZx9ncpMsRqtKjaJc/nenUY98lx8BEgr
         kNTnQwBTfcSrY1S/x59yRifBChDTknWquNWnyOIYsbfHb+dg1M7G2GpQ1scSOK9DC05R
         uA0Iczw2qt28iNmx6QAxmDEnssUe/Mzt9Vhv6+QU1QmR26iMvwWsUVn1PtUcBNJNavIX
         dNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699857293; x=1700462093;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7X8Q3bWU2dRMheKMl6znuDGTL8OYttpKeJhXGaFmHQ=;
        b=Wtt2+z3Wum3SVOe8hd8xFnusfIUCaI7MMaabDBzjhtyZ53GFhxK8ExexCdSPJMxfsl
         om7fuZOGjevP7JX7v+D+f9PnSW54mg+4rsJiL7HCqg4m6M6UK5pTAp6Exagn6Q7ZXCtK
         HDMecMUNZGFfVdXSgQAPvb13MOIVd1GLd2Fld5JiyY5j83TdZUiRhwqU5vGHY8zLrE04
         x13GdZOELiW9WVvKwLE9knliDNQFJV+Zl5UHi1IlcKmUK/Ix5JI5OTGtIZzo/7m7mSMs
         hGfcvFDWqPeAUNSy4RIvfGEknbdiJ3wn2csBsQdtzpwgT8/GYEmp3PgTUpQ5wkUxERGq
         qfQQ==
X-Gm-Message-State: AOJu0Yzft5wb91o92NXyn82v3Ko4DHPp+Di1t/AzzFLAcBfHITNy0NtB
        cBhcNjknrQsIVeNwzHo/s/d2dK8P/MtZS6Zxde8=
X-Google-Smtp-Source: AGHT+IFlEQ2R7sw2qIoUFIoyETSwsbVDQmeD0OiozrQQjvgWZ5aFXj06TP006bnKOl2hM+QeXEB2Qg==
X-Received: by 2002:a17:902:d2d0:b0:1ce:8e4:111 with SMTP id n16-20020a170902d2d000b001ce08e40111mr7363584plc.27.1699857293218;
        Sun, 12 Nov 2023 22:34:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902db1100b001c9b384731esm3421449plx.270.2023.11.12.22.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 22:34:52 -0800 (PST)
Message-ID: <6551c38c.170a0220.3c13b.6d49@mx.google.com>
Date:   Sun, 12 Nov 2023 22:34:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231113
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 374 runs, 1 regressions (next-20231113)
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

next/master baseline: 374 runs, 1 regressions (next-20231113)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig          =
| regressions
-------------------------+-------+---------+----------+--------------------=
+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig+videodec =
| 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231113/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231113
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d173336e238b0f7f5b7eddfa641d7c25c24bb86a =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig          =
| regressions
-------------------------+-------+---------+----------+--------------------=
+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig+videodec =
| 1          =


  Details:     https://kernelci.org/test/plan/id/6551833402602c6380efcf2e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231113/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231113/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6551833402602c6380efcf37
        failing since 96 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-11-13T02:00:04.991413  + set +x
    2023-11-13T02:00:04.994593  <8>[   28.380715] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1037417_1.5.2.4.1>
    2023-11-13T02:00:05.101225  / # #
    2023-11-13T02:00:06.559016  export SHELL=3D/bin/sh
    2023-11-13T02:00:06.579771  #
    2023-11-13T02:00:06.580234  / # export SHELL=3D/bin/sh
    2023-11-13T02:00:08.529579  / # . /lava-1037417/environment
    2023-11-13T02:00:12.116310  /lava-1037417/bin/lava-test-runner /lava-10=
37417/1
    2023-11-13T02:00:12.137496  . /lava-1037417/environment
    2023-11-13T02:00:12.137862  / # /lava-1037417/bin/lava-test-runner /lav=
a-1037417/1 =

    ... (27 line(s) more)  =

 =20
