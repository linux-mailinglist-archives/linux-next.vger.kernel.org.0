Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3A4FBDFB
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 03:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfKNCop (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Nov 2019 21:44:45 -0500
Received: from mail-wm1-f45.google.com ([209.85.128.45]:52279 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfKNCop (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Nov 2019 21:44:45 -0500
Received: by mail-wm1-f45.google.com with SMTP id l1so4060561wme.2
        for <linux-next@vger.kernel.org>; Wed, 13 Nov 2019 18:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cVM2J8YhTDi945e51vNhb2fbCbyKffq/dOsPFuvKaOs=;
        b=EpCbO0W6Gj0Ctp9THTIJd0JEepQS7204fHOsBTiN/UVYHSu5NL7wTcKCnO7xmv24HR
         RZZc2k+xm7ZKEhKAYaa+UTSc38ZMX7/XpewNme4nww4/0h/399upf62WXcPYYr1iGD0v
         KQKfJotBrIXqGY40Qsrf4vJ9iflRGOhJD6igUrOGdAYNKeLUB36AczAsOyyiUz29NRLZ
         +8s6sRE8f42bdITvn1ykX26K26FIFnLCSDDBZoDwBRiqm2HEQUBLY380Dhl8aMhOKktV
         vmAXieBBros3vcvZYq+eCa7IgmuElxoXLIBsIldgNDgCrpvrXXUGd6q001bmE5wWJQOY
         gdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cVM2J8YhTDi945e51vNhb2fbCbyKffq/dOsPFuvKaOs=;
        b=FlTY9mH8uZk15JxAY2i0XO4uv49PC9DpHh9GZFaHvieDj9l/T1V3/QrpF58ucRVRb+
         8EFNotPHv3Txi2FCuuAKvVTZCL5hJXiD7pr/eJQ9s1vtr0WwwVOdT98T1cd8kLKSO9cz
         +kT81rNk9VEnz2Dz6os8NBNae54Oh0qSX0qnRy5dkcN3N370ID4s/BgDGcu2rPLHEW67
         VXfHAHgWYLXeUlZQG4DaK/kJ/J/EE3la8PM26a1RzfLwE3OAZ1RPBOTKe+lmh27ZcHAQ
         WXLkMDN8IYslzrmaiZOOQjUiDQShKiJHrnalOIqlDHVtjQIFHkQRQKhN8g2g7rFIYYLP
         1zqQ==
X-Gm-Message-State: APjAAAUJ/Z04RKYeYw8AVnnrEKM5wyOd9WEg/SOUpSVBJA8nykRgaRS5
        PdhvgntNrB+GniI+E32ICTIvdkV/BoO/tg==
X-Google-Smtp-Source: APXvYqyTVE8QEPNVHegqpmeLVQwAt3jRWweyTAid7VMXkJc45lD8DRjykk4IFK84tW71U4UqFXxqzA==
X-Received: by 2002:a1c:3c42:: with SMTP id j63mr6057347wma.90.1573699481637;
        Wed, 13 Nov 2019 18:44:41 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y15sm5091601wrh.94.2019.11.13.18.44.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 18:44:41 -0800 (PST)
Message-ID: <5dccbf99.1c69fb81.530e.8760@mx.google.com>
Date:   Wed, 13 Nov 2019 18:44:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc7-190-g1b2a36d66d87
Subject: next/pending-fixes boot: 239 boots: 2 failed,
 225 passed with 11 offline, 1 untried/unknown (v5.4-rc7-190-g1b2a36d66d87)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 239 boots: 2 failed, 225 passed with 11 offline, 1=
 untried/unknown (v5.4-rc7-190-g1b2a36d66d87)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc7-190-g1b2a36d66d87/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc7-190-g1b2a36d66d87/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc7-190-g1b2a36d66d87
Git Commit: 1b2a36d66d873784d653575f687f604fb6c6bc96
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 25 SoC families, 27 builds out of 215

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab
            sun50i-a64-pine64-plus: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            sun50i-a64-pine64-plus: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
