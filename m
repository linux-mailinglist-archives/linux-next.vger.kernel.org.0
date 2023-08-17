Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7A377F070
	for <lists+linux-next@lfdr.de>; Thu, 17 Aug 2023 08:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346827AbjHQGUz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Aug 2023 02:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348195AbjHQGUh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Aug 2023 02:20:37 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FFB12B
        for <linux-next@vger.kernel.org>; Wed, 16 Aug 2023 23:20:36 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso46846235ad.1
        for <linux-next@vger.kernel.org>; Wed, 16 Aug 2023 23:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692253236; x=1692858036;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1QZyQkAIJBk+8V8o9ZC3rqXNckaXmnGY2OOYOTrv1U8=;
        b=qPNb8HNFdm17xt7N5ahPdz12mD5/9CIxElRiO4jDdaGlw8Z7ZXP0QbrXcPVQe5JEPM
         RNipQ46s+R6VPLJyn2P9ImctS8+QDZ/SUArJsWYKeRtia3WseYR10s/2HCPTly6rBJyi
         ISLSpqMWw1YsUavXPFL2P4KJRGquHXSHHA+fkrHn1zZvXBLO7jKmIXnBbXElZj0RB2D0
         A+mTy8KlRN79n8PQOAyzJjejFNm9lcr/Cmjx9X3dvi17jFY5Dly5dADpH/7aumCp0J98
         lmhvqJFr/Q2rwYiwdnLZZWYUf0h5Y1GSBkk6cm3WklJWKOTqV74PMbGFBSnaP1Y6tSga
         J05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692253236; x=1692858036;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QZyQkAIJBk+8V8o9ZC3rqXNckaXmnGY2OOYOTrv1U8=;
        b=FdBUyfWI1Sa+3zKfQIzFbHbxxUtcf5LDZz9alAuOZPRuqCBL4G4wG66nbrsjwl1ZrQ
         95c0sPorF0tUyTo/Zset8r0kI2d4s2qTO/+Zhx/m7QlXqdUljEHUuew7eCj9yfEO3DD4
         j7se6SJQml0BF0JICMXQxo4be6UCSDUAU+I9qHWZD/7qPrHEYotV2JdrV0BgvF1e011H
         AxLUUBsnXYFqKDmZUPnbl3K7xaFOE/WBsJfjQGCSDCn6hB9APkZK6GTLMnjyVrpYoJRX
         yxA4udekqtQptHM3d+4yEBwTMXqQSpuLgM8wMD9hv6V+UzHpFJCyU1qnrFIJ+JxUBAUb
         vNpQ==
X-Gm-Message-State: AOJu0YxtLfyioZOIgxRdK5ZqN7gk7fZpzJ/39ofE8E9G65/MrNHMBo4Z
        81boGr7/XQ+JRxcpcYRLSw7bUicF+uKsUXJaL9iLIw==
X-Google-Smtp-Source: AGHT+IF/jb9SRBdLLtaa3/GgirfZPLwPN/Ns5WWC2WZFEFIwS2EF17B3u0Zm0IzI1ogjGIYfIn+c/Q==
X-Received: by 2002:a17:903:11c9:b0:1b6:4bbd:c3a7 with SMTP id q9-20020a17090311c900b001b64bbdc3a7mr4333095plh.66.1692253235771;
        Wed, 16 Aug 2023 23:20:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l7-20020a170902f68700b001b7f40a8959sm14242315plg.76.2023.08.16.23.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 23:20:35 -0700 (PDT)
Message-ID: <64ddbc33.170a0220.8ca6a.ba71@mx.google.com>
Date:   Wed, 16 Aug 2023 23:20:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-rc6-205-g42fecbf39285
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 53 runs,
 1 regressions (v6.5-rc6-205-g42fecbf39285)
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

next/pending-fixes baseline: 53 runs, 1 regressions (v6.5-rc6-205-g42fecbf3=
9285)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc6-205-g42fecbf39285/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc6-205-g42fecbf39285
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      42fecbf392850e73b8f9f2a11722052f81d82afe =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/64dd8c712952a989db35b1dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc6-20=
5-g42fecbf39285/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc6-20=
5-g42fecbf39285/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64dd8c712952a989db35b=
1de
        new failure (last pass: v6.5-rc6-182-g1f1203b93bb4) =

 =20
