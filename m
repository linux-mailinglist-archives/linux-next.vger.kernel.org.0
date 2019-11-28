Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB0410C6E9
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 11:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbfK1Klm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Nov 2019 05:41:42 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:46363 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbfK1Klm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Nov 2019 05:41:42 -0500
Received: by mail-wr1-f41.google.com with SMTP id z7so27026248wrl.13
        for <linux-next@vger.kernel.org>; Thu, 28 Nov 2019 02:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qV3pKqnB2YdYBYutzIer/fhYqKimXNJV625ynxvkbSg=;
        b=jza3yV5jXeiTt3iXeBdndxi6EBxO15Z/Rp5qMtB3iox8LQomWPxO+ln/qutNppsOlw
         zNuFxDX9aPmlkpfvXbV78ebXeinQ1gb2smvaB3x9kTuDh2ADmZ/OxPz7iBwoVY+65koU
         5P6UkKGyR7GOeJESMr5/PgaUKudmo1KqWJeZY6RMsFBlR2YxUDpTP4xhehOTFa5w+zJl
         l5mo0ngQT/rbqpJe+mCHnuqn4m4Qn2Int0fNCvjfqrER6MMgTjhxfGIqNKYoUQQwoGUb
         VIBwW5FusmNyGxi4+kCrXaN2V4caEat0x6sdSmbyc5tZ1qXtbWnjqNqVQKLOZaSaptel
         IYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qV3pKqnB2YdYBYutzIer/fhYqKimXNJV625ynxvkbSg=;
        b=qbeTNDWg5mQaGKcKY6rscTQ8lhKRnzM97x9n6vf7WZ/BPB7hVpK+OUHmCpxN5G0Pj8
         sehMGhycFtgeQ3MzBLZ9wtpFldKuYG9TPWIIYY3XjNkfsrYKJ88G5ZfGfAnoAZKJ7FO1
         WAHrTl31CeJraOHG9DSTHiBm0EnZO1vBL58bfXQDJxI9ujDWGW4XLVpxwUVUEDgObHkS
         S3aa7+kxa46LNSbDhvDxuHi9HYwzUqNRjVybQVdNNskyDqBs+AXct8gyWvOGC0DiVvw0
         63bAv1Ng4ahyBMCFtahDHFu4HfwpsKFfOgaNE77M6XWzEk5ZgSJw27WRcq+8uEDKzaZ1
         iGew==
X-Gm-Message-State: APjAAAXlMuiFA7uyirsMqL1a2rs9l8SnFyuHn4odZw4B7BRqfa01/mkX
        7Pamfgs+7b99XxrJ9DTH1kz2lePmHnh0Kg==
X-Google-Smtp-Source: APXvYqzs5PlLM67CJAVhidnxUMOMZPIu9hH4uKhpZgaSviIQVOujaBWRXNbVLNjwB4oFg+5CJnjmrg==
X-Received: by 2002:adf:f290:: with SMTP id k16mr50021233wro.224.1574937699030;
        Thu, 28 Nov 2019 02:41:39 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f140sm10807611wme.21.2019.11.28.02.41.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 02:41:37 -0800 (PST)
Message-ID: <5ddfa461.1c69fb81.a7c12.7429@mx.google.com>
Date:   Thu, 28 Nov 2019 02:41:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191128
X-Kernelci-Report-Type: boot
Subject: next/master boot: 263 boots: 4 failed, 252 passed with 6 offline,
 1 conflict (next-20191128)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 263 boots: 4 failed, 252 passed with 6 offline, 1 conflic=
t (next-20191128)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191128/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191128/

Tree: next
Branch: master
Git Describe: next-20191128
Git Commit: d26b0e226f222c22c3b7e9d16e5b886e7c51057a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 26 SoC families, 28 builds out of 216

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
