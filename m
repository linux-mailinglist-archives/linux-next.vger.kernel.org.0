Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C0BBBFDB
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2019 04:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403911AbfIXCDP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Sep 2019 22:03:15 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:39837 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408472AbfIXCDL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Sep 2019 22:03:11 -0400
Received: by mail-wr1-f52.google.com with SMTP id r3so65040wrj.6
        for <linux-next@vger.kernel.org>; Mon, 23 Sep 2019 19:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ghDTPJbP6oLZsAtKUa+BKCKzEIbpv8sc/sYMfBTfWl8=;
        b=ZpR2SlJ2UE77gt+I0lKuFCY/3OZani6wA8yH2En+oVej26aug2/6tiSdhIg3yFBStd
         Bkqlo9Gei3opJ3ZFf+CJCscMh14rkysp7/qOPUZaIQpcMbEc/ah2DtkQ/Y2Luj0mRZuq
         UqFldfQt5PS36o0GIqGNZoKColeARZJwnOokV5Wwd1/YqmxhgaWkyU6TYnOQlfqgiUKg
         Ivb2gzNWnnveYs3wZ8YrJ2W4YkAR6637TIcTmcpazE1bYBH5+lauSdqFaNdl2jXCPR6N
         bF/b9snnQr6olaSzSzzvyJuMJ+hijqba2mtqWH56sSpxCV/Bia0Y2m55QwCu90oefXUu
         84dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ghDTPJbP6oLZsAtKUa+BKCKzEIbpv8sc/sYMfBTfWl8=;
        b=qDoTz87skZH1/nbos4xVfSYjieSZxvC2r6RcjfnEZ9+ZjJ2oihVjEfyZvINqh2I0jw
         nc/fsTfbl7qbHv2nNfkfw5sVePBpWprBTdYeq9lL0UJ1KsPhV/i43eOeAFTyOSjJ6TbV
         rQfpBBpY7zAFNQ8ICw5GV1lrfGxWZ27BjfdlBWwxgxuZ5HiRUfqw8VcnO3fg9sKkgMtP
         F4T9qlqOIanmevA6N5sJymeB+kykIJdCjBCyKIKciSb2wKEA77iEmdVEE86wepfFBVdB
         9mbWl8AynTXOGc/sQncIywfmVNlGMJA3e3pgqD87/onpl0hU1PyvGid5feay+ghgPHQY
         qzNA==
X-Gm-Message-State: APjAAAVn5LGAbo9DyUFcVI6+1t5KHJl9icILCUTZ7ozC9lyysFUMIPkR
        WuFnkK4/Ry5J777eHWEiEOh6LeNu0svmHA==
X-Google-Smtp-Source: APXvYqztFfIJrZc/r0i5Kdj97IdG8yUECfZEiuQ/u7gMK6Sdvh7MgadLY9oI69HApRYe1Iec73oqMQ==
X-Received: by 2002:a5d:4f0b:: with SMTP id c11mr226450wru.63.1569290589176;
        Mon, 23 Sep 2019 19:03:09 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c132sm192140wme.27.2019.09.23.19.03.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 19:03:08 -0700 (PDT)
Message-ID: <5d89795c.1c69fb81.c312c.0c57@mx.google.com>
Date:   Mon, 23 Sep 2019 19:03:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-11900-g8bca7701fc34
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 307 boots: 14 failed,
 280 passed with 11 offline, 2 untried/unknown (v5.3-11900-g8bca7701fc34)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 307 boots: 14 failed, 280 passed with 11 offline, =
2 untried/unknown (v5.3-11900-g8bca7701fc34)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-11900-g8bca7701fc34/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-11900-g8bca7701fc34/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-11900-g8bca7701fc34
Git Commit: 8bca7701fc34e3e5e6b5a3c037c3afe692c0cf4a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 26 SoC families, 26 builds out of 214

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            mt7622-rfb1: 1 failed lab
            qcom-qdf2400: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
