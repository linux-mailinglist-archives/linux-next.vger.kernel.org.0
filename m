Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C34E478D2D2
	for <lists+linux-next@lfdr.de>; Wed, 30 Aug 2023 06:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235808AbjH3Ek4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Aug 2023 00:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242025AbjH3Ekr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Aug 2023 00:40:47 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536FD1B3
        for <linux-next@vger.kernel.org>; Tue, 29 Aug 2023 21:40:45 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-56d8bc0d909so3127686eaf.3
        for <linux-next@vger.kernel.org>; Tue, 29 Aug 2023 21:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693370444; x=1693975244; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v7pAQSzAsK/TfX0p8wwWrHa8AjgOZZea8qrnOc6FEuQ=;
        b=kOpd4EcS6BDhezdeux0TJ4ebSRYEp/Pa2mP9zBPatkNlcYJJ5usjF9ZHtR8Vyr1FPv
         KmVPeMYXxduR31AR0WlMgmJMS5hEzqvC2oMmUMVuwaiIXcRuDdzJQhLWmBV8OmtYurmS
         kpnzsGgc+4K0rsOCZ/dFbtQ3hdGtxuwRX2gmYkDBoDyxaRA4O5j0HTobsshgLfgkwwea
         0nDzGo4iiCoAJHkQnYT+fGwOU/jBbCL1/xh3PRKBX22xrQ+sY/VWxC64od4i4qVR9NVY
         hbq20smBFA6l5W7RV/q8H9xS6civwAWAu9FoHQ/r5W9Xyn0wh9ada8zqqY8lZ94PW3yE
         p5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693370444; x=1693975244;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7pAQSzAsK/TfX0p8wwWrHa8AjgOZZea8qrnOc6FEuQ=;
        b=RK8RpOItrPbWmExnu2MGjY3j5A9OR898m6TLEIMQODWzSzKP1zJV8oczkcRxz+q/wF
         pxDFJu7Q84ometG/kAQyFRzOrlfRE2q+NlS+N7fRG3MhuBuOkUvgi7G6t5c8yD2PiZIu
         luzpkdSuV/ygNHygAFkklQ+UTCDBXmi4GSZ947+5c6PYfO+P5iYJ+fQb7EmlCCkTT7Zi
         rDRzIjvAx2DQgrXNoJsbdyhCfhxdmLp3jDv7yaqGXZlFXUcVTWFtxA23VcFL2HBiZVrn
         fd7qKxdhOi0615GHsbUtjwFDeZA92gO+2WtiE87jXFx06SK1yRbrpinec2JpFleKw0ub
         Cl7w==
X-Gm-Message-State: AOJu0YyQHU+HE8OZenqFg/PGiTkKnCwzq+XthC370qkSP5ajmcgMMy+F
        4hI+Z2zTk8vjFklKwOxwmGMyUfQm48t5KfJdAtw=
X-Google-Smtp-Source: AGHT+IEfc+IrXut6QHuVdMwQAUWLpzpeVKfQKaqNuRhUIyTTwm26UPYcPZYxctjcdVnECrr546oOYw==
X-Received: by 2002:a05:6358:988d:b0:13c:ee28:2323 with SMTP id q13-20020a056358988d00b0013cee282323mr1116132rwa.16.1693370444250;
        Tue, 29 Aug 2023 21:40:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a19-20020a62e213000000b00686bef984e2sm9295128pfi.80.2023.08.29.21.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 21:40:43 -0700 (PDT)
Message-ID: <64eec84b.620a0220.a3db5.fe96@mx.google.com>
Date:   Tue, 29 Aug 2023 21:40:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-5353-gb22935905f9c
Subject: next/pending-fixes baseline: 61 runs,
 1 regressions (v6.5-5353-gb22935905f9c)
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

next/pending-fixes baseline: 61 runs, 1 regressions (v6.5-5353-gb22935905f9=
c)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig | reg=
ressions
------------------------+-------+--------------+----------+-----------+----=
--------
k3-j721e-beagleboneai64 | arm64 | lab-baylibre | gcc-10   | defconfig | 1  =
        =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-5353-gb22935905f9c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-5353-gb22935905f9c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b22935905f9c5830bfd1c66ad3638ffdf6f80da7 =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig | reg=
ressions
------------------------+-------+--------------+----------+-----------+----=
--------
k3-j721e-beagleboneai64 | arm64 | lab-baylibre | gcc-10   | defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/64ee97c5e3072ce889286d8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-5353-g=
b22935905f9c/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beaglebo=
neai64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-5353-g=
b22935905f9c/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beaglebo=
neai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ee97c5e3072ce889286=
d8f
        new failure (last pass: v6.5-1588-g1cf6f50b5d09) =

 =20
