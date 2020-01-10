Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA10136CD8
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 13:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgAJMP1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 07:15:27 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42847 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgAJMP1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jan 2020 07:15:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id q6so1580984wro.9
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2020 04:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=23rEqI48NreftWhiybQ9NxbKeVhWiru13KhgEpruzdg=;
        b=1t4XEjitxBjbIq15LZgXkkMt3MTNMXyi5erUxujdYfR0I2XHzcVvMePLNiDheQb6Wm
         trYbNlrYDbQRHT+ZkmNnGTOxFeOYC0W4Wr7XqjMjQJdTL9KRRtsrYiBapY5jRdQunkv8
         9ROQe24HB2i34HWqT7l7YQcH0bP6bxfKQgz7rf5IjmMBpRpDH5XAkPvX3iPXr+Qh18Gg
         lFSLbg4fcnfNitTZQAUrZv1sUNqUdwqIR1dm+CAV0ijUgOfJdBbaEq98RgHjYTMtVCZE
         7WTBik0vF1ha3eG6b04wSFWvGvex8JqFxjH9JQc0nZiB3+RVCdaBqpKA7E/OrlYdGUSx
         PaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=23rEqI48NreftWhiybQ9NxbKeVhWiru13KhgEpruzdg=;
        b=Lkkmz/ceS0Ytz2rBuQnYeBGe/nWzk75RbUE6CwTRqW/q6MiT1ujMHp3yyBELo2lcvQ
         IQ/G2UFh21nVIsmKRBy83p77Xzv7WEQr/IbCaJmDS+2+/kF7Hr3evWI2csisF8kDKzWz
         IOdozYPyQED/eeiwqsJA2nRfPMKK1eWYRX5R0IVD2WiNeuh/idpJ62maA/VAIdsvK5Cv
         EVjdFnaU2r2l79IZ7IvWQPnzUMDSC77IHnhjxN794QgX783OPW8QiyxOZsZqCsC/O7sA
         eBNgvdoSO0Ge/twtEztuCpxIqVK/m48pqbhRQurSAsLoVsmZrSfI8hXyUTEp89qM7SOt
         DXeg==
X-Gm-Message-State: APjAAAXx+RgNr4/O4bOTIsJGgwccYI4MUM6peqFJrm3D+l8HvN+kU9e3
        4sL0omnw9hbpXYYA/GGceWWB92P9NsIcEg==
X-Google-Smtp-Source: APXvYqxw4rwEy06IhNSoII+OxPTL5/xP58neVU6k+K77hr1ci/vALCaXYoBX6KvsKIAosDZBMjbSNw==
X-Received: by 2002:adf:e6cb:: with SMTP id y11mr3310440wrm.345.1578658525177;
        Fri, 10 Jan 2020 04:15:25 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g21sm2027796wrb.48.2020.01.10.04.15.24
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 04:15:24 -0800 (PST)
Message-ID: <5e186adc.1c69fb81.4f04c.94e1@mx.google.com>
Date:   Fri, 10 Jan 2020 04:15:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc5-445-gecb24723e078
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 186 boots: 3 failed,
 178 passed with 5 untried/unknown (v5.5-rc5-445-gecb24723e078)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 186 boots: 3 failed, 178 passed with 5 untried/unk=
nown (v5.5-rc5-445-gecb24723e078)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc5-445-gecb24723e078/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc5-445-gecb24723e078/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc5-445-gecb24723e078
Git Commit: ecb24723e078820b92525fd2bc07cc2daff2ac94
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 67 unique boards, 18 SoC families, 26 builds out of 214

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.5-rc2-432-g9eed7d73a=
938)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-rc5-266-ga617565a3=
afb)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-sei510:
              lab-baylibre: new failure (last pass: v5.5-rc5-266-ga617565a3=
afb)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.5-rc5-266-ga617565a3=
afb)
          meson-sm1-sei610:
              lab-baylibre: new failure (last pass: v5.5-rc5-266-ga617565a3=
afb)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

---
For more info write to <info@kernelci.org>
