Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 338F550BAD5
	for <lists+linux-next@lfdr.de>; Fri, 22 Apr 2022 16:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448575AbiDVO6E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Apr 2022 10:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449036AbiDVO6D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Apr 2022 10:58:03 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA9BDF58
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 07:55:08 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id t4so7535389pgc.1
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 07:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ap8HDrgsWzd6NEhwMbaasSj5h3PX+5Bl1laoMR+IKPw=;
        b=1dHmn1He9D6TW8Hg1WQPm9NOMCfZxRFzv4wMYfP8s1Xd8wPZzk9701M2j3nlx/oU2K
         lK/HS75PeDmsYISXgeV4gI6G2pqe67fa48pe5OH/jMu2tWOOyd+ulxNH7/n8xjKJqwzk
         YbpM7/W5dA/HsOdM7LKxTAVEI5ViZhbrV2s0N97A4hGOzhPma+OOgMgZQPB/fHCg5e26
         Q+qbjLSo9KOlj69qjJJVZeJXVTVCt8i8inT1IktExHHxVVOf5vONwf9IiQh2LeJ+k0d9
         LesXA8UFbotExZB0M6fRcP+E15M6TInD+sg9NeQB4YGMYG2m1DR2nvVEWfzHfmUE7hNo
         vkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ap8HDrgsWzd6NEhwMbaasSj5h3PX+5Bl1laoMR+IKPw=;
        b=W/+eDrL+1KQpaMu1WCunmxZms/XX3XLHFqUxqc16aEl8Y3mGVvnm3KDFrl2m1EoCZ+
         P9m9ifLGQTY1X4U3kePZzWZLJkCj3LgXHhF5YO6aWpsimNRfihCDuQIS8AnaV5EVSgog
         mjnuC126Rl7vJupTDR6vR8PyFGx1dOfojn+sHYGxkN8bBZ6bjc/DO0H2dVx92aPMOJlF
         Tk67Gn6heXCgKCR4M0Nj6/Q4ceS+5gD/iOW1DBqtvfBjT9jVDpfhlP/nxb7XBvF9FZI0
         scOT+PIlJ9SF5UlgWhlaxOVHM+SrpUf7wO/l1OZGqbVX/1I7hwzvnzu9aKBO3xjv02N+
         Il0w==
X-Gm-Message-State: AOAM531UnpZoXwoyUNwc9LV5NA+3+HfifH3JUYt04gKrwcauhhMUr2wP
        8/Zjk3EBVNkYqDlphL9POnbZq4L2yW5MDEf998M=
X-Google-Smtp-Source: ABdhPJxFdiI0vq4dNRqWIkhJAm0u0OxOOsykz/BecXPDpPirZv0EcWkUztE6KU5rJzWoh9fBqFGeYg==
X-Received: by 2002:a05:6a00:ccf:b0:50a:db82:4ae4 with SMTP id b15-20020a056a000ccf00b0050adb824ae4mr5381883pfv.67.1650639307449;
        Fri, 22 Apr 2022 07:55:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bu7-20020a056a00410700b0050a4ccc6138sm2649385pfb.139.2022.04.22.07.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 07:55:07 -0700 (PDT)
Message-ID: <6262c1cb.1c69fb81.a5bc2.6464@mx.google.com>
Date:   Fri, 22 Apr 2022 07:55:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.18-rc3-381-g1e9235a24947
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 248 runs,
 2 regressions (v5.18-rc3-381-g1e9235a24947)
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

next/pending-fixes baseline: 248 runs, 2 regressions (v5.18-rc3-381-g1e9235=
a24947)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
meson-gxbb-p200  | arm64 | lab-baylibre  | gcc-10   | defconfig            =
      | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc3-381-g1e9235a24947/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc3-381-g1e9235a24947
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1e9235a24947eac05d3a1d11c4bd9aa012ff5acf =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
meson-gxbb-p200  | arm64 | lab-baylibre  | gcc-10   | defconfig            =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a7be9884529633ff947b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
81-g1e9235a24947/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p2=
00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
81-g1e9235a24947/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p2=
00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6262a7be9884529633ff9=
47c
        new failure (last pass: v5.18-rc3-306-gd66bdb48aeb68) =

 =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6262955fda02f0b54bff945b

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
81-g1e9235a24947/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
81-g1e9235a24947/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6262955fda02f0b54bff9480
        failing since 53 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-22T11:45:05.249289  /lava-6151611/1/../bin/lava-test-case   =

 =20
