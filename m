Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B50A3D3932
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2019 08:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfJKGKL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Oct 2019 02:10:11 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:41237 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfJKGKL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Oct 2019 02:10:11 -0400
Received: by mail-wr1-f51.google.com with SMTP id q9so10423522wrm.8
        for <linux-next@vger.kernel.org>; Thu, 10 Oct 2019 23:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ABsGPKlMo/s3ZbSLu/R1N1DsZ+Ahl5YC/wqLDySyjOA=;
        b=ScK5UUb1drW1L8siDfb73JqhE53vb1zlckwoaqWpPGB/QfIxcQ6r79daKA3Ucig8yZ
         dAk9S7tRu1FzkyY56OpuszmcTEbs37V+SRRdDYrJr7ax/CTeBzsLYaDmPjZtNfF9hD7/
         91AWUbny/E9N5IM47PIEkX8QTp/TqeLqxwkbkiCPEsLq1z19I3+PkjD2eWJVjkp0U1uw
         dBzc9ZwBbLpenzDHJ1nGnDkvH67T5I2NIGMi9g/J4Egl33wUozhHVghPjHzqGcqonH/x
         /scSJxMVdqScxEiRQMQuQIPHct6cu38YW1/NSltNpxrfv+YaLOiLMQ3XFh2wwq04daW3
         +GDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ABsGPKlMo/s3ZbSLu/R1N1DsZ+Ahl5YC/wqLDySyjOA=;
        b=DP+EGXAnZ3IoDhSqEf3IkWQZTbfT7v2qTd+fvlRaYbEfImfbQX2kmp0PzZPtoX8tfn
         eu9+/zzpLj1t6irJxpwiqoUIWZEL3EDUJbcwkU9w7UMiSL0RQKs8VfT5tvkiiHvtgpEl
         8n2pj4D79PHeJxzlO0SvDHvmOUOzoPw6uTkbXzAlMpl22Q1lx57DsaU6EL2LUILA/MjO
         QaGLzhYyO7Kwebz/E/ilDsHkltUh8y6Ya0XsxwpH8aGGkynF427jSbSCN69YYVe6fl+B
         Y/u4DNAZngfnjBnHiAfoub+thzo5lUGlTzETN9FyvnERvAAWIysUDtUeEFK0irnJIVQD
         7dFg==
X-Gm-Message-State: APjAAAVESk1CGRlrVr9Ze6XSsvfwqweUJl0NKeKbpkIANS0TXGQQIgjm
        dyUPfe4Q/bdF1jV7oV7Mp+3PBcU+Rvh8JA==
X-Google-Smtp-Source: APXvYqyCy+ef/5JOjXo5yJ32nFX7o9ZHHk7/ajdOqo1Rp4QDucQqt2taw6yCzLoTbGo0b0ipHtnCsg==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr11403259wrq.67.1570774209029;
        Thu, 10 Oct 2019 23:10:09 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o1sm11660377wrs.78.2019.10.10.23.10.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 23:10:08 -0700 (PDT)
Message-ID: <5da01cc0.1c69fb81.26a2f.9841@mx.google.com>
Date:   Thu, 10 Oct 2019 23:10:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc2-490-g83e89f5f17ba
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 292 boots: 13 failed,
 266 passed with 12 offline, 1 untried/unknown (v5.4-rc2-490-g83e89f5f17ba)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 292 boots: 13 failed, 266 passed with 12 offline, =
1 untried/unknown (v5.4-rc2-490-g83e89f5f17ba)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc2-490-g83e89f5f17ba/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc2-490-g83e89f5f17ba/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc2-490-g83e89f5f17ba
Git Commit: 83e89f5f17bad1b7ad22606ae2282054d3981de3
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 26 SoC families, 28 builds out of 214

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig+kselftest:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            mt7623n-bananapi-bpi-r2: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

---
For more info write to <info@kernelci.org>
