Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1687AE20AD
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 18:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392518AbfJWQfF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 12:35:05 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33675 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392517AbfJWQfF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Oct 2019 12:35:05 -0400
Received: by mail-wr1-f65.google.com with SMTP id s1so14076834wro.0
        for <linux-next@vger.kernel.org>; Wed, 23 Oct 2019 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5y2Gmj6IduxCyhX9XZZhjnMoQT7qc+CY9mfbHegPAe0=;
        b=Cqm7ykFQ0ucr8F0uynrR30v9H1d0g8M/63G3U7tCpwW6faDIRNqp3kidE8LoQMRyNS
         QnPKZPahzUZyRTHSXU4QIXXrORm9TkG1ipetnrfv3tAoKbrWIiuRv2b9/WTj57MaFHtK
         /c+gwUh2ThOL7e/WBRAIrjF2KAR8OeoOS6nOQWXjbmZjAwDD6/zM6634FEwUJ2+2fmol
         12XeUwi0HIqGMPY/i9gcwPXrfliSwDWGQwnyrRQaIHK9Z6gPMVmBU0psk1lv8yb31lQD
         gsqhy+BjkMwefbJxiQLmQBETbb0mp4R1RFq0+ZF5vtajgm9S7H18EiLRygMUL3RTXB5x
         Q+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5y2Gmj6IduxCyhX9XZZhjnMoQT7qc+CY9mfbHegPAe0=;
        b=kq8XxNSY8Evb9zUB9sSG+WIiy9KP8rnoIFl94RggCMRT7i5Vv0rNPfGh3RFUHU6ctd
         mTgACzfJ80zw2RVwXgfrC4jaT+VsBAwdE9IYohMnsrr2H36+g4aROR2FXon7WtzIlDCP
         isz22uoW+POIu+anFM7hR1HaySlRatjcA8tyuN45OW8WsmGycrjH5Zviv+xkomA7wDAB
         SIWq2aj6Y+g/e8KlaBD+KJODZ0ShN369CGxqFbB8WeeLwf3BjpOv6Zw+JKgPQFGcy6Dl
         sYE2/G+YbGGql/egrR9LvwJ/JpzoM8Nznjh4IbC+Lm8TMy6bl0IT2xoyX/RJp9EiTINs
         ympg==
X-Gm-Message-State: APjAAAXB9sj9B39iLTwjAlHZZUZ71i9WypwL5bBmbCQu6TlvFzWItubj
        bm0oy6nfJLQTNAHxghDG/OEIDtMtV1O8dQ==
X-Google-Smtp-Source: APXvYqyEkHoSWgUEdSuzAM41Rg+Lqmzk01d+jPrTQA4+LwMZ6Y1I0QlzuNUYJUve5u8/2UlOjaAIsQ==
X-Received: by 2002:adf:e283:: with SMTP id v3mr9763612wri.20.1571848503150;
        Wed, 23 Oct 2019 09:35:03 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j19sm39383810wre.0.2019.10.23.09.35.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 09:35:02 -0700 (PDT)
Message-ID: <5db08136.1c69fb81.328f7.3f17@mx.google.com>
Date:   Wed, 23 Oct 2019 09:35:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-305-gb115640def2e
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 272 boots: 17 failed,
 246 passed with 7 offline, 2 untried/unknown (v5.4-rc4-305-gb115640def2e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 272 boots: 17 failed, 246 passed with 7 offline, 2=
 untried/unknown (v5.4-rc4-305-gb115640def2e)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc4-305-gb115640def2e/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc4-305-gb115640def2e/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc4-305-gb115640def2e
Git Commit: b115640def2ec107ca19d9c428eca28f03f6f3ab
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 26 SoC families, 28 builds out of 215

Boot Failures Detected:

arm64:
    defconfig+kselftest:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            omap3-beagle-xm: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
