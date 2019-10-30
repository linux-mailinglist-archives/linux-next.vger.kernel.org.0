Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50BF2E9D6D
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2019 15:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfJ3O0L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 10:26:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40219 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfJ3O0K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Oct 2019 10:26:10 -0400
Received: by mail-wm1-f66.google.com with SMTP id w9so2399831wmm.5
        for <linux-next@vger.kernel.org>; Wed, 30 Oct 2019 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/a8YTFRP5302T8zBw2B/scZMPa2GMb/4VlyetuFRKYc=;
        b=Ip65drrrfQ+gZ/ek34By+0J3u4w4EG7hLbrON+Nk4Ut4DNQmK4IW6W+Dszc1byjlVz
         UeSg/IlSaPr4jTj8HOrUjTmqZDgEwdHwy3KJyaIFVLvqu4PmlgJa+GFo7lCkkbiPM8hZ
         8D21gCWCS3LwNFlLT2ncbMgKye5qTMidAr1gNjFSOJ9ESTsRQ9Yqen1KqyX8a+gn+Phg
         z9uoNhvaCl0SDYwJ/+MLSxvJ/m77YeQydwGNKTgjlMuqaanbvzkw+S/7I4dhaVY0Ssgw
         XmfMNnmS+OOJtSO+ftD1q8ZIFuKPxR3OaT3yGHYYEJCBQDjCcI8so0nazf3F+3XHdM43
         Jpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/a8YTFRP5302T8zBw2B/scZMPa2GMb/4VlyetuFRKYc=;
        b=MSQ4dXUm92HmMCZEOluZZ2mOf1CJVEeedi1LBtpOXv3nH9HZ+hSVoR9k2ufR3497MI
         ynW62CVVNhaY4J9St48YuhNQfKVLJW5eS9sKXFgktpo2MoCeibbTSVm7NpXc7sGOlsVC
         BCvNW4WJzCzrJUvhphIUBGff2z+6U1eyRPz2Qbg7czBakdjuD5QxlngB+6OPZavOvNGQ
         2NdmDzQkXU/a/qKtZvtpED0IEC2cue9ZueR2bpl2cgtO0HdIRfdonL9LoqTTGlCwLl/q
         n+8vM6vyXkioYf+/lZdG0e8a7digkuUEPqU5qFBRmGunmjIOi/BXRh1L/HSHb2Xyo1R/
         BANg==
X-Gm-Message-State: APjAAAX8cVGdzf3LCVm2BB1Q3o+pmDD6TrbGjrk5BSu7Pud0IiVvezp8
        XfI6jpvNp8DYDVuj0Zu52VQOaKpopQvyIg==
X-Google-Smtp-Source: APXvYqwAWJmyr1Gnu7Q3vNkFRhM0GN5ngC4+ZNP5CgakoB3PE3aKFhElWy/vZAHl64iI/c0MNft/Jw==
X-Received: by 2002:a05:600c:259:: with SMTP id 25mr7405924wmj.135.1572445568370;
        Wed, 30 Oct 2019 07:26:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f13sm386746wrq.96.2019.10.30.07.26.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 07:26:07 -0700 (PDT)
Message-ID: <5db99d7f.1c69fb81.cc1eb.214d@mx.google.com>
Date:   Wed, 30 Oct 2019 07:26:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191030
X-Kernelci-Report-Type: boot
Subject: next/master boot: 242 boots: 8 failed, 225 passed with 7 offline,
 1 untried/unknown, 1 conflict (next-20191030)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 242 boots: 8 failed, 225 passed with 7 offline, 1 untried=
/unknown, 1 conflict (next-20191030)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191030/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191030/

Tree: next
Branch: master
Git Describe: next-20191030
Git Commit: fdbc6c104f956257ee41b8be7c846e6c2035291e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 26 SoC families, 24 builds out of 216

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            sun8i-a33-olinuxino: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            hip07-d05: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

    defconfig:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    exynos_defconfig:
        exynos5422-odroidxu3:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
