Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAE11B7608
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 14:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgDXMzo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 08:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgDXMzn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Apr 2020 08:55:43 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9BBC09B045
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 05:55:42 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d184so4765509pfd.4
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 05:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RuueEyJZiTlLFxk8m5wRgPvuq9APA9jxiK/hV/va9K4=;
        b=0PePRI0p9owNYkytVZ0MEwHTlgF3UhNMSvFXnCjLQj6q9ljTvr2CnLBa6NLWurnifT
         FKuSkwbkNDi//sJo6WYeqOVicUZDNpAplWi9dITI9fCBforKsbollFjm+nwYLsowR0uu
         HIZzobAlS6CIpLBJgu5yUYJuK2g7fwEhdMdDAcO0ByXeQclE+HInLRJjr6bDJYd6Vai3
         /AX1G2FXmRo5XgSQsMU9umxd5dbeKVLk5IjB10zAjpDd3Yss8IazjQ4xSHkpVRvSA78P
         QfLwmhqgjvRtJXwuCJQy1C9/I0zHg+UtxX7h/cQteGODiUL78lfqkiyoBjYtJ/d9cs3n
         pZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RuueEyJZiTlLFxk8m5wRgPvuq9APA9jxiK/hV/va9K4=;
        b=t5ibY/LwrVmMUjCICKP7eMFwVw4okKi5fkI94nFtqMk/4pAmYTAZv5NF3pJbzcVV55
         JSz6XxVHmsNUFYAXt8nA2HnlcqgG67R8KGnhX2o6xOyhQT4L130yZkPbkCW3NvDwf9eJ
         5AGAgm2WsUeKIColfBCZifqeX7UV2JAQwO538LmYMDkX9AT1UW8a0ondRGshR3jWN2fq
         sUGu4xZapeAXWcgOrSAYuwdmYdnNLn+HTpGbNtPjp4MLpcTuwcf1JMNo5CmP2JcH3rge
         u6SkJzIfyMbaY4PBWCRnzcMC1q+H4LFFnzf3yp/vECudu8136ZhcYELAb0PNHjLxo0F4
         ieUw==
X-Gm-Message-State: AGi0PubPwRwh6aR/8vDunILwZi7Q8jQDpNJW5z9V3A5thV2U33u55c1j
        nubrobqROqLBrl1xeSDTYgrO+e3tjUo=
X-Google-Smtp-Source: APiQypJ/jiaVLacE+n8E0zU6zGGzSHroZkDzF/LiKkoKQyJqPRedkOy7vykQ8U1VskrgTaXqhT5fqQ==
X-Received: by 2002:a62:c1c4:: with SMTP id i187mr9839451pfg.319.1587732938626;
        Fri, 24 Apr 2020 05:55:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y29sm5987512pfq.162.2020.04.24.05.55.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 05:55:37 -0700 (PDT)
Message-ID: <5ea2e1c9.1c69fb81.29ab9.3974@mx.google.com>
Date:   Fri, 24 Apr 2020 05:55:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc2-530-g15caa57c062a
Subject: next/pending-fixes boot: 151 boots: 8 failed,
 136 passed with 4 offline, 3 untried/unknown (v5.7-rc2-530-g15caa57c062a)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 151 boots: 8 failed, 136 passed with 4 offline, 3 =
untried/unknown (v5.7-rc2-530-g15caa57c062a)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc2-530-g15caa57c062a/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc2-530-g15caa57c062a/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc2-530-g15caa57c062a
Git Commit: 15caa57c062a6a1d926d4c4f2f782ab92f7dfcca
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 70 unique boards, 20 SoC families, 28 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc2-434-gdbf9c50e=
fa4d)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 69 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 10 days (last pass: v5.6-3095-g77173=
2386d6d - first fail: v5.6-12726-gcb0447b07277)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-434-gd=
bf9c50efa4d)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-434-gd=
bf9c50efa4d)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-434-gd=
bf9c50efa4d)

i386:

    i386_defconfig+kselftest:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: v5.7-rc2-434-gdbf9c50e=
fa4d)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 13 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

x86_64:

    x86_64_defconfig+kselftest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-rc2-434-gdbf9c50e=
fa4d)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: failing since 2 days (last pass: v5.7-rc1-369-=
gddfbb969755d - first fail: v5.7-rc2-266-g3c7f529d10ff)

Boot Failures Detected:

x86_64:
    x86_64_defconfig:
        gcc-8:
            qemu_x86_64: 1 failed lab

    x86_64_defconfig+kvm_guest:
        gcc-8:
            qemu_x86_64: 1 failed lab

    x86_64_defconfig+kselftest:
        gcc-8:
            qemu_x86_64: 1 failed lab

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

i386:
    i386_defconfig+kselftest:
        gcc-8:
            qemu_i386: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
