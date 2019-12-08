Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF1A011604A
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2019 05:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfLHEXa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 7 Dec 2019 23:23:30 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:41426 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfLHEX3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 7 Dec 2019 23:23:29 -0500
Received: by mail-wr1-f53.google.com with SMTP id c9so12225778wrw.8
        for <linux-next@vger.kernel.org>; Sat, 07 Dec 2019 20:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RCtLuqfX/8BcnHIQfOWrBEJYbiA9IaHp29kAwvy7x6c=;
        b=t5LjGKbt7ydSet0oadk9iVYYvjc0l++yr2mDqnPfdAj1BqqqSh0Y0AgEK9W2noAqBZ
         Xdb4/9IpSSnucpNup2/j2RR4RdGGyyKlr8ToNL3ohcR2egvR9ikoa/DLG1oiXpbJ/Jqb
         XJHcnB5S5KAqeJIwUL/Wk2lt3f/yvghBcvQZz1Ceto9LE+iZeAU3RQP/WiRoQjCuQ44k
         /iYjsNS/bnwX/6GL9iEQWhMSlbc+T43tX/f1RxkRtIlrDV9utC+opy31BZ2YZxtxvQZ5
         mql6j09zdHA9F5cnj2Mx3F4NLriL9FcIszF0RXNcQ5SKk50/94jO8rl3Bh3CbIU02tuZ
         ZQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RCtLuqfX/8BcnHIQfOWrBEJYbiA9IaHp29kAwvy7x6c=;
        b=rMfut6BB+ZtQlc8DR9kYWW/mOYaszlEzHE4HXwXXPRoRxpZwqV4CW0cyorYrhEsKjb
         pYzOLRK7wrlcI8W2Whkp7YLo0H4oBdQJzx0VcC2BrJIdJ5o5XSbBB62yY8VK53reYZfJ
         dzUNQM0yhtfdiHnhslBBjFSazrOjxE/cnIpBmw1bMMLME5szrQs9nrH2fUrMHMue3q49
         MufdueT5ZmjpKTKtuBd7uDzevifsAmbwuzjxFLsuuz255ZgFNg2zzZN7TXODS0scr+NV
         lBa5Pu1AD6FieuTtYsEXVV1x9dy3/tXc6nDFME19CcrR1/RB+fgKdrBNu1Tf+cKUlkmn
         tkCA==
X-Gm-Message-State: APjAAAU4JEyyYnQrqtFvBJC11aB+Dm3E15ZTzCQQqfUEGkF36Z21OMcL
        bUA3pS9+0K3FZTCudk+DQ4gB6oNc0nQ=
X-Google-Smtp-Source: APXvYqxRq233P95RGBI8McmryZ/S/ygaIf7KLgJWT5wG3rdlE31GfcrRyFzDBijtOuNu16YqOiN5FQ==
X-Received: by 2002:a05:6000:1047:: with SMTP id c7mr24480920wrx.341.1575779007165;
        Sat, 07 Dec 2019 20:23:27 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id p10sm8651364wmi.15.2019.12.07.20.23.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 20:23:26 -0800 (PST)
Message-ID: <5dec7abe.1c69fb81.c42a5.213e@mx.google.com>
Date:   Sat, 07 Dec 2019 20:23:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-13395-gf8186a61dbcf
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 276 boots: 4 failed,
 264 passed with 6 offline, 1 untried/unknown,
 1 conflict (v5.4-13395-gf8186a61dbcf)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 276 boots: 4 failed, 264 passed with 6 offline, 1 =
untried/unknown, 1 conflict (v5.4-13395-gf8186a61dbcf)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-13395-gf8186a61dbcf/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-13395-gf8186a61dbcf/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-13395-gf8186a61dbcf
Git Commit: f8186a61dbcfd6a618097dfba5311323b27addc9
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 97 unique boards, 26 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            juno-r2: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
