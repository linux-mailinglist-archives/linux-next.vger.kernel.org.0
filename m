Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B671E15E34D
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2020 17:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387964AbgBNQ3H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Feb 2020 11:29:07 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44450 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387792AbgBNQ1Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Feb 2020 11:27:24 -0500
Received: by mail-wr1-f67.google.com with SMTP id m16so11546493wrx.11
        for <linux-next@vger.kernel.org>; Fri, 14 Feb 2020 08:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=f1s4JKkXZPhZL0z0+pYvV90lNbdCF1qoRb7VIYIGQLw=;
        b=N5SHU5fA7G+oTyVLo6w6JDCB9BqOuZubf3A5KwVEs3NksADxDiu3ximrOEFQ9r/I6l
         5LXFA8eyZjuiiVUvbmrtEPIzmmKxRQ9UPFxrRNBc5kH/oDmCDAfnPWRJGuM2Rm5dfLps
         LaHKZjQCvWR7G+BVwRQx4dlalJTj+GDemSeXGOMXzOen2PadXSc49Q9J7DuQIGLRICvV
         JoasF38WNnipWO8TWfKD9fOyxAktyly/mWMY2PaqGuPrZhghqXfnvjL4NOQwn0clmwyt
         Thonu6z1HHbNrFDbQZ94pDmjSmIXQBZy69BTooNjy3T7Wacs1GStVz6juQY+z1mnbi+C
         /5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=f1s4JKkXZPhZL0z0+pYvV90lNbdCF1qoRb7VIYIGQLw=;
        b=aPAJJXk9jZ8YhRCK164pcLkCiMIBHjQpuCRKUGG5SGg26zkM2OQ/m2OxJHcKDr1rW0
         QCKLzkFUIEO6lJLwsLVN2NRJDc/ct0iYo3AZr43xxLvEOAUjO/nQ1fLJhUbEssNgDTaJ
         tg8tZGwSNTWq0fz4MVKmuBV7XPljGpSCG/mjJ1b1VIb5iF6cR5Gs3tOHUn7DnT7vx0bm
         YorEDaRYV8NG55G/sBokaiUkXGXzXGEqZWD1Qdl1+DXQcS1tA5m++MilmfyIaeCbLNkH
         uxjOc4MNnIn9emhPARHTWphwFkg6LdjkwcGSvx81DHrhXUDjL4SinVYDBPK/1QCkmB4K
         MwwA==
X-Gm-Message-State: APjAAAXoMaB8xLu9g6fbCm0CYUhUCJ+p6/FC6or8Pw+QzrSc0iyIbbdv
        W+Nhg/F1b7l6LgM72e0vb6VBDn7+2Kh9Tw==
X-Google-Smtp-Source: APXvYqxQ9tV9RoeLCggCbKqHlRq+wemQG27eO2ui3WJagRORm9FH10Q+2xwS8zPQZQYCHMkzF51Y9A==
X-Received: by 2002:a5d:678f:: with SMTP id v15mr4934026wru.27.1581697642490;
        Fri, 14 Feb 2020 08:27:22 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u14sm7540064wrm.51.2020.02.14.08.27.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 08:27:21 -0800 (PST)
Message-ID: <5e46ca69.1c69fb81.988a4.0e0a@mx.google.com>
Date:   Fri, 14 Feb 2020 08:27:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200214
Subject: next/master boot: 93 boots: 15 failed, 75 passed with 2 offline,
 1 untried/unknown (next-20200214)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 93 boots: 15 failed, 75 passed with 2 offline, 1 untried/=
unknown (next-20200214)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200214/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200214/

Tree: next
Branch: master
Git Describe: next-20200214
Git Commit: 9f01828e9e1655836fea88d0c8225d648850b33a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 82 unique boards, 19 SoC families, 19 builds out of 162

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20200213)

arm:

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20200213)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-cubieboard2:
              lab-baylibre: new failure (last pass: next-20200212)
              lab-clabbe: new failure (last pass: next-20200212)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: next-20200212)
          sun8i-a33-olinuxino:
              lab-clabbe: new failure (last pass: next-20200212)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: new failure (last pass: next-20200211)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200212)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20200207)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: new failure (last pass: next-20200212)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200212)
          sun8i-h3-orangepi-pc:
              lab-clabbe: new failure (last pass: next-20200212)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 14 days (last pass: next-20200130 - =
first fail: next-20200131)
          rk3399-gru-kevin:
              lab-collabora: new failure (last pass: next-20200213)
          rk3399-puma-haikou:
              lab-theobroma-systems: new failure (last pass: next-20200213)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

---
For more info write to <info@kernelci.org>
