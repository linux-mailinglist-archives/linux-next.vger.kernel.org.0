Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461B684F2F
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 16:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729516AbfHGOxT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 10:53:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35424 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729278AbfHGOxT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 10:53:19 -0400
Received: by mail-wm1-f65.google.com with SMTP id l2so358908wmg.0
        for <linux-next@vger.kernel.org>; Wed, 07 Aug 2019 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=39LitdysiAul7Xgi+nhBgFZX52M3U5jM7sW1zymjf/s=;
        b=k2r5LoXstJ5KoG4+hTU5KBoEllmPksORCuev34Ovy3dX9zw76ElXku39JaTv9tTwdG
         jLOIg3lL47qbQMtvNe3pYh2jiSr3jnWPi4hSrcyEk4CzMODES+SnrDGCz44Ys/hI8BdF
         AYDA3JgLZNYMHCAqrvrLw4H1VJis567G+QNZ3qCGsKMpH5DUQ9rgcsseRaOLYqj1ktpv
         XZ3woC8gtUzjgX1mvFhytZScfNJls4oh5N93yfE3OzFPuYUtQO9iGnV1dcMmMJPy3t8U
         eGi0rmLKbp80pT4fSETHlv6wiCsy3QD3z/f4ByuZr8vVThZHNMKJhelE161n1iGqCzzU
         RtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=39LitdysiAul7Xgi+nhBgFZX52M3U5jM7sW1zymjf/s=;
        b=qPTKerm+Szy3h92DN/gJFJn/XCIJhbl0dsry389PPkzzV173Frvj7+M7uPNf4C82F/
         jSlXW/QkSaFxlbJFK2KwByD/ILvNU5cLAyh2U28l9VgeBEy+FD7jR5jauaT1V2AigAg4
         dc+9ps9NCUYVjqNexSFSrkX8pKBq1OC1GU36KIyRDcTo28xVroRV/Te7YQNknjn+a/hx
         aAsKEEYh1Aq6Y1kIGNtYt6MYO43vIfvecpLbhVqy2/WmQwQXEmbF1pJ4FSaMtk5vuoNZ
         XOqXMa2vFJwJl47SKMXh9eikskMGdasv9Kyr5G7tMUxAtLolRs7Bhs+GiFQR6mFHjchT
         v4eA==
X-Gm-Message-State: APjAAAWYI+1jD3ytSCdBCqICw2nV4X55FP5S63oLppKs9L+t/ebXE621
        YGzEuIvf/efvnjwzAMXTZ/qAZbTjaY6YyQ==
X-Google-Smtp-Source: APXvYqx0nIkJ8XLRXQ7damSPLiZkrS9zgA91Zd7qNcnlJahEuLi4cPKyG73UX5RRp8IH/PXevLPZGg==
X-Received: by 2002:a05:600c:228b:: with SMTP id 11mr406416wmf.26.1565189596580;
        Wed, 07 Aug 2019 07:53:16 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i66sm141569wmg.2.2019.08.07.07.53.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 07:53:15 -0700 (PDT)
Message-ID: <5d4ae5db.1c69fb81.ad2a5.0bfc@mx.google.com>
Date:   Wed, 07 Aug 2019 07:53:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.3-rc3-474-g2c5a544f82b3
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 224 boots: 7 failed,
 194 passed with 20 offline, 2 untried/unknown,
 1 conflict (v5.3-rc3-474-g2c5a544f82b3)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 224 boots: 7 failed, 194 passed with 20 offline, 2=
 untried/unknown, 1 conflict (v5.3-rc3-474-g2c5a544f82b3)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc3-474-g2c5a544f82b3/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc3-474-g2c5a544f82b3/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc3-474-g2c5a544f82b3
Git Commit: 2c5a544f82b3ae9a0bc0fbb28f37ff64233802ce
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 28 SoC families, 22 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
