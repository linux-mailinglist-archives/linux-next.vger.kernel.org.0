Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1C2A922D
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 21:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387918AbfIDTF7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 15:05:59 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:52291 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733010AbfIDTF7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Sep 2019 15:05:59 -0400
Received: by mail-wm1-f51.google.com with SMTP id t17so4449253wmi.2
        for <linux-next@vger.kernel.org>; Wed, 04 Sep 2019 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rLoZ8l+a6rF9jd3DxGLhmZvI15vxos1grYrrjmT47nE=;
        b=1DrS/BvqTBwJ75UhLWVl8TcjfliAzOd7FCBd0YdRbocdJzsgOr5e27UJ1Ef/duHeIs
         OPmJcd27HeC+RznsIxT0eb9OpbnipOEKqfFbPzR2Kki1kubeEVtjarQSuYZ/b3e+wmPI
         y682uVkh9AZSoQOUv8ndjETyjTsuxv4KPnoejib8TkLbeLfj4zVMyHEhFajjhijhzVo/
         ab6Zbc1R5cL6e+VPBiU5AMX2UF16Wsu30Ucik+J7DsmWwJaYVD0/9F0x6uTw+i+d+Nwu
         SXgJsfl4xWmgAPAu9QxxyXRys2yUr3cm0TcaAlcvGAP/hLSrpDmMTR90rJ/312H/lmTA
         GUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rLoZ8l+a6rF9jd3DxGLhmZvI15vxos1grYrrjmT47nE=;
        b=iyD7aW1qlc3N8NuvDeanI/lbmNd12xEY3eN4zLsh8FRUiVKt3T2X7+KrLL/zi4v5pV
         UOaXv76iYx/Z66nYN85dYNGY3KTkQ8rV2p8n7D4bCXTfBzAt+T0Wx2Cvx5zJS16FHwF9
         3WWjChRcuuzYhowbRCzppmpPVElbE2qt24TEdvbZQSqYS8LHVx0aWkNBd4SnvPVTYJu2
         urtq3PMbvKkjlNtnmP+/ALR5xui0vORpym0F2X+yVbruluqjGEqoUva6ZWp8XjleIYZc
         PpycqVO8iI/sFOpgVWNmWHtpzy4UaH5cMLwCb/fhNyPtEp/GbaMW4M9kOnaeJguG9r4X
         khKQ==
X-Gm-Message-State: APjAAAXvRfJeBI1dukrnP3cjC0uwFqpJI7oTjEQKsc/8bw0ToV4fe4Jx
        uc5WzAw012ISqCoq4tWmUaD3km7FRjEbRQ==
X-Google-Smtp-Source: APXvYqycqj2uuoZIwG0NRsDSYBrANEZRWHwQzwWpztCBLDFSCzPVST8XuasHSDCiEqJFGXUM/S9nAg==
X-Received: by 2002:a1c:7606:: with SMTP id r6mr5829121wmc.78.1567623957614;
        Wed, 04 Sep 2019 12:05:57 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v6sm6030104wma.24.2019.09.04.12.05.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 12:05:56 -0700 (PDT)
Message-ID: <5d700b14.1c69fb81.ef051.f4e7@mx.google.com>
Date:   Wed, 04 Sep 2019 12:05:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190904
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 310 boots: 11 failed, 292 passed with 6 offline,
 1 untried/unknown (next-20190904)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 310 boots: 11 failed, 292 passed with 6 offline, 1 untrie=
d/unknown (next-20190904)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190904/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190904/

Tree: next
Branch: master
Git Describe: next-20190904
Git Commit: 35394d031b710e832849fca60d0f53b513f0c390
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 97 unique boards, 28 SoC families, 26 builds out of 218

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

arm:
    vexpress_defconfig:
        gcc-8:
            qemu_arm-virt-gicv3: 5 failed labs

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

arm64:

    defconfig:
        gcc-8
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
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
