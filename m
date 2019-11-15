Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48314FD2EC
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 03:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfKOC3b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 21:29:31 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:53074 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbfKOC3b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 21:29:31 -0500
Received: by mail-wm1-f41.google.com with SMTP id l1so8131401wme.2
        for <linux-next@vger.kernel.org>; Thu, 14 Nov 2019 18:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aKsfBGNXu3eyztDbP+oI8IUHMAjulbKkTCQQi041afw=;
        b=scitXX/OPOAbl46YetZsOXh/RBeOKMCZC2QRbRrxxzIVmH7CQT4bVMxA3O/t5Zl53d
         lAc3DPFFI/ldrW+x8hFOCEgBCKo2Biguog96Ok0S30N9D2cmwmmMxvDbaVTiY/46G2gp
         E+xtxTaWSfoh/wqO0Jnh1CA+VHbBw/vyQtZi4qIGhJWAEBKrzVk1LhrfIomvIuPOIKZq
         lXRlp4giq0hXDl5WGZNApqXaSaGyyBa2enGWpg5sgoQqtRLPIsne56WMzrSSTrZj/0tc
         ddnPrK8e8oHG2Q53BM4x5RcC2zaJb0wv/bCdaJCNFc3inJ+HrM0dqD9FEsroaJWt9RbS
         CCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aKsfBGNXu3eyztDbP+oI8IUHMAjulbKkTCQQi041afw=;
        b=YXby7aafvFk0ANkW7r3HkaMEb3GPgZJcVny9n9y/9SkmaJtY2/lZqwgBy1sAZuX3pf
         wd4mL4RxduroGDyiJwxMWamQOpTQV9pHsM5ISSk30LDzwHRDm1V3YsJ/i/p7WhjEpEsR
         UeFhCma9AwZChiYdim5DPWoo+gGXvU6qhasDUDT7joqq4fO5RLYQwuyyHbZqkk3AQ1KI
         m+nBd5hvTqWKT8gFbYK8XlosKuQ5oXVcoJ6KfXO0fOlVaUxnezFR72otSY4RuB8MvCyz
         +KdklquxSQCFFQOykYTFQPdBMrPNYSmI3Ge5XJewSPW4UMReToIxgeNEPEnGdUAMyoHc
         bcIg==
X-Gm-Message-State: APjAAAWHBwvaHWJJL3kn3l3dwH6oD8oOphVlM9guMjPug4Gw8oOV5B2H
        1/J2Q8Iqy8pzvXc8Alu90Gv4y5CPiykpXw==
X-Google-Smtp-Source: APXvYqwQE/FlDy2x7y6egk2a/oyaBWz23M89kffj1Lj3diRojkvPMSz7nOzqDxn4e2qCDojG6w1w+w==
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr11052407wmh.74.1573784969177;
        Thu, 14 Nov 2019 18:29:29 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s17sm7743571wmh.41.2019.11.14.18.29.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 18:29:28 -0800 (PST)
Message-ID: <5dce0d88.1c69fb81.fa780.505a@mx.google.com>
Date:   Thu, 14 Nov 2019 18:29:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc7-202-g2190e31dfefa
Subject: next/pending-fixes boot: 239 boots: 6 failed,
 227 passed with 5 offline, 1 untried/unknown (v5.4-rc7-202-g2190e31dfefa)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 239 boots: 6 failed, 227 passed with 5 offline, 1 =
untried/unknown (v5.4-rc7-202-g2190e31dfefa)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc7-202-g2190e31dfefa/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc7-202-g2190e31dfefa/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc7-202-g2190e31dfefa
Git Commit: 2190e31dfefaa786058111f2c95565862d2167f8
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 25 SoC families, 28 builds out of 215

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            juno-r2: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            bcm4708-smartrg-sr400ac: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            sun50i-a64-pine64-plus: 1 offline lab

---
For more info write to <info@kernelci.org>
