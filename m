Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8037A1646
	for <lists+linux-next@lfdr.de>; Fri, 15 Sep 2023 08:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbjIOGkN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Sep 2023 02:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbjIOGkM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Sep 2023 02:40:12 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE082718
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 23:40:06 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68fdd5c1bbbso1336109b3a.1
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 23:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694760006; x=1695364806; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WJv/OvBCQBO+ncMHIj8iuf8MlyRXZufymci3vM4NvBE=;
        b=02kFx5Wb1dbRwB+sM/+DqlBTNpaBa+OpDPMtVT+Yrq0GcERCUyxhn5wIkLwmh6wYx8
         j5AL+8S1oMTElyvRzH6JqEcvudg40UXiHbjSvodobeM8yUGjUdoeoI/kExiOcqW98hDW
         ZSJY5PMtq2z5ZK90ijv+l8Q3kOtCAa8Y7QsGWQnc+4QAWUF8kuMiM3OHqr5S1I+c2DM4
         jFE4TiWmw/RvgkNJvOwukgg4XodLRR4dcRXTE8r5umyTT4xOXRPFM7B7e/t1/P8rsJmV
         GYjeFQe0DZccKOk7lay1Tv8MFAzgHrdTE6SFSzi8Xx0goOIcvHEX6Y+kCjf9dkkk1gyO
         OSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694760006; x=1695364806;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJv/OvBCQBO+ncMHIj8iuf8MlyRXZufymci3vM4NvBE=;
        b=pjGB2bUV+8CtXOTn0FWnGezmsRyqblZPIzvXHhlT9WHTtT5GcSop3odRmdysF5vMtD
         glW7ax7qnEW0B+jNa8KoAfLakXpGbHOfpntYh41CifW7yaLans/9qY3CFgXhxI3gJfQ/
         Dx4XiDkF250a+/DpdhtiV5akHlvJhvcGomkM3vRgvy5Rb/Fp4HWYDwvShPkx7K2v5R6K
         U7Vf7jiRdGfpqZLogRTfFfKFNn5NUjHH7nfP8offF6+yH+MZb+YqU/2nr9gcnpkzNeU7
         y+0V8ZlPz45Ffc9C5BRZ7SscSVRo3hOjw0mZzQthfIsxdSHjft8OJy9h46lZ/owQPDk8
         fbBw==
X-Gm-Message-State: AOJu0Yz6BDED/oVgOzK4RERhg7cfILEG1k/NMlDMA4HeJ4tmGYSCFgCn
        3NN15UG6xQiZI99MEQPBy64G+PseFWUXYMXn5Pw75w==
X-Google-Smtp-Source: AGHT+IEXxKKRnS9aaXUrOQ61HvV9EMFSCW5jhU0HbHS0UPYBuH8/BVJWPosKscsHBB4tEv+EQTmdkQ==
X-Received: by 2002:a05:6a00:84b:b0:68f:cb69:8e66 with SMTP id q11-20020a056a00084b00b0068fcb698e66mr1165468pfk.15.1694760006027;
        Thu, 14 Sep 2023 23:40:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ce7-20020a056a002a0700b0069049d15fc6sm360211pfb.191.2023.09.14.23.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:40:05 -0700 (PDT)
Message-ID: <6503fc45.050a0220.7268c.0cb4@mx.google.com>
Date:   Thu, 14 Sep 2023 23:40:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc1-445-g66b45e71c969
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 53 runs,
 1 regressions (v6.6-rc1-445-g66b45e71c969)
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

next/pending-fixes baseline: 53 runs, 1 regressions (v6.6-rc1-445-g66b45e71=
c969)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc1-445-g66b45e71c969/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc1-445-g66b45e71c969
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      66b45e71c969032c8c1564217e8596103b451145 =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cab3f7c1246e298a0a88

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc1-44=
5-g66b45e71c969/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc1-44=
5-g66b45e71c969/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6503cab3f7c1246e298a0a91
        failing since 10 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-15T03:08:10.089208  + set<8>[   28.233891] <LAVA_SIGNAL_ENDRUN =
0_dmesg 108552_1.5.2.4.1>
    2023-09-15T03:08:10.089791   +x
    2023-09-15T03:08:10.203996  / # #
    2023-09-15T03:08:11.365446  export SHELL=3D/bin/sh
    2023-09-15T03:08:11.371456  #
    2023-09-15T03:08:12.865600  / # export SHELL=3D/bin/sh. /lava-108552/en=
vironment
    2023-09-15T03:08:12.871508  =

    2023-09-15T03:08:15.584823  / # . /lava-108552/environment/lava-108552/=
bin/lava-test-runner /lava-108552/1
    2023-09-15T03:08:15.591391  =

    2023-09-15T03:08:15.601672  / # /lava-108552/bin/lava-test-runner /lava=
-108552/1 =

    ... (12 line(s) more)  =

 =20
