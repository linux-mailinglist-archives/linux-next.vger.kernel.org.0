Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEEBD648B
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2019 16:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730477AbfJNOCY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Oct 2019 10:02:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53404 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732012AbfJNOCY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Oct 2019 10:02:24 -0400
Received: by mail-wm1-f67.google.com with SMTP id i16so17412453wmd.3
        for <linux-next@vger.kernel.org>; Mon, 14 Oct 2019 07:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eoDeg79mPExY4MRhSFMkjQwh5unGYEYDjETsSy2/oJA=;
        b=e901rW6lMPSooR7UetwoynneGFNTnn6L7Cv3ux+yIab4YQ+Zh1GtVdyzXeLSxzvwQG
         SwpremCO4maZcpTNGoGrarpKsHf7LSDKIchuHSMc/jWvE7U0ZPHTPAcUj3T8JacgHAIh
         eIVNpvnJze68eOrBraxcGPlBkkvTGQMUWn+G7rd7WK0LRpHfulNXJRXdVfgWPBrGEGI1
         YHFzcXpOpoqcOlx4I5c5Zdbl+YIasyoVZlASirnA6VuvFtygCewWGFz9l06lcnNqbVYF
         MoZP5ZUZVGGcnTm1lSrDRjtL9po6KncEqe9thhAoKuGw4tsC+sjShFItWik8n40PBeXG
         UOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eoDeg79mPExY4MRhSFMkjQwh5unGYEYDjETsSy2/oJA=;
        b=TSV0PraWLbp3iaxG+e64Dcct8huOyIYkAPZS07IvZs9t0/VKTbDlgiHPsAWumb6Mnw
         XwPVS86j4ScducLMbjZl36+D9+UZjuwzokB7+UY4RIQZbaDoJZYNo/4ZQRj2Exkxd+HX
         OhKv5rDWlGaGFL+R+NKczelhIbxV76IMOYXsNfrXE+WuGww8N8h6u5gJ1TV/W4y8IXgi
         8ZnBBh8M0HjmT5VMfweUHDFsjPyxIxQ9Pl+9xPCn1V4kHL1Sx9SqvQ9ooHyb1scML1S/
         AMKGjUG/PyT6/mSqZki5KNrdW4T9Hak7svTD6Fg5FNZshqYJbaTb8CETWVaM9Jxk5uFh
         hWCA==
X-Gm-Message-State: APjAAAVTtbpKm1ZOLrmfCkRvj8R9qcJEie8Ui85CqLUQJCuBE0vAnCd5
        E8BDh408v2jO20jBQltEjVZ49cv2c3c=
X-Google-Smtp-Source: APXvYqzd6geVpjdPPK5q8xYPeTCyNCtmn0QnI5q73V5bYAtMXNbRG4qPwf9EEW347VUGLeHusubPvg==
X-Received: by 2002:a05:600c:2212:: with SMTP id z18mr2009295wml.154.1571061742500;
        Mon, 14 Oct 2019 07:02:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i1sm20614690wmb.19.2019.10.14.07.02.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 07:02:21 -0700 (PDT)
Message-ID: <5da47fed.1c69fb81.9479.fa7e@mx.google.com>
Date:   Mon, 14 Oct 2019 07:02:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191014
Subject: next/master boot: 288 boots: 11 failed, 262 passed with 13 offline,
 1 untried/unknown, 1 conflict (next-20191014)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 288 boots: 11 failed, 262 passed with 13 offline, 1 untri=
ed/unknown, 1 conflict (next-20191014)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191014/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191014/

Tree: next
Branch: master
Git Describe: next-20191014
Git Commit: 4eeb5abd245d849a4692325339a94566953363d6
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 26 SoC families, 28 builds out of 218

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            mt7623n-bananapi-bpi-r2: 1 failed lab

    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    exynos_defconfig:
        exynos5422-odroidxu3:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
