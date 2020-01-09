Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E6513585A
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 12:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgAILqx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jan 2020 06:46:53 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:33778 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728656AbgAILqx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jan 2020 06:46:53 -0500
Received: by mail-wr1-f49.google.com with SMTP id b6so7130307wrq.0
        for <linux-next@vger.kernel.org>; Thu, 09 Jan 2020 03:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=k5DiZFfgoIRJL4MER6PKu5bdCGKBet+bacSzU9yjh80=;
        b=o7OmPi1DWDCoYFJJA+KPA4eFaEIRxxwt0IV6LB2JMeg/5hX+/2ZuiPzUd2kYktBZ2p
         5ojcl+ZTFHb918hsCnLvHHBdn3zmwoprI4CPQM3RpC/uuwt8p7YzqK7I91kSDYuq/h9L
         4wCwsIbTtFMfks60ACycVnZo13W4lf9yKjA7u42ShrhWrDW6xufsTLlGQIL3HgJwZwD6
         4eVJnW60BqEUxMoUcaQ8yYSmBTHkhcr3PKPq+wnDrQbl2oEYa6Z/gIVqMMtfuPE8ZWPv
         J0Qbgf34Bn2XeTgyAw5NbYD4GFd1PZFk2hnEdtkO6V4U0XgxBODqldRhU8buuCqS4d85
         leWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=k5DiZFfgoIRJL4MER6PKu5bdCGKBet+bacSzU9yjh80=;
        b=bJJpjab+uxT2gKwa57N7O5B9EANs1I/JcQvUSVvTTNQnvGzyu4cybDtTL2E4C5+9AB
         voI7IIwZ6art9mt6akSqwRwBfNzta0HaZdbVoa9s80RCA8NXyV9x+HQhKWTWZ7HeYpq7
         qfG+kNT+JIdbbZ1KR5V/Dd5TNy5hSppgm5R198vSuVHyh3UzHp596hNtycpFzPvWaAg8
         ccd+egFWwtoNEkFebi65/Bu4PEylI/vZgO6aydrqjkjWl61UaFgp5YdrK0pul+7enXDc
         j7b3o8f04KHcmA5Pb0T7WorGh//Pr9yK2R4geIAU3uiuOqvj7mrd8txzK1J+rf5opKL2
         MU6Q==
X-Gm-Message-State: APjAAAUKs+KhPFDQICfo7yPw32G+t6Buf/z7gjaqSUE4O0zzeFEG11/a
        960GmY8wyZyrQ5tQiIGNVMQteiEm3aeOqQ==
X-Google-Smtp-Source: APXvYqzeA2tqkXV1SWlh06yjZWhzecoHjO8walwqpk9/K7FK3PumK3yK+1a0zB0Pg2I65dH6fe46mw==
X-Received: by 2002:adf:9c8f:: with SMTP id d15mr10544243wre.390.1578570411041;
        Thu, 09 Jan 2020 03:46:51 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z11sm7976231wrt.82.2020.01.09.03.46.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 03:46:49 -0800 (PST)
Message-ID: <5e1712a9.1c69fb81.f39a7.6a4f@mx.google.com>
Date:   Thu, 09 Jan 2020 03:46:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200109
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 183 boots: 19 failed,
 163 passed with 1 untried/unknown (next-20200109)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 183 boots: 19 failed, 163 passed with 1 untried/unknown (=
next-20200109)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200109/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200109/

Tree: next
Branch: master
Git Describe: next-20200109
Git Commit: 85cff1ab64327cee3090050b3dd6b5f1df3e5e1f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 64 unique boards, 16 SoC families, 25 builds out of 214

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200108)

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-drue: failing since 2 days (last pass: next-20191220 - fi=
rst fail: next-20200106)
          am57xx-beagle-x15:
              lab-drue: failing since 2 days (last pass: next-20191220 - fi=
rst fail: next-20200106)
          omap4-panda:
              lab-baylibre: failing since 3 days (last pass: next-20191220 =
- first fail: next-20200106)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-drue: failing since 2 days (last pass: next-20191220 - fi=
rst fail: next-20200106)
          am57xx-beagle-x15:
              lab-drue: failing since 2 days (last pass: next-20191220 - fi=
rst fail: next-20200106)
          omap4-panda:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-drue: failing since 2 days (last pass: next-20191220 - fi=
rst fail: next-20200106)
          am57xx-beagle-x15:
              lab-drue: failing since 2 days (last pass: next-20191220 - fi=
rst fail: next-20200106)
          omap4-panda:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 2 days (last pass: next-20191220 - f=
irst fail: next-20200106)
          qcs404-evb-4k:
              lab-bjorn: failing since 1 day (last pass: next-20200106 - fi=
rst fail: next-20200107)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200108)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab
            qcs404-evb-4k: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab
            am57xx-beagle-x15: 1 failed lab
            omap4-panda: 2 failed labs

    multi_v7_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab
            am57xx-beagle-x15: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 2 failed labs

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am335x-boneblack: 1 failed lab
            am57xx-beagle-x15: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 2 failed labs

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

---
For more info write to <info@kernelci.org>
