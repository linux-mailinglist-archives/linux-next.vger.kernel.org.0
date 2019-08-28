Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9C83A0D2F
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 00:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfH1WG0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 18:06:26 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:44466 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727251AbfH1WGZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Aug 2019 18:06:25 -0400
Received: by mail-wr1-f48.google.com with SMTP id j11so1287393wrp.11
        for <linux-next@vger.kernel.org>; Wed, 28 Aug 2019 15:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=E2a9bd4VmhM5QyeWx47X/B+dtLmgWnIzSdAKyPtaSV0=;
        b=LpJe2ceC2sNJmo2f/0CJmJr8diT7WUdGei5bN/ydXWhylk/ZZEYDuZRIc3aW33wD2b
         OLN5R87VyUPh6UuLrYXItaKMTFlpBWBt+TnZ4u8l+jQfF9SvJx+SRAX06yhQm7IsMFua
         XlByU8m4p9K5dOuc1D/gY8JIP3kWvR+2eJokQejq+YFX0JtaX3l8LxuCK1zqFg3uV+yZ
         ifVX3OJus681d6UINOxJl9glNwFuEltGY9yOb2yW+6LhaNBIJs+XNqXe9pJpnK8EHL8n
         LJXMTXlrQ6pAmfWvmGehueK50vnCXP4DaOm1buNQGQ3YcWqfgQWNcJsimSoVFCF1x7/Z
         rcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=E2a9bd4VmhM5QyeWx47X/B+dtLmgWnIzSdAKyPtaSV0=;
        b=giNhFNKu3ohkEYtrNNuLIROMR0p7o6rdxC5F8YN///w6E2znImkg+cmHMTltab3gQa
         i0/lOK52FoGh+Wegsz1CI0fbv0L/lPdzvK6IznRJdae4tyzz354RaIWxQqq5EcOnzR4H
         6GZIF6yrulGHwJXaDweToH0SacWB1uBUrGc9Z/DHFIQha4M97h1CKE929sjX3fZdzguq
         gXUW8wBnfHygdFJZyD5Gsbj3DTdLe/SjdGGDREzOV98c6rd1zskArfBJLQL21fajOAs7
         kyYdJFDXe81P9RKg6Wg+uHmamxJw8NRYCMMSZaOe39EeLf9P3CU1kO49o5Tl4nWkj6TQ
         a7Jw==
X-Gm-Message-State: APjAAAWeLwZShBDsKkSZaQlef+vwVlyqvNSHbBqw0sEZzs3kdDfGdk9f
        bcq8+zvltE4Jjzw5geqmT+SFl12G3+nmVA==
X-Google-Smtp-Source: APXvYqzjl12ttytDDZTPYzHoxqXGZ6T8VbJua2iNE0NpD5ENSg2KxH0rd1ocQvM8LndGTHmbIk999A==
X-Received: by 2002:a5d:4446:: with SMTP id x6mr7191014wrr.11.1567029983616;
        Wed, 28 Aug 2019 15:06:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d69sm527663wmd.4.2019.08.28.15.06.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 15:06:22 -0700 (PDT)
Message-ID: <5d66fade.1c69fb81.b5fc3.2e14@mx.google.com>
Date:   Wed, 28 Aug 2019 15:06:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190828
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 212 boots: 4 failed,
 196 passed with 12 offline (next-20190828)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 212 boots: 4 failed, 196 passed with 12 offline (next-201=
90828)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190828/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190828/

Tree: next
Branch: master
Git Describe: next-20190828
Git Commit: 5d18cb62218608a1388858880ad3ec76d6cb0d3b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 27 SoC families, 17 builds out of 217

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

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
            meson-gxl-s905x-nexbox-a95x: 1 offline lab

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
