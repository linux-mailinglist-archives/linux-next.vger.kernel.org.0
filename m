Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B98ECA4113
	for <lists+linux-next@lfdr.de>; Sat, 31 Aug 2019 01:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbfH3Xf0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 19:35:26 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:52657 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfH3Xf0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Aug 2019 19:35:26 -0400
Received: by mail-wm1-f52.google.com with SMTP id t17so8952965wmi.2
        for <linux-next@vger.kernel.org>; Fri, 30 Aug 2019 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9gzMGQlnZY3vlccXj6BLBt2l0eXJBPU5KlQ0Am6C2s0=;
        b=1Ynno66DWGRpgFqnQXYBfm168x3Vhufr6wwXp6f4PFmbLLhbu2v27irlo18X+jm1Ve
         Na1UR0wAc2squYPQY2zFeLVZKPIQiYxfDYDUIx02vEvxot70XQs9Kd0ZWdhCNvfJNtIS
         AHYvtGGQC9SIHJHBQQiGO79U39fTMc5zJ3KEWCu+ddf51FrF+FvWBfMxY6e0TiIBjZfE
         g42XDqZ6Xrs0+hDh8MYFvRQddgA8IpPZBvA/k6k2ze7qg4OV/UjOQ0Nd6SvddrZr5XDt
         ZBQSC1YBEEXQ6EvtUoPFR6j9gfN0HlUzvpes7qw1R8SihntmJje75Y1Pi3XSnftpQauN
         WKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9gzMGQlnZY3vlccXj6BLBt2l0eXJBPU5KlQ0Am6C2s0=;
        b=ADnhpHYoTvuj2UOUmCZDev8WYPcVh5AIB6/xbt4lo5yP44rUrTHYql7gpP9AcaYjeb
         DNQoLt3nCqEcVlEv1ewhVQHu7LJZ9oS/gyMknuatQ6rAD5ic5/DnoJaZIl9cBlL+LQzD
         Ls9UxgtA0L0hUg0/BhrE/AOhSYQToiARWntBBQMdzeaPY60z4pgDibDtLDQRF04Fj1pw
         7ZRIc3hh1zHvjUIMwaW/SflXnpYkwi0Ibp1XXl3jNP637Xz7Y3Ahbtipn3ChxDmBwI1d
         fChB7OaY+4UVc/TDV/aAUi7X73S6kf+ih+mbblqKpaxADQjt3YgclLD0mTpNdszXf9JH
         0fCQ==
X-Gm-Message-State: APjAAAUKP5/Pw5fH3lfdfVQsqHBrv2pXSzRNuFKblbOQ3dgEzbLR2YQU
        DGBRnYaNkvtlrDd0mBbByGk+BIVRBqf7sQ==
X-Google-Smtp-Source: APXvYqzd+FZyCF737FgaTrnbxoEdizG/Co9bKkwYn6+EJhxODeuNFRvewysNw9adYcI2hJC2aKNBsA==
X-Received: by 2002:a05:600c:24a:: with SMTP id 10mr4194808wmj.7.1567208123435;
        Fri, 30 Aug 2019 16:35:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id p4sm5418679wrs.6.2019.08.30.16.35.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 16:35:22 -0700 (PDT)
Message-ID: <5d69b2ba.1c69fb81.2fe16.82e7@mx.google.com>
Date:   Fri, 30 Aug 2019 16:35:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc6-346-gfeb027635b34
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 296 boots: 8 failed,
 273 passed with 12 offline, 2 untried/unknown,
 1 conflict (v5.3-rc6-346-gfeb027635b34)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 296 boots: 8 failed, 273 passed with 12 offline, 2=
 untried/unknown, 1 conflict (v5.3-rc6-346-gfeb027635b34)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc6-346-gfeb027635b34/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc6-346-gfeb027635b34/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc6-346-gfeb027635b34
Git Commit: feb027635b3421c0d25bd446a1e5529b494aed69
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 27 SoC families, 25 builds out of 222

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.3-rc5-377-g88ec80624=
7b2)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.3-rc6-305-gae3f6f95d=
f2d)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    vexpress_defconfig:
        gcc-8:
            qemu_arm-virt-gicv3: 5 failed labs

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
