Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E826914DB7C
	for <lists+linux-next@lfdr.de>; Thu, 30 Jan 2020 14:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgA3NZT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jan 2020 08:25:19 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:46563 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgA3NZS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jan 2020 08:25:18 -0500
Received: by mail-wr1-f41.google.com with SMTP id z7so3948626wrl.13
        for <linux-next@vger.kernel.org>; Thu, 30 Jan 2020 05:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3mpMFFkA8QFPu/xooKa2ur3SJoj9IfdXWJypJ7bPBI8=;
        b=NA14ZrvxP0rmTo+VFlwfdPZtmiaUwuuRC2WGz13sRnEWSjiT4AxSKm6PZJ1jrYsRfN
         GhwTbiT4JZAc7uk47wB4p71YsttUQ/k79rsNDa1KRR0rP7OknHYxYbXHFI+NzaWIvq3p
         dvxX20POwKp6EjBBsRQABwc40TiIKf+0urc6gmpsiLyV6TdngKxZ/+z4tTygqcb3Zba8
         oMpLn7i87TX7zt01/TkYpj9M+avyS55ho2ynJ4tkEn5zgzuClu8Cqo8sYqs4nusj6rJV
         t3LrPycUsByutXIrzU5wx7fey5Jj7D7KNZMnmF2fsMSSRpo6to+9FBtUyaJklnKZcsqv
         U4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3mpMFFkA8QFPu/xooKa2ur3SJoj9IfdXWJypJ7bPBI8=;
        b=dbQ6vcPUBLmshNvEYa3VtmhZgkqtRvDgxPmpBsL4PR6izIZfP3HVO8yIwHHXv9KfPX
         M/J4Yrt8GqV8SZIvoE+ebjsBuRIsfuuirjQIOmjmQOKDQObPwsjtnaux1OrQQ9h4L2GS
         iBJZUGqc74nu8AMpOzVtC6dF1Ts1ahnJZxqY+bVk/lc1eoTAI4RfQaQNCvjnhgHQbNcP
         2Q5Nev3H0dT7GZXRWrhUrVEN3wBaEFrhZ6zUzcSqYSWB12a4+2Nq5T+w80RYSlJWsYQv
         t5QNI4VsWiUSy8d5cpEKMMxUjg9RyUOQTA2JQmJs98WrJeoxA7Qn8NpL4x/VxPwE4CcZ
         DueA==
X-Gm-Message-State: APjAAAW7wvVFHzY6f0Pui8zrHXLKYlarD2/we33KtBhhwrb0qCvmMY37
        mgCTQaxkmPjR3X+L6vOpy+28gx9ciyTPZA==
X-Google-Smtp-Source: APXvYqwhU9avPqCY85qUTk1qxgOkbAsYLD3IG07ZG9cvpg2W0S5vHzRhuu75fC/p+/6N0eS6hk8Igw==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr5560475wrv.259.1580390717470;
        Thu, 30 Jan 2020 05:25:17 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i8sm7584502wro.47.2020.01.30.05.25.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 05:25:16 -0800 (PST)
Message-ID: <5e32d93c.1c69fb81.29e7e.249d@mx.google.com>
Date:   Thu, 30 Jan 2020 05:25:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.5-5439-gb1111a46ce07
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 186 boots: 11 failed,
 174 passed with 1 untried/unknown (v5.5-5439-gb1111a46ce07)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 186 boots: 11 failed, 174 passed with 1 untried/un=
known (v5.5-5439-gb1111a46ce07)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-5439-gb1111a46ce07/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-5439-gb1111a46ce07/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-5439-gb1111a46ce07
Git Commit: b1111a46ce07c7765cbfdd9f851d348dd303db9d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 65 unique boards, 16 SoC families, 22 builds out of 206

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: failing since 1 day (last pass: v5.5-rc7-273-g=
56dd35ec1a09 - first fail: v5.5-3974-gf60232fa162d)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: failing since 1 day (last pass: v5.5-rc7-366-g=
2e30f8d48084 - first fail: v5.5-3974-gf60232fa162d)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: v5.5-rc7-366-g2e30=
f8d48084 - first fail: v5.5-3974-gf60232fa162d)
          bcm2837-rpi-3-b:
              lab-baylibre: failing since 1 day (last pass: v5.5-rc7-366-g2=
e30f8d48084 - first fail: v5.5-3974-gf60232fa162d)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.5-3974-gf60232fa162=
d)
              lab-baylibre: new failure (last pass: v5.5-3974-gf60232fa162d)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.5-3974-gf60232fa162=
d)
              lab-baylibre: new failure (last pass: v5.5-3974-gf60232fa162d)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            msm8998-mtp: 1 failed lab

x86_64:
    x86_64_defconfig:
        gcc-8:
            qemu_x86_64: 2 failed labs

    x86_64_defconfig+kvm_guest:
        gcc-8:
            qemu_x86_64: 2 failed labs

---
For more info write to <info@kernelci.org>
