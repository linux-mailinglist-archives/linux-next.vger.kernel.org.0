Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFA61A6480
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 11:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgDMJOp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 05:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727879AbgDMJOn (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 05:14:43 -0400
X-Greylist: delayed 449 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Apr 2020 05:14:43 EDT
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1076C008769
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 02:07:12 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id o1so2733719pjs.4
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 02:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nLK6rQKnsYFgZHhqs3Dbe55s4KvmuXEbU2L4dtz+kYU=;
        b=FFE7Xm2NKygDuQy+wFZcLHmkcw40sxIpphMCSksZYkud9HZFWYrWpkns5S1GHnbONV
         bxnV9zE30FmqoROU3vHNVFRl2tb6xLWsz5EBGfHyPdlK2/bPr8ojZNTzBe2mHWavK8b9
         YivRe8ZfycajFQAxIyiiZXbXnIX3wGgeuoY9DF7csuYW1M3+fhR3GhZZco2O+dkokJ61
         IoB8vgMBFVhN0F3RybU7WRaPYBtvVq4TI+S7WfnRbtM+FIetnar0IJkrdJNqfbyHLWmj
         vNPeH/zd39WhdUUm15SZIh42ay6lAyBjvFAFb+HiZEYCyjE2pl0bHxHFot8pp9Mj88tn
         SIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nLK6rQKnsYFgZHhqs3Dbe55s4KvmuXEbU2L4dtz+kYU=;
        b=pTlY4qYYJGZaj+gYDR2Yf81kqw2YwNOnZHLAn0TG2PEvuL/OcR0U6eGJu3Mwo+7wwI
         ugH4GANSUSDbklgR0fFDApNnLo/2Ce7zQSxDmM4xoh3fGNqLSNClvu8938mrsURK3E3Z
         qvlHZogqvfPDToN8Qjq+j+cWADtJof6DEaZtQIVJl3+6sYOQsHYi0cGocV9MJSFUsR+0
         qeUIfmkErORH26U80VblqeVaorJJdoJKpqQzhfXr7EmrgqARtXChZaKnPAk9xmAu1hRA
         Iv5OVh19BV+GprxH222O4UGzJ2+ghXaWKFlW8dqdj4jaz+jeaOXr9DzGgYeEojB/SnNx
         0q4w==
X-Gm-Message-State: AGi0PuZ+Kooa2E1ADgNdScoAv8dXhXRBqyFsj5Ck4Gtk8DAqtLuee66s
        qLrYWXwOUol5ybVjGXknp5R/GcSHvew=
X-Google-Smtp-Source: APiQypKIZFCMDWY65nyUlaLRUbm0QyghwPZPF/1PbcgAH9lZplog+0svD+kn/L39VbNl2RPZ5orIsg==
X-Received: by 2002:a17:90a:ca8c:: with SMTP id y12mr2639960pjt.195.1586768832119;
        Mon, 13 Apr 2020 02:07:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ep21sm6461326pjb.24.2020.04.13.02.07.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 02:07:11 -0700 (PDT)
Message-ID: <5e942bbf.1c69fb81.3da92.53b0@mx.google.com>
Date:   Mon, 13 Apr 2020 02:07:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200413
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 272 boots: 6 failed, 257 passed with 4 offline,
 5 untried/unknown (next-20200413)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 272 boots: 6 failed, 257 passed with 4 offline, 5 untried=
/unknown (next-20200413)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200413/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200413/

Tree: next
Branch: master
Git Describe: next-20200413
Git Commit: 3b2804993d1e9f2b01f4264993009d3e48722e0d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 23 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 55 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200412)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200412)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200412)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 16 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab

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

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
