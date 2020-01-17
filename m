Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21237140468
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 08:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbgAQHS2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jan 2020 02:18:28 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44981 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgAQHS2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jan 2020 02:18:28 -0500
Received: by mail-wr1-f66.google.com with SMTP id q10so21590390wrm.11
        for <linux-next@vger.kernel.org>; Thu, 16 Jan 2020 23:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=C3KliScJHAfZgtxBm1Dp+uiusRNQqDKWrjJFyor1Zy4=;
        b=buxC4AHLVp6AZ5s6/Z98zggLIeo3XizYJtAR/fPAA1hw29rguIDT/IomF4ExJZn04V
         CgfqsIsBcXjsQ281+biooXp2Ju9S26W4D2ulsXQ60ry2nS3M4LYifbxnipg+R0OyVNcs
         NCE3akPx73gJusGYDvjFmuRQci5vXMq3ba6a+IVVAJKz4RKSAsA3tOw2la/lgPNcABiy
         AVS/Rb6Xq9tED+AH8+BNDfUjH1p9wotrMly44gko54lKZ0pIXtupC+IrGr1IclNg96Xl
         vautT+Ypo6OVP4HB5gicOJ1s9JwpK8BhEDGTHP9R7UsU6sWmqK2l5BhVTMI2nI75Ec/b
         RLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=C3KliScJHAfZgtxBm1Dp+uiusRNQqDKWrjJFyor1Zy4=;
        b=T5a4gBWkE41jHM6GtNsqDnfuW+C83FwLcdgDbg+v6yH1haZJjij+jVTzqAMeDo+t/4
         nd/Zxpgjld4AsLL3WaeyeK4gfmqvquottNj/heprnW+dJIIcNbaASqptwEWfbvQwcO1B
         qlQWb0kLxmkOaHvHi/HLUVThBelsnSDbqUfe1LVHSfropIACFu4mUnmWfBxsJBGRvfEb
         4WbppJM7LFqRz5aU0pupF4ajsRs1IT4StoPIGZFOaB8Z7JUm/b6Geqg78XmTeXHeQqo2
         OsKOywijA5h5mJuqrtbCZi95ofTxJZ8F+wZOpjYpeS40yfFDhky5hYhem2nnknDcbD2U
         tz7g==
X-Gm-Message-State: APjAAAWLAE8oiBYE7WlPKynVWKQOK8erdGAWwBAb4HomIb7DepT7SPu/
        FSQkLTzla85Urpw5vt3fqWLkhZWFGdsL6g==
X-Google-Smtp-Source: APXvYqyPW6XvWk6a+d5gddwUq3Tjbe1qjVWGV2D/6wCeKNgvf78j5lwwe5P7xp5FwaI/V6JOcJlKSQ==
X-Received: by 2002:adf:b648:: with SMTP id i8mr1478167wre.91.1579245505679;
        Thu, 16 Jan 2020 23:18:25 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x16sm2400762wmk.35.2020.01.16.23.18.24
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 23:18:25 -0800 (PST)
Message-ID: <5e215fc1.1c69fb81.eb2b1.8255@mx.google.com>
Date:   Thu, 16 Jan 2020 23:18:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc6-450-ge24e77e03983
Subject: next/pending-fixes boot: 196 boots: 6 failed,
 182 passed with 8 untried/unknown (v5.5-rc6-450-ge24e77e03983)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 196 boots: 6 failed, 182 passed with 8 untried/unk=
nown (v5.5-rc6-450-ge24e77e03983)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc6-450-ge24e77e03983/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc6-450-ge24e77e03983/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc6-450-ge24e77e03983
Git Commit: e24e77e0398319862489009664e26837dd31e851
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 69 unique boards, 17 SoC families, 25 builds out of 213

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.5-rc6-391-ga06ab7cd4=
c3b)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.5-rc6-391-ga06ab7cd4c3b)
          meson-g12b-odroid-n2:
              lab-baylibre: new failure (last pass: v5.5-rc6-391-ga06ab7cd4=
c3b)
          meson-sm1-sei610:
              lab-baylibre: new failure (last pass: v5.5-rc6-391-ga06ab7cd4=
c3b)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s905x-libretech-cc:
              lab-baylibre: new failure (last pass: v5.5-rc6-391-ga06ab7cd4=
c3b)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-libretech-cc: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

---
For more info write to <info@kernelci.org>
