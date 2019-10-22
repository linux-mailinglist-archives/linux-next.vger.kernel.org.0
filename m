Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25475E02F6
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 13:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388692AbfJVLeS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 07:34:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53586 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388689AbfJVLeS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2019 07:34:18 -0400
Received: by mail-wm1-f66.google.com with SMTP id i13so1562415wmd.3
        for <linux-next@vger.kernel.org>; Tue, 22 Oct 2019 04:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IqvZAnPdIAaj2SKGWaDS3LqIsor0yVj+Ial5eXW8q20=;
        b=VOsjkoxk1A6lGUI51FZrRd4FQuiWZVF9xcc+bZL8GpTySFITE2/M1+eXCMgOjnepKm
         HiTKe+iaNXohB7UoGl6chF6cK5mZWWyjDbIlyD8Zz70wlcLKUuojHSN7T/W01DJYF7J9
         FgnqWiu+qi7tkLlF1mnfTJ5AQZjCvE9toixkoIE5Q9KxW6hSOFczjWdo5Cwrp2dBF+7P
         6UifAdZGyddzvf8TY4Ihdd+wkft/O3Uscz0khDCQgFKLb1sFeMzCgB9Veh1CVPZ1dumT
         KVdBW3qare5KmTJ7yhel4MiAQJ5y1WGRpHUL1959N/wz38GXmz4f5StffOtgKvUqiCXd
         1Drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IqvZAnPdIAaj2SKGWaDS3LqIsor0yVj+Ial5eXW8q20=;
        b=UiXgxb7X31VTKYpIXGWIzya5RAoWB325KjcltvFX2XzecvG7QkJZcPyrCuylRv/29h
         LwvyZbhZSJVLxwsRdLamlrYSURgEt3LnqOKtGc05AJt/vxkyEW2yJMIULs68Tk0KXSpm
         yZ5tOeTG+nxjJasGzhCpxIjAppQQOiH+LOIi7jRPFWH+DS/2QPrlgkGfaRBec/XGZdON
         9HiPuDNGaJ9njzouq9BHT3Pb886v18BdS0QdKwlvs2GX9G0p5cLO4cwcrtao6yAOPWzs
         l7qQvvtKsS3jyBdE8TQjiKDDTTG46MYApbQp8W83O5zYOuN1nC9EXYWe+/+7+WvlLXEQ
         IedA==
X-Gm-Message-State: APjAAAV9jqTHnceYS3kUX/s9DGVuL/kTlPAmywB3/ZLlyRoFZ38yKt/Q
        21HAAw2eudzGAIYzzNV9Y9GE7K1WHbEv9Q==
X-Google-Smtp-Source: APXvYqwrDmcsTbQTs0C46Ote9gpfkCXS3rP/IghfIf/dQzgBDERud/R5ebPnIN8JMVv4CeGEpcNYKQ==
X-Received: by 2002:a7b:c10f:: with SMTP id w15mr2562720wmi.171.1571744055573;
        Tue, 22 Oct 2019 04:34:15 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d2sm9848551wmd.2.2019.10.22.04.34.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 04:34:14 -0700 (PDT)
Message-ID: <5daee936.1c69fb81.e8e17.a8a0@mx.google.com>
Date:   Tue, 22 Oct 2019 04:34:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191022
Subject: next/master boot: 128 boots: 8 failed,
 113 passed with 7 offline (next-20191022)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 128 boots: 8 failed, 113 passed with 7 offline (next-2019=
1022)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191022/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191022/

Tree: next
Branch: master
Git Describe: next-20191022
Git Commit: a722f75b2923b4fd44c17e7255e822ac48fe85f0
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 55 unique boards, 20 SoC families, 20 builds out of 219

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

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
