Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2ACEC2D81
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2019 08:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfJAGaI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Oct 2019 02:30:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50878 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbfJAGaI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Oct 2019 02:30:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so1880726wmg.0
        for <linux-next@vger.kernel.org>; Mon, 30 Sep 2019 23:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=altJetquCl7xTNrrZKGML906jounARgBBLrH7amsD/s=;
        b=gmJ0GfdmPBkdJnRaknfIppNpNjsgIWYepntQvpHn6yUc+bXvHZpzgOzm1hkgSMZQEl
         v/DqejhNcca9XCYLt/o14mjGhIb5vJL9dQrBaIfjuyTnKZy4HWB0SbNWsDqtLm+kzcSE
         3i7kYRdLyLOMDRJoAMWnum0afnWF8+TRgDGltzPku40vBFTnx+QJuoAIp6MJXNScyReM
         6/1bmgnFrZrsV75PBo61VB7GrGJT8HysWrX/YRhWQXeIP9GVoFegZ4WkOLvhGcvIqfLh
         ctGt9XMHuxvpo5MvXbVH690jmrYgcXbhJFUX+hof+3oW5ohU+lTWM0MdUNIILSRorKrU
         dsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=altJetquCl7xTNrrZKGML906jounARgBBLrH7amsD/s=;
        b=VFUbH/Q702qOWx1ZpGdUxVLtPo8nGRQZ6NUSq9z9O7gABjdYXEC7IgiGFshMWC3I7T
         sjSTLHQvh6XDizc/gCWRjvpvUJgcvrj43ITc4d3odsRemsZUk42js7xNZoGsUZqAIVw3
         +IK1GtlRf6aF5LACT3nm06AWL0PQ39eMktY4mhuhORzX04xubd+1TqOHPgtK0x7xXWe0
         cKqC3+C2AzR9+D9qPxKQCmjiIkOVoQt4R1JCAS6fInabhzL06PNf54EgYhccS3O29Ho7
         Y/7M2av1kbb+fRpqbX4vuBvWyeFzBsEVZ6iDjHd/kwOOt8fQ34IqNUYaVf7ItftzKe/y
         9A1w==
X-Gm-Message-State: APjAAAXav5kn5U23KPnfwYYDON0XK9rwO+F3UwRj2zQXevrP9ea4cEjU
        wt6LDKU7HEMKq6Jvlo4kQiz5mcEVRqcMOw==
X-Google-Smtp-Source: APXvYqyFeV1CDm0qm9jMw5YOmHWzfxgrgWJxEBe6nsJzDReN/tLBrBtf9TOXh4qdDJ8weaABhJlwBQ==
X-Received: by 2002:a1c:9d0b:: with SMTP id g11mr2121634wme.22.1569911406030;
        Mon, 30 Sep 2019 23:30:06 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h6sm15434167wru.60.2019.09.30.23.30.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 23:30:05 -0700 (PDT)
Message-ID: <5d92f26d.1c69fb81.26ba4.609d@mx.google.com>
Date:   Mon, 30 Sep 2019 23:30:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-91-gae083b2a11c7
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 214 boots: 10 failed,
 203 passed with 1 untried/unknown (v5.4-rc1-91-gae083b2a11c7)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 214 boots: 10 failed, 203 passed with 1 untried/un=
known (v5.4-rc1-91-gae083b2a11c7)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc1-91-gae083b2a11c7/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc1-91-gae083b2a11c7/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc1-91-gae083b2a11c7
Git Commit: ae083b2a11c74328112ccfce4981a6b6e0a45f8c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 52 unique boards, 15 SoC families, 22 builds out of 213

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 1 day (last pass: v5.3-12689-gd2=
0eeb14322b - first fail: v5.3-13311-g8d0cc3a7f82f)
          bcm2837-rpi-3-b:
              lab-baylibre: failing since 1 day (last pass: v5.3-12689-gd20=
eeb14322b - first fail: v5.3-13311-g8d0cc3a7f82f)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.3-13311-g8d0cc3a7f82f)

    defconfig+kselftest:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.3-13311-g8d0cc3a7f82=
f)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-13311-g8d0cc3a7f82=
f)

Boot Failures Detected:

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
