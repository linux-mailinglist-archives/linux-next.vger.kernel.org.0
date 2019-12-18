Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 493D612456D
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 12:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfLRLMT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 06:12:19 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46237 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfLRLMT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Dec 2019 06:12:19 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so1787639wrl.13
        for <linux-next@vger.kernel.org>; Wed, 18 Dec 2019 03:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Dd5rYDQnNzdfAZXhDOBvUuCUMLtmExIHD7F8EeHHEHM=;
        b=FsNT5MwkVSi+HEFMyfYV5qRta5uW2ezDgyqLOJUR/8r3myW5sT9NCVp+vnZ3CdFCX9
         e5DlrXFCm0FdBgLV+Bgh93FRmY6vT87cvw93BC/dbrrY+SiGZcIvInSGub3AA5QCxqvu
         KURnLDn9O4o0hlO65xUwUI9++06bOiEwWjyszuW+V4cIvKpUKZllN9UiT2qzfR5rFKzi
         allGBJZFm6P/joZMSbRihDFuzrTx0HGrqqoMW0/SSjL7FKycVHYP0owRWxqE0FV5A2Lu
         9hVKvKKXceltKnX4QYCQ5i5o/ga4/tN6RRQA0KoTvChcIusdMQ4W223Ts1zA476WimQz
         7F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Dd5rYDQnNzdfAZXhDOBvUuCUMLtmExIHD7F8EeHHEHM=;
        b=oHdVtwIK8im+DyQ6gyLLb+It6ZsG+gKVW8yOvQjOj5kEGNVLxbEpxQLeGWklwL2pnO
         poAsJx/HqGmPiPDDyrKUWwTN6uny2pHPneRky6stqqIn2fJ7htTvCwj6odKpGLUUeMhR
         5sHQGM4TyJTCDOHaYHCBOqmbZefvX5A4Tflm24rUHMqoqdY21JbqHMd1RzvApOyskHNc
         aLRB5mkfs3+MjrqFKqkni7B87pOvBechBrPO/bbm+vYZ0j1CIGU/hVOxmYegUZCSq/M9
         rV5dv5RROp18XdfSAyJcB4S0c3z0oh8pZjlqcF2xz6zz2CcZr306/v932+za7GNgjFIg
         oPdQ==
X-Gm-Message-State: APjAAAUAMyG90KGOMvbem2neRsP+bY/KoqNF23MnO+/GgdcpnwNqxGaS
        0u4pGmmPSOqLua4pR0kfMHPmgnFw7uHBgw==
X-Google-Smtp-Source: APXvYqyrfO+SddMwtgkH/o2LaxwJxoqKbQGp/UvPJwn9ig/NpOWdIGyYW8PMgR1xw6ILJgl9RxiC1w==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr2125546wrm.107.1576667537453;
        Wed, 18 Dec 2019 03:12:17 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o4sm2146566wrx.25.2019.12.18.03.12.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 03:12:17 -0800 (PST)
Message-ID: <5dfa0991.1c69fb81.c0efd.9ebd@mx.google.com>
Date:   Wed, 18 Dec 2019 03:12:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc2-432-g9eed7d73a938
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 219 boots: 2 failed,
 210 passed with 6 offline, 1 untried/unknown (v5.5-rc2-432-g9eed7d73a938)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 219 boots: 2 failed, 210 passed with 6 offline, 1 =
untried/unknown (v5.5-rc2-432-g9eed7d73a938)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc2-432-g9eed7d73a938/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc2-432-g9eed7d73a938/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc2-432-g9eed7d73a938
Git Commit: 9eed7d73a938cef7d99ec6551b4f35eb1376d2c6
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 23 SoC families, 27 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
