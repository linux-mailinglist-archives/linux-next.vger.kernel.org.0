Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B3D1086B2
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2019 04:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfKYDGt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Nov 2019 22:06:49 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:38861 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKYDGs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Nov 2019 22:06:48 -0500
Received: by mail-wm1-f41.google.com with SMTP id z19so14149778wmk.3
        for <linux-next@vger.kernel.org>; Sun, 24 Nov 2019 19:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GEsEO+QiizYNK0lxHBNIQq36WwGYW49fMS6A7VY8LXk=;
        b=iAPJukw2aD65DoziM/jfioPZkjEyzEfCqVFcrMdkDrwglgIqdQiN3GaNYeSVfq7TrO
         oOpr/ZHKNSc5fZqCgVL7SqVYku6+BAU/Utkpo7PNefdjpC00jRDvvYibuB/vyLVthdP3
         yGjXredCoA2DSekv749sQ1BOiLT6z8wZzF+dcI2l7g4SqrNGvZCrfe4Nuo8Oo5dB4Z7b
         ZP9NV1xbWFcuVgxrgzVFUqXfjtUMp9QE07GLQrt0BvTJ1NEenw+OQi9wfJrlTZvQZo/y
         +LntZb8ZVWLXShiWR9tvWbidcGhFdfyciZA13pU1KK7mmsjOlSqpOX29KMG73bifgEU3
         tMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GEsEO+QiizYNK0lxHBNIQq36WwGYW49fMS6A7VY8LXk=;
        b=PMbIpIT4gxzqWYmxkinLjG5rdoZm7FEauRfF1OtGyvQoh3WYE63FRT2WCpOgbtubl/
         /wHD6pH7hlrIUszLSQY5MdM6znQ2gNugk0fADeqc2t7arxcjGcnUuwwx9GG98JcPCr+c
         y3vDMiT3c4Qx4v+0GtBS+qKgE6OU3TZBUqwvxnFje1dqL6UGSUnuAaVxTHWe5eMXnoZ7
         06q+DRS14YkMAbz2ULLGFRqLCbAe9NW9LjUgViSNRtn3y9LJqwXLCx1ZfH183fu0bXxt
         pWjn4UuqT0mgRNzeYwTykf3BElqRgLydeZg7lvqsNdBmP8m1RnlkseB/dfLGFsq7KN+l
         JlDw==
X-Gm-Message-State: APjAAAU6ISfwAxGaUPZP+MwZNUDFtRrgcgbjKLqjS5Hb5L63lw9rjPms
        EzdrnuRdVBBDUsjXarG5zkhZRRrrmNPytQ==
X-Google-Smtp-Source: APXvYqzgm+riqBOjSdhNHBkHObZ+hRMqOHEiwPjAorZAe5Z6BcigIXHIxCZYxSX6zoU4z40gQ544mA==
X-Received: by 2002:a7b:c768:: with SMTP id x8mr27564050wmk.26.1574651206501;
        Sun, 24 Nov 2019 19:06:46 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c15sm8624624wrx.78.2019.11.24.19.06.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 19:06:45 -0800 (PST)
Message-ID: <5ddb4545.1c69fb81.963e6.775c@mx.google.com>
Date:   Sun, 24 Nov 2019 19:06:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.4-rc8-192-gdeacf707906e
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 265 boots: 4 failed,
 254 passed with 5 offline, 2 untried/unknown (v5.4-rc8-192-gdeacf707906e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 265 boots: 4 failed, 254 passed with 5 offline, 2 =
untried/unknown (v5.4-rc8-192-gdeacf707906e)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc8-192-gdeacf707906e/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc8-192-gdeacf707906e/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc8-192-gdeacf707906e
Git Commit: deacf707906eaf4b42afb53c7be4352580b680c4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 27 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.4-rc8-156-gba9fc86e6=
953)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
