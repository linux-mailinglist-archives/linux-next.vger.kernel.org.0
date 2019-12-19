Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFCE125F95
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 11:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfLSKpQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 05:45:16 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40888 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfLSKpQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Dec 2019 05:45:16 -0500
Received: by mail-wm1-f67.google.com with SMTP id t14so5077267wmi.5
        for <linux-next@vger.kernel.org>; Thu, 19 Dec 2019 02:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Y0fqWZ+QoYqiTR1A3iYnaKjO1//xY8m4Q16VoAPmjAs=;
        b=epBxLUd+I6zxsbNkaqncoecS3GvK2lybtKUMN3u29GuklyotFSgjbVuA66Q6XE2iNr
         v393PmqxnVXZZX2PILQH/xk/AI79dUYNvhgr7TkLGprtIH49t/4e3mGIm0idRK1FAaoy
         4NPMm16C9XLDH8bFaMoRxEw4PjVqPb5voRVDi0vADVLRF/0c+OMclUTcwStfHx6J50Nw
         1c1G3t2RovndsCsxDh/Z6SRUi7FuqSHK5pCKapEIBvXrglEzGMlWuOXRGJsXKi0FvLfk
         gGEwdFfuJkw/lh+8VgXw46dOMtySo8uN8KIwg+35RoY5JYoLMNXRu5f738Xml/CRjvdv
         bUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Y0fqWZ+QoYqiTR1A3iYnaKjO1//xY8m4Q16VoAPmjAs=;
        b=VeLU1ebOsQD2edODVglBjNW6FaEP3BvguQixd0jk5bj22vmBz/OwRuQEHnnj0wJuHR
         eCQu6YrM2TtOyCmp3sHN0jXclUBppROosZ244F2pOctGf92cuxdg6meD7jXF1zLzwm0i
         U8QHfQhMA1LBPrjhQMhgKyLo2zDegWJi3EsvucIQ5uB3D32ytWJ+iAbb3bUejJXtHGsZ
         CDPw3lseOco0Fqbg89JCftWils61iAbNrEzAYDBSpTR8WITH8GDeHWFNrEe2kSNbQld+
         zlqhHvWSToYXHWe3EoxAbTQtrY6dP8rut+SggCUlmw4NcmE0QqDyqPgHf84kSThDz0Ke
         mWDw==
X-Gm-Message-State: APjAAAUG+3nVKAerA9jmh/nb4AHALJXSQyBuFfiidqoJnVtnBSKg9aoZ
        6NV7W1yxWIPmz3Yw5KFY6PTNb5/a2ZsqhA==
X-Google-Smtp-Source: APXvYqzvQK7sohcQFBgbpm954H9O/5Y6ubsa1nlxO8Jly9bLypyzJspmg0lc4vH6M3LK1JWQCGqfIA==
X-Received: by 2002:a1c:6755:: with SMTP id b82mr9045532wmc.126.1576752313795;
        Thu, 19 Dec 2019 02:45:13 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e16sm5871938wrs.73.2019.12.19.02.45.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:45:13 -0800 (PST)
Message-ID: <5dfb54b9.1c69fb81.ca3f4.d372@mx.google.com>
Date:   Thu, 19 Dec 2019 02:45:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc2-502-gd5e7f2ed7f95
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 160 boots: 2 failed,
 151 passed with 6 offline, 1 untried/unknown (v5.5-rc2-502-gd5e7f2ed7f95)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 160 boots: 2 failed, 151 passed with 6 offline, 1 =
untried/unknown (v5.5-rc2-502-gd5e7f2ed7f95)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc2-502-gd5e7f2ed7f95/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc2-502-gd5e7f2ed7f95/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc2-502-gd5e7f2ed7f95
Git Commit: d5e7f2ed7f958ec05937074233c5fd23abde5d8b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 72 unique boards, 22 SoC families, 27 builds out of 214

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
