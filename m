Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E82F2DC020
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 10:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632801AbfJRIjN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Oct 2019 04:39:13 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37232 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbfJRIjN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Oct 2019 04:39:13 -0400
Received: by mail-wm1-f68.google.com with SMTP id f22so5222614wmc.2
        for <linux-next@vger.kernel.org>; Fri, 18 Oct 2019 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HqADEATO2tsVpM8nSLHjX4VfE5R2OkHw2Jl4bFBliaA=;
        b=bXUQkiJ+6HIVmXuqZk3RcuxSv0NsXetokBLfQsSms7XykrjVAO8ntYc2IJnix3lRYc
         n0RyFsF/xd4yhFSj1xmKzuTF019gsGk1ArmjQuc//VtzRV9lRsWEDukBjup6QWGXYgUV
         cactWia9hPVqOPtlLQMh89QZ7M6kmxKVsSK7gqYyRrduG6Qlu0EEGa26K0sjT+99tMaZ
         CnAMmT4kkpeqNz2oLx23cczLaDFzldquaUm/njZZbPcQ3vx7YLAta9dTcEJghbUo3Tm3
         tN0mJ44YZAXCPgMFaRZOVPF7jyke6e1+j5tmfG3qsj+RL9xnu5gIPw7sBWmh0kc2S151
         SywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HqADEATO2tsVpM8nSLHjX4VfE5R2OkHw2Jl4bFBliaA=;
        b=OaanWJtO3Y5U9L35PGkZncsDZVB+qURatKdLkLo3jSQz2cWdT7sydH3hSZZBB/UuGq
         gnZaiRrDY/8KUxQw2ypZKerLI2ygSjy4XJOda+XIoQ9s7jhBuxV1SvQ/Y54hBO9g/ziQ
         ywfh/bTLWEQRE6sC79z56LKT8grf1QLKqQLPyrO9NV2hj4d1Vhfgvi3ustumPAZVC5Rl
         XuosXA5pJ/X52bPWP6wGRd8lgJySWLqOFUzbfBys15y8AeETO45W2Hx1yHFrg0F3Gcro
         rg9D8lrvxkl9alltiXArpcWDJ5SRebw/aY98MBDKHHaY6VclQjCEKKl6ZeyhWSAucNIl
         XNNg==
X-Gm-Message-State: APjAAAWi9E4qhd7RHnq+FkV/h7jdzAxGzPHdwyp0nvu+GoyNiB66Rk2u
        zscRJ4c7LLZIx6hSNhCAbhTZ9f9DXjv6SA==
X-Google-Smtp-Source: APXvYqy+IlBYblVU7zEVfjU6vFHkFq7bMCpimZqKvkHAIJVfc4f7pEWhfLej3J1BVNfJ+FI7Lt4NMQ==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr6769237wmj.48.1571387949297;
        Fri, 18 Oct 2019 01:39:09 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d78sm4436413wmd.47.2019.10.18.01.39.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 01:39:08 -0700 (PDT)
Message-ID: <5da97a2c.1c69fb81.2cbab.71ab@mx.google.com>
Date:   Fri, 18 Oct 2019 01:39:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc3-393-g487ed230fbdf
Subject: next/pending-fixes boot: 246 boots: 6 failed,
 232 passed with 7 offline, 1 untried/unknown (v5.4-rc3-393-g487ed230fbdf)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 246 boots: 6 failed, 232 passed with 7 offline, 1 =
untried/unknown (v5.4-rc3-393-g487ed230fbdf)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc3-393-g487ed230fbdf/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc3-393-g487ed230fbdf/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc3-393-g487ed230fbdf
Git Commit: 487ed230fbdfe3fe44ede5b3a2863cb07491a1b5
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 25 SoC families, 28 builds out of 215

Boot Failures Detected:

arm64:
    defconfig+kselftest:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

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
