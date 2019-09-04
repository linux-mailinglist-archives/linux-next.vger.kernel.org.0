Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2325A92C4
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 22:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730222AbfIDUEK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 16:04:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52316 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfIDUEK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Sep 2019 16:04:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id t17so132355wmi.2
        for <linux-next@vger.kernel.org>; Wed, 04 Sep 2019 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eyrfGxdX3W7CtEapUlYgAyniHlcc5LaA+14hkTplX+0=;
        b=Fc0/HW1hE3o9LAZ5Pro/LIaQan/ZNob/rpnJC+dz8Le3FYy7Jo5N4H4g21Mhef3EPC
         BCoJ8KgDZ2ixTGpKqvDM7or52VDxvzeoZUk6yepPiriZnBtok//Xg264q1r3X4r4vyZE
         Jf4zm9POVeUq6tATH8TaC9BBQOTczUooHWBFsM6T8a+1cyTm+9iD1gCTNmJV1fEJdHif
         cP9CbzdQFS7xr03KZbz76g9KW+VIY8Pcy1VywpaQFqxzqSrcT6qqZwA+Y3TLJUSo9+sz
         t2zMKiC5xJCb93M9OFB3PW4c1EpSbj8iehjoZnSlRDHGph1DnKIcyuvY6czSYIZ1C9rE
         pe4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eyrfGxdX3W7CtEapUlYgAyniHlcc5LaA+14hkTplX+0=;
        b=lZDmuPh1B4eDNzMoeLOWAeAE+llyokQJyXq+GQoO105e89dXk0bJJTGlJrHUm4ZgdS
         ev7bQsunKj2gDlNJrY9KzeJV4yallt5lWY6TNNnFOYQL3wFgZg+it/cwlTDVFOAlCWQy
         7u3wiVD6v9iRNdJbH4XdEHdd8+Yi829j3zS/RlCJ5XBxJzHFvmw8oVF2/VgjNjuOKIcW
         MWiA1+g4mYOkuG8ebNKI+q1eceN7x0/DXlehpqbZYyuQ2OZ6ThySfikJdBwIMw1VyHPv
         uOsjjPRXIrvZr/bY0W6RDhCKaq4cnXFHDZ5N4G/4eRKSZUksmw7nl75YauSAIohxzkps
         jC7A==
X-Gm-Message-State: APjAAAUl6LDIWTBYEl9qO1o1q6kpiFebNAhM7JOiFaY2Lm6YEhA5Fpjb
        0dqjyAtHk/J3DXNS+CeZH3FWH+l7dyn8WQ==
X-Google-Smtp-Source: APXvYqyuCGzAckJkR1Vb+inC83vuS5G/cjTsK7oogcnyAT6SGARu0WAyiFxJl9Du2l//IdhE+50R6A==
X-Received: by 2002:a7b:c766:: with SMTP id x6mr11360wmk.51.1567627448643;
        Wed, 04 Sep 2019 13:04:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f75sm126080wmf.2.2019.09.04.13.04.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 13:04:07 -0700 (PDT)
Message-ID: <5d7018b7.1c69fb81.f6f40.0b27@mx.google.com>
Date:   Wed, 04 Sep 2019 13:04:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-116-g18ec21ed1250
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 303 boots: 9 failed,
 280 passed with 13 offline, 1 untried/unknown (v5.3-rc7-116-g18ec21ed1250)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 303 boots: 9 failed, 280 passed with 13 offline, 1=
 untried/unknown (v5.3-rc7-116-g18ec21ed1250)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc7-116-g18ec21ed1250/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc7-116-g18ec21ed1250/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc7-116-g18ec21ed1250
Git Commit: 18ec21ed125080b893ae2f4e31a144198b8aedc7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 28 SoC families, 26 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

arm:
    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    vexpress_defconfig:
        gcc-8:
            qemu_arm-virt-gicv3: 5 failed labs

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

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
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
