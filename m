Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E819B960E
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2019 18:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405192AbfITQ4i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Sep 2019 12:56:38 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:33310 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404759AbfITQ4h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2019 12:56:37 -0400
Received: by mail-wr1-f46.google.com with SMTP id b9so7509738wrs.0
        for <linux-next@vger.kernel.org>; Fri, 20 Sep 2019 09:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kJ/8zTW/X9MGQ68CDrI/x5dXKakwUlGKYrfxsBITFRw=;
        b=HMLObEvZqvtWYfldmPftMR+LYc5t++uEQOsGbv54CsgXR5La2sfaxO4cGEVZ7tV4kP
         YfPbExmMD5/aX/X3x8md9kzNPsN5m73qAW3A5LV6A8J8scXzJ+FkM2dDoPoQ5M/mCI0s
         KqRTlPbKYqI/L6Md00JhMobruGv0utYvxDDB9EoEWuLiKRRoYC7QIpc8O9oB/BE/d5k8
         ECR86I8JCKMYfVZiEEMkBxBP5MYIpWUjXAvX1yfI5ML7aOnJSKdoi65LcBE2WYHdHlko
         V9fu4YeCpT7rM8FVpR16jTubokaVJxRFWtYiB09j56VxkyJp0NyTZmOg4G8I9GKZNfVx
         MXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kJ/8zTW/X9MGQ68CDrI/x5dXKakwUlGKYrfxsBITFRw=;
        b=EoQEZHDyK8uuxjJnjw9KeCeITcgQQK9rYXigiuPi7m8FTxqBVZoP+v+pkKrpjuWz5y
         DraJ7+omrYUqKUWm0L9pBWZTYaaE6zMdThjfRDK6UFYQdJvLQFCWQegCAlhEKUf0tKQh
         KgYSU+/z5oncDUg3JuspLc8FqDyFDcGePhoYpeSJjs1C993o8viCsQ4DIeLiERRQaX3S
         IY3iURf4wp3Ma5y+hBhN+j95TlUlxLQFqix4dI7TzVxPuKpmLldnRrInDN1dAh4F5LIy
         59u6F/PEKYaJAWUbaE7eOadXkFRkBlD3AUt59Ue3Ngtv+8QOGtUuKhmlJnkqlAsLZlXq
         tNcg==
X-Gm-Message-State: APjAAAUKKuuyPRZOH3WMNuqiwoKdBPOPeqk5XvTwERrqk+F4nA9ienkl
        CUXP92ZYxJjKK5zsCZkK2KoKe82hQQaUrQ==
X-Google-Smtp-Source: APXvYqx7IcGD63OtqS2ZKpOUoDTWi+K/Xt74pX5LXkZlO4BifIvP0A2O6e6ZSQLoADs3NxoLy2tN0g==
X-Received: by 2002:a5d:500b:: with SMTP id e11mr12705807wrt.285.1568998595853;
        Fri, 20 Sep 2019 09:56:35 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v7sm3300804wru.87.2019.09.20.09.56.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 09:56:35 -0700 (PDT)
Message-ID: <5d8504c3.1c69fb81.83d1a.069b@mx.google.com>
Date:   Fri, 20 Sep 2019 09:56:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-10264-gbd302977ecfe
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 307 boots: 14 failed,
 281 passed with 11 offline, 1 conflict (v5.3-10264-gbd302977ecfe)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 307 boots: 14 failed, 281 passed with 11 offline, =
1 conflict (v5.3-10264-gbd302977ecfe)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-10264-gbd302977ecfe/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-10264-gbd302977ecfe/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-10264-gbd302977ecfe
Git Commit: bd302977ecfe79e709503cdbbd1de778d2897eb5
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 27 SoC families, 26 builds out of 214

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            mt7622-rfb1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm64:
    defconfig+kselftest:
        qemu_arm64-virt-gicv2:
            lab-linaro-lkft: PASS (gcc-8)
            lab-baylibre: PASS (gcc-8)
            lab-drue: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
