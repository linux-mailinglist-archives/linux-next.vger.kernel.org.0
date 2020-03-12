Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37269182A65
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 09:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388081AbgCLIDl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 04:03:41 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37986 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388171AbgCLIDl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2020 04:03:41 -0400
Received: by mail-pj1-f67.google.com with SMTP id m15so1626446pje.3
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2020 01:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=M2tSqdpfrsDuf3StpICf3QcTzKRSkhjObL2IQ92Qre4=;
        b=oFOT6kpHxlCh2Dhn+wAn80eHlGK9ifUqPTtZ4m5HUOWIS+S9YuJNo0qGsXYK7rOGfc
         Dh1G+zFoCRWhh6Jyu7fDiVtfVZ1ok95NczaC3nLDM+1z8aq2YQy97TNliEaiYC6GKMVg
         PjLglnW18N9SDf610T8bJ8TAr3AvyIC4VoUdSdK/Z7oZaEh3kkOT5HfjPYnv8WnxRJpl
         f+7qcaRj6/vYMpC3ZIV+VTphe92EEXOpotyLxxsTZ7z0yw8wtM8rKf4/mslmou6QLxn1
         z+xI05jMfPXkYvmGb4h8pRYNgaUicSYixEJkCjvmQGFsDxM2RnFs/x+I7qt+Dd5z2bYz
         ngYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=M2tSqdpfrsDuf3StpICf3QcTzKRSkhjObL2IQ92Qre4=;
        b=sMK5i7sqhkYUInEOm4diK6zMpuU+yd1Rhs4RAuWTQxq9Q8BQ8L1G74alilfXecn96r
         xJ/J5N0k0xAfJJTahjr4DEXhVII/1LJTAbq7OfCXc3gvSxZ4e1lcBlPdqp2N/FilYyKJ
         bJxyo3rgnHfXIfacLN1VpPQJbL2iUeHT4fgGWmOkySspBi9xvtOO3cPTRJcqJKsF759y
         ugahuYeZNTsoTQhtSh5hvRQ8VNcu7TgvSJ0EVnYJl5jzqj3DpggUhAaMxdGRmh42zPxd
         cUbQn+TusPjoCVrr6trbCPAokmII5X72FXuLkBdUrKKgbdd0tZhT0UpZg4X8mmm+olHT
         N1MQ==
X-Gm-Message-State: ANhLgQ3zJHreiOHGEcEBpbC1dhTDq2xTY5MxGnBoKVydpn67lKvkTAfD
        rct/pnRL+logLZYTbWmHXy+BXOoAxRA=
X-Google-Smtp-Source: ADFU+vueIhdrmS9ovNeHytUSG3XAdXWIFVC2SGDKkEWCJ3Uew4lvhWHm7N0KJw/MgJWUoPDMawVHWw==
X-Received: by 2002:a17:90a:8915:: with SMTP id u21mr2772719pjn.87.1584000220093;
        Thu, 12 Mar 2020 01:03:40 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 69sm35170976pfz.97.2020.03.12.01.03.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 01:03:39 -0700 (PDT)
Message-ID: <5e69ecdb.1c69fb81.5d0e7.42ae@mx.google.com>
Date:   Thu, 12 Mar 2020 01:03:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc5-294-g878792b73893
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 202 boots: 4 failed,
 192 passed with 5 offline, 1 untried/unknown (v5.6-rc5-294-g878792b73893)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 202 boots: 4 failed, 192 passed with 5 offline, 1 =
untried/unknown (v5.6-rc5-294-g878792b73893)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc5-294-g878792b73893/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc5-294-g878792b73893/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc5-294-g878792b73893
Git Commit: 878792b73893e82f444c85548198d0d5c50459ea
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 23 SoC families, 27 builds out of 216

Boot Regressions Detected:

arm:

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.6-rc5-213-g683f454b6=
b26)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc5-213-g683f454b=
6b26)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-213-g6=
83f454b6b26)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-213-g6=
83f454b6b26)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-213-g6=
83f454b6b26)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.6-rc5-213-g683f454b6=
b26)

Boot Failures Detected:

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
