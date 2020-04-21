Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050801B2BA9
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 17:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgDUPxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Apr 2020 11:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725613AbgDUPxS (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Apr 2020 11:53:18 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E724C061A10
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2020 08:53:18 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y25so6759825pfn.5
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2020 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aOZY0e+8vHMzdOEka93z2xv9+vp6Vu17OX0eM45w+Ho=;
        b=0FEYbILbmDra9I+f2YET5hlrUIC4tg+FAvMn+bKtS1DemrBeGyTAYX9bvDi4Eu2E8m
         d/eCFVhP1iS8nryrEpWXNTGNJXtdD8od/AoXX99C5jfeHcv8E4Twp9Be/a/c1eCBtLkk
         iYK4HpMitJK5xqb5KuPTZtm61kzx8NBCiEFXoHN+1DXP7h/lZ1ovEltnAP3tKOuWjsW7
         3cTnGLUhZfWAslJO5fIr74Yiw8rnhogHla2D3RSQSstV0gNmGvetJtZBvQJmaJSjtCW8
         kXF8ytALr7epCNyIYBpiFCS6OdPTNpi36ng+0p1PLazJQR0U1xfz43/b0Znpa77iAUL8
         taEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aOZY0e+8vHMzdOEka93z2xv9+vp6Vu17OX0eM45w+Ho=;
        b=BxPCQXb0ZkUH/7sK1tSX4tGgKCDTYAWH+Ai8kwXsWXH8fiSK0nmhfg3FLF+Rfw6ZIQ
         l0N0rl1J1cjosVCm0OsJ5bcmULM5q19Tv27JVvt2y0wOTkwBuT4P/wvbrtJadXnYsvpC
         dVJrYSJd2UZ5B+DPdm2Y5NI7jeTCrbDHaG+0n2KCLH9yc79Z2ExseAqbkLoOGJ1cPS8b
         lRxrIHkxY8oYC4zCJC42BnkiWZObTT+ydH/5lTfsPSfzmREAO/AeQENLL644WfkZm3+8
         X3HgilZAX3TpkUzIUZE3jDbDYvfulN8NCza/VUUyvnoq3FPhFzGZ0QGKnNE7aixfWRkZ
         zRMw==
X-Gm-Message-State: AGi0PuaawYbrOOBzuIKO6QAz8tV7blqexP2cr6R8KilggtWZk153XWeK
        hwZP+K5/H7ZnBOxEP7ZXHIUI+cjDBb0=
X-Google-Smtp-Source: APiQypK/B/RI/Ljm/fYZk4RbrSSivqRqMew/Lt+8/qdBVx8I/lAqv1fKljiFaxXSc9BGZxy5Tt5aYg==
X-Received: by 2002:a62:83c3:: with SMTP id h186mr11970268pfe.192.1587484397297;
        Tue, 21 Apr 2020 08:53:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t7sm2690103pfh.143.2020.04.21.08.53.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 08:53:16 -0700 (PDT)
Message-ID: <5e9f16ec.1c69fb81.f4d60.81ee@mx.google.com>
Date:   Tue, 21 Apr 2020 08:53:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc2-266-g3c7f529d10ff
Subject: next/pending-fixes boot: 199 boots: 6 failed,
 186 passed with 4 offline, 3 untried/unknown (v5.7-rc2-266-g3c7f529d10ff)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 199 boots: 6 failed, 186 passed with 4 offline, 3 =
untried/unknown (v5.7-rc2-266-g3c7f529d10ff)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc2-266-g3c7f529d10ff/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc2-266-g3c7f529d10ff/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc2-266-g3c7f529d10ff
Git Commit: 3c7f529d10ff4c411d7296b5a13648c559f1de18
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 22 SoC families, 28 builds out of 217

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 67 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-rc1-369-gddfbb969=
755d)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 7 days (last pass: v5.6-3095-g771732=
386d6d - first fail: v5.6-12726-gcb0447b07277)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-194-gf=
507be28f9e5)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.7-rc2-194-gf507be28f9e=
5)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-194-gf=
507be28f9e5)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-194-gf=
507be28f9e5)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 11 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

x86_64:

    x86_64_defconfig+kselftest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-rc1-369-gddfbb969=
755d)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-rc1-369-gddfbb969=
755d)

Boot Failures Detected:

x86_64:
    x86_64_defconfig+kvm_guest:
        gcc-8:
            qemu_x86_64: 1 failed lab

    x86_64_defconfig+kselftest:
        gcc-8:
            qemu_x86_64: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            stih410-b2120: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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
