Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0A31B56FC
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 10:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgDWIM4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 04:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgDWIMz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2020 04:12:55 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE65C03C1AB
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 01:12:55 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id o185so2545055pgo.3
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jTeYAlKDlHEwxMN+t5jYCoaSmpX1as9jWcuUbWJanHY=;
        b=Or5SY0nWSTWAxOu9dmuz0JQnG56Wb6qs8n5nCN0lyAzzv9ucLmOIb0X4qmjC10Lb1P
         iGHeuOwEiDr2J2QMtOB9k3Z0WWOxcvK1VQil1yhJw6wv6whJ/IjKV5kd8JKAv38HKYdm
         uGg1vkGLyEH9lKIVZnPdPmcMv3Tsu7LPWf0Q40qfg6/Ex6E+cBhMoGDnfkLYEBzYGNiP
         n4gQ8Rvr99Ms/hkIZDQxD4dxijTYh69AFFBJSliemTdP7EHkjmtR+yLqg5vMg/jsd8YF
         /Zo7NKTCaez7frTTai5snv2bdaczPG7smneoN80HNVMfp8KhoSbs+B8vlH+nVEosNABI
         eqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jTeYAlKDlHEwxMN+t5jYCoaSmpX1as9jWcuUbWJanHY=;
        b=am+UVswVE74OfUD6di5IloM4cwxdzb/52aOHmlTb+oM9/EBsZehT+HMmYj20TC1FSq
         4QdGov3PMN4x3TGl4pyIfOuCYcHPOciFWjsazmRmLVWqGi7d3V6OUZxNfvRjFA8v/zyF
         dtheNppVYqlTr+8d4SNKBPAXm6TDbuUChZ5FQWliFe1BcEY6EtIFpMZpVm83DJwVI/Fx
         nqEOzgN4BhD8hWEAPw2KwdgAEsQl/GX+ng8q40988286nIbJnG0d9Jdck4jMzVr/VVN8
         BR0XGvS/JsCbgV5ogt/nXHWHuom4/QW1J0XZuNqBsgJ7SXkdG26hx/78o8t5B5I/G13K
         ECng==
X-Gm-Message-State: AGi0Pube5ngFJ/3jjQG5J5ounLKVAYOMz2GF0Jm2jfxV79NSRNN1qs3w
        n6I+cq59UPuEfhcIxcLYadyfohjOyS0=
X-Google-Smtp-Source: APiQypIpyzrNBmNwF53HB0RBZ9/yntGchs9UW/dtQYJDeEIvHR/HoC69ppydMr0XQm/zFkLyCpA8DQ==
X-Received: by 2002:a63:4824:: with SMTP id v36mr1611539pga.398.1587629574685;
        Thu, 23 Apr 2020 01:12:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k1sm1355277pgh.72.2020.04.23.01.12.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 01:12:54 -0700 (PDT)
Message-ID: <5ea14e06.1c69fb81.e2ad2.56f7@mx.google.com>
Date:   Thu, 23 Apr 2020 01:12:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc2-434-gdbf9c50efa4d
Subject: next/pending-fixes boot: 149 boots: 4 failed,
 132 passed with 9 offline, 4 untried/unknown (v5.7-rc2-434-gdbf9c50efa4d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 149 boots: 4 failed, 132 passed with 9 offline, 4 =
untried/unknown (v5.7-rc2-434-gdbf9c50efa4d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc2-434-gdbf9c50efa4d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc2-434-gdbf9c50efa4d/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc2-434-gdbf9c50efa4d
Git Commit: dbf9c50efa4d9df1de245ef37f492cf2cd71d8f7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 69 unique boards, 19 SoC families, 28 builds out of 217

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-266-g3=
c7f529d10ff)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-266-g3=
c7f529d10ff)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 68 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          sun7i-a20-cubieboard2:
              lab-clabbe: new failure (last pass: v5.7-rc2-266-g3c7f529d10f=
f)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 8 days (last pass: v5.6-3095-g771732=
386d6d - first fail: v5.6-12726-gcb0447b07277)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-266-g3=
c7f529d10ff)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-266-g3=
c7f529d10ff)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-266-g3=
c7f529d10ff)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 12 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-rc2-266-g3c7f529d=
10ff)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: failing since 1 day (last pass: v5.7-rc1-369-g=
ddfbb969755d - first fail: v5.7-rc2-266-g3c7f529d10ff)

Boot Failures Detected:

x86_64:
    x86_64_defconfig:
        gcc-8:
            qemu_x86_64: 1 failed lab

    x86_64_defconfig+kvm_guest:
        gcc-8:
            qemu_x86_64: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
