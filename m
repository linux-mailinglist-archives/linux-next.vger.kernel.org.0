Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CB81A5D09
	for <lists+linux-next@lfdr.de>; Sun, 12 Apr 2020 08:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgDLGa6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Apr 2020 02:30:58 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35980 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgDLGa6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Apr 2020 02:30:58 -0400
Received: by mail-pg1-f194.google.com with SMTP id c23so3050971pgj.3
        for <linux-next@vger.kernel.org>; Sat, 11 Apr 2020 23:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Svac5smL+sO2UekrUUnKcIA+leCvSaPReFIguN8PinQ=;
        b=RxRXZxcDG2vhZda3BkfQhxo7uQbU++C0seVDWlg7OpfbadKCtkijGenaMGwvr8XMqg
         4ieS6yuSpwMNz/Br07xC4r8TR3L5vTkoDI5UAvX7PZ8SrYzxONiBhemn9mpsJyqJ0Z6u
         23z5UtdsN+08ZbQ6/4S0pQYv4L3uHz0oLfR/JmfyHsmH53meTcl9n6Q1Ovd1VTaIFJld
         4PpuRU3u6mZ7WBHc6q3dRMQau223DfX6B+6BjeeKNaANGR9nMQ/A5cIqSXLOfAibXR/P
         TJWWfBg4MDXLZxQDeulYY4RQ9aS4bMxaIVT1mraSrq6QUj044WF1x2OZRHQIcKZXh+1n
         WwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Svac5smL+sO2UekrUUnKcIA+leCvSaPReFIguN8PinQ=;
        b=Jq5t0qBybBffTT6IgscZsMSOE/uRhD6J5XcpX/VFGcEkUURcO5b+XFMOIuUb4jUJ6u
         PzANOrWpC8EQ3/zwy694tvFvvpxcobEQWI1k1Szbn2jvCj+h6yQiF8MSgBmYHYfn6NWR
         RV/ekD7TTQ4DuATFF+eZROlOCSt/hPAd2QIu/jQStpX72Ql9nXvIt4VRrb1GY7ReqJk4
         VFs2Cw4CDWmVkNK3y9S8PS7+cdffsBIjSqGEtpTUrrJ/2+sqNYE56Oio8nUpmLKFj/l7
         EzI1iMeaeftEBaEamdE6H3p/ZMNn+mqgXZuJMX2OM1vtEC08k1cBFqKtO20GLFbJW/4l
         +WqA==
X-Gm-Message-State: AGi0PuY+L+dm3FtEJYYObJPB5ozMCWzC76OnmwoEQ8aUc6WELUZaZtp1
        MSk3uroGK5JuvPaJr1K/bRaDZGA0Sg4=
X-Google-Smtp-Source: APiQypJxUwhMPqEUAlMz2l0L74tOVAwm/LjTYD8+4PiJqc/7s7QeBo/2DBYXzYAnBhNhj598q6ErTQ==
X-Received: by 2002:a63:1d4:: with SMTP id 203mr11312130pgb.74.1586673056032;
        Sat, 11 Apr 2020 23:30:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y3sm5483578pfy.158.2020.04.11.23.30.54
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 23:30:55 -0700 (PDT)
Message-ID: <5e92b59f.1c69fb81.d36f3.30a4@mx.google.com>
Date:   Sat, 11 Apr 2020 23:30:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-12833-gd8068e4ee00a
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 207 boots: 4 failed,
 196 passed with 4 offline, 3 untried/unknown (v5.6-12833-gd8068e4ee00a)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 207 boots: 4 failed, 196 passed with 4 offline, 3 =
untried/unknown (v5.6-12833-gd8068e4ee00a)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-12833-gd8068e4ee00a/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-12833-gd8068e4ee00a/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-12833-gd8068e4ee00a
Git Commit: d8068e4ee00afba50bce03f6045c30e6cbe7f0c4
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 22 SoC families, 29 builds out of 217

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12726-gcb0=
447b07277)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12726-gcb0=
447b07277)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.6-12726-gcb0447b0727=
7)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.6-12726-gcb0447b0727=
7)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12726-gcb0=
447b07277)
          meson-gxbb-p200:
              lab-baylibre: failing since 1 day (last pass: v5.6-12503-g3a0=
f8793ae13 - first fail: v5.6-12726-gcb0447b07277)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.6-12=
182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
