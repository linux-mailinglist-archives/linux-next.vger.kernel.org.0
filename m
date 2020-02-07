Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2838F1550C4
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2020 03:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgBGCsA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Feb 2020 21:48:00 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:38793 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgBGCsA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Feb 2020 21:48:00 -0500
Received: by mail-wr1-f54.google.com with SMTP id y17so871512wrh.5
        for <linux-next@vger.kernel.org>; Thu, 06 Feb 2020 18:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Spn3UV+eGCXOimONWnBALR9MUG6VLfwfSzeEw1lM1+M=;
        b=WPsUOsaEoyPX4aBvtLdXZam7/1g3byIjMLkvrb3V4+ZZ7TRB7TuQnUyYtPHtKGPZl3
         CDxSutMyJXuVTMOQnZAaGsUczRFzkikxEgxCAt5R3d719Hyfvg+N4BeVI4uwEV4nqsLs
         BAcOGj5B9+fiwP4U/u0uDRuOFFJH2XkBLSV2g8x40MVDS6eUjw1rhTEczmzSKVbRYMRJ
         EEzKrrAmWuxK7f/j3o6Tc21QY3y7TZ21vhdBK7tutaZRan+EwbKd0W3ir4VwSm0RUKUN
         mu7QjGzvHc1bx9jqy1GB2Y4jjvmd5y1ZqHbCnyYeTQedHaHgT73wCvpA1YMZTbfL/W7Y
         4j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Spn3UV+eGCXOimONWnBALR9MUG6VLfwfSzeEw1lM1+M=;
        b=Lj+fCbONpt0wDZjjeEePCmgjp4ZuJqfLnsFfGEWVxZyVmG66DBAeInaelhHRBJzngm
         FawLzC0Z84UAq24KryIZYHCp/e6X+MvwaxP4OzCo8z/gIxl9ZDRwVodVv5ap8uMnFzjg
         sEWIdK9ZFABBGArAdYAfwn7xCfpoIViGq/yaLh/tuw0wrvQwFVlIofyo48jFbi74wMtr
         BYPzrw2qB9lS1PwJqIoT9gc6eYqCoK8QQQ2z1yogY+S195iFnPJTLEmH1EVzvQiadG6E
         yCawwBifefv/rpeWO5QAjBlHSzfMpZAeWCPOBTQjwJhkupfdozDSIJGEa3xZaWRzcEto
         XnyQ==
X-Gm-Message-State: APjAAAVPJlmOO+Z067sIicm110QlqiF/GAYAT3OPAqE40A0rN8fcbqip
        k5KImIxNCydVTukoyucowY+38P8Wk15O7g==
X-Google-Smtp-Source: APXvYqzbIsV2W1wy66EgXlSSTJSxCy7lXBtRONaAbZozqSWx78Tv+O78mf2XFWoQqIDBQ0xoEOH5rA==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr1411946wrs.303.1581043678789;
        Thu, 06 Feb 2020 18:47:58 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t9sm1585947wrv.63.2020.02.06.18.47.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 18:47:58 -0800 (PST)
Message-ID: <5e3ccfde.1c69fb81.6c7a.6787@mx.google.com>
Date:   Thu, 06 Feb 2020 18:47:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.5-9913-g2eb0c73548f1
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 214 boots: 7 failed,
 199 passed with 7 offline, 1 untried/unknown (v5.5-9913-g2eb0c73548f1)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 214 boots: 7 failed, 199 passed with 7 offline, 1 =
untried/unknown (v5.5-9913-g2eb0c73548f1)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-9913-g2eb0c73548f1/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-9913-g2eb0c73548f1/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-9913-g2eb0c73548f1
Git Commit: 2eb0c73548f1016ec92ccd2909bce300b233ee89
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 24 SoC families, 30 builds out of 215

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: v5.5-9475-g7c2e=
b3712de1)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 1 day (last pass: v5.5-9475-g7c2eb37=
12de1 - first fail: v5.5-9670-g2c46fb8a6882)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-9670-g2c46=
fb8a6882)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-9670-g2c46fb8a6882)
          sun50i-h6-pine-h64:
              lab-clabbe: new failure (last pass: v5.5-9670-g2c46fb8a6882)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-9670-g2c46=
fb8a6882)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-9670-g2c46=
fb8a6882)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-9670-g2c46fb8a6882)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
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

---
For more info write to <info@kernelci.org>
