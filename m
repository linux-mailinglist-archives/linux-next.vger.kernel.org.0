Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3C0105EEE
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2019 04:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKVDJO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 22:09:14 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:52576 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfKVDJO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Nov 2019 22:09:14 -0500
Received: by mail-wm1-f43.google.com with SMTP id l1so5916731wme.2
        for <linux-next@vger.kernel.org>; Thu, 21 Nov 2019 19:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RxpHxZpkfImOqufd7qXJ4txiM5HqIikyz1ghUcFubFM=;
        b=kOR8SYjbkN9gvB1HNyUxGPVhQ3LOPPmNI/o8JS1ONfUZVnVRuiak97D/LOoL8WfCSs
         jC1zYGtbgF5C0WyVZD/elY6C4ZDtnJ/63y3T1pFaZXNzgfZ9m2z7EGAt3oFNxZqQXQc1
         pk/3TWsXZiE6Qyz/+rl63Ro3a+un7myJzTMoRBZMahGzjFARzFapa1OzmJvKVpDGy/4Z
         IA7oqOcMVqFp/w6yy9caFIz9k3ZqJqfIG0ZIccpdfc96OU5vNplKcV8eMb1oxzaR/R9N
         XdoWSkbXx+44zaUJLYsdsxA2VkdNfJarTuK1jid5/UKH9fYlvOTiRDBlIpY4nr9sMz8i
         2nEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RxpHxZpkfImOqufd7qXJ4txiM5HqIikyz1ghUcFubFM=;
        b=gEmdxkij1up0hSDQFUDLIaVb/Kjlcx21OCwCZ4RNtnzWidSDZrA0f+hyKqC33ueKNN
         LZtV/80iFn+fwhQZNU2Hfwgm7sGjkML6x0v9wu5KLqnINq/CGERmXQ0oQsuDz3yuHIhE
         VIY6giKgdgYoQCB8EOt5V4UhXsJf9gK94kzbLLJtKuaoPWnTMk8eRqhjXOlNIoObyydx
         QtES2B+ANosBe1+8CDZoevVMJUUgPaaiKejakWKBD1s9YgMpZURw6lde3RzoU3jrTwm8
         13PgPgcygtVao8c4SmvZhohXhERYv6bLRu9nDCYg195cBQ1eLY1cFUwhHXBfBX2nyg8Q
         q2EA==
X-Gm-Message-State: APjAAAXfoOMgROaLMBFN/HxFEXkPD6NjuI3+eXmIMlAfKzjWZ+8qhV7D
        7lhgYsWaJsKG3rLuz0ABJtwp0CJiZZ/HRQ==
X-Google-Smtp-Source: APXvYqzLf6sc8OUdZrGovzU2/3RQjQOQohtDLmQN/KCYwjjEeWabsxPwBbn8n8ofoq1iQXRmpiunMA==
X-Received: by 2002:a7b:cf26:: with SMTP id m6mr7497265wmg.17.1574392151620;
        Thu, 21 Nov 2019 19:09:11 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c76sm1858933wme.18.2019.11.21.19.09.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 19:09:11 -0800 (PST)
Message-ID: <5dd75157.1c69fb81.ea899.935b@mx.google.com>
Date:   Thu, 21 Nov 2019 19:09:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc8-156-gba9fc86e6953
Subject: next/pending-fixes boot: 273 boots: 2 failed,
 265 passed with 5 offline, 1 untried/unknown (v5.4-rc8-156-gba9fc86e6953)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 273 boots: 2 failed, 265 passed with 5 offline, 1 =
untried/unknown (v5.4-rc8-156-gba9fc86e6953)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc8-156-gba9fc86e6953/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc8-156-gba9fc86e6953/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc8-156-gba9fc86e6953
Git Commit: ba9fc86e69537c5c4372edf162f7775d2f411705
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 27 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.4-rc8-126-g232aa1d5e=
73c)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.4-rc8-126-g232aa1d5e=
73c)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.4-rc8-126-g232aa1d5e=
73c)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
