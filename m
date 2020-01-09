Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB50B135249
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 05:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgAIEwx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 23:52:53 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:42368 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgAIEwx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jan 2020 23:52:53 -0500
Received: by mail-wr1-f45.google.com with SMTP id q6so5844413wro.9
        for <linux-next@vger.kernel.org>; Wed, 08 Jan 2020 20:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wErXHCmWPPn6Pr/dkwyFX7UTPDEecqa7SPM3KvnzlWI=;
        b=i5hIC4AamBI0Q01HCNU5xNoM5mAJbItgR89w9Y1GCSClVeWhqHJfJtL3HtmNPTtoHU
         ccImb5cVx45xc/C+gfcTi09AgCtPxuySV9poGB8kRph24G4AUP2SSXN51xf/z0DSfASq
         8UGSdgh3Y7inH/wHhhfrfRJ3S21K6pQYCUIGdyGpvmOCe3x4QYnZQwAcy20lf9wPtOQL
         LY9QXsbV7xT5+x3yVg8Kqp5755JHqP2Yidb0LO1x4ErBUbGTcFaog0n1JltsXCnb0DM9
         zhIPOjVxOOa+Sh71q1sanptsLE/JBxIO7buIgUTtQRddDi5C8ujgg0Ehrpj3M5O/0dLF
         Sq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wErXHCmWPPn6Pr/dkwyFX7UTPDEecqa7SPM3KvnzlWI=;
        b=QX3DuGa3Rnh3gagPUq36UjlEP9TTEqnd0BaAdxwnf7z7HoVLaVHbXf/uHgJvPtfw/R
         7R8pVjASXTsa+R8HLEm8Fw5pqn3B4QGIiolxQAuNBRjU0aUgHwjGt7ZotAFp5XLaZK5V
         WLeU355LsmE+gNNuH6pLk4FjdHriGyFFT57JcY0ZIIAihlkOqXzCn2NxNucvHGZEYCwH
         B01lbilAhdNswzwWQh0lWk+A3eoY+J66no+S+/Z/Am4gVh+3WGSpEK1zk4nyZS5wN8Hr
         qrE62frYSiRZodpnNGNBRRgec3dVF7Fn2lwjfeW3/ZxNwv5uxlTf1khEuR1CQwxf8h/2
         0qOw==
X-Gm-Message-State: APjAAAW2w0DWPZXuOz3dJMXbYU4iM8JyEt9ww0vn9hMJistzq1H0H0Ln
        7O6tpWQ7JTySo+ph6td1qEWMg2zxbvnnTw==
X-Google-Smtp-Source: APXvYqypKZsEtN2IDSs75Ax0/drBG+Z2G8YvFDfOVsX7TFcmgYZSp6wfYLwvfbr18zQ+gZ5GA+q53w==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr8531923wrw.31.1578545571359;
        Wed, 08 Jan 2020 20:52:51 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b10sm6881574wrt.90.2020.01.08.20.52.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 20:52:50 -0800 (PST)
Message-ID: <5e16b1a2.1c69fb81.12bf1.17d9@mx.google.com>
Date:   Wed, 08 Jan 2020 20:52:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc5-266-ga617565a3afb
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 116 boots: 5 failed,
 110 passed with 1 untried/unknown (v5.5-rc5-266-ga617565a3afb)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 116 boots: 5 failed, 110 passed with 1 untried/unk=
nown (v5.5-rc5-266-ga617565a3afb)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc5-266-ga617565a3afb/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc5-266-ga617565a3afb/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc5-266-ga617565a3afb
Git Commit: a617565a3afbb9d63d26ae168ecdac262d6970e4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 50 unique boards, 12 SoC families, 22 builds out of 214

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.5-rc5-233-g77c957322=
6e7)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.5-rc5-233-g77c957322=
6e7)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.5-rc5-233-g77c957322=
6e7)
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: v5.5-rc5-233-g77c957322=
6e7)

x86_64:

    x86_64_defconfig+kselftest:
        gcc-8:
          qemu_x86_64:
              lab-baylibre: new failure (last pass: v5.5-rc5-233-g77c957322=
6e7)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

x86_64:
    x86_64_defconfig+kselftest:
        gcc-8:
            qemu_x86_64: 1 failed lab

---
For more info write to <info@kernelci.org>
