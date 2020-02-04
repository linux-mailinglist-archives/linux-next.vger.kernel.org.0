Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC021519F8
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2020 12:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbgBDLiR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Feb 2020 06:38:17 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51414 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbgBDLiR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Feb 2020 06:38:17 -0500
Received: by mail-wm1-f66.google.com with SMTP id t23so2933314wmi.1
        for <linux-next@vger.kernel.org>; Tue, 04 Feb 2020 03:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2ublTd5vyzLnz/HKXnqbxebi1/iHfppgV/7rvEqNVe8=;
        b=zdLV91Hc3LaueTsXjp1eexJhEUU98xudexepMQcjGQH98WhKJt4l3IgO9GzKhqMbRN
         TproKE1Mykjsb0z6c7KPfyPvDSjDDOxFYKor8EuRE6DGIk2+AbE/j1g+kf3ZdlC3N1bh
         1zir8yJAXZfSsoHxJF9Z9Yge2Pff3vJa+TPzcaAJ056XrTDFh6IT7gz9vehQt+3bKNbf
         osOzUlge/pUU7eXRtkyPl4wJAFHAjgMrzCA45vgHw4XrkrFYe1yH+/Wbb0OJmKPywTSH
         qRDDnQDcy8jTFrqhIXBDz3O13L5C8uPHex5+GpZTvjp6P4CgaoVAfePNWfLw/beysixb
         +lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2ublTd5vyzLnz/HKXnqbxebi1/iHfppgV/7rvEqNVe8=;
        b=r40H/1Kar1cpScc3cq/duJm1Vxi3RLRPeMnPL9ikiJshNLNLUlQ+iNSSKmaT0i0Ebp
         TiNRxH86fhASZy/N7Lgy3Wtk6V1le4DL3/W7ReF1dtJYUvPBqzn81QjBwP13Wxldof+d
         d8lgcyK+j2O9s20jmaSY4BLmO6o/Iu/0nkhoADd2Go5xdy9HwUAZ9ODS426MNJrWsjib
         WpfLlSMx+RkmI2g7VY0gCoJ4ePWGq4ea8zhjAyOuzO7LzI3eP0VYI7KW6jmRWSLzKKLb
         fR4mGqzjZdcMe4gWXN9JMuZqlFvDnsCgBV9VI/RiMdS/kQyHEPOZw+ZVV41XImbNcKcs
         1NHg==
X-Gm-Message-State: APjAAAUTdA+CtUj7aPBKfjqsP5iJdkjlGR05YJvnkYl6/KRmVuD2HBF9
        3R7i+VSEYaREjFR9IdHNoZPcD67V6yPJlg==
X-Google-Smtp-Source: APXvYqxt2bZ9EmWTesl7SLtqFRm+gV7VoomPA+vFyJgYmEq0cqzL59L9mVKtdMfVzXNC+p0P4+RjGA==
X-Received: by 2002:a1c:660a:: with SMTP id a10mr5348136wmc.122.1580816293771;
        Tue, 04 Feb 2020 03:38:13 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y7sm27723537wrr.56.2020.02.04.03.38.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 03:38:13 -0800 (PST)
Message-ID: <5e3957a5.1c69fb81.e5132.8ad7@mx.google.com>
Date:   Tue, 04 Feb 2020 03:38:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.5-8929-g9e4730e1c5e0
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 93 boots: 6 failed,
 86 passed with 1 untried/unknown (v5.5-8929-g9e4730e1c5e0)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 93 boots: 6 failed, 86 passed with 1 untried/unkno=
wn (v5.5-8929-g9e4730e1c5e0)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-8929-g9e4730e1c5e0/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-8929-g9e4730e1c5e0/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-8929-g9e4730e1c5e0
Git Commit: 9e4730e1c5e01cdb3f6cd218f77a521a67bdf7a6
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 71 unique boards, 19 SoC families, 16 builds out of 183

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-drue: new failure (last pass: v5.5-8839-g56c8845edd39)
          exynos4412-odroidx2:
              lab-collabora: failing since 6 days (last pass: v5.5-rc7-366-=
g2e30f8d48084 - first fail: v5.5-3974-gf60232fa162d)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 6 days (last pass: v5.5-rc7-366-g2e3=
0f8d48084 - first fail: v5.5-3974-gf60232fa162d)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.5-8839-g56c8845edd39)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
