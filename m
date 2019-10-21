Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19F5DED4D
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 15:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfJUNS6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 09:18:58 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35757 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfJUNS6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 09:18:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id 14so6117722wmu.0
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2019 06:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ojrrbb6Do89CJhu5s/usx0uK8GXtt7/hkrDkwNN76z4=;
        b=BMt6GZiJNoeijDnzpKMuaWCqBFEulW/SaXWWU8Srjk8AwI7ZoH59Q9ScaOwAjHkPSM
         x+w9mLxKdpCMNeFpUE4EoQWm8qNyGJ7YUaNL3V9kaBLAMeZf8PM2aiecqYBUVv0sxVJK
         kcwJsZlBkFpdZI0jgaraSsppU5uOt9GP8xTlXm/Y6rvoCpPwSMojJeoxDH60qdlLXJf3
         loDFJQjSJZMppcYafsR6FYTKs/KAA7boieyZJ4TWFSSWeRJzg59uOBeN2STWdoi09kfz
         jSo2dVFcd1wHKNdLqRDabayTZa60pDCNdm8qG1H7M+BDZkUXQACTMNReftFh0tbCWHry
         +3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ojrrbb6Do89CJhu5s/usx0uK8GXtt7/hkrDkwNN76z4=;
        b=RJS2/vAD4VMLRFPiRFE6N7mhFiZHYuFhUD4UVYjwCHcd5zswH7U6O3sbbsyBhJ4SCb
         LnTpA9LgLfMkZWFfREIhE1vGC81slqOrURyYwrIQBjdxRfzH0aMg5CcenZrwUcY/fSSF
         F2ToaNEcLyPcx7SDbqLIEt+QrZkw4+fbvggmtSMUtkdwfh44/YlOQj+B9FqyT+4V8vdQ
         hwmcQ1EfHm9wr3+b2kjP2/CiFoPhKuj303diRzZ6nCQeIKH8GmT6H/7jYDaM+ZPBwZtj
         XJiVviuhh2qXLVX30hDNAVYK6gbO526aVQ6YdGPqsjrNqLoiw4H9oAmy7wSBkFUs6RbH
         Luqw==
X-Gm-Message-State: APjAAAVTjbd8ZTu3Pi5TmlVUsycKiyOqccd682X13NosV0i7zsz5GUXG
        3kdwQzphRsjtQGb/pclofdSR4JzeJUBVWA==
X-Google-Smtp-Source: APXvYqyYT9xl5fAsOP81gR7nZYYoY4ScFJvxQk1ZmSMiVkbMjpfVY48n/6YiDNsrh1WzUNYIoijLGQ==
X-Received: by 2002:a05:600c:3cb:: with SMTP id z11mr19697015wmd.138.1571663935829;
        Mon, 21 Oct 2019 06:18:55 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k8sm29155860wrg.15.2019.10.21.06.18.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 06:18:55 -0700 (PDT)
Message-ID: <5dadb03f.1c69fb81.2c590.bc6f@mx.google.com>
Date:   Mon, 21 Oct 2019 06:18:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191021
Subject: next/master boot: 264 boots: 16 failed, 239 passed with 7 offline,
 2 untried/unknown (next-20191021)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 264 boots: 16 failed, 239 passed with 7 offline, 2 untrie=
d/unknown (next-20191021)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191021/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191021/

Tree: next
Branch: master
Git Describe: next-20191021
Git Commit: a6fcdcd94927a1b24dea6a9951ffa7c64545ecfb
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 24 SoC families, 28 builds out of 219

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

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

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
