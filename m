Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A881A2307
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 20:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfH2SLZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 14:11:25 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:53541 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfH2SLY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 14:11:24 -0400
Received: by mail-wm1-f49.google.com with SMTP id 10so4668254wmp.3
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2019 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1uuGz634z7aLday1Fjqc4bZaYjGfQIA8QMX9pfrMg6s=;
        b=SrLFJums1Sp0/UN87yraP1MlhAEQq33//vGMwETGyCMMeURwH40xdKef+tQMUqm6kW
         dMRxPJqSYf+/dzry2ewF7gWdCAHhwbcNXCMZEunR7P3Des7XG/++B5fpXZ/S/C1BYRAv
         GQs2xSvcfBPez38wCfsht80ebZ2w5wZF7ANBcwv9ELgJCUUy2DjyrgCqg9aNVvTRRXb/
         flkamk4Xl8j/O82BtcohP+9U0Xc2Gzp6Ya8JPWEAPmpfVcWSuOXXsra5IZcegBmtb/xE
         X88F0m0f/1QiAZtpq00Cm8OXC2ccHBrh/2IATTwPRmBtAs8FZofgFfx5PpqTj1Ukf+Uc
         gi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1uuGz634z7aLday1Fjqc4bZaYjGfQIA8QMX9pfrMg6s=;
        b=ZJj0S03RGeY2qfqXtn3l1kGi6NMD1eLsBLJF2IOpoXHVSLIMqxrxXVJULn6VFrHUK5
         fzs5ZFATN3kKzhhRYi9+kLiCNbEoIaYa1oy+gwtlnKCDy30HqM1g2Xxn17Ar+in50zav
         N0mwh6xK8MNB7KrEDqUwEQ61D526DCZivVwnWrl28hxKcIyX+SZ4PbTM4f5b2LDyikgk
         ezDmaTVZIPdnbhp62EpOgtA8jNQYr7QsPoiRC8l0rUyjuLowwaay8inwwIUxKWlEiKqm
         PGxX4vXUGra8taqv4PBcv8RKQs5bBg2mlf7XNStQ6HlSl2KzDC3+flFiomNdioAn5Hmi
         wodg==
X-Gm-Message-State: APjAAAWJ2H6kh0/RQTjBajDwgSanCZhklFaDdXo/w2Q35/5Dy/fD9eTS
        M9suAqXkIxbKkeA5WzX+kb4PLxuKuh5ntw==
X-Google-Smtp-Source: APXvYqwEGQNkiXmZ2rlnW5m80lz9jRz1uvrxQDgtE1Jlt8OjoGGrxIPXQGFqWxrJV+Bu4r0Zf8UniQ==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr13523495wmj.58.1567102282919;
        Thu, 29 Aug 2019 11:11:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u186sm7025684wmu.26.2019.08.29.11.11.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 11:11:22 -0700 (PDT)
Message-ID: <5d68154a.1c69fb81.51825.1dc3@mx.google.com>
Date:   Thu, 29 Aug 2019 11:11:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc6-305-gae3f6f95df2d
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 215 boots: 5 failed,
 197 passed with 13 offline (v5.3-rc6-305-gae3f6f95df2d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 215 boots: 5 failed, 197 passed with 13 offline (v=
5.3-rc6-305-gae3f6f95df2d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc6-305-gae3f6f95df2d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc6-305-gae3f6f95df2d/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc6-305-gae3f6f95df2d
Git Commit: ae3f6f95df2d9d2afb091c29ec647962e3218e8d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 82 unique boards, 26 SoC families, 20 builds out of 222

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: failing since 1 day (last pass: v5.3-rc5-221-g5=
995e3fbeb96 - first fail: v5.3-rc6-214-g30064e30ccb4)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: failing since 1 day (last pass: v5.3-rc6-214-g3=
0064e30ccb4 - first fail: v5.3-rc6-266-gebd24bbbf581)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
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
            sun7i-a20-bananapi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

---
For more info write to <info@kernelci.org>
