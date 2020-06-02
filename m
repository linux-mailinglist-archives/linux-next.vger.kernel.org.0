Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE3F1EC2DE
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 21:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgFBTgv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 15:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgFBTgv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2020 15:36:51 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39BAC08C5C0
        for <linux-next@vger.kernel.org>; Tue,  2 Jun 2020 12:36:50 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 64so5629823pfg.8
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2020 12:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9EON3eqYLONhGBJmKjq2g8WKAA8+ve7im5elMy2JkHY=;
        b=pSCqEpRMdpDnCxM9mFyNVKiF/x5LL910N8QKosuOEs7TTMhJQV1cJtY8Q5bvdiVsPA
         70CxxltFumyIXCkw7JvYaZlu5tiBqTJC8dp7W5dIhLaZkIeo4MYwIupMJReb6X24Hu1/
         AGgePf/irHms1tGW/3Lmbq+j5IxtVfi3SOqE3Mhu+LGFFqGeLGCeIsx1xjsujrhwMk6p
         80pvAsRnLmY7RIwymLXTXxzNOX1X97pEBmWE6YQhajSHXy8GHjQb95VUi/oEr+9cAyKT
         SHlpZ/N98WnV3djJHwo6Mpiaf9dQF+5OSyMLbInHP+ET+B/ZA0XrS3y4ES/7kjkHpT6K
         T/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9EON3eqYLONhGBJmKjq2g8WKAA8+ve7im5elMy2JkHY=;
        b=MVBJ/CDMbvaWhJjojNgnnF+EWjPA7pDmnfNsJJQrr0l+ZEdUG8ijvSYRNItwpzFx0w
         9GoO6Nk/iW0gFRTAhqnHMr6toTARVo1GyheZPWyYRykSGLEvAIxwo8HAQIl3qc3fqIvg
         Cck36NcCXZrknLffsCy5fBV70yqv6hm8peGpQmcNE8w552hZrhKu8Oe9QHuwsQXey4Lo
         rI6M+YwSQ6WcIEI+ApsyqFexznKS5ayQEEf64lLttI9XTXL/kaoIzxCqaAnPuORojkpG
         1oSAXIzaZoK/PPU3xmEnEE5vabVvRzkA2lXNNCGP59xQuykGVThWjE/9moTddRpDYi/u
         COkA==
X-Gm-Message-State: AOAM532q3fxoNlFkLLTqLLnbGmmvb29tEhG2EVMvvSRz4GtizGLpP6dX
        gmNdwvymCfO6BvdVfixl/oukxsqRUpY=
X-Google-Smtp-Source: ABdhPJzpXNpbMMJtWVYZOCMkN3S/Yhume3rHbZRd0u8Br8N3Khp1p3kd+ZuuTxVAnJlxof7gE7B4Nw==
X-Received: by 2002:a17:90a:46ce:: with SMTP id x14mr794360pjg.121.1591126610101;
        Tue, 02 Jun 2020 12:36:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v1sm3102747pjn.9.2020.06.02.12.36.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 12:36:49 -0700 (PDT)
Message-ID: <5ed6aa51.1c69fb81.3b9c7.f706@mx.google.com>
Date:   Tue, 02 Jun 2020 12:36:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200602
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 127 boots: 4 failed, 119 passed with 2 offline,
 2 untried/unknown (next-20200602)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/next/branch/master/kernel/next-20200602/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 127 boots: 4 failed, 119 passed with 2 offline, 2 untried=
/unknown (next-20200602)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200602/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200602/

Tree: next
Branch: master
Git Describe: next-20200602
Git Commit: 0e21d4620dd047da7952f44a2e1ac777ded2d57e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 72 unique boards, 15 SoC families, 21 builds out of 172

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200529)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            mt7622-rfb1: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
