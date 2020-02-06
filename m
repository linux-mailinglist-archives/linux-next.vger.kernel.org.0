Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD01154113
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2020 10:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgBFJWm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Feb 2020 04:22:42 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:34638 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728033AbgBFJWm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Feb 2020 04:22:42 -0500
Received: by mail-wr1-f54.google.com with SMTP id t2so6232697wrr.1
        for <linux-next@vger.kernel.org>; Thu, 06 Feb 2020 01:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ig+zYZd4MBThfwi4UkATCYsr3k4TYWbcWiV0aMubQyk=;
        b=Dws07gJm6Px2gw2cbLQo51ocI2gMzNeJodDduLVFg5It0MTLpNODreupIv1kV4hw9B
         NtQC7Qr2bqkHpwbygpQGzkWGHpRZG8425S5JYm+B+wm2S/olQvah6hksNV2vGU24XGu0
         HXG6rgX/2Flj48Mwf1qMjCvU4Y1BpxnfeBSCbmtW+3e6jck2KorM2XrMkcUzZuPTzJUK
         xLb/HHQYMK4bOJPnq0d1K6/ZdqWV+p2Q4uvTvvioLXNjbzgHEjQzKUTc6w6HKlBQNiKh
         4KgInoKtHNmUOICzL9hyX6jargBUKt2LHSh5Zm4dAQpYhAst+vj0SKdwCrxTEPsqEGCT
         ngDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ig+zYZd4MBThfwi4UkATCYsr3k4TYWbcWiV0aMubQyk=;
        b=frWk6g5QvpYw29U+EHJjovlNWw9UUYXWvm/AtWGmEa+Ta2AxFI8Dofu7rtcqxFbchw
         1he+zNaM1fjH8i2MmDclxkTgIig05nX+NzxnKx1a7VR/YpDLQRTfihtPGXLgT9Uo0s8b
         ardqu4sdAdNIBA67eLcQ015jjyYtfc+ZVq6Cdzsz70vdbxt/iXf0CVqq8sAcbmHQU7za
         u6peK9DjiytIO5Dvwsq1Uz59qSwm32lpYHRdZfO2j/FtdMugus4D912Hx//6aeJQ+Mfk
         LFOywqD9xi54HlM38f6GHDZr0O5TcvWkR0qpdedaB5rFfSi1ltGCnEEGKzbWVsM7o+/8
         ZVfg==
X-Gm-Message-State: APjAAAUsAVY6tXMafS6JEtkL3YXKBT6fdHa6tC76ryiuUkEDaXgs5kpU
        kBEpeLT7RHOemY7wrGwTIuukyqGANNmegw==
X-Google-Smtp-Source: APXvYqx+T6ICkbncKSpRgwlwiecLgI9aw0ShVDCfoCgHADRlrDLxsAwb+D3ZIfu8/b2VRusbnZKnBw==
X-Received: by 2002:adf:81e3:: with SMTP id 90mr2658464wra.23.1580980959733;
        Thu, 06 Feb 2020 01:22:39 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w26sm2888801wmi.8.2020.02.06.01.22.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 01:22:39 -0800 (PST)
Message-ID: <5e3bdadf.1c69fb81.76e15.c014@mx.google.com>
Date:   Thu, 06 Feb 2020 01:22:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.5-9670-g2c46fb8a6882
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 96 boots: 5 failed,
 88 passed with 3 offline (v5.5-9670-g2c46fb8a6882)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 96 boots: 5 failed, 88 passed with 3 offline (v5.5=
-9670-g2c46fb8a6882)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-9670-g2c46fb8a6882/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-9670-g2c46fb8a6882/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-9670-g2c46fb8a6882
Git Commit: 2c46fb8a6882cf96d34fe1c2ac2cd097de58a68e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 41 unique boards, 12 SoC families, 6 builds out of 33

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: new failure (last pass: v5.5-9475-g7c2eb3712de1)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-9475-g7c2e=
b3712de1)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.5-9475-g7c2eb3712de1)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-9475-g7c2e=
b3712de1)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: failing since 1 day (last pass: v5.5-8839-g56c8=
845edd39 - first fail: v5.5-9475-g7c2eb3712de1)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.5-9475-g7c2eb3712de1)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-9475-g7c2e=
b3712de1)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab

Offline Platforms:

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
