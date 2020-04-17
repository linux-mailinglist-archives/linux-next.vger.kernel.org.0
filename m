Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D6F1AE2DA
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 18:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgDQQ4s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 12:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbgDQQ4r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Apr 2020 12:56:47 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD06C061A0C
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 09:56:47 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 7so2355776pjo.0
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=c8DnN8hJPRPsK9g1ho2Eml4FFUnANaPwjnNG5lUY0ao=;
        b=iJhtbdEN4nPeexxwkuXURzYkyyAqE+mArzbGjfveD3z9rxyh2HbTcNMS8Js43U38pH
         8yngA7yTeaPm0WGm49WJ+x+1C4czwbs7HkcTXcF3naAWrynTJ/URBQBmOGgoMowbmPjC
         CdKNBeOugl+LRcJUCwJD2OPhHFokyLgP1IFWBMLFCBGJDcv3kqhuhL7EaZQfshvA6bGQ
         s2g5Y+lzpwYHioy7qqJhZ1xomM5rp1UoEUEAN9dWiKvVQvxwWXbxFPXfhPRIkPjOyaSz
         XiCfDo6j5k4hJwOMt+yZCfpvkLTKWyJ/Igv7G7IZf9oL2HCMVmRj4Gri4UfYlCp2lEVs
         4x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=c8DnN8hJPRPsK9g1ho2Eml4FFUnANaPwjnNG5lUY0ao=;
        b=YhGk+sR3KU7LHiu1vBpCdz62b0PnFkkuibm/V5Ihg+xPFR6xG7PNoZMR2zcHFGkhX1
         utAJ4i4yIkul+iWzhbHHOZn1sNCZnHipbh1iNnZXa/DTq4KS2jceUKSExA9cCdRV1Rn/
         00ICbMjtm4OA0qfZyMHtX5OqlpHeaZ8Xx3uzG2Z0C7K1BomrC5pBgIWSXaRvYYW69JNg
         ALMsofKekL7bVluGrk+R+D9q8SMTGAwTY5eyRs8tH7x7inNJkR7zchRFBvc+C2HrRZAk
         oee2n+dGL8n663VizI0UB6y3iceHlXIeAz0C1jN9bveB2yY+NlnLnIKwyRlhi0wrYThA
         lBcQ==
X-Gm-Message-State: AGi0PuYk8x68p9OonDn9+VvO3v4Wk/uMgBDLPzfE7kq46jya51BppHPG
        4OqytVrtk5ML+ulhvy6UB5tN86T3Kiw=
X-Google-Smtp-Source: APiQypI8SWsvU+3tGwBKurskHzZzngL/PakNgJhApqJae9JJN7qdqnhTbsWUfkFDVDHS9SNPn6otNw==
X-Received: by 2002:a17:90a:1946:: with SMTP id 6mr5782374pjh.42.1587142606606;
        Fri, 17 Apr 2020 09:56:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i73sm10652619pfe.80.2020.04.17.09.56.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 09:56:45 -0700 (PDT)
Message-ID: <5e99dfcd.1c69fb81.34e3b.81be@mx.google.com>
Date:   Fri, 17 Apr 2020 09:56:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200417
Subject: next/master boot: 276 boots: 7 failed, 256 passed with 6 offline,
 5 untried/unknown, 2 conflicts (next-20200417)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 276 boots: 7 failed, 256 passed with 6 offline, 5 untried=
/unknown, 2 conflicts (next-20200417)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200417/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200417/

Tree: next
Branch: master
Git Describe: next-20200417
Git Commit: ea16390b6f2d61f0db6fadc8c512c012c1edd1b9
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 107 unique boards, 24 SoC families, 30 builds out of 228

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 59 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 16 days (last pass: next-20200330 - =
first fail: next-20200401)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200416)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200416)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200416)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200416)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200416)
          meson-gxl-s805x-p241:
              lab-baylibre: failing since 1 day (last pass: next-20200414 -=
 first fail: next-20200416)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200416)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: next-20200416)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 21 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            stih410-b2120: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        sun7i-a20-cubieboard2:
            lab-baylibre: PASS (gcc-8)
            lab-clabbe: FAIL (gcc-8)

i386:
    i386_defconfig:
        qemu_i386:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
