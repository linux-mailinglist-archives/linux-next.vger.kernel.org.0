Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE24417A898
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 16:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgCEPNC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 10:13:02 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44074 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgCEPNC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2020 10:13:02 -0500
Received: by mail-pg1-f193.google.com with SMTP id n24so1898049pgk.11
        for <linux-next@vger.kernel.org>; Thu, 05 Mar 2020 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=z6fDZr3zFczZ51xW83mDjTfB47fwGZoHGxLu3ytAico=;
        b=q0f2ku3deLnyG+/hkH+n1X3bgimb6Ao5wZeaCXinLffRdo0QiiEBsFZQsGXTBiDw9x
         gVvOW2u8eQ8/U3rbgZprt883NOd+sOo7Sk3T1EB9KLIKJfcCbqEBArjruXWfKQhhrkUe
         dCa3gNj8QeQdXiEo7vIiXrhk70gi6QCbaWubA1z7iqZMBop5hgtKUR8zV3fDxP5n2+D1
         oACmwdmE6un16byLZ+88gkMZDV0akLTzIY278ktNvWAWRf5si9Fn49nQLEEOtTOzJdDE
         z0lL/Tn+6+gAUy6zyq1aSyMX1xX5Sw7nvp5kQSGOTEU0YyX1bkiRZOmo71IIYElmTDt6
         jv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=z6fDZr3zFczZ51xW83mDjTfB47fwGZoHGxLu3ytAico=;
        b=knMhMhDDxa7OXaiqx9czxWUm0debH3+1VOeIVtaSLfwaJE2MtqwbT/1Zw3yO8qRZT6
         ftSV9iHSfyFtK8/1x8tY8dqsRxWPoS77FyFO9jp/m3IGxTLAOD4+iEAOMl03ssrGcDbw
         v0mBuneTQP45RV7ra+kFFt3SXTIiWQun6VTGPaZTW3/4KBoRRS/AlIpSHSKTAmHsCL4X
         +hRtQDqZbYnOsXKDFuU7dvmxNeMzAX/UiMoeOlwvMQYVRrKPPCj4pt9upZIIpcRygAL3
         aBhEICKBWqUC2eWxT5KfHqVrZIIcHN8684HmB6jT7TMgqurq6jNHANUbaYB4T48sKYXE
         VvRw==
X-Gm-Message-State: ANhLgQ1om7TVvOrJSsj27WOH/Tnxj5WT7tbGTbRHkd64t5YAIsew6Bd9
        sOB9HX0Z+r3FneLiJjPU+y1RoDytGV4=
X-Google-Smtp-Source: ADFU+vvUtAieZlPTrLGEqV1HmrS9gPtEJjbQIP9HJjcQxhc9kNMfapC7s0MJ+MxxOws6itXi76ySGg==
X-Received: by 2002:a63:161e:: with SMTP id w30mr7702590pgl.110.1583421180565;
        Thu, 05 Mar 2020 07:13:00 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x66sm21188329pgb.9.2020.03.05.07.12.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 07:12:59 -0800 (PST)
Message-ID: <5e6116fb.1c69fb81.f08c3.56ac@mx.google.com>
Date:   Thu, 05 Mar 2020 07:12:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200305
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
Subject: next/master boot: 195 boots: 14 failed, 173 passed with 5 offline,
 1 untried/unknown, 2 conflicts (next-20200305)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 195 boots: 14 failed, 173 passed with 5 offline, 1 untrie=
d/unknown, 2 conflicts (next-20200305)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200305/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200305/

Tree: next
Branch: master
Git Describe: next-20200305
Git Commit: 47466dcf84ee66a973ea7d2fca7e582fe9328932
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 23 SoC families, 27 builds out of 329

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 16 days (last pass: next-20200214=
 - first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20200304)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200304)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200304)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200304)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200304)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200304)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200304)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: next-20200304)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab
            sun4i-a10-cubieboard: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxm-q200: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

    defconfig:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    exynos_defconfig:
        exynos5800-peach-pi:
            lab-collabora: PASS (gcc-8)
            lab-baylibre-seattle: FAIL (gcc-8)

i386:
    i386_defconfig:
        qemu_i386:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
