Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2039FAA7C
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 07:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbfKMGxZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Nov 2019 01:53:25 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:43707 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfKMGxY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Nov 2019 01:53:24 -0500
Received: by mail-wr1-f48.google.com with SMTP id n1so949738wra.10
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 22:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vLatROzkiQV7b3n07Z0wt9hoe/jtRUQ3ANYR2RmBq6M=;
        b=0wWTPPR9lYGGHFmsH487tc1jfN1ZeezCzdaRJL7OKvNiegT+Um4b0wabJDEKMvhX7V
         fuT76BQwbXe5T0aoPmT6/S9zfHfkH9VqxSsUyRCW8aDnexg2NmxBAH+hUwlNeGb63ppy
         roUpLUyFTm/8HYuRXrUdF1YuLea5uE8dAk5xHn4Dg4cjH68duPHmGNZ721q0xUZ5ibYR
         +jlk3qm0tU8YoQ8HZlRjNx6vjZrJkkoAFi8IjafLispqxHdAulFQMCeoten285vep+PW
         A9yn+TG3rT9IklQAepKDnGBIfUMfGC/yq3rr/eVTX+c/mZwC6L9RskNr6Myb9BACDIjv
         8HUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vLatROzkiQV7b3n07Z0wt9hoe/jtRUQ3ANYR2RmBq6M=;
        b=RWoAGoTUP365ChUKlcIIyEBXvyHNbkh89bSAZjHQX9LjM3nUHuBFuC3y/P4JAb5Vwv
         aL05JC35T9CeStqylHaYgVB0Spl99Az1iC/EsZL3dL2iThYDRfRU4r2jEVsqsV0M8NFy
         FpBo+beAI0py3uebz5uniECHBaoniOLuP/Zu0/DqGtlXbCBpuqV7GvneWnfSfQvFPbuc
         wgsR8QcjT+NE6cIVQdpD3wRbVIyIgxg3wcRpZdaTJvsPIpiKALhhaVEOyYg9pNkd/dlq
         Aq4/7pMDtZb/rcCakhUljlbTGIl/tCNXQziG7JBPZMlksRaHGL7/jXZ5wFD3OSwtAMJU
         Pjmg==
X-Gm-Message-State: APjAAAWr94CQhsSzCwK/3QNG3EI6Y9J7YhNRlRH4/RsgQcfTWxGIrw9G
        2oYz7TqEhbCmhPhQ8w+IpW6BE6Qx1lhWTg==
X-Google-Smtp-Source: APXvYqxtEHKloLsyKWF2Y9Bzj0g0tLWqcgb6edCyaiQkuBMfSYW4emACUYZayz/zoBL6wXoGi+wGIw==
X-Received: by 2002:adf:de86:: with SMTP id w6mr1196005wrl.220.1573628001684;
        Tue, 12 Nov 2019 22:53:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t185sm1341684wmf.45.2019.11.12.22.53.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 22:53:21 -0800 (PST)
Message-ID: <5dcba861.1c69fb81.aeb07.5082@mx.google.com>
Date:   Tue, 12 Nov 2019 22:53:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc7-162-ge83fb30397fa
Subject: next/pending-fixes boot: 234 boots: 2 failed,
 225 passed with 7 offline (v5.4-rc7-162-ge83fb30397fa)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 234 boots: 2 failed, 225 passed with 7 offline (v5=
.4-rc7-162-ge83fb30397fa)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc7-162-ge83fb30397fa/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc7-162-ge83fb30397fa/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc7-162-ge83fb30397fa
Git Commit: e83fb30397fa07cc94788cec594100a7f6b122a3
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 24 SoC families, 27 builds out of 215

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc7-105-g0=
1970a127dd4)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            juno-r2: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
