Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F6C1436EE
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2020 07:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgAUGKx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jan 2020 01:10:53 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:40894 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgAUGKx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jan 2020 01:10:53 -0500
Received: by mail-wm1-f48.google.com with SMTP id t14so1646582wmi.5
        for <linux-next@vger.kernel.org>; Mon, 20 Jan 2020 22:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jt0cvGAYM+c2CPlsIcKySeeIvlkdHZCZlM5YVfxrG2o=;
        b=gl/9vq51Z4ZdWReJQDiN6AV6F9Qd9NP8iBHEvyqLv1GZ8QMpKDcO+xeY5r9+fOAre3
         4LDFRP1ILo6iDxeM60dCI2GZa63vTnigOziZ9W1Fo5Q0IEnxxwJlmGS6AFhi6ns1Y1jI
         UPaQmJcbsP41L5acLD3f6JRopzKL8pRVxpe4DYrW5OKvuiji+gKJF3KnIivVCMM785yi
         y67T0lZ71lAOKoPweJHhezmfGRVTjpRvwYwSbpUa0GCyMz5xiNrrRrdZs12WkwGhtE5a
         L5Z7/NeFGqZfvg/k+nMiCmz0C5fq8GZniKfkt7mLsy7Z7c08trnoUGRKLXyNgCjc53KQ
         6GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jt0cvGAYM+c2CPlsIcKySeeIvlkdHZCZlM5YVfxrG2o=;
        b=m+pS7GnWQWz2QEjLl/vYsUOPIOnILv3VxT7T4k+Zu6pFvyjVZJgCfPSyQ7gfqNQIkq
         rTr1e0QN96/DB2TlPmYFZ4uGUvOPntGMYaQwF+OzwdQ/GXvVFL2vnW3z2ATvQ1cLu0cV
         gaYtqnSOUCn10dBrjhxMOgUuGIOX1qNG/qunQttuht4cTD0jxi45WLZDoXjBlKBdvzGY
         XiW8Olp42aKIMMQPDdow6UD8TjLRcfKfq5+aGoyuFHLf5e4iZQHyrkBDdL4kpcZRmBR5
         dK8JusJ+amaVzr9zHLARnGoBpuZSGQgLe0vDzak0ZYVfHM9XKjZEi8Ig5RAm6anTtn4o
         axyA==
X-Gm-Message-State: APjAAAU2EMpTKFdRenAY1Yu0AMr0vyXgDvat71IdDbh6bZMFZ4vNhcvP
        MI+HLZ2aBVsUgHxYRH/gJC+ofV3mZ0ka4w==
X-Google-Smtp-Source: APXvYqwB78iJMu9Vdx/XgRwPGOZsxFIJ/qzQkLqN8b6wIxGIACSMORlRW7ftyF3rMtPIhrkoFJd3pw==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr2491178wme.82.1579587050953;
        Mon, 20 Jan 2020 22:10:50 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c5sm2413678wmb.9.2020.01.20.22.10.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 22:10:50 -0800 (PST)
Message-ID: <5e2695ea.1c69fb81.628c4.8ee8@mx.google.com>
Date:   Mon, 20 Jan 2020 22:10:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc7-254-gdc352a664198
Subject: next/pending-fixes boot: 248 boots: 8 failed,
 215 passed with 20 offline, 5 untried/unknown (v5.5-rc7-254-gdc352a664198)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 248 boots: 8 failed, 215 passed with 20 offline, 5=
 untried/unknown (v5.5-rc7-254-gdc352a664198)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc7-254-gdc352a664198/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc7-254-gdc352a664198/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc7-254-gdc352a664198
Git Commit: dc352a664198f09253b8bb3d996be327c6fa7bad
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 24 SoC families, 29 builds out of 214

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: v5.5-rc6-592-g5=
87f6a13069e)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: v5.5-rc6-592-g5=
87f6a13069e)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab
            sun4i-a10-cubieboard: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab
            mt7629-rfb: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

---
For more info write to <info@kernelci.org>
