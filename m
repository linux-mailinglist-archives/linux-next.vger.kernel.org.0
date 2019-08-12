Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98BC58A329
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 18:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfHLQUm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 12:20:42 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32871 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfHLQUm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Aug 2019 12:20:42 -0400
Received: by mail-wm1-f67.google.com with SMTP id p77so349885wme.0
        for <linux-next@vger.kernel.org>; Mon, 12 Aug 2019 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qePOOqmSlNr9SwjAZX5nR5vrLqwWA4e7gaiExDYB5Uw=;
        b=NSy7x9k7d8nvh+XFWjUMQbtG0gBf/LGFQOqnODW9OJlU7I6bl4iqgA30pBSre5bcFU
         Od516OLCki/xz/d/iohMXusTErp5TDvUF8D0erUr9aSoB7Ej9N/18HaDeLEIHL0R2oIG
         r8MOUGfzTwpq/QgOAA4CuqcUWRKFsMNP0zvmFchsPlzVNMCBtGBFN5D0dRsnuYDiPXzi
         RM0nfoBiiU2w+Q8x46GbE0mSng5yDsRBvYCCBSv8mKEA8MOq59TqtUXFrn8zRQDI1Aa5
         CfdWseYCVefcFj+MyG/TVGy9v7eGrdmwODSnIaBZtDfxgKJ4QVl0Jg9SgC505S//AkKB
         SKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qePOOqmSlNr9SwjAZX5nR5vrLqwWA4e7gaiExDYB5Uw=;
        b=EtLxbCFwEge/ubPAD28kV+o65/day3zgo9u+REnEV6kA6t8BL1FbKGhurHqRL917RE
         W41Oo0AqcfM2HEpJc+OKrOoPKX8O6S2mKmuGRaSfExa9daXUmb3nT5dvL6X2aE7RVJBA
         AruNwMpFZHL2R/YLcAHEhik5v3TTQ16tlIWK/wQGzqPjKanIfPF6yVOOczozKPERCNho
         Y/ZCYKDREuVKLqKd4QnZpaMMU/TGQSO+dBuDUm4qzKbz+wQ69M8DvNtnu5/F1ZewTidT
         gJTCbMGIBMnBfgU5cFSdsPbPuMn+6ALTq6TP1YxPUZWDoX/4iOTvDMFM9QT1nJnPOxLG
         +IVQ==
X-Gm-Message-State: APjAAAVCGwvjw0NppUBawk1wIS4UXkYRhe9iUV5pVT86ssS6iNhQlPmD
        Ykq9DkZLpDUqit305E3x6yRY1zM+yJw=
X-Google-Smtp-Source: APXvYqzZdYEZboqybcPmNtscFiIwmJPvzhPvKiggpy7F7sdcAffXQEcByXdQr08csWNr8ROsDk9kyQ==
X-Received: by 2002:a7b:c415:: with SMTP id k21mr62403wmi.135.1565626840745;
        Mon, 12 Aug 2019 09:20:40 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u186sm48116wmu.26.2019.08.12.09.20.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 09:20:40 -0700 (PDT)
Message-ID: <5d5191d8.1c69fb81.81db8.0403@mx.google.com>
Date:   Mon, 12 Aug 2019 09:20:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-148-g65a07a9f5dd2
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 211 boots: 4 failed,
 196 passed with 11 offline (v5.3-rc4-148-g65a07a9f5dd2)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 211 boots: 4 failed, 196 passed with 11 offline (v=
5.3-rc4-148-g65a07a9f5dd2)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc4-148-g65a07a9f5dd2/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc4-148-g65a07a9f5dd2/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc4-148-g65a07a9f5dd2
Git Commit: 65a07a9f5dd2daf903d979dd2e7b24d0e212ad1f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 27 SoC families, 21 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab

---
For more info write to <info@kernelci.org>
