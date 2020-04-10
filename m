Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7D41A4830
	for <lists+linux-next@lfdr.de>; Fri, 10 Apr 2020 18:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgDJQBU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 12:01:20 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:39144 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgDJQBP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2020 12:01:15 -0400
Received: by mail-pf1-f174.google.com with SMTP id k15so1205963pfh.6
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2020 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1oXVnRsmkl/l8YmWpcTbQ7olrFsCKh1Y7bO5sjnjtfI=;
        b=pSHC5YC2LZaI3QPpgt1GBzpY9Z0GYXDdbfcLUxn14gPMMLod1CnNUnXh47sNw811vF
         42P7TH3tas7oDP7oL6REgu+yMd6Hws96nzBWCcQ799ZULSxCqXvSU1lmQNhTFS0CMlbD
         Mma7coo35iI9DSBkDp8LEaOOLsX49BVNnAwNUzjlZc/I+PiBVqm8ScV6n5zFqhu/qczZ
         5Nijrlu05H+DR/976dUN4O3xN3ZDTjDNmlMA+9ey1dOPtaXoWPBhllGSij+VjMBGdq2M
         aPUXCY7eOeIIshdg6tS93Y3Yo9QmhcV1P2R78f7ImLpIduokDfeyeqSdW4flW3H88fTD
         Qm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1oXVnRsmkl/l8YmWpcTbQ7olrFsCKh1Y7bO5sjnjtfI=;
        b=s0gSjHmWphSQY8PgSBgXEdHEK7M/Vs0E7CEW4O1LOF9/U9LM5xSkAxBpWRBz6vcdIa
         8MnmNV4FVhyfmfkKGp8GQLPYyTVHQBQMuc27JF0lHV6jwLdGQYmB8NkhhzXKhI+6kYUD
         mWlqhLoOgk0YS94PtSz6vhDfrS8bY9lciCTFEz6QrTjA3AhaEL4Rr3Z8gc7EshTGXQ0E
         eyzzHE2Mv2u+UxdlBneP89C52MoxU8+m3yeV/HnKM/9SGqmcdbIc+lh8DC+l4Rb8BemK
         cqKi1yQqqEEnXBMS3MSASjV51c4I2Ftg4ZFajS14tKIpOlK0y1Hdmor4TFnx1mKhqBnE
         NFsg==
X-Gm-Message-State: AGi0PuZZFZGzAFn4lndHeMM60Z7CgRLKs3QwIUyL2Z+b09r/+dH+VMil
        p1sXXWwUVogUGBMGsDaoI9VBLsr1s8k=
X-Google-Smtp-Source: APiQypK3vm4rY9MTaDvXNdHkjE54g4A7eiIX3F7inXXFN6r5MkePo3L71H+fi0Ev2NOXRk9KD/6TZA==
X-Received: by 2002:a62:3844:: with SMTP id f65mr5748469pfa.255.1586534474095;
        Fri, 10 Apr 2020 09:01:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x15sm2063364pfq.107.2020.04.10.09.01.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 09:01:13 -0700 (PDT)
Message-ID: <5e909849.1c69fb81.fa50e.6406@mx.google.com>
Date:   Fri, 10 Apr 2020 09:01:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200410
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 273 boots: 5 failed, 257 passed with 5 offline,
 6 untried/unknown (next-20200410)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 273 boots: 5 failed, 257 passed with 5 offline, 6 untried=
/unknown (next-20200410)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200410/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200410/

Tree: next
Branch: master
Git Describe: next-20200410
Git Commit: 0434e521ce3b67f8305d91c3300e93821270cddf
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 24 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200409)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 52 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200409)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200409)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200409)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200409)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200409)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 14 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab
            stih410-b2120: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

---
For more info write to <info@kernelci.org>
