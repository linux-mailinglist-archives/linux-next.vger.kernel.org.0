Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A55D3DFA
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2019 13:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfJKLIw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Oct 2019 07:08:52 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45041 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbfJKLIw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Oct 2019 07:08:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id z9so11429749wrl.11
        for <linux-next@vger.kernel.org>; Fri, 11 Oct 2019 04:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t1GkOwYRbJl8UyjktqJHiw/xSVTDnpv8LkI3MWLepa8=;
        b=ZT1PCOZoQXv6SinrErNGISG4RxPGkabtELDhFbWpohrt0qHYybjldaKmTtasPk1uqJ
         5G5fMcW5gMXvSZ2bxw5mBZGaJzx76BRwUT7+CbrFmDEmX6zTbS6of7pi5UaP/CTAnIS/
         4/v4aKCsze+UnZdgmZST+D4Cc+MZTKuwn1+heoYsl5O/ZNvzTKa8HHKYWHtqmOSAgrn6
         qp2DB55mJ0ogU8RFw80O0iZSZL+LRmZiPi7k7jPp6Ym9kXhruVkXzDLlxX7bJn7tfW8Y
         VJudnLKZdVG/tnAMeNJd9TgkW56blY36v+Bu4+sdQJn5OGorMJeQnmNCI4lBs6+MgSiS
         hFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t1GkOwYRbJl8UyjktqJHiw/xSVTDnpv8LkI3MWLepa8=;
        b=MYecJA+s9zJMUHydiga9kMfpkVIcp07KTDCpT325F/OuHQhknOItV2aAVOGb9ymqrH
         xok4YlfEaRRSiasO7wn/zNqjIGoLhUxjMVXTJvREBYea0qJ2McWn/or6yOxjSGT7DXTb
         YGXIqXawuW+joe2d7y+gQoqalAj5o2tvY9QtQeArUfctfTfTTZmcQdNRwsx0j3WvyXIW
         +Wgak4HhW8nV9LgYsn6aj0WYh5oKJlEeDQqUc+RIyzAaKi3SUt8pxRFKnllcWWATsCyZ
         /pjmp6n+AQI7MFuZuvy1TMxcWa1QH8ng5Ym3FwewG3KBTxQmjVbjUb9fjLT7fv92yDmz
         yxGQ==
X-Gm-Message-State: APjAAAU0LxbOJjDp9p60QOS5/axpiWKX7zke0lMtv1WmrBgubiH7OYYx
        q23jUiBgihHZ7UZnLzh5y4o2wmhpz9+1Fg==
X-Google-Smtp-Source: APXvYqyxTYnn8PdiobSzoHpyxbSdlDUBykD+M0uLkcdaUEcb29dnk7bGU9t52SOsEqTGXC0wOUdyzA==
X-Received: by 2002:a5d:40c6:: with SMTP id b6mr11882633wrq.90.1570792129910;
        Fri, 11 Oct 2019 04:08:49 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c9sm8227955wrt.7.2019.10.11.04.08.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 04:08:48 -0700 (PDT)
Message-ID: <5da062c0.1c69fb81.34dbf.6b21@mx.google.com>
Date:   Fri, 11 Oct 2019 04:08:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191011
Subject: next/master boot: 311 boots: 15 failed, 281 passed with 13 offline,
 2 untried/unknown (next-20191011)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 311 boots: 15 failed, 281 passed with 13 offline, 2 untri=
ed/unknown (next-20191011)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191011/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191011/

Tree: next
Branch: master
Git Describe: next-20191011
Git Commit: 8ada228ac7ed08a2c5ce035089e858b103af09c4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 25 SoC families, 28 builds out of 218

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab
            qcs404-evb-4k: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            omap3-beagle: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            mt7623n-bananapi-bpi-r2: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

---
For more info write to <info@kernelci.org>
