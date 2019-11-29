Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C00310D0A2
	for <lists+linux-next@lfdr.de>; Fri, 29 Nov 2019 04:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfK2D0m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Nov 2019 22:26:42 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36587 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbfK2D0m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Nov 2019 22:26:42 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so33255233wru.3
        for <linux-next@vger.kernel.org>; Thu, 28 Nov 2019 19:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ilzUBt3E12WQXceTqHgpx+rWUBlwtHU2RUoTzA/4SSA=;
        b=ouY5zk+aPHrxuMne8UihZrYf0oTazyla7nGAfPH1JsGyL8RnDFLHeRT4yx5CpmGG7x
         vWFGvVfzxn5/wfgnpWJglCKm15pJPwoltsC/SPcF4MpVReKUazja9j1lOjqXsz+7AmRY
         CnP47dOvUpPuGP5d7+UT9vpz/ZoKO3zB+N+Qe58FLCsDWLRWHe0TVoIPRnSJsVR2IoJ6
         Dn5PY0MRZXOWCSEmwvLQefUKJpK1f56VDOS1fg5m/Xo8pWonqmiTdyC5KFx4sR0jAYXH
         Dwu90cM6a5mfHlY5LuBLUeSSefuE+fLKbBeVFLEvFAZ5+uAY6bUUeKi3by3M+FoCQFsC
         kPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ilzUBt3E12WQXceTqHgpx+rWUBlwtHU2RUoTzA/4SSA=;
        b=PjSsb86TbOatRf8wWfKsJc4MEnE2N/vLhYFPQ9BNMqKLNkTvSJmovIEHJOaOatYiGH
         BfSu6u2TWbZ1fod5MYX1z+x9lzPUdNg43/zq0+fMO2XwvDKu+KFUmWTnPraT0pkGOQxV
         wFF6fHWjj5bfe8usUMvagRu657YQOIJ9A4Ac9vHYPqm1SPZO+Cpj/HWTtZ84katYlv1t
         idJMPvQMRkqBFePABAuO9iZ1i7307ywc7G5hd9Q9ybtg2hyFm4poAPDXwS1Rwj7TGari
         LjF/Sy3elc9KO8DHSNH0HWDx1l0RYEOV5xbUnp0zHKg1MlU7peEJpjV5I9ps6ZW7qIz/
         +57Q==
X-Gm-Message-State: APjAAAVkjouXmUKX8iVeIusHZGWUjzrtJPIy5Ql27Cx7SRJTEQbFvRCn
        m1o4Qo+jaBfBEXgY7pImZ8XuhOvQNgth3A==
X-Google-Smtp-Source: APXvYqzW1kjUP079OTdyJi+MgPuTsmKq+fHFXkAcSB+GAuCqCYhKs2/0YfQlA+G6+GZvdV9vvxKW1Q==
X-Received: by 2002:a5d:49c4:: with SMTP id t4mr45121970wrs.226.1574997999605;
        Thu, 28 Nov 2019 19:26:39 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id m9sm24691866wro.66.2019.11.28.19.26.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 19:26:38 -0800 (PST)
Message-ID: <5de08fee.1c69fb81.3ede3.f229@mx.google.com>
Date:   Thu, 28 Nov 2019 19:26:38 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.4-8981-g4bd8408b6dc3
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 211 boots: 3 failed,
 201 passed with 7 offline (v5.4-8981-g4bd8408b6dc3)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 211 boots: 3 failed, 201 passed with 7 offline (v5=
.4-8981-g4bd8408b6dc3)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-8981-g4bd8408b6dc3/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-8981-g4bd8408b6dc3/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-8981-g4bd8408b6dc3
Git Commit: 4bd8408b6dc31f3868908402d7df411517a015c4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 24 SoC families, 28 builds out of 217

Boot Failures Detected:

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

---
For more info write to <info@kernelci.org>
