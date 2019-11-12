Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09169F8833
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 06:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbfKLFrk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 00:47:40 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:36240 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbfKLFrk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 00:47:40 -0500
Received: by mail-wm1-f42.google.com with SMTP id c22so1580789wmd.1
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 21:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5+d0RIokqCiYT7wr52J0bD7FBOdmI+eUb833cC+uduY=;
        b=HkfYEWFVnrEsAiUqjHp6zcqKn8VCmImBUX/QVIbF07H4L7n9/eMz9wYxQEdI5acxdU
         ZBBdxP0uLcAKOQbek1S80esFIaUNXyv5tYJe1rPtkTw8gfsRPvVArExQLcDumEfVd0z9
         hbl+tLxSKwton9g3IUSe8lcWYjURdB9Ow6qFuKw/4N/XRG35zezBgbz+5tCJfKTKNH2p
         knhvvDqepPcbjJTKKHQrrWm8SRv/QSr8NIEQcOk3PrXjBfX1IyHCtwSsMtP65YBk76mk
         ZFIb86LY7qgGRy2ZyuG6Uq4cvtqTLhvd7xlAumzIopG1wpmSDbwLKg2A7e1dzrWuDQ2/
         /yLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5+d0RIokqCiYT7wr52J0bD7FBOdmI+eUb833cC+uduY=;
        b=HfAOQ8VsADJAZBiCpI0TpCX3v+tQwXKDgmfKzj2TJEz/bc2KLuW5X7uERfStZlbIm/
         pEv0EAHB2EhFti7oJTMJ50EUXr+mhMB922G3Q1PFaO0PxW8qCQYR9ikn9YvWLuSyGMI2
         Iw41IEGbiDTdviGDio0FJctHoCaVt4t3URd68bF9kT54HfjKpoxXDFZWMIrlVPHsXteM
         c9XQHp1HbF2hZtS//+Dk7GCjr99AnVFvJKRmrexP2ruWRVMHIdKyTUOqEm4qCxI/YEdd
         8SJDSSaKIBQ2yoj/kSBSorkJnFQS6JiY5lSd0JOkoBFZZfDiLyyTmCWz0ePOSnKr5rxT
         c4gg==
X-Gm-Message-State: APjAAAW5wcwHlEX1E91JSM8STJank8ZyJkqMSStfLt0aQxJr8l83cHwE
        Qx2W+UyLB3twkGmsbJ9Kbze+KAezndV1oQ==
X-Google-Smtp-Source: APXvYqyDwdzQqI1fJILZCiIkQq30HBFWIKGbj72pqwasv5oXFgJ8vf1EVTRXjLaSjCBVDPVFLaXKeA==
X-Received: by 2002:a05:600c:2383:: with SMTP id m3mr2128413wma.166.1573537657663;
        Mon, 11 Nov 2019 21:47:37 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 65sm37227994wrs.9.2019.11.11.21.47.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 21:47:37 -0800 (PST)
Message-ID: <5dca4779.1c69fb81.7d9ae.b17d@mx.google.com>
Date:   Mon, 11 Nov 2019 21:47:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc7-105-g01970a127dd4
Subject: next/pending-fixes boot: 240 boots: 2 failed,
 229 passed with 9 offline (v5.4-rc7-105-g01970a127dd4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 240 boots: 2 failed, 229 passed with 9 offline (v5=
.4-rc7-105-g01970a127dd4)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc7-105-g01970a127dd4/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc7-105-g01970a127dd4/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc7-105-g01970a127dd4
Git Commit: 01970a127dd4ed1f032404e66b40bc048585a4d7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 24 SoC families, 26 builds out of 215

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            msm8998-mtp: 1 failed lab

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

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
