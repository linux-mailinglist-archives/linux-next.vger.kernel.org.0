Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32475178A59
	for <lists+linux-next@lfdr.de>; Wed,  4 Mar 2020 06:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgCDFwD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Mar 2020 00:52:03 -0500
Received: from mail-pj1-f41.google.com ([209.85.216.41]:54869 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725271AbgCDFwD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Mar 2020 00:52:03 -0500
Received: by mail-pj1-f41.google.com with SMTP id dw13so409995pjb.4
        for <linux-next@vger.kernel.org>; Tue, 03 Mar 2020 21:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RuH1JKceqXgS09cU/pqDoAziqdqK8klEc27lrkGpAZE=;
        b=UFJ7f4N4qJ/WA1jtKISZhSgRS+6vXj0dmEi7yYARnPSCTy4otZgSNktxRXdSHe6Gy7
         Gbr3hDZ1KhbFXytBE2J88CYruc5HY8/c0rhxcV5qt5KkdfNNCX92f/FS6ZhOg+PDy2rr
         kX8fmdbioMKCaffUAQIYSyFzmF65oCwDGuSIOuJM27ihzrFfyjvEPC4yvpCcy97mvuQd
         gSJJjc1XzE+jdOxQqE/2KBEm5yhBEsJyW1AZy+pChFeVgykeu4bcJUnmFyhwYKR1Nk8L
         X+JCCPtSKxATDL6rdaXdwudoNjK83RFvYayjwyWisfVbulb/mGBA6H75DWkrHkxPTxh9
         Wr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RuH1JKceqXgS09cU/pqDoAziqdqK8klEc27lrkGpAZE=;
        b=R3CzlzGJitePwhrStK9LgBzaVt1DnprNRnMbmX1A3xJWya1NNs+uH/SEiFyHL1+2AJ
         Ye0ysRzqkLVMlkkIq411ciRzYMU7Krh7KCMelGp6Sf7ruqns4qx8fp2Z51ci28cDK2gn
         5fp/qXFb8WYhtfXKqjnllzp0B7UurT0U3b9zuRFGkS0Wtx2X8ueGj1mxF9ZaoxZHNsdX
         qSq/txjsLh6s6r2crNEOLwUDGkJ16IqQH75m3ib4+ZmVW16icxMLctRYH84YaLH+enq2
         c1T4VAegeX0342EY/wPTW5m568BY3WitSi5RDMOHjXRQnxkYKlfWbkRoJ8npo4ki1ifm
         8KlA==
X-Gm-Message-State: ANhLgQ3ySfTGdheDVGObTI4Rb+eeDG0Wg+dLU1Fur4JmDLw4u5sgdLtV
        FF6hAHbVVDR69+0c8QpA8Tg8vRPDlzU=
X-Google-Smtp-Source: ADFU+vs2crouA7mmd8981OTEpl5I1qonrbEF6FEL4fZ0fzDtxuwSKsimlJRo6/XVW7x3597zPMbJVw==
X-Received: by 2002:a17:902:8d94:: with SMTP id v20mr1612304plo.259.1583301121897;
        Tue, 03 Mar 2020 21:52:01 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u12sm20920630pgh.52.2020.03.03.21.52.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 21:52:00 -0800 (PST)
Message-ID: <5e5f4200.1c69fb81.939e1.7aca@mx.google.com>
Date:   Tue, 03 Mar 2020 21:52:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.6-rc4-219-g02c04c823da1
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 110 boots: 6 failed,
 104 passed (v5.6-rc4-219-g02c04c823da1)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 110 boots: 6 failed, 104 passed (v5.6-rc4-219-g02c=
04c823da1)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc4-219-g02c04c823da1/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc4-219-g02c04c823da1/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc4-219-g02c04c823da1
Git Commit: 02c04c823da1fd91807196316b7a7c472027c11e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 59 unique boards, 13 SoC families, 21 builds out of 216

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: v5.6-rc4-203-g8f169e319=
c63)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.6-rc4-203-g8f169e319c63)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.6-rc4-203-g8f169e319=
c63)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc4-203-g8f169e319=
c63)

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
