Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 144E3B3381
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 04:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbfIPCt7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 22:49:59 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:55874 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbfIPCt7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 22:49:59 -0400
Received: by mail-wm1-f47.google.com with SMTP id g207so8265615wmg.5
        for <linux-next@vger.kernel.org>; Sun, 15 Sep 2019 19:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1Yqo36Qwxe5ajwWCtW2/pvXwSr2DRje75hOCa0jlusc=;
        b=n8EGRm/oDwqMlfoOTMyHNAiEh4VZMY+sIZhGUc44Sr1iaerP6+FPnS5O9UaCNztKbg
         LM0qIxUZn60ozdP1464H147uUU9AlUD5Sz+SMurliwSygOEdLNxzn89cS68hlo5p5hXP
         vhnJQ/FbWBgZWRoW7jUi+owyQ3AcooPF/IzqF9Xmoaiil4j5MVL9Gg43yjE/MH6beWvy
         gZYAHXMd0szareqPhJiCCAf7BPoFR9uQGdT5ew6yohYx56GU1CTJCiyTSlLTY+eUc1QN
         L/1Ry7lu1ADeMc7mcDTxl8L1onmPaczhYTYO43VprDj9DHBifxhKA432LeE2C7Ukyy+z
         2+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1Yqo36Qwxe5ajwWCtW2/pvXwSr2DRje75hOCa0jlusc=;
        b=L3zjyKc+bTrkGDIghBO7wvtnmpE+n6Z8PK+oX9FlXljqo/w4DWHLHWTgHhqQusIlL6
         7cVmmtpByV+3BRzVwY1k/7JGAUKA/f+8Dm0y7+nbEusM39waFiwBxyQDjCC4sgnUJhcq
         f28rJl3Jtd4u4UToYTCWc3XynPS3sjN0KCJG2Zo3msGIcVmB5L3gsa9S4rA5Am5HmCeR
         c5u2APUK33Ov/JKa9fsqnu0m4tHAAifNq+VN0+lInd9MKXbh6wOjx1g5DUImrdBRcgDE
         vNONOzdMBaoCh8SUK9qQ2toAeqSA/6X1nv3Kc/b+nR1cALdDkfc0N1UMDmrs0C0mKlwD
         3FUA==
X-Gm-Message-State: APjAAAXNMI473sE15tyaOVJGbKvjbuo9HdTKTbALCRFn3moaFPfrxQgq
        VQpynFRpDUFSQMr1W+e9Rr3KhfMQK98=
X-Google-Smtp-Source: APXvYqy4cEqnMl9XsXXrEYrdga4VHq4VZWv9unFMS0KlJS3lVf5jga2P+E+vdsEUMU4ZDNm6HUUGnA==
X-Received: by 2002:a1c:a54a:: with SMTP id o71mr12653123wme.51.1568602195900;
        Sun, 15 Sep 2019 19:49:55 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w8sm25470179wmc.1.2019.09.15.19.49.54
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Sep 2019 19:49:55 -0700 (PDT)
Message-ID: <5d7ef853.1c69fb81.2b355.dd5e@mx.google.com>
Date:   Sun, 15 Sep 2019 19:49:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc8-720-g379eb0fc5e9a
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 309 boots: 7 failed,
 289 passed with 11 offline, 2 untried/unknown (v5.3-rc8-720-g379eb0fc5e9a)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 309 boots: 7 failed, 289 passed with 11 offline, 2=
 untried/unknown (v5.3-rc8-720-g379eb0fc5e9a)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc8-720-g379eb0fc5e9a/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc8-720-g379eb0fc5e9a/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc8-720-g379eb0fc5e9a
Git Commit: 379eb0fc5e9a0a9c81d546ce0e03977bbcb5ae7f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 27 SoC families, 26 builds out of 222

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
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
            rk3399-firefly: 1 offline lab

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
