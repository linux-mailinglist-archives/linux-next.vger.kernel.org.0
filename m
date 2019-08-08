Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE808865B3
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 17:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732477AbfHHP1X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 11:27:23 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55230 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbfHHP1X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 11:27:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id p74so2817806wme.4
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2019 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oOgsL5oIKZ6pjWo5SQXyZMDwxSUiyAr2GUFPbj3Reqg=;
        b=McwgZ5SRjx1UAomZ68dubb0EVViwTvL+knQ25REwl964HogKhy+z+uIv7t6RfHFrLl
         jvsjsfW8RPzho6QRyP3IDfuSVQCesd3V5h1MWiwQt8U96CE4aKxhPCRFzM4BrHqQm8Yk
         9JvUtQiEc/7ZwWN+4gzGx0xQ9y7FHhZkISmq6WK02S+0nxi3d9hWzNDZlgWic29sKE3n
         JUkV2tHly23Q7FKRyeIMVjJxLvAKl7myme1p0U4KIA6jhCSaujT3ljgkXb7cSy/ZSHj6
         546bHDHrdX1hyZL8SxbsFTz1IEt7n+5E8CIaPuVstv2hcfxajQzh5OoqDIcsTD5nvJ/m
         Jf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oOgsL5oIKZ6pjWo5SQXyZMDwxSUiyAr2GUFPbj3Reqg=;
        b=YNYguwjn1D5Oo4kc4kVtFwC985ecrf6oBhgRxbcMCHH7JfrRXMu4miQXavu48we+sW
         G2tbk9x7K1pBhSdvJMIMpoPd1nTuQmsSo1c9WwnBoYY7qR8ZZgazJuYOMzdWcqw0rVnI
         joNcTWusih/t9jlVzEQOB1LMkaVek80QKBdXzzExVOlLeYhj+AxoG0Y/cH2SUzg+bi4J
         Kb5Bu7DDqhO7Cr1EF0k9ikpg2QTI0f9Puyo6arvMxmtTXisK1IOFppw07Rkblq4dsI+E
         TBw7p3uVkd8qdDcYT23eC9iDdRPNN/jwevGoa078C9+x7IaMdj15jfstEPVFz3wNL+Dd
         pQ2g==
X-Gm-Message-State: APjAAAWsj6t7zgB5INnnrEHpMd2zEkKsXMrHVJ6osfqQsEyvkRIa4UDZ
        yFt+iud25h7tICtfT0JiB0+6//S5eiDIGQ==
X-Google-Smtp-Source: APXvYqztyW9xQm/tAGDO1+MzHHnLxMrTgn0iv2l/FpXsASqhZw5XBNA9NJSB1o8Pbkpe+u99lVoqKA==
X-Received: by 2002:a1c:c742:: with SMTP id x63mr5351773wmf.0.1565278041344;
        Thu, 08 Aug 2019 08:27:21 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y16sm202948813wrg.85.2019.08.08.08.27.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 08:27:20 -0700 (PDT)
Message-ID: <5d4c3f58.1c69fb81.39b2e.6ed6@mx.google.com>
Date:   Thu, 08 Aug 2019 08:27:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.3-rc3-496-g15d5760478fa
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 217 boots: 5 failed,
 187 passed with 20 offline, 4 untried/unknown,
 1 conflict (v5.3-rc3-496-g15d5760478fa)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 217 boots: 5 failed, 187 passed with 20 offline, 4=
 untried/unknown, 1 conflict (v5.3-rc3-496-g15d5760478fa)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc3-496-g15d5760478fa/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc3-496-g15d5760478fa/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc3-496-g15d5760478fa
Git Commit: 15d5760478fae77d83ebddcdf7c77c5c44385125
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 28 SoC families, 21 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
