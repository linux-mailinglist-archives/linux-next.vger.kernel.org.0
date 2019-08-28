Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02AB9F89E
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 05:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfH1DLg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Aug 2019 23:11:36 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34237 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfH1DLf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Aug 2019 23:11:35 -0400
Received: by mail-wm1-f68.google.com with SMTP id e8so3768946wme.1
        for <linux-next@vger.kernel.org>; Tue, 27 Aug 2019 20:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JB+XQgxOE3MvcPqs1GzA3ny5mzF1h0aykPZ6n2RFNxQ=;
        b=fHYT1FP6/tBetssse5NszEGoC9DzJ6MIcHOL1Gh4NuL1mxpA8QzCQjy3uRXdfZNiWK
         Z2metzi+iBig77RA5Z7wF+/6GsTC+Ona/0BPoPHOZ+Faqq9Icvpx+U2Abpr40LwElExC
         Fauofoh+BSHB5TkM7nZoMeNHue0qHa1YxZjda8px3lUkwxUJ4TH8sZxB2Z75iwVuHXXq
         O7P906I077CvglQpkZLiHO2wkYFM3kgB7P6oHdJuHBqp5hGBhrM38b/F58nlt0dmnCfQ
         +yHUggRIjxp99/jkdFTNsJfTr6zTg3s5KI816WSFPR3R52p7yGk+pHuswVrAJivb83W5
         OQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JB+XQgxOE3MvcPqs1GzA3ny5mzF1h0aykPZ6n2RFNxQ=;
        b=cTRDnwOsbCZq0dEHbeE9dXqTjqWwLIkn9N7ie7dAx6bfS/09awx8cjbT8iq3mLinve
         3bXWJD36RXiOg6fqLI+/UsIdH6166QumX5opJjFU/3RH0oS5YOl+efbcW2DQUDL2ff5Q
         gjMAMuUq9SrRHjpTDSb+yV/8QFefRuQV4jpHYBwTosUnS3K4rkVD4OHerxsh5tCeHmu3
         DOayoyAcoYq1CGBngYuh/oi0cnZhEgRVcSFyYa4ANFHKWCnLdaCcp/4+y3AfQJKet7JW
         8LzZeK/3R7VInAQMTf82MR8i8iOrkHLLNNiBV6bXvGGmOa+Qq/S/5oH5mz8wUgP/8wEI
         WiIw==
X-Gm-Message-State: APjAAAXxMrIeEM1JZKm+/IiY6n77zmcVYOVteJF52kNLNNwbDrakV3zN
        zFyUB0nZ0vFki7Fy2XstrOmAtU0z4VCQKw==
X-Google-Smtp-Source: APXvYqwcqUkKau1am/vK1jk2vPO0R3bGngNIvJZRabBKWWdVkIC5xir04n+yxX++swwhDSPq6Djrlw==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr1823930wmj.142.1566961893216;
        Tue, 27 Aug 2019 20:11:33 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g14sm1628865wrb.38.2019.08.27.20.11.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 20:11:32 -0700 (PDT)
Message-ID: <5d65f0e4.1c69fb81.a25b3.8520@mx.google.com>
Date:   Tue, 27 Aug 2019 20:11:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc6-214-g30064e30ccb4
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 241 boots: 7 failed,
 220 passed with 12 offline, 2 untried/unknown (v5.3-rc6-214-g30064e30ccb4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 241 boots: 7 failed, 220 passed with 12 offline, 2=
 untried/unknown (v5.3-rc6-214-g30064e30ccb4)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc6-214-g30064e30ccb4/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc6-214-g30064e30ccb4/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc6-214-g30064e30ccb4
Git Commit: 30064e30ccb43d9d3c0ff9634934b354ef46aa12
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 26 SoC families, 20 builds out of 222

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc5-221-g5995e3fbe=
b96)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.3-rc5-377-g88ec80624=
7b2)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.3-rc5-377-g88ec80624=
7b2)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc5-221-g5995e3fbe=
b96)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

---
For more info write to <info@kernelci.org>
