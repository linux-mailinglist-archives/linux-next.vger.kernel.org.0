Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D9F61363C
	for <lists+linux-next@lfdr.de>; Mon, 31 Oct 2022 13:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbiJaM0Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Oct 2022 08:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiJaM0X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Oct 2022 08:26:23 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01795EF
        for <linux-next@vger.kernel.org>; Mon, 31 Oct 2022 05:26:22 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so5769017pjk.1
        for <linux-next@vger.kernel.org>; Mon, 31 Oct 2022 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DBziwjD6VOr3EGXyX1bjYrdrCAM6584SHszB4FeJSak=;
        b=JwiQNgWD58FPmPWU4+SL+0NyLcb1gDWnV2eblVZe38dV1733rXhDBHTltzbzbNi+cX
         SgBMNeH3y8n9bu6opBQskB4KS1LQB7tejodO2f2DI5IuPUGCht4TRHjWgSu4TqJi1BNW
         WvumMA7XFTrTL3ikcQstPw1enAJYwv9Xv1BXy0gFFQQkHPzuE3hWG/HB7RavUg0tqfHg
         gnQLp9igR/iqCMTQUHqo/WkwQ2VF5n3HFABBiY/sFoQtkWrZWOqqXXy8FINmi3eb9scZ
         OI01jhD2f4LTq8XgAWgTQgoD/R2A8VBmIQ61Fm8Dmy4nzGzecK12q66xFyAtIuN2yQBn
         RPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBziwjD6VOr3EGXyX1bjYrdrCAM6584SHszB4FeJSak=;
        b=E4Ku3pcqFEiuKb8cog20UqzU4Y10Cb+eu6z0UzF+dJxdvG8wI081mglYc9fa55oea7
         u4utRkUgpb55KGt+B57l3HjizTzuPy98PMGZETO5BsSKaTqshmJ1g/M5PPssObQK9Uz+
         1FJRHml5AnXak8mqVYCtoyN+hleqT9TbjAa+PXx7XDK2mefdjYhNvnFqynbLObUf7mYj
         6Ms+VX8bPG4iuVD2cZhv77/RTB0aICfJMkXSaG/HUWpL4UJ+7WP3RxofUM7/e68PaVhx
         SdkZr7mYz4VJ239dLw4oAAQiU8/qn3eGi2azU/d40nI0kZd1yDu+DmMaY15R/kf9iiOl
         A6tA==
X-Gm-Message-State: ACrzQf1jDVzOjU0kuT3KwpIsd9PZXhCTT5uE4hdSX3NPUFlOMvfqVGwE
        ZXd+/K0Lux7CYp/QDuYKxlCkPy3Vae7ysyHP
X-Google-Smtp-Source: AMsMyM7UuF1/dv+ncYb7TByxOo8XVM+PmSEqM671gggTfo/1i79V/G2uN7WR824A7KOyB16xkmZgGA==
X-Received: by 2002:a17:902:cec3:b0:187:12cc:d699 with SMTP id d3-20020a170902cec300b0018712ccd699mr9125829plg.83.1667219178881;
        Mon, 31 Oct 2022 05:26:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l16-20020a17090a071000b00213d08fa459sm2673276pjl.17.2022.10.31.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 05:26:18 -0700 (PDT)
Message-ID: <635fbeea.170a0220.9bf15.44fb@mx.google.com>
Date:   Mon, 31 Oct 2022 05:26:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20221031
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 40 runs, 2 regressions (next-20221031)
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

next/master baseline: 40 runs, 2 regressions (next-20221031)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
221031/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20221031
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6fbda10ec6f8d70d0f4446f861f7db726c2f2e7c =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/635f8dd54bee418642e7db74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221031/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221031/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635f8dd54bee418642e7d=
b75
        failing since 171 days (last pass: next-20220506, first fail: next-=
20220512) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/635f8cda737f2368bbe7db66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221031/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221031/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635f8cda737f2368bbe7d=
b67
        new failure (last pass: next-20221028) =

 =20
