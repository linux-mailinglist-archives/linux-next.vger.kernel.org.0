Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6538018D872
	for <lists+linux-next@lfdr.de>; Fri, 20 Mar 2020 20:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgCTTel (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Mar 2020 15:34:41 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:45955 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbgCTTel (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2020 15:34:41 -0400
Received: by mail-pl1-f175.google.com with SMTP id b9so2921120pls.12
        for <linux-next@vger.kernel.org>; Fri, 20 Mar 2020 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SPOCGYe7SnupgCWqIRY2sz/OYV66/c9d45l8+QLRNRg=;
        b=Wt7AEYXSrQzJ77fIBiSUf3sgQgwLd/TJ0o444WGqG0Dz708JxgPXGXSHIwXWxM10dY
         3fqvHgzcYl6cOsJ+WTLaxgjMTeqBW58gS089/XPwM5DjLfkmPoYAKNBf7J+mMt6AYZjW
         mNPY3CEsctYOxhcyg51WrCfEqVVc5nYmuVFa0fuzzgQGMpTsGffACV9Jq7PAtXYJWimD
         L+fh//Df8FwwKvFCmxWQqOApKEysZ6L1qnDK3PIqWaX7sOLBeSqjqljINxKwA9C6FpR/
         COh+ymgpgOp5ZpVw6G04kjsefTCAzEg7oj7r23lm0gQUFFQteqZDcSt3gEFTF8hPNrUT
         ARbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SPOCGYe7SnupgCWqIRY2sz/OYV66/c9d45l8+QLRNRg=;
        b=qUM56/S098HGMDuJIis7QW9uvIGipD9acjqWvtq3p9/8RX5QOqXy7qJMU70+qM7709
         IpAqIWtABZ8VCH+Ne3X37bxF92HI3jOC2qgFPw8QisBKGVn61WJNjMgk7UHKrz3GXNEu
         cAq7RjfO8SqWYznu8e/10npwVq/hhmG7uNRyg88Lt9LqWeItjqSEKTAjb2YfrwY44Xyb
         MV+FO0KEcnglXW1+W/0KCLfv4rfl0P8CZlkISE+IhKMhkSVGcP0I21vuRwYWx0Pyqhs/
         AacfGqca2bEFfXGypbGgMS2cBnDoA/tKnBzCFCEzo8mM5rI/VIapWWV+bzhTgARuujPF
         EQuw==
X-Gm-Message-State: ANhLgQ0vUCDn5uyRbL15clkveFcculuLY4mymQVM9I2YXzZFfZHFRGoG
        vYPF62wqyqzKzD7y+WgkzG/rMrptLFQ=
X-Google-Smtp-Source: ADFU+vsJBcxp06CB/vbLVZDwrmRl8g+VOGNX2T0jQCtFZM49jfjLPh4NLJFqgVApgmiCyDTVGxBY6w==
X-Received: by 2002:a17:902:7c18:: with SMTP id x24mr9173845pll.99.1584732879384;
        Fri, 20 Mar 2020 12:34:39 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i11sm5505635pje.30.2020.03.20.12.34.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 12:34:38 -0700 (PDT)
Message-ID: <5e751ace.1c69fb81.8339d.27d7@mx.google.com>
Date:   Fri, 20 Mar 2020 12:34:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200320
X-Kernelci-Report-Type: boot
Subject: next/master boot: 278 boots: 6 failed, 266 passed with 1 offline,
 5 untried/unknown (next-20200320)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 278 boots: 6 failed, 266 passed with 1 offline, 5 untried=
/unknown (next-20200320)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200320/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200320/

Tree: next
Branch: master
Git Describe: next-20200320
Git Commit: d8f289c16fbb72e17b783175c1fb0942816264fd
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 25 SoC families, 30 builds out of 329

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200319)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 31 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200319)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200319)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200319)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20200319)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxm-q200: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
