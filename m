Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E1D25ABC3
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 15:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgIBNH7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 09:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgIBNHr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2020 09:07:47 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC40C061245
        for <linux-next@vger.kernel.org>; Wed,  2 Sep 2020 06:07:47 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id mw10so2321356pjb.2
        for <linux-next@vger.kernel.org>; Wed, 02 Sep 2020 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RezvhQlBXmlBEvDF1/F+27IedIFclHoGFTrF6++AWDY=;
        b=BhvRTFLY1zIvRP5T2IObdfQP00mMBcSNgqPIP7FtFoRKbEpOsPdGNmUA6FqiVuIcxo
         Q2o+EW/0oq1kwwJmXmIO8fct6dvzSi5qAf249NDT65Pj2Q44zdLdk0hgOeq/JPWUhrVc
         c77hCjhxJrfTqYaesd/lK3Dwp4z5s/F/cK+UnxPQmxZRX31zyDISUVlLKa0S45nG04Mv
         VHJyZtL6Iu4I3c8yCwc8WaFAgXkar+RQe2oL6eU77AHeMeY0KFX+BTScWPyNeD6KQokY
         3VM9wfaSHifYJDas7IkVkTJoPWI4/vkSCZPebVxP+3Ozbci6pesT3Rj5Gvb3QRkABv5s
         bUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RezvhQlBXmlBEvDF1/F+27IedIFclHoGFTrF6++AWDY=;
        b=dATvtTN55EXZRVC/yufcve4itQeIbTGxo9JiSmbqWJwoJG9E2ZglwJFoMVufr7+0Ql
         qL46sboyCxfg7TSXxz4PvRXP9miHYqQtl5oaUICpmz2QnP+rx24GpUS6K4vWye2qAlmU
         jgPYdsl8s8gkcCxjJos91uKU8GvHqQLV78aQhRIO8rAmBd4EYkR6SoKqqqebFQxq1W/Y
         WF7NzrZc6IYgQqX24Y+icEKx1ESUuI0TL59C0/XwI8LdcTfClmy5KRGzybJ/lxOhmxXR
         CPirGFYhtYQLbcBbPdtKtWxLuenqaQfdexuUap58siBf+cpt29L+3go+xqdhOf0eoJZx
         r3qg==
X-Gm-Message-State: AOAM532mFcdTvp/ZDrzONxGgJEl637z7bmnDR8xlRulYkcjPrn9UWlf/
        QzKH2mpgm3zIDtqVcytXgKdC32kJvFqWYA==
X-Google-Smtp-Source: ABdhPJzLVafjJyBlHSKfJ9ecMxzhQiEMb+KER19eUcAOKcmgcuoi0CRsyGIBF9vVp0MpkuPqv9PKiQ==
X-Received: by 2002:a17:902:788e:: with SMTP id q14mr2014918pll.140.1599052065406;
        Wed, 02 Sep 2020 06:07:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w4sm211138pfu.215.2020.09.02.06.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 06:07:43 -0700 (PDT)
Message-ID: <5f4f991f.1c69fb81.34034.0566@mx.google.com>
Date:   Wed, 02 Sep 2020 06:07:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.9-rc3-380-g4d386b9bd46d
Subject: next/pending-fixes baseline: 301 runs,
 2 regressions (v5.9-rc3-380-g4d386b9bd46d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 301 runs, 2 regressions (v5.9-rc3-380-g4d386b9=
bd46d)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc3-380-g4d386b9bd46d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc3-380-g4d386b9bd46d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4d386b9bd46de4ca4d841962887d700e09e831f3 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4f686ef997363c2a081135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc3-38=
0-g4d386b9bd46d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc3-38=
0-g4d386b9bd46d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4f686ef997363c2a081=
136
      failing since 15 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first f=
ail: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4f613f88b8a39f0e081130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc3-38=
0-g4d386b9bd46d/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc3-38=
0-g4d386b9bd46d/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4f613f88b8a39f0e081=
131
      new failure (last pass: v5.9-rc2-452-g3b025a0ae05d)  =20
