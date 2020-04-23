Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301681B60E5
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 18:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbgDWQ1R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 12:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729564AbgDWQ1R (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 12:27:17 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1CD4C09B041
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 09:27:16 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id o15so3149924pgi.1
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9yvTqJ09OYm4uFcdlt8ustz6svPGqUfuJHfC0B3kNAA=;
        b=k+UJUabtgyeHv9kewqdpH9qYMIHVPMSnZrWfPGfqSqIYoFQTdNI8UT8Xhf/4RYbtMv
         nFLTqN7DMWw/6ZrNQde0kItGkJVwzUDgjSLlnqlcDZ+vrCMr/J4VSyD+4OPVBUUVR8W/
         K8FrE0QV3Ggc0TDDbpSp7BosXvFoVg5UJIhV33mZs1zTY3VDTVd8a/Fl5nmCo5IrsvR7
         7Yre9IiKvhn3m04zDC/IeQSd43Hi+Ml+HWmxUZ4TR487lYpbmXiNFKJZB6uSXFGDaAju
         MwBzaBtkY+dGCGOWXXlysMbwDyIxo0hGlBJimHidqnK0+jMRuiFIFVpZVgp1oWH6WUax
         8Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9yvTqJ09OYm4uFcdlt8ustz6svPGqUfuJHfC0B3kNAA=;
        b=qnpmwFxr/MG9PZxfCVxdqoQJmiglr3tfPbWVOhtgmS0dE4nCGxbu3PcXQkjDWHz7eL
         AphkSasJA9aiRFwEht2zI+L7kS6Aed87FztvNvG560IySi7XRMEDRO9JpToldF+CNQJY
         cMMhIROBU5easFBdUEAbe98lXjKjwj6sSRIg9YR0MERUZO2qzdlKUPxz2tnqnYY42bAz
         v2idEiiGd9lm5442s4Fyal+PMd8ZsKAVfQg49la8f9wFv6iOLCtFlmwg1RkWakeIzdRu
         tjG123os2YsRRVy7F6oOunttGob3VFn9xtMhfop39ygZmPSKUY/sXzksSdR885vcysBN
         vjDw==
X-Gm-Message-State: AGi0PuaSV5s99q4OyKH0Ng0Z9/eyfMQ+gFfU527mRWsSKLev+LtS2IUf
        EkUXJEtNTemVIjAjmeuOkMnJA2+kAhQ=
X-Google-Smtp-Source: APiQypKE7VkqxTrWaW9Y/fpAHfSYKmtDuNZ0wZ+K/BkEv7ibIZPsQxZ1S9byO/395xPdqeEdt3Hozw==
X-Received: by 2002:a63:1662:: with SMTP id 34mr4762857pgw.117.1587659235913;
        Thu, 23 Apr 2020 09:27:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kb10sm2363161pjb.6.2020.04.23.09.27.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 09:27:15 -0700 (PDT)
Message-ID: <5ea1c1e3.1c69fb81.2e23b.685d@mx.google.com>
Date:   Thu, 23 Apr 2020 09:27:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200423
Subject: next/master boot: 149 boots: 5 failed, 136 passed with 4 offline,
 4 untried/unknown (next-20200423)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 149 boots: 5 failed, 136 passed with 4 offline, 4 untried=
/unknown (next-20200423)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200423/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200423/

Tree: next
Branch: master
Git Describe: next-20200423
Git Commit: aefe184e814492e36b2ca350c1522bd71b09b520
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 69 unique boards, 19 SoC families, 28 builds out of 231

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          imx6q-sabrelite:
              lab-collabora: new failure (last pass: next-20200422)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200421)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200421)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200421)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 27 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig+kselftest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200422)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200422)

Boot Failures Detected:

x86_64:
    x86_64_defconfig+kvm_guest:
        gcc-8:
            qemu_x86_64: 1 failed lab

    x86_64_defconfig+kselftest:
        gcc-8:
            qemu_x86_64: 1 failed lab

arm:
    imx_v6_v7_defconfig:
        gcc-8:
            imx7s-warp: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

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
