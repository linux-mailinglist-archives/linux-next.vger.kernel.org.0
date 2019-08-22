Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8B71998AB
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2019 18:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbfHVQAa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 12:00:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53672 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbfHVQAa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Aug 2019 12:00:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id 10so6159102wmp.3
        for <linux-next@vger.kernel.org>; Thu, 22 Aug 2019 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YzYHEl5eUJJBtSS+Ks5CjwQOPym3H4jpvM+YXHELuxM=;
        b=IOIROkdFJHCtOXD2SETOZNwJRhNL0+F3F+9go6ozoZxUM9fXC1+pZnO6xX8XNnvi5E
         fUGhFTc7PsQyHZe3gD/YHDm5TmnAWsXwLknDHuh33Gbx/41eccgXsr15J4VKdE2+CzQL
         yvTqzMp4vQArG7n017KUYd+0eLk+YlE2xUhcZAlbttxtiD6RHCHKfxpGdqdC0VjaNAvp
         SV5W/0slZ01vHpMyEf+Dsi+H02Vak4VaTTqonpf6WLBaE/KstSJx1mvz4SlAMFqKYSpZ
         iM+GtjOa87M9+vQLtFYifJEEaCh5f6tnVkFv2ggWnPLlzZVBumgxT4qLY6SqmD1kWWVC
         WQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YzYHEl5eUJJBtSS+Ks5CjwQOPym3H4jpvM+YXHELuxM=;
        b=QVCKKOcPCl9tJgs2rUEuKNgPOJRT1Pwr07xzSohpFxLmSVWFzUZDv0AFHv6Rcis2oz
         Gwh9R+VG/zYrcPAso5SSg3qetf90V1P7VNfUH2nrHAdKVkAR6Czz8qr39n0dIq/45DYT
         ofa1iC3rwnch4a5NQBph2VA00t5jjjTG7WHzKb+AYhZ38DzGe425b1OViQHv+MhyQHsx
         eN42eqfGABYNHt1SgrQOEFAzFT8B6Lg/Wqc12vW0BR+HYR+bSEYHhZ5KgasCUpNUTDVQ
         3TCHkXz+uLLPkrB9KzSmMd/p0QmoIhEE20Hspo8ywL2yYFuIcfL7r3M1MHYPlXazMYyl
         Hbrg==
X-Gm-Message-State: APjAAAUA8pywbgxi38jR3w2LXOV6RWJUpxY3XtM9jiGe1EzHkDoDCQ58
        pzqz4t4B7n9Lh2Zd/3BV/T/PIlM/6+OYAw==
X-Google-Smtp-Source: APXvYqzLuB+A/gP7x3GQ8m+jmWwk8e7MjPfaWy9d41W68nZXBopVodM8zK+qLFf1NZNMGHUci6iSdA==
X-Received: by 2002:a1c:411:: with SMTP id 17mr7645418wme.34.1566489628668;
        Thu, 22 Aug 2019 09:00:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 39sm41160wrc.45.2019.08.22.09.00.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 09:00:28 -0700 (PDT)
Message-ID: <5d5ebc1c.1c69fb81.b6100.0305@mx.google.com>
Date:   Thu, 22 Aug 2019 09:00:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc5-318-g5c8c607cce6d
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 228 boots: 8 failed,
 204 passed with 13 offline, 1 untried/unknown,
 2 conflicts (v5.3-rc5-318-g5c8c607cce6d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 228 boots: 8 failed, 204 passed with 13 offline, 1=
 untried/unknown, 2 conflicts (v5.3-rc5-318-g5c8c607cce6d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc5-318-g5c8c607cce6d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc5-318-g5c8c607cce6d/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc5-318-g5c8c607cce6d
Git Commit: 5c8c607cce6dbac1532cee8c265632eb900ea1fa
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 27 SoC families, 22 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            hip07-d05: 1 failed lab
            rk3399-firefly: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun7i-a20-cubieboard2: 1 failed lab

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

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

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    sama5_defconfig:
        at91-sama5d4_xplained:
            lab-baylibre: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
