Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837051CB890
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 21:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgEHTr0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 15:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726767AbgEHTr0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 15:47:26 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA7CC061A0C
        for <linux-next@vger.kernel.org>; Fri,  8 May 2020 12:47:26 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u22so1170907plq.12
        for <linux-next@vger.kernel.org>; Fri, 08 May 2020 12:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HER9rFYP/lb7WS7cFsDZUNRStir/UFMLRKDPxJo9grU=;
        b=AT03KQjee54Pc0niT2kLquI4Y2VsVPzNOcES10c2tRosbSJvFaIWMuxcF1n60zOTn0
         NsTjlKvaVt0EmLwRNG1mOqeeEZDq93H5+IPGmTH2aUK61i7mrkycB5qDyapXlW48xf4E
         7zUJTCHQWf2f2DUqAEBwoRexKfTbtQZU8TXFylNP0p41VyP53bkq04f4COSFqtmQBCaH
         1ZTqe3wKnxpJvU7k+jSA/k5QqZ7d0pmbg8VosbKoY0HTIk/UZtHz1xW3dPOeH1d3xfrv
         jjlk/fC1VmRoxjRKi9hTep7g/HvGWXPrHV6QNn9G9/pRrPOkqAZeMp384PICTDO+mKzo
         v6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HER9rFYP/lb7WS7cFsDZUNRStir/UFMLRKDPxJo9grU=;
        b=FPqHF90U6vY7U5sXS9xkyR10j77r3tcFdCXM8oL1p6apVXFm5tknLsG5ifp661glr5
         XXsLzlBO6+w5kDnmFGYfhGFvBEVDV5m2P7uyA/eUeE1iAqR7kMkQ1mMFzQStoPBT5N0Y
         SDMFw5ETW4kacdo2TwR0xV7DqtqnXAcC0UhIYm2CFYqnBmkUmmHW03OlEAeZT26b6tX1
         27fTqY7xsBIvltubS8zeP4QRzNIMCVUNMDFTAeky33O4TpCuHVzslxYJHoO+NQ/crI1C
         +5jKiA1ve2GpGPiD7i9sUXQKYiUwYP7cJwWcZW74eZxXPCicdcspMTFtsgBoycvpAgk2
         LvhQ==
X-Gm-Message-State: AGi0PuY/+TH0e9/EbZ7vUWWGbx2n6Ct48hmFNZWHF1BJRi7AvLMkarbO
        7JnV0EDrzL3O+xMu/LgoqD4MSXZ9kyY=
X-Google-Smtp-Source: APiQypIP7q5Dy78hgO8aGEyDAcH/mQE5oTuow/3n/04ggl5nAOSAxbAWdh7fUbauXbh4Pi3SS1yaaA==
X-Received: by 2002:a17:90a:3287:: with SMTP id l7mr7658984pjb.126.1588967245348;
        Fri, 08 May 2020 12:47:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w186sm2726502pff.83.2020.05.08.12.47.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 12:47:24 -0700 (PDT)
Message-ID: <5eb5b74c.1c69fb81.6bd87.a423@mx.google.com>
Date:   Fri, 08 May 2020 12:47:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200508
X-Kernelci-Report-Type: boot
Subject: next/master boot: 231 boots: 10 failed, 209 passed with 6 offline,
 6 untried/unknown (next-20200508)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 231 boots: 10 failed, 209 passed with 6 offline, 6 untrie=
d/unknown (next-20200508)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200508/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200508/

Tree: next
Branch: master
Git Describe: next-20200508
Git Commit: 30e2206e11ce27ae910cc0dab21472429e400a87
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 23 SoC families, 29 builds out of 231

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 1 day (last pass: next-20200505 =
- first fail: next-20200507)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 1 day (last pass: next-20200505 =
- first fail: next-20200507)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun7i-a20-cubieboard2:
              lab-clabbe: new failure (last pass: next-20200507)
          tegra124-jetson-tk1:
              lab-collabora: failing since 1 day (last pass: next-20200505 =
- first fail: next-20200507)

    tegra_defconfig:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 1 day (last pass: next-20200505 =
- first fail: next-20200507)
          tegra30-beaver:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
200505 - first fail: next-20200507)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200505)

arm64:

    defconfig:
        clang-9:
          apq8016-sbc:
              lab-bjorn: failing since 1 day (last pass: next-20200505 - fi=
rst fail: next-20200507)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 42 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

arm:
    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab
            tegra30-beaver: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab
            tegra30-beaver: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
