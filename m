Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8575D10ADBD
	for <lists+linux-next@lfdr.de>; Wed, 27 Nov 2019 11:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfK0KbS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 05:31:18 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:39793 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfK0KbR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Nov 2019 05:31:17 -0500
Received: by mail-wr1-f50.google.com with SMTP id y11so22914818wrt.6
        for <linux-next@vger.kernel.org>; Wed, 27 Nov 2019 02:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sRL3K6Vt3CBck09HFRDTEoF4k3XoHwDByCowcu1R+lc=;
        b=b2/wfKylrKX2LWbvHEcTp1Kkl/GE9+8Dh1xrqOcg5uspFucUFOkUt47vytIlrMPZDF
         ADyNxdSROAy+1LTGsJP5xjK7fuGotUIu1W/HuC3EWBNFXRIR1bcUD4EFweHpB8cpFMaR
         JQySD0KRpr6pty2c0/Lqs3H60SXIk9G+m2WG8uQDASWdhkVxQYXFdV81nn+I+VM/iyUC
         5U5no1B1plUtPFCqTLE5VITJ7gfwycuwGcT/YAOE5Us96mpAjaJARkwc1W3CzDJ5KZ2J
         b7RX29aZgr5CFxi5zQZL/6QIk5/AbP8UGJnFwqvdHnyPCqTzGV5n6Bid83UZGIoa5fYN
         Rc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sRL3K6Vt3CBck09HFRDTEoF4k3XoHwDByCowcu1R+lc=;
        b=mktWbLfSRqNfUTFYaGd50x/md/9NyCpqih/UcF2drLQB2b0EflMiERbSVfR6fhwoTG
         hx1jv/A5vQxYQOD170JKkFSCWUY+v1ZP716FskDydiyngigeu+Gp8Ir4NnRgZDl7a//N
         lsmOaSXoH2pQIBMSkr5cbIYLKaQ2NwmDVbEc1ERyyHp71F+NhG0y9Br43ajJyb0PaDEr
         ZaKG0EHObcnoB63lUuYlHjc3ta6G47e/KbpcuedbS2od0vLBfkYpqa1jNuCH/HqZdZBe
         Tl3vaCC4unQ00iCu3Mn9wQZUKxhYziREVYQwF5uExIRkDEcz1Kx2ZXZ2GK39E6SOjhxR
         6zBg==
X-Gm-Message-State: APjAAAXvdshVKRmBYVOSiQGZGj9kwQhEHwtQqwFRYn9XVZnui1ESBnIp
        pctF2r7uy6ctp53kgKsEiPAPUUxQ6TqblQ==
X-Google-Smtp-Source: APXvYqzs2WtruGmLRKA9oFEsDI9ywCUaEPdzuQE1i8fxGLLEmSb4pTaXOKiU3MNNT3krFKr4cW7FoQ==
X-Received: by 2002:adf:e301:: with SMTP id b1mr41192075wrj.280.1574850675190;
        Wed, 27 Nov 2019 02:31:15 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f12sm6266892wmf.28.2019.11.27.02.31.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 02:31:14 -0800 (PST)
Message-ID: <5dde5072.1c69fb81.6c70.efc5@mx.google.com>
Date:   Wed, 27 Nov 2019 02:31:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191127
X-Kernelci-Report-Type: boot
Subject: next/master boot: 265 boots: 6 failed, 250 passed with 7 offline,
 1 untried/unknown, 1 conflict (next-20191127)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 265 boots: 6 failed, 250 passed with 7 offline, 1 untried=
/unknown, 1 conflict (next-20191127)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191127/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191127/

Tree: next
Branch: master
Git Describe: next-20191127
Git Commit: 1875ff320f14afe21731a6e4c7b46dd33e45dfaa
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 26 SoC families, 28 builds out of 217

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
