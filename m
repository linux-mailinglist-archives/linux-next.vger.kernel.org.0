Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77502A2740
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 21:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfH2TZx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 15:25:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37120 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfH2TZx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 15:25:53 -0400
Received: by mail-wr1-f67.google.com with SMTP id z11so4595376wrt.4
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2019 12:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=k7eSbPueeRYbhwmucbkqvw1kmWpZzltBlU7yQe/kJ24=;
        b=LfIDpiwplLD4zzZdG1ZMEtRTCMqNWap4uqjLR/ZD2+JVuC8xE6qeGHpNyS65+Lolmz
         PKK1bZgF5SyqR6RgPNwrYRkT7d48H5J+Z81xzGAuQYGlD/c2n7k3P7i7HVk0iKsA/8Js
         L7h7igcZooY2bCc8M2bt/lQY92LhGDrfBXGGcoUZYunQIGge2PjZRvq0HlD3yF/HFRn7
         ewwgyQi9lzD5XZaOuVrYBeX2c2+5MbTfJ6aN/I9X+8SG5iY8f6eSWneWOVOTovB35uvN
         i4+3T8F9ZjtVNEbcFsH5NtOEcYrO/YhjTmD2mXK1rJgXiPXQvK/hnr26WO+hlk0ar4La
         1bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=k7eSbPueeRYbhwmucbkqvw1kmWpZzltBlU7yQe/kJ24=;
        b=OfqGqopsvmd8RgQqiMkhJVjGU5VoSutmDPxiFd+95sVx9iSZxuj2Di4KHisb6EWxYV
         LOgG5MDBZs+EAcR4yDjjyBNB/8N1A6436v9X2Izof8kTwOKEAdbvzmKIG7/HEGM2YWJs
         LYEVh+cmGMlH1UO38DgBkkjOj59uiYbnMBORhv86Rn4RJqyPz62a58vbZ6EQXqxT4gj5
         Un48fMM7vpzDrkfPVpZJ2J08pTul3+IkB5/BqtSuqUYmjqg1yLEbffUuq3RpFP1iiUjh
         kjSeWMtINyCiSys/8G9G62xKRKWt3ROY7TQl7cw+ctOHtdryFtWHonlp+qNsmVQWVHPq
         UnLw==
X-Gm-Message-State: APjAAAW2AFCipodCMhtbNti2DrSKS8qail33+mti7RLuuwtRcDwFN3ho
        IHRDVtFtqA9tBy2a0hNh8MIVkoDRAnoL2g==
X-Google-Smtp-Source: APXvYqywhGlNrCIjdvwaAR6klURLcTUlr5verwwld/xRZ8l+8yjezkU+b7Bc6oAxVmaOUYHP3W69yQ==
X-Received: by 2002:a5d:4083:: with SMTP id o3mr13973079wrp.150.1567106750686;
        Thu, 29 Aug 2019 12:25:50 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k9sm5240881wrq.15.2019.08.29.12.25.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 12:25:49 -0700 (PDT)
Message-ID: <5d6826bd.1c69fb81.dada7.a075@mx.google.com>
Date:   Thu, 29 Aug 2019 12:25:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190829
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 209 boots: 6 failed, 190 passed with 11 offline,
 2 untried/unknown (next-20190829)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 209 boots: 6 failed, 190 passed with 11 offline, 2 untrie=
d/unknown (next-20190829)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190829/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190829/

Tree: next
Branch: master
Git Describe: next-20190829
Git Commit: 64c1a9f4736656edf16d41714bea5caab1234a2c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 27 SoC families, 17 builds out of 217

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab
            sun50i-h6-orangepi-one-plus: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

---
For more info write to <info@kernelci.org>
