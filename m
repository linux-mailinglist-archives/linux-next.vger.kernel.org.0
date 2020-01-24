Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9F5148F2C
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2020 21:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388015AbgAXUNn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jan 2020 15:13:43 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]:53279 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387535AbgAXUNn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jan 2020 15:13:43 -0500
Received: by mail-wm1-f46.google.com with SMTP id m24so659406wmc.3
        for <linux-next@vger.kernel.org>; Fri, 24 Jan 2020 12:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vzpZ0ogaIvLoQtiHl8emXnXsd6gq0sBujp+ICIaMSRE=;
        b=TfZhXQ3AJ9Bn6mot3QoVpvwa+DkhWxd70VJkH69sDYtlNXFVviV+8mJTC2VHgsVcBh
         scRtGGbkN+P3zoEzgMsYhzmCgh3eVNMNovSnSprWaSoS1UQfPKyPL0r6fUJ9i/ZHdO1M
         1Gg3ZyPuCwtcnTBYPSnxtYcymkFtcZmQHWB8f7wQy36GY0qQIaZ1LzM1mqD5qLA2ECi1
         3wic6Cq5fDLZcktuGC5ZLrl/IhRd1If1kWjZg4jiAWcCc8tFZsu7HKn06B8j7brgM03m
         4F49gn2rdKnhhIOqTs7StP9hqYaa65NxC+7m7AjSqxEh3coJmAUb9TzvEwzqc/8snVsB
         VHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vzpZ0ogaIvLoQtiHl8emXnXsd6gq0sBujp+ICIaMSRE=;
        b=SIwQowseuaAmXczT3izxPPxqNuUUATYJVzJwovpTcTtQtXmUQIEJNxod3LbyCsMhhu
         e6+pbiSVmNi9f4VonxOWFYgjCPfI4OnpezVOqPULpHOW+nVM/lLjv15OQS10XULHfm/c
         +UHyTN3z1142YiuQgCwvTTi5X0vT9NbJ1h8FVr5fTN0OVs2WDzts5+STWzH1fPAv8KVt
         MnePhuG5ebGXV23YZpOa7X/PjmiCHg63IToNf8GwEMp2SY30cBp94xJraOleDPmK8MyT
         xcxnIDj+OjQaei/uU9V8kZCL5kTzfGPdSsT7aPtu/b8qzpRyCYKsXzLhVkcR0MrpTUtt
         G/IA==
X-Gm-Message-State: APjAAAWwkyLuBmZzCEEs3LoItkSScF2XfbJjEaEdn+NPj0QyMQhjFmc4
        M4W5AdyRZclWJmqMaxdI6TtU/c0w1s914A==
X-Google-Smtp-Source: APXvYqxSbFv161/H0ewEF/oyFDc09S9AxtHrFPGchsLyDMwSE1hm0q5msp6cJF4u4iiVgtKi0TLlhQ==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr462675wma.138.1579896820159;
        Fri, 24 Jan 2020 12:13:40 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n3sm8440440wrs.8.2020.01.24.12.13.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 12:13:39 -0800 (PST)
Message-ID: <5e2b4ff3.1c69fb81.22b9c.49bb@mx.google.com>
Date:   Fri, 24 Jan 2020 12:13:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc7-366-g2e30f8d48084
Subject: next/pending-fixes boot: 265 boots: 7 failed,
 248 passed with 8 offline, 2 untried/unknown (v5.5-rc7-366-g2e30f8d48084)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 265 boots: 7 failed, 248 passed with 8 offline, 2 =
untried/unknown (v5.5-rc7-366-g2e30f8d48084)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc7-366-g2e30f8d48084/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc7-366-g2e30f8d48084/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc7-366-g2e30f8d48084
Git Commit: 2e30f8d480842313c3de748bedd0a469f131f12e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 26 SoC families, 29 builds out of 210

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxm-q200: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

---
For more info write to <info@kernelci.org>
