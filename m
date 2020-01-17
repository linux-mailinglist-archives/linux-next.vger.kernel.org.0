Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22BD51408E5
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 12:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgAQL2r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jan 2020 06:28:47 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:41305 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgAQL2r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jan 2020 06:28:47 -0500
Received: by mail-wr1-f54.google.com with SMTP id c9so22351725wrw.8
        for <linux-next@vger.kernel.org>; Fri, 17 Jan 2020 03:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2KTu0wWc9xYIQvdiyMlLZHndNpfIz7EwdEGfioXgST0=;
        b=J036DoAugmLrOcZxlNyRETGhU3EJ3nzs2eB6ttV56K8cd2LL4fEstIqwMCU+YjxsHB
         D4LVursypyZqpa2298Na8kObE3x0RlGT/k9m7VwXgTFop/EvUQymO7oBmnGIY2ff15w6
         tKUhUeJinuafQedzX2Jte3PIH97Pcn9vDTQxTKu0hdOZi2906YkotmYEiqBQB0W2Wo72
         YvFSnmmX4MCjexMB4WfFf/AC20ADUOLhjIhw8OD+PKyBOF2eFksKxo/lL2ioHC1nNtkA
         19ekZ5v96INnAqO+yg7O67JM9Yl02AIFb7NSsq0FPr3LwqL9qH3crte0p6vWBqr6i7Dd
         mC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2KTu0wWc9xYIQvdiyMlLZHndNpfIz7EwdEGfioXgST0=;
        b=BCqitCiOLNHJ/WiEkYLezyVUklNyNGiHZsDwCrbVmmeZPwYjuO4xNXULaObxlYYnBM
         Ku2junNIcAXxrkwQdqym9SeYK8+okj9aCexFGxxi8CyNydzFemiCAM8ySAdsjts8BR9p
         0+E2tpYdcCPF7tN0mkJjDLjK1o4jl2jLUBkIec8xVAQhm8kklIKDZ3blQv3R++Nvg+7C
         OQzhrjkao7CiZPraJt4EV8AwCeiKJbfitgk4avDL6oWLtG4pqQVv+A4RUs1lC9Z7rshA
         JHHKleEJqnXpHoS6cd9FkFpf79bSHunRAlsamrIG2tr7rxFPeWbiGDykRZIz6vbRtWG7
         aS3Q==
X-Gm-Message-State: APjAAAXfiRU5esrVmR9OwH+xQI9639t9DlAQcRc9YucHlqn/eH/MXRQD
        FWz+WiQ2UM0k7OQjI+4sv2Awoyc3M75ORg==
X-Google-Smtp-Source: APXvYqxzHZsiXqvZx9ZpNTYeXPGeT2ANfhXDXQBwjTiNnEonZPGzLX26bdVqpmlDi9JOLUqINPXBTA==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr2532252wrn.404.1579260524893;
        Fri, 17 Jan 2020 03:28:44 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d8sm34296315wre.13.2020.01.17.03.28.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 03:28:44 -0800 (PST)
Message-ID: <5e219a6c.1c69fb81.97cd6.cb85@mx.google.com>
Date:   Fri, 17 Jan 2020 03:28:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200117
Subject: next/master boot: 260 boots: 11 failed, 240 passed with 5 offline,
 4 untried/unknown (next-20200117)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 260 boots: 11 failed, 240 passed with 5 offline, 4 untrie=
d/unknown (next-20200117)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200117/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200117/

Tree: next
Branch: master
Git Describe: next-20200117
Git Commit: de970dffa7d19eae1d703c3534825308ef8d5dec
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 24 SoC families, 30 builds out of 215

Boot Regressions Detected:

arm:

    multi_v5_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: failing since 1 day (last pass: next-20200114 -=
 first fail: next-20200115)

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20200116)

arm64:

    defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200116)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200116)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200116)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            msm8998-mtp: 1 failed lab

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            meson8b-odroidc1: 2 failed labs
            sun4i-a10-cubieboard: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

---
For more info write to <info@kernelci.org>
