Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC945CB93A
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 13:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbfJDLfh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 07:35:37 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44015 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbfJDLfh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Oct 2019 07:35:37 -0400
Received: by mail-wr1-f67.google.com with SMTP id j18so5949330wrq.10
        for <linux-next@vger.kernel.org>; Fri, 04 Oct 2019 04:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LMAoGajgWcICmeUWOhfA+JWLgm+5RwLX4Y7WYNcGht0=;
        b=yDXUU3zytUMkPvc4bt8yaV9O7tzv8kNswaNKFtsGMNkn+FF8E9HPUVDQHiP5W2/E9g
         fl58TSX8c3wsXJsTWqcU0Kqk6qlreuEPX9ru3+uipatPsor+iTHq/bmOXmtkSY0a4OTA
         VsonLLeN2wDlQElej01PQ/WnBXQOQlgJnI/X8iXuJBnNtaUsMIjrpUTMh6QtQ37augLe
         Iz230yxl6PW91Ql3ExYRuUZUtHKFVkMk0WwWwhuGLoLJrncG8tYp7KFTiO1RuidtN8Dg
         RELeFTRpamOx7A5M3Ur5dNEQHvYy2K2EeI9uou0Te0dN/A9cjD5wN9u7nD64HcmxQGmu
         J7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LMAoGajgWcICmeUWOhfA+JWLgm+5RwLX4Y7WYNcGht0=;
        b=sle7f8toIjUueAQg9pGReB9ifSt7IuK1ppguIhb/mm23I7SOT8CxKqHi8wt3pTzGm6
         qp9Zi+nEm05uccg8l6TqsU6sKVkEEMKVKjUMXOdST6tTNY88AWJuyNUcXVBBzO7VIKbQ
         kzGiRouvQ60fgl257CydLvxU2pBwiPob22+VvYYFzf5DxsHxoQkKUEWua8zy8N3TCzMg
         SZOUJ/KtJVzNHpSWNU9UftHJV2CCiTAmLGeXJci7EKg4vzJGdB5hIt6fbq00MGl+mtdV
         w5i6lQVxZC3k16HST71XU6YFIF4cRDte0SyCYfcz16DHgLDCUUN3/WaSdSp0R7onx+iC
         woSQ==
X-Gm-Message-State: APjAAAWLouuXaUcVt4r1LF/PNj5sZBJgG/A1emx0291BpGaq/JtdjVf/
        uxdNmzxEbfqAauvIAdE65Vm3D7Xg0T+M9g==
X-Google-Smtp-Source: APXvYqyNixpXvV1DHGLLQOCnhzruICNOtqG+PeWRR6ieq8CnVWtx/EY8IG6GNpTeHvY1U57BfajTyQ==
X-Received: by 2002:a5d:5111:: with SMTP id s17mr10336318wrt.59.1570188934866;
        Fri, 04 Oct 2019 04:35:34 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i5sm6039606wmd.21.2019.10.04.04.35.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 04:35:34 -0700 (PDT)
Message-ID: <5d972e86.1c69fb81.174c7.c186@mx.google.com>
Date:   Fri, 04 Oct 2019 04:35:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.4-rc1-298-gb76690ad767a
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 270 boots: 12 failed,
 234 passed with 23 offline, 1 untried/unknown (v5.4-rc1-298-gb76690ad767a)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 270 boots: 12 failed, 234 passed with 23 offline, =
1 untried/unknown (v5.4-rc1-298-gb76690ad767a)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc1-298-gb76690ad767a/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc1-298-gb76690ad767a/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc1-298-gb76690ad767a
Git Commit: b76690ad767aa45ce68a6c5dc102f26078f22cee
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 27 SoC families, 25 builds out of 214

Boot Failures Detected:

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

Offline Platforms:

arm:

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

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

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab

---
For more info write to <info@kernelci.org>
