Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022F2127833
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 10:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfLTJda (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 04:33:30 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:40215 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfLTJda (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Dec 2019 04:33:30 -0500
Received: by mail-wr1-f51.google.com with SMTP id c14so8708133wrn.7
        for <linux-next@vger.kernel.org>; Fri, 20 Dec 2019 01:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Zuh2ZSP3DfllxFcJRtUPhgXKUPJVYzI3/bJYFuEcDQ8=;
        b=FceX9V/FATMJmsHMCH7Wz4WFnPhY3smvNMnYtQt8pDd814GduEDWr6XwxxUMOjA0iU
         FtOpBLIJz9if4lXU734i9MMaxxMaqvAnJSNyA7vO9oPXK+XbYYRcyoapr910IDLIGPYh
         R784wD6y4OFUcvbLlE6tByBnoX/mef+SSRcMqYKbPtGtw6kA6hsYdxyjw/8+vSqteTbW
         2CJJaQYNKoVy0aoK0/+4uLCum6JY0htoMlkAuSw8YQhGvIahVFBUhUtVLkE+FcmrPPGQ
         4RFVV/Hgb8b0JIrIm610YxsQMJM87JJoNz7f71uEAy7sXtv+uoJW90vWGF1etTGHqLq+
         KRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Zuh2ZSP3DfllxFcJRtUPhgXKUPJVYzI3/bJYFuEcDQ8=;
        b=uYuO0jUA5cYpZlKv0OGFGrDHPUmEpJfgyO+gv9GnRZIObLb5Knbya8F+Sv5oEmXOmM
         s9kZxzGMTd6S9C9Yq6VDuIogFUSDNrzIC/USC3jyw37dLTxt3FRN3HX++csyk69mN53/
         D4bFst0bzoarDu0tStTYeyivu9/JbWK80WNPP4qZPgQnz+I2D7V02uKI6ytEzbJy2Nbl
         ClM/XcEO2lPyxPHBk1oEZ6GXu+OXOKOy8uCPbs8uPGDZzZVmYXnxQq6JmtPS6q2j3zhZ
         6bd/vEpF6coL/g6UrBbLyJcFgklMCAfhUQRF585//Vq0Yfa6I5YlTEagGp0NsyVGH4tY
         1DBg==
X-Gm-Message-State: APjAAAUdKql/+4FfQje5/CwifYRqJxPtdJbLbHPhOMbiq1UJ103Nbv5t
        ap9UFEAMLzkVX4T0bDPesVVrZuaGOQBAiw==
X-Google-Smtp-Source: APXvYqzzeDDw+HhTsfuzusAvWIfdla1aujkzbx79SS2lfCZ0dprz8nEz5/jXS1o/aP9FD3vemp8mBw==
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr14080291wrj.225.1576834407465;
        Fri, 20 Dec 2019 01:33:27 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o194sm9447896wme.45.2019.12.20.01.33.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 01:33:26 -0800 (PST)
Message-ID: <5dfc9566.1c69fb81.a0c92.01ce@mx.google.com>
Date:   Fri, 20 Dec 2019 01:33:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc2-549-g9125728fcf86
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 219 boots: 3 failed,
 208 passed with 5 offline, 3 untried/unknown (v5.5-rc2-549-g9125728fcf86)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 219 boots: 3 failed, 208 passed with 5 offline, 3 =
untried/unknown (v5.5-rc2-549-g9125728fcf86)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc2-549-g9125728fcf86/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc2-549-g9125728fcf86/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc2-549-g9125728fcf86
Git Commit: 9125728fcf863412fb80f042c39ff891ab9f48c4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 23 SoC families, 21 builds out of 214

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: v5.5-rc1-399-g9626c50a1d3=
d)
          sun50i-h6-orangepi-one-plus:
              lab-clabbe: new failure (last pass: v5.5-rc2-502-gd5e7f2ed7f9=
5)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
