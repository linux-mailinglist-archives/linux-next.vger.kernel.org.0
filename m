Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F77F17F0FF
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 08:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgCJHZj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 03:25:39 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:36206 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgCJHZj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 03:25:39 -0400
Received: by mail-pl1-f177.google.com with SMTP id g12so5097402plo.3
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2020 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MVFShgNQh6XmEBUolgjyBwmQ4auhYTuvS53OJ/MAX18=;
        b=sU/Xx/IDZhqTvnkXKLY/Z5K5XAxojMw4tVBJUeSYiVj6Ty4pG4oWXbzrguNjo+0X0X
         ZXgTr6okNTbReJBV9Qml+VG9EzA8tVfgirjfV4iyfFwI6tCUGhRvUBqiXizhSGsbRJSl
         USY3IXZ3o3K2StDNmKfJP7me4QkCJLtA3Db7Bg6A2xsGBDFrEa8U4yP2SDWCZ6QEi5Az
         cVW8kjLebTG83yIh7fg3JX2RgOk3WIEFb+YrAuIhdKN4+/zGRjCvH+ckEo8pv5QjQrD8
         z3Jfk9BL+W/smghTpJe+lG/PB8yINrlp7PCzf3bB6CPuIYSX75XKnDK2yPUpl8YLv7Sv
         ZEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MVFShgNQh6XmEBUolgjyBwmQ4auhYTuvS53OJ/MAX18=;
        b=Unw6A1K71sjb+rQD9DpH1TKN0aaH/N588xi62462/+BVvjXjubpZNbkk2JsRRpeZyp
         tNyHH7+5mTkKynSxSKNeDn7Wi88sbhdNeFLx+0eHQJoOoqCoUNoKppnBzt/PnSc2Y+4u
         OCy7SfiGlomBFkfvnzEMLBKOlC+suu/n2P9AsqrS3v9J+fQhXqGu8MCv9B3eFg5Z7LEI
         kzeK46WNNRZlSnSAIcTxeg87KYV4E0jQ0m/AMpfgc7YN7KtIwnphlSH8ZykiXfbp3V3+
         YjD4zyHb8UE6f08gFvTneyzHEr7x9fGtQNOy9/SzaUjbuMLLYTEtcWYAdsD0Te+jmvi8
         pNYw==
X-Gm-Message-State: ANhLgQ3iF+A+OEi0Fb26QpzYzpc4AhFa3wsqMv9YL80uddWUYhuCsfGm
        Qo5vxsmtlNgWga0wDcCdU/2IH32cYVo=
X-Google-Smtp-Source: ADFU+vuAkIv27J1jTfRBBWceAJ1DWA1ptupWTNP/w8kQm86MxJz21RtDBMMJMRzBHXaBPDGVLS2laQ==
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr18096842plp.252.1583825138271;
        Tue, 10 Mar 2020 00:25:38 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f9sm46187842pfd.141.2020.03.10.00.25.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 00:25:37 -0700 (PDT)
Message-ID: <5e6740f1.1c69fb81.b6d9c.fbf9@mx.google.com>
Date:   Tue, 10 Mar 2020 00:25:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc5-158-g83e1475cd019
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 206 boots: 7 failed,
 190 passed with 5 offline, 3 untried/unknown,
 1 conflict (v5.6-rc5-158-g83e1475cd019)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 206 boots: 7 failed, 190 passed with 5 offline, 3 =
untried/unknown, 1 conflict (v5.6-rc5-158-g83e1475cd019)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc5-158-g83e1475cd019/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc5-158-g83e1475cd019/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc5-158-g83e1475cd019
Git Commit: 83e1475cd019c60c33f528157985f7d10961f5b6
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 23 SoC families, 27 builds out of 216

Boot Regressions Detected:

arm:

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc4-399-g7f925373=
eccf)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.6-rc4-399-g7f925373eccf)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc4-399-g7=
f925373eccf)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-rc4-399-g7f925373e=
ccf)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc4-399-g7f925373e=
ccf)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc4-399-g7=
f925373eccf)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.6-rc4-219-g02c04c823=
da1)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc4-399-g7f925373e=
ccf)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc4-399-g7=
f925373eccf)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.6-rc4-219-g02c04c823=
da1)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc4-399-g7f925373e=
ccf)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: v5.6-rc4-399-g7f925373e=
ccf)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            sun50i-a64-pine64-plus: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

i386:
    i386_defconfig:
        qemu_i386:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
