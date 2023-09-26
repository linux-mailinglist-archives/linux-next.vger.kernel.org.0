Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111027AE59F
	for <lists+linux-next@lfdr.de>; Tue, 26 Sep 2023 08:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbjIZGPc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Sep 2023 02:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbjIZGPb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2023 02:15:31 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF84E9
        for <linux-next@vger.kernel.org>; Mon, 25 Sep 2023 23:15:24 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c3f97f2239so71397185ad.0
        for <linux-next@vger.kernel.org>; Mon, 25 Sep 2023 23:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695708923; x=1696313723; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zoiAYBYX5FvfE3dWCyRlYgTB4+tKjLdzaZqCSKJ3GfI=;
        b=neFGaKk1OP5twvUogXjoMhcDD9uiMY6swoeYCKg2+YtmnMQRoc3LvHs9L+pl/dp7vi
         m80uVS+Nb0/of9VnAZGDczfK0lgKme82d3li5+KLfXx39q+3zLzOAQdPw1iGpqi7X8nA
         GXTEV+IAFqOA5zUldey5clL2Meiem3x8ERmWix9rQSuk1D9lmOM5GmxGd51pj5hZYZnE
         8EdK6+j2vjMoLpw1Xxj4A3Z5O+xpFKY2zWJiopYvyN5xTMovm3bcXQQpf6063GuCuNlu
         hGP+xukDaHMCb2TqTRe0t0VhvdN0fCkyOcsOBVX0E5zNTSYcSgHT0+B0zpoLpYudYVj8
         hF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695708923; x=1696313723;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoiAYBYX5FvfE3dWCyRlYgTB4+tKjLdzaZqCSKJ3GfI=;
        b=AOdgL+In+wfMQRoyl+df2rO6sGE3WAMxEvOF/KZxFM9qyMF1hF2tk4zlhuRvAS+X+o
         /WVFRBvwfA+QMCxNLeNuXYKKEwwBhctaYGXBzt1uhwJqQ+392NAoX6odhkGIOWcAYZi0
         asrfToLfNVA3e4mAZ4EvEcdlnrHXOibWxPeRZ7QzgXEc0TyG8cugELr9Cb2hMLF8F+ap
         dDMNGw9NllpO+/zpWgiNYM4P+NzTfttbKiOHEgv5jb9Wy53mAizvC4ydBAIKm5aCVpFL
         QodtWVDHzjC+OHxLw1xJnWk5tccCm3M6vSUm/DidglK6JcD8W1BBaN6Iysytkvnune/8
         StwQ==
X-Gm-Message-State: AOJu0YxCof9jdJvpoNYRDYgHHT8zkUA1z2MMWp9QuzUcSZdCllXXY/hm
        NZWAB7gkVP6acaGrrQv3l5mnKPE2jP7NF5XLiBPFbA==
X-Google-Smtp-Source: AGHT+IFRvRMNddskn1MAze41rjN1i+OabBbuAN/f5za9K+/o6y55oW+h9F61WPjq7z6eT1WE2kS5rg==
X-Received: by 2002:a17:902:9302:b0:1c3:343c:f8b0 with SMTP id bc2-20020a170902930200b001c3343cf8b0mr8103661plb.66.1695708923576;
        Mon, 25 Sep 2023 23:15:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001c6052152fdsm5544995plc.50.2023.09.25.23.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 23:15:22 -0700 (PDT)
Message-ID: <651276fa.170a0220.55321.1c23@mx.google.com>
Date:   Mon, 25 Sep 2023 23:15:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-240-ga427b9ee9815
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 55 runs,
 1 regressions (v6.6-rc3-240-ga427b9ee9815)
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

next/pending-fixes baseline: 55 runs, 1 regressions (v6.6-rc3-240-ga427b9ee=
9815)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc3-240-ga427b9ee9815/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc3-240-ga427b9ee9815
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a427b9ee9815a9d07e1d182ddc994caa06042786 =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6512464420b5eef15e8a0a70

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-24=
0-ga427b9ee9815/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-24=
0-ga427b9ee9815/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6512464420b5eef15e8a0a79
        failing since 21 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-26T02:47:04.011652  + set<8>[   27.632868] <LAVA_SIGNAL_ENDRUN =
0_dmesg 131849_1.5.2.4.1>
    2023-09-26T02:47:04.012259   +x
    2023-09-26T02:47:04.124019  / # #
    2023-09-26T02:47:05.290232  export SHELL=3D/bin/sh
    2023-09-26T02:47:05.296370  #
    2023-09-26T02:47:06.795632  / # export SHELL=3D/bin/sh. /lava-131849/en=
vironment
    2023-09-26T02:47:06.801711  =

    2023-09-26T02:47:09.524446  / # . /lava-131849/environment/lava-131849/=
bin/lava-test-runner /lava-131849/1
    2023-09-26T02:47:09.531332  =

    2023-09-26T02:47:09.535162  / # /lava-131849/bin/lava-test-runner /lava=
-131849/1 =

    ... (13 line(s) more)  =

 =20
