Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5C9516B7C5
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 03:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgBYCcb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 21:32:31 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36829 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbgBYCcb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Feb 2020 21:32:31 -0500
Received: by mail-pj1-f65.google.com with SMTP id gv17so620027pjb.1
        for <linux-next@vger.kernel.org>; Mon, 24 Feb 2020 18:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3nFKjyolnHA3bCs3kf2rL2ibWNsDOpYdaX+SGbREfbo=;
        b=wVqBoM/LEzKBweKbBI5jAv9kJ4GofuFMVieDgOGk7NiAQ7kBFjJ/d4sHtvmKveiFyE
         W7Z1f/14Eo1ebUr8D0i9PL98tVkUGXafbbFnFm6QI3Kk2MDdX1L8msHM8vNF2MhP2Ph9
         xr59HbJ2BsklOQZFbN9pp0eTppGaKK7D1pMspiGZKl1EX3UfrE1GTpaD8oSZPhRkcWft
         z3FEcATmyVg8dquYQVDQ+aiTthnwMzLq//zUdBE7KXKFO5BXYzZVCSd/9E//iD0z4L6e
         q6Mn+kwCSPZ25WWzvpRMM+w1+MbKO7uB4Xl1ZtPVS70GfHzO6a4pTmIEM3LeIuC9FkXI
         jKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3nFKjyolnHA3bCs3kf2rL2ibWNsDOpYdaX+SGbREfbo=;
        b=AEsRAjQEBlZoVPqPag3PujFXTVvRraaKlkUhU2Dug3SBgNJkn/dEQNr0fIUaLrC6wA
         tgRYiD8UYy4I/hfKhddTAuU+LSPl1d0RfeBspI+c651AEJ5YYFrrpA3KBS8zQPHKZ6rY
         sBgUoEXVs/SKa9FlD69+AohxDP8pmTrHy2fkF2jTmj3v6EDYo9LQVolYWym6ugewtK2T
         icYcljCQ8zQaRzpijwTDZgmG7Od522DaowL8qP+t3YuPv53gWfOqyI/rhFfSDMLfhQXe
         B0JNQfywOHcRoofiUYkosruROh3LXGcNeAA0cT8JcIl5OtDqGTYddA2OK7RezvfwaH9P
         /nQA==
X-Gm-Message-State: APjAAAXIhgY7Lc21jLZZkVEdlP2FofdaVAZkD3FV9oPiI9RUeTyf/rKm
        lwxzChcnb/NQyWsFdSWue6hWEl/VT7E=
X-Google-Smtp-Source: APXvYqyEKtkoQ5Xf5m3LnVN/i3nHygmxHCHPE70Nmtu0fz/yOIdMgmU3N3czXVjA/L5c0DRVi7wF9w==
X-Received: by 2002:a17:902:ba8a:: with SMTP id k10mr54454228pls.333.1582597950007;
        Mon, 24 Feb 2020 18:32:30 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c15sm14202064pfo.137.2020.02.24.18.32.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 18:32:29 -0800 (PST)
Message-ID: <5e54873d.1c69fb81.cc25c.7c65@mx.google.com>
Date:   Mon, 24 Feb 2020 18:32:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc3-186-gfe83899e5f85
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 202 boots: 5 failed,
 194 passed with 3 untried/unknown (v5.6-rc3-186-gfe83899e5f85)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 202 boots: 5 failed, 194 passed with 3 untried/unk=
nown (v5.6-rc3-186-gfe83899e5f85)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc3-186-gfe83899e5f85/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc3-186-gfe83899e5f85/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc3-186-gfe83899e5f85
Git Commit: fe83899e5f85422f831e731df13ca8eca451010f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 69 unique boards, 18 SoC families, 26 builds out of 216

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 10 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.6-rc2-548-g14e518b63=
427)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: v5.6-rc2-548-g14e518b6=
3427)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: new failure (last pass: v5.6-rc2-548-g14e518b6342=
7)

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.6-rc2-548-g14e518b63=
427)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc2-548-g14e518b6=
3427)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.6-rc2-548-g14e518b63427)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: v5.6-rc2-548-g14e518b6342=
7)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
