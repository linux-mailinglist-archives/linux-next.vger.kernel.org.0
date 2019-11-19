Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 202D6101238
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 04:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfKSDcG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 22:32:06 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]:55665 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbfKSDcG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Nov 2019 22:32:06 -0500
Received: by mail-wm1-f46.google.com with SMTP id b11so1514381wmb.5
        for <linux-next@vger.kernel.org>; Mon, 18 Nov 2019 19:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KZGl7E2ogQyfgDB3utAlCwTPfJ9BjSMOWbe4sINXWyI=;
        b=U9qqvrRJ/SMy6AKPPWnMr57nCs8sT8eYCEU8Vyyor4iTt9JnCCey2fxflqe53EZ3Fi
         DaPN4WCzZ9Hh73L2SE7N43CQiaVBeKLyTpe/R3CBL6NfFfeqLApRDolN3Kfp2+9bRiYg
         c1kdidhJTYKAZ4TAg70KpkB6QFU18Kb0wNTZnrLrXS715a6k0U9T27CriwM8Nb8gUsOZ
         SBITI4FcJ6FMsWfS+RAgIq9jC+4TyWDQgtQjNL5A2k1eancZAk7aNPevxUzIMq35oV9x
         da3q8VTps0NUcXddC9WRrUsAs816hhZB5UWqxuq9maM7GtF25dgN5h8exWWnuzpVtVHJ
         31nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KZGl7E2ogQyfgDB3utAlCwTPfJ9BjSMOWbe4sINXWyI=;
        b=k9rwEg84DBtEqmV54EyHJIYsJWyUcrjz7adCUQgthGE5b2++Vre4m3kEST+iCAsw4t
         bxO14co2ZGzgXHVQ3+u3oX090m7WpnBMBGXFoaXqDGvvN78YZZi2tthog3wwJOv2jSBj
         RpXaQEaQSR4saTBm+HFMSgcCA86IHksYNE4UkrkL5zdo8CvGRwT3q85Unbxc73AsNsGU
         ufgIGFm7D2Ae5iB9GU3uGRC6987xaLZPECikyssKmuGZrhoz1j1rsMgd/LvzcTM8RktA
         9VYzHv9TotKMTQce7IRNO0nMJtLk+lB5747yqS7QDBCHxOMgWFvIpIbtc8wRrzulFZIW
         Nx1Q==
X-Gm-Message-State: APjAAAVvafrJsUxWY++xsqg1Yv0MQ6lBWOHFP2cjtzg/dn66RaEbnclj
        2Dgb/VEwSBGgl2ytRtlRxkCegr/in3r2SA==
X-Google-Smtp-Source: APXvYqxb9lJdl/Gn2V6q0jSf1I5fhB0SUveGzCQtE8CxYXJ1ux9lA59lJewCr5bkRhB2S2akcRJgLw==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr2783307wmj.32.1574134323639;
        Mon, 18 Nov 2019 19:32:03 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w4sm1465917wmi.39.2019.11.18.19.32.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 19:32:02 -0800 (PST)
Message-ID: <5dd36232.1c69fb81.c4dc8.6bbc@mx.google.com>
Date:   Mon, 18 Nov 2019 19:32:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc8-85-g0632e899eb04
Subject: next/pending-fixes boot: 254 boots: 3 failed,
 245 passed with 6 offline (v5.4-rc8-85-g0632e899eb04)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 254 boots: 3 failed, 245 passed with 6 offline (v5=
.4-rc8-85-g0632e899eb04)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc8-85-g0632e899eb04/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc8-85-g0632e899eb04/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc8-85-g0632e899eb04
Git Commit: 0632e899eb046db54d3b1c993811e0b1b7b90b04
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 27 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm:

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: failing since 1 day (last pass: v5.4-rc7-105-g0=
1970a127dd4 - first fail: v5.4-rc7-306-gb1a61072f202)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            bcm4708-smartrg-sr400ac: 1 offline lab
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
