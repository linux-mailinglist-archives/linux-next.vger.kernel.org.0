Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32ED016B371
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2020 23:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgBXWA3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 17:00:29 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36210 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727421AbgBXWA3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Feb 2020 17:00:29 -0500
Received: by mail-pf1-f196.google.com with SMTP id 185so6054311pfv.3
        for <linux-next@vger.kernel.org>; Mon, 24 Feb 2020 14:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dnT+BR+qy+DBwAIlLvmqu08CusF+HZe4pzRiTljNytw=;
        b=18i2QdEhNXImEDa/t4a322+WjOQ3fOg+lEDGXcrdsWhZH3sLxuiOXP8gIWL/eR1LLH
         VjfrAyyfKwMb5nssRnYmHeUCOhbINiYFPFT9GMQ+mKfHwSnYiPYUR7J+jpnpIjW9VxEz
         NOaQ/fPUerijvns6MCUXWNHXLkkiqSjlBSbUHj+/uWbHk4nLSD6s5ocLKoaZb9FA6hS+
         w7GupNhyqawIFSnxdcodRQsy0W4Y6mQtOHA2FNIsajR1ktyCs1heovN5NHajfeYCtNIx
         flru6nlKZyVCFQjQBzkZljxPEAXQCB5RCSqfx/C/yzCS6OYPGY8FWicNc6vUS7Ify3t7
         ZavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dnT+BR+qy+DBwAIlLvmqu08CusF+HZe4pzRiTljNytw=;
        b=Zo0CMFjYuRJ3ijd37pBI63tN5moWJiqhnRe1jlPvGSkqw454erV/aVnHl54uEDPc1V
         3hl63cYfDiQ7Zou7gFjZ5uBK+7m+nB/aBoP4eKXV89LzBXmPekxs2JU/BP6IQzSD35EF
         tvCRJGuFqs4e0U8yd1zqdxEWVaVrk4qa2xi6yLxwxH8X7CPgTExsb6RIIDyJcwK/0LYE
         c1gbS+TxoK2jWgYzahzVruE7OrSWlxwLdziRewb5ar3LSAUIFjVTda4JkcQuNJx65XRY
         Psje16ZmzoojpE//agbLdnhAceMlrS1eZPe/QtzXiNmkXpByhwKMNYtUdtdLpsIeYyR2
         y2dA==
X-Gm-Message-State: APjAAAUucvq4FaIjOA8hL2CwByUgK4iQKFFmsGa47PFb5gY2m/7pItJt
        ng9EDlgVgfTE55/oP2RbNbsoqMmes/o=
X-Google-Smtp-Source: APXvYqxNHaUobj3vL3KlWQ+HmfyPJTDeyhY9wy/Em80uFNrQ92zBLWH5a600cWFnDepMBJiAO3qJFw==
X-Received: by 2002:a63:1845:: with SMTP id 5mr55687128pgy.311.1582581627854;
        Mon, 24 Feb 2020 14:00:27 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i64sm14214948pgc.51.2020.02.24.14.00.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 14:00:27 -0800 (PST)
Message-ID: <5e54477b.1c69fb81.8ecf9.57e8@mx.google.com>
Date:   Mon, 24 Feb 2020 14:00:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc2-548-g14e518b63427
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 198 boots: 4 failed,
 193 passed with 1 untried/unknown (v5.6-rc2-548-g14e518b63427)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 198 boots: 4 failed, 193 passed with 1 untried/unk=
nown (v5.6-rc2-548-g14e518b63427)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc2-548-g14e518b63427/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc2-548-g14e518b63427/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc2-548-g14e518b63427
Git Commit: 14e518b63427c1224d3f30dd93757cb32a9aa167
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 68 unique boards, 18 SoC families, 26 builds out of 216

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 10 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.6-rc2-429-g943e218ed=
d5a)

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

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
