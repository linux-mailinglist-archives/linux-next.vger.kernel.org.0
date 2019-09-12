Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6B1CB14D6
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2019 21:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfILTk1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Sep 2019 15:40:27 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:35262 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfILTk1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Sep 2019 15:40:27 -0400
Received: by mail-wr1-f44.google.com with SMTP id g7so29785497wrx.2
        for <linux-next@vger.kernel.org>; Thu, 12 Sep 2019 12:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1k6x2F2wI4IK87XZLsiOZoRWFJyXnAiIyjhxW4JycPc=;
        b=FL+dRFFygGLrG3bHHnJdfExwYoj+u/kclt1xjTHRJKGIioJCZGyTyL6fWBHWILYG/q
         YOiAtSvedLszplJQvM5qAe+E1CWGchWqFm4xmOlROEAYkCQ5xgX+vTtyXvb1tUMolqX4
         TmjKBBWMHRu/NbCWGhhMNmb1WGaMrYxUwEy+gHV3izI06PFvbW4sxnggC1eEKIG/E3cx
         H5Ww2RWnHCnXizuMX46PpKK+qEJClIkBC+0fviy4NGgm32G6iDSsqpLoo+qxvvzYASi3
         TE7lUcSi9orGaZWRsydTG0oGtSkMYjIgTchcanPpe40wggcucmuOhBLlBWqWOxRFe/Qn
         0Xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1k6x2F2wI4IK87XZLsiOZoRWFJyXnAiIyjhxW4JycPc=;
        b=A6M1r8PLe/SAo/LjgUa3DPuOpcHNsF4EMZsuU474U5qBXy9NEcofokgMW3aq8w0kdR
         R0XVFHyTdZp0Sou3ZGWEDs4WxANHrqHDfyFeXiBVOMiTBvYLalYQ6iFifETH7jgnRlXd
         RePDZGYuCvF2KCLZ6rtYMnPTTSbmeZYFMBRmMTASm9e+l1qLj0QfpvzmeXh7upSZDiem
         9Wto5hM/YYPJ8tLOPslBRl1XsuOnKYRukRG5/mkVc+N9D+YxfVAm+bIncXjTa7E+X9UP
         84ayJaE+cHzSGQS7mvzccntGcRhTn8s3VKrc/jH7dR0F4w+HvB9wm+EF8pqEfz9FkhVP
         wYYQ==
X-Gm-Message-State: APjAAAXqcwlSUEMtRmqlKbF2T5W5v0+UPK1hjT3BV7mD5PmPt9PYHfO0
        A3nw0LivX1emdOJicQIJe7tSHYCsBPM=
X-Google-Smtp-Source: APXvYqxcXv8o/RTMIQj98geW53Rg8UOUpIVMAmBmMZ7p+ISV2w2xJ0fY63zVzdk7r7Tb90KKjK/vRg==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr9027481wrq.214.1568317223795;
        Thu, 12 Sep 2019 12:40:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v6sm249923wma.24.2019.09.12.12.40.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 12:40:23 -0700 (PDT)
Message-ID: <5d7a9f27.1c69fb81.d28f6.196a@mx.google.com>
Date:   Thu, 12 Sep 2019 12:40:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc8-192-g7931faaade95
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 318 boots: 11 failed,
 295 passed with 10 offline, 2 untried/unknown (v5.3-rc8-192-g7931faaade95)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 318 boots: 11 failed, 295 passed with 10 offline, =
2 untried/unknown (v5.3-rc8-192-g7931faaade95)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc8-192-g7931faaade95/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc8-192-g7931faaade95/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc8-192-g7931faaade95
Git Commit: 7931faaade95204384f3b02b2a39dcc431b278e7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 28 SoC families, 26 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

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

---
For more info write to <info@kernelci.org>
