Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE574E548D
	for <lists+linux-next@lfdr.de>; Wed, 23 Mar 2022 15:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiCWOv3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Mar 2022 10:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236610AbiCWOv2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Mar 2022 10:51:28 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0B07CDED
        for <linux-next@vger.kernel.org>; Wed, 23 Mar 2022 07:49:58 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id c11so1290669pgu.11
        for <linux-next@vger.kernel.org>; Wed, 23 Mar 2022 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pXC2r0IkJGedvkQGMxWky7rbAZUbdvECEVCiuqhLDkw=;
        b=PLfh1ZxjtwkuQF/EF0i/IsSo49jzIvKU5ENSNxjmQGtHS90GWreBebnVMoZqgH5cEk
         ZijzGRVORPuUX0R1ICqyABzPF3H/CPyhLMlfnZqfoVT646P8TVJgZfh9Kd8iZqQYFL5s
         bWGIcaqETy7INlqX0cJJ0wseyb471qucClJqWBVN9h7Bke+4zRf79Y3DlG6r+jFdwRX2
         jwwh37cpxREKqhaPV+xKjzvNa9Hx6J01agfRGVTWOKr4p2irAx4vTSzyoAhdq4JpdR3l
         fxn1fa8/CPDcAmz09smTd7H3776qmPxRm8IjoPsaUk+3bD7Kw/SKpfA7a+LWpPay/eBO
         WbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pXC2r0IkJGedvkQGMxWky7rbAZUbdvECEVCiuqhLDkw=;
        b=KNBmo7r2Z1MgFt9h2kj+6QeVet0boIbuKmjYLtSx7mYi0Kwh3DTIl77I6OJwPW/15f
         zKG1XVm1PEg4wwuV+ID3k0RRPuMw3iAVvWaUoEkyrdf4lnkMA6Uwqg49M6GjuK11tagG
         fYe9b+DNcDgyJOpAwCx78nw20A8rJAOaorJ5Cu2Nkb+SH/fZmQhoUMYd9TtZPmBMgDVg
         TV9fup3pWOBG0dxv3xhtTQ71YM0AKWakE3JLjEv2OePA+hm/QalB12R5zwcoRJOY6VhH
         RzJR/pUmM9W7VfTiaSRgb9j/i13aQqJf/Zpl0C0NIKU7lj1MpmHXBaACg08WG+zEDaiO
         48gw==
X-Gm-Message-State: AOAM5330FTp4Q2rQ4dB6TG3BErDl80PeJGdS3S/hXjQZgnPHQcPWbsnK
        CBQctKRaTt7Ug13Er12UCdJHxnuH59hZLtMhY8k=
X-Google-Smtp-Source: ABdhPJzaMuXJrWXEDbyR+sXeabt4G+Ds8SnCyw1smFkYie6qCwFakAfIkwaPdj+oM2GXnzjzIRHLsQ==
X-Received: by 2002:a05:6a00:a92:b0:4e0:57a7:2d5d with SMTP id b18-20020a056a000a9200b004e057a72d5dmr119735pfl.81.1648046998183;
        Wed, 23 Mar 2022 07:49:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g70-20020a636b49000000b003823dd39d41sm107369pgc.64.2022.03.23.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 07:49:57 -0700 (PDT)
Message-ID: <623b3395.1c69fb81.9f04c.04d3@mx.google.com>
Date:   Wed, 23 Mar 2022 07:49:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220323
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 162 runs, 1 regressions (next-20220323)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 162 runs, 1 regressions (next-20220323)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON..._64=
K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220323/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220323
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b61581ae229d8eb9f21f8753be3f4011f7692384 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON..._64=
K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/623afe79eeaec188f8bd9183

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220323/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220323/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623afe79eeaec188f8bd9=
184
        new failure (last pass: next-20220321) =

 =20
