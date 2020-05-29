Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42DC1E779A
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 10:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgE2IAp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 04:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgE2IAp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 04:00:45 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C27BC03E969
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 01:00:45 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ci21so878647pjb.3
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 01:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KLkYZ+cZ41y421oa0DUyka5/l8x4zZ55sNCNblaPhVo=;
        b=TqdAEOWWECHm/pVj9wVpiIqu9hwzQsQVXRwbOR5iLefHJF5UcV2DNNke9OPIf8rjSI
         +A4OfPAMKJa+0b0+lUHbkLV2CVRc9e4ZmTOSm6cxcrfm2l/LYYhnsOApcrU3TNGjTjTG
         Yx7dpUK1ESUke6cnfsXIPTZGATDTeXDM0VEpiP5oevb5V6Ci8njKFC+CPshFBwTKuZnn
         BNniOeQNoODSP10i8WqY4l66OgsZDRpzzn2+/fGzCZz4/Ad9yeirniGtD4MdP1rtu5bO
         CPgMi8mNDuVroAOVOLIQ2LyJ7Lg5DOL6iiyWMe7wXk/TctsGW3zEgJ2blVuVqeTVfQTa
         0c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KLkYZ+cZ41y421oa0DUyka5/l8x4zZ55sNCNblaPhVo=;
        b=RwHqGOrKPplqaRSFTNxNxStk6vG4LFrAmVj85mVxP0UfENs02Jnz8cxO9OL5pn2Ows
         rmN78wgWPkOz97FO+IMQwY6krLy/Ca7i5qcrNiy4Iib4B76X96MPqF2vKqt1LGsXyMcU
         9nVaMg+ZeSUqEHilKyDM5UWGaZh0Yyk6LIe0OFAnKLfKxt6Gohy6+kg45CJkZvDvNTQN
         HfpWbH/383yYmRGPXW7hRQsn8M6QeRo5GdlonuE/nTjnuCfz0QPjeSrr3j9kj9CIlS6F
         j3QsrHqqJydyfvlGmGntbC3VEnOh8p5Qy77wvas/pAET6lzUiMaF5LV6q0vgN/h7bFZG
         mZkQ==
X-Gm-Message-State: AOAM5339b28jQcWZ/O0BTrA2G7LWwNpUDCYvnjoWLVx0Uq/uchHw6JBS
        pZOytDWwfVK5XiJUeg7BbJyKbG/EQuA=
X-Google-Smtp-Source: ABdhPJx4EagOLEpPB8JKUvpYaohiLp5A6+up6tdDqeDCNv8QcbvRTJrM51xW70vRW+B7P2S4xjoJgg==
X-Received: by 2002:a17:90b:8b:: with SMTP id bb11mr7680680pjb.219.1590739244479;
        Fri, 29 May 2020 01:00:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ft10sm3564553pjb.40.2020.05.29.01.00.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 01:00:43 -0700 (PDT)
Message-ID: <5ed0c12b.1c69fb81.4dbd2.17a1@mx.google.com>
Date:   Fri, 29 May 2020 01:00:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.7-rc7-238-g59fcbde6ab90
Subject: next/pending-fixes boot: 125 boots: 2 failed,
 114 passed with 4 offline, 5 untried/unknown (v5.7-rc7-238-g59fcbde6ab90)
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
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-rc7-238=
-g59fcbde6ab90/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 125 boots: 2 failed, 114 passed with 4 offline, 5 =
untried/unknown (v5.7-rc7-238-g59fcbde6ab90)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc7-238-g59fcbde6ab90/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc7-238-g59fcbde6ab90/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc7-238-g59fcbde6ab90
Git Commit: 59fcbde6ab90da87fa0bd1f51ceed3c14d0f845e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 61 unique boards, 17 SoC families, 17 builds out of 145

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc7-144-g6=
edb22d07477)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc7-144-g6=
edb22d07477)

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.7-rc7-144-g6edb22d07=
477)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 48 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-gxm-nexbox-a1: 1 offline lab

    defconfig:
        gcc-8
            meson-gxm-nexbox-a1: 1 offline lab

arm:

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

---
For more info write to <info@kernelci.org>
