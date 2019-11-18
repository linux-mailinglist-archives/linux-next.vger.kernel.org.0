Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4A6FFD0F
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 03:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfKRCXd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Nov 2019 21:23:33 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]:52107 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfKRCXd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Nov 2019 21:23:33 -0500
Received: by mail-wm1-f47.google.com with SMTP id q70so15673038wme.1
        for <linux-next@vger.kernel.org>; Sun, 17 Nov 2019 18:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bjbFovPPEunrRvriZi4GOLP/xJ2DV0BOtlZZFLxt2IQ=;
        b=g+HhBXYi8YLGFNixVBCeGvjGd7rEkd2cWXqVKhUVuyN/UXTJ9guZ0Nls1tQ+fHj+gy
         GUH/D1SkBPkHBRp+D7Kwkh/xjaSVcmhUeL/AfrKBYsjWlz7SptLB/Ysj7fNK3MZuyLOQ
         aT9qO9IKLwnHXnK4vbsPDzAOtWbOisu/dc5mcCrIPJfrtdSGHkfQrNuqi61FiUnRi5pn
         xlh0CKHlmAiDM9mB9af+A6xcFGtlgJvbaz8CTbKYP4S8PvB+fL1Jndus7NQznxX6a9Fh
         97qKQet6D1u7dbUB7YwQCG1WWVSICSyj7baDxu3K/DPufjr0LdyoW6G2kTu5ERzXzDAs
         ttvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bjbFovPPEunrRvriZi4GOLP/xJ2DV0BOtlZZFLxt2IQ=;
        b=RdWpARbOZuE48eUnGmyoQe4HTiyUQj3xhEGnI4yNMJqmOpZ5ruPLcrDRsRNpVd8aDX
         wb/QM1xQ6jSLm8svlGc15IwIlvCmtSQRDJvBikRTxsOIYgq3yG2dL8TlpNNlPmIZJ8p0
         Um1/M8zFrUSPgimIxbeXRVTW8XghDVxLCbOs2P4eAM0Ln4l3jVr0kj8dcG0hUavn+AuO
         epLWlozrVvJ0fFCYSkyocZD/6FP6DtTVyaJGALBMY9a4X6Nr696NWBzPUu4MW53ePV3y
         VJElrJGeaWcvQlZxSv/6TJSRsgdWP+HSc9AzHia+DMyDmrm07dEfewPiUiBB98Vs5QAt
         tmKA==
X-Gm-Message-State: APjAAAXELZtW15a52rQ3jznLcdNQb7zza1G4u4Dok1EB6WaPpIP+3jwS
        khgkQY05ZapLkryQFYNQJABbVI5+kiY=
X-Google-Smtp-Source: APXvYqxXmK9EobNmyVhClfV8d+egs9m0MYQ233R2nh2v2Aq61d6wpkjfwoATdLDyCYGrKeauXS255Q==
X-Received: by 2002:a1c:9e58:: with SMTP id h85mr27566542wme.77.1574043810379;
        Sun, 17 Nov 2019 18:23:30 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x205sm20806583wmb.5.2019.11.17.18.23.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 18:23:29 -0800 (PST)
Message-ID: <5dd200a1.1c69fb81.7257.1454@mx.google.com>
Date:   Sun, 17 Nov 2019 18:23:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc7-306-gb1a61072f202
Subject: next/pending-fixes boot: 232 boots: 2 failed,
 213 passed with 17 offline (v5.4-rc7-306-gb1a61072f202)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 232 boots: 2 failed, 213 passed with 17 offline (v=
5.4-rc7-306-gb1a61072f202)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc7-306-gb1a61072f202/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc7-306-gb1a61072f202/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc7-306-gb1a61072f202
Git Commit: b1a61072f20257a3ac49c0fe5647bfb29cfba5d9
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 23 SoC families, 27 builds out of 216

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2835-rpi-b:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc7-202-g2=
190e31dfefa)

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.4-rc7-105-g01970a127=
dd4)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4ek:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc7-202-g2=
190e31dfefa)

    socfpga_defconfig:
        gcc-8:
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc7-202-g2=
190e31dfefa)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            juno-r2: 1 offline lab

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
