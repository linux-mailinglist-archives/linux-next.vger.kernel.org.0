Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A6C6E18A4
	for <lists+linux-next@lfdr.de>; Fri, 14 Apr 2023 02:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjDNAK7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Apr 2023 20:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjDNAK6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Apr 2023 20:10:58 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5939D30DA
        for <linux-next@vger.kernel.org>; Thu, 13 Apr 2023 17:10:57 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-634b28df952so1403259b3a.2
        for <linux-next@vger.kernel.org>; Thu, 13 Apr 2023 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681431056; x=1684023056;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wgQoysqn0ZBHt1D3X4Am7gdwTBkAwBEzyivAJzUcnEc=;
        b=1ne2nzVQYmEWwO1IUZfRIVepB/a5Udn4VE8mCu92WW8bvdjlCLh7J1aNFLV+EMSuMt
         uafcmxx1p9enLj8ul++kcHXMqkmoVrRjLv05F8ReYnnIas3IF6gm3FyRUVjLzJthHcW/
         XftTqL0gN6yJLMGylycTuwjdD0Wttbj1bVP1zwD1eIMvub7TmQmuEXOn2g1a5Qdfd2EA
         NQg2x+ZIYJLrx57oM3BeXKrnnSDKYrAZUlvJXI/jRQup/IJAEJQN5wdA58dhu50IQfaV
         HCyOc3NL9EPJq/ixm+ec4y9CVElO2FR7A++A4i1EhSrbWgQ/HJyAcCejWcNzFIHFGwJc
         BNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681431056; x=1684023056;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgQoysqn0ZBHt1D3X4Am7gdwTBkAwBEzyivAJzUcnEc=;
        b=cSS7h2363q+J6r4l48f82yhqq5SqfQ/4sXfg52WU0YIG/uvnkAnW17YxdTrJTAmFnO
         UHvaw7+XFGmPJSQFJeH6DM37YU3WHOXChAyGXrOE1o742x5gOf6NE4NAMNfvu+qJy02y
         K23clx4Qj2y52pKzx7jdtjEdwwXDZ67kwMiYnTW8aTQh2peXyP6T0QHvxnh+wYH6AIaw
         3IMmcJ52Xzz53XLfonqBEczLWJ9FSCgcca6CsdGMyRMw83umpjzIW3FsCPSb6vR2r/T1
         fJQZPLw+jbAJqwnNYYLcKS8KyfiMjr+0qpR05vWVcc8yWJRymhsUVnoWVngewVMB2o+8
         dtRg==
X-Gm-Message-State: AAQBX9c6bZqjla/8skufDF2fIOJ/y35cNUmdc+U356ebrOjE15sa1Auc
        Pd4VhO4955nhE5KYaCIljDg0L17b6CBcPl5tJR94E2DS
X-Google-Smtp-Source: AKy350YsikWBOHCMlT0i/Pn45Qm0xwMBxRM3CrhQcJPUXwN2Ndg6FeZrV0b6b9k/vBbKhQJeYuu1bg==
X-Received: by 2002:a05:6a00:ccc:b0:634:c780:5bb8 with SMTP id b12-20020a056a000ccc00b00634c7805bb8mr7138912pfv.17.1681431056633;
        Thu, 13 Apr 2023 17:10:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b3-20020aa78703000000b0062dd8809d67sm1841625pfo.141.2023.04.13.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 17:10:56 -0700 (PDT)
Message-ID: <64389a10.a70a0220.7b67f.42af@mx.google.com>
Date:   Thu, 13 Apr 2023 17:10:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230413
X-Kernelci-Report-Type: test
Subject: next/master baseline: 92 runs, 3 regressions (next-20230413)
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

next/master baseline: 92 runs, 3 regressions (next-20230413)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3288-rock2-square | arm   | lab-collabora | clang-13 | cros://chrome...av=
our.config | 1          =

rk3288-rock2-square | arm   | lab-collabora | clang-13 | cros://chrome...av=
our.config | 1          =

rk3399-gru-kevin    | arm64 | lab-collabora | clang-13 | cros://chrome...4-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230413/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230413
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e3342532ecd39bbd9c2ab5b9001cec1589bc37e9 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3288-rock2-square | arm   | lab-collabora | clang-13 | cros://chrome...av=
our.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6438657f21c572a9882e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230413/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230413/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6438657f21c572a9882e8=
611
        failing since 2 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3288-rock2-square | arm   | lab-collabora | clang-13 | cros://chrome...av=
our.config | 1          =


  Details:     https://kernelci.org/test/plan/id/643864170b445188172e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230413/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230413/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643864170b445188172e8=
628
        failing since 2 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3399-gru-kevin    | arm64 | lab-collabora | clang-13 | cros://chrome...4-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643864c6d8abc05f5a2e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230413/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230413/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643864c6d8abc05f5a2e8=
5fa
        failing since 2 days (last pass: next-20230406, first fail: next-20=
230411) =

 =20
