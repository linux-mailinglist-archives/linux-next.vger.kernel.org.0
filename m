Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4719D115C30
	for <lists+linux-next@lfdr.de>; Sat,  7 Dec 2019 13:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfLGMVd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 7 Dec 2019 07:21:33 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:34657 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfLGMVd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 7 Dec 2019 07:21:33 -0500
Received: by mail-wr1-f54.google.com with SMTP id t2so10822685wrr.1
        for <linux-next@vger.kernel.org>; Sat, 07 Dec 2019 04:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Szw5eeNsmR3qyE6/WWAjKeABD+qW+RZoZubiZrxRj0w=;
        b=G+tiuRc8kQZpkOXjcCBQs2I5UMrkRu+KGsj6V/V7UezF/i4/lGBME940SOnONF6KBb
         4DZMokL287RtJlVdoLdR6YRvIemjuCuQjuJ8qFYgJywBAnHZwJF6qiEhMEp8Sx7sBYOt
         4kwVgGgefJQQkiO/c2yAqZBRahNhl5OZ0CZ+r5gGXzIBitO/OIXkeUigYkEZo0B3TMys
         0ocOPlRHp0ULspJwBIypNxJMFSl6NzVcbrJL+qg76loJBiEaVzkkxGNmgfX9nloUw/Hs
         jF6Oq+ySuJfidhoM7H+RI85eBm5/CTh5upaH6Up6u/D16T/0kKbOFK7zkRD5RueDWKKk
         wD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Szw5eeNsmR3qyE6/WWAjKeABD+qW+RZoZubiZrxRj0w=;
        b=gCwl40X+KiE2aVYyRyO0j58u53LQ/xWgMDfMJ/S+BBYe6jCBAC5q4Tq0T+C9zfyqNf
         Uzeg1B98lQXxl/O2YiSBZA29S/ZGUIVW37gouoIDA6TE7m5Te026tDKQf5gydV1owKVu
         zJvniGZMw8dXsCzE23E/OsLzyP4bu9W7iDbpLuLATDQO0idgymldXB6rUZoXJKqQVlK5
         jIfO7UoZgcu7xC/sWZagJ5GoWHmCyQHcjCXQPk41ZHcv1WQ893PcAVvheWiV5XFUgVnh
         EA9acVnHSwKY5laHyCjcxfI9e5vr3h0jj98QzQvcP+kKzhvy33I/+gOvjXXr4bn4O9Mu
         TbBg==
X-Gm-Message-State: APjAAAWNzAK5LzviCifubxTmiZRJnldb64bwGjTUVHmUA1P9a8lnLdtb
        R1fOPfTXZvLViX5J+vLI76bKM1yo7TUeXw==
X-Google-Smtp-Source: APXvYqwxB0XlXtH/LDlQreKbyl+clukdp1R84U6ppoj/LxBvOvF67YWxZhIIbz/0YdJVYK0xzzIuHQ==
X-Received: by 2002:adf:d846:: with SMTP id k6mr19881961wrl.337.1575721290795;
        Sat, 07 Dec 2019 04:21:30 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k4sm6885927wmk.26.2019.12.07.04.21.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 04:21:29 -0800 (PST)
Message-ID: <5deb9949.1c69fb81.17b2b.7a4e@mx.google.com>
Date:   Sat, 07 Dec 2019 04:21:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191207
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 215 boots: 2 failed, 204 passed with 7 offline,
 2 untried/unknown (next-20191207)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 215 boots: 2 failed, 204 passed with 7 offline, 2 untried=
/unknown (next-20191207)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191207/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191207/

Tree: next
Branch: master
Git Describe: next-20191207
Git Commit: 558c2bf52f618ae884276d53ee03da9e45541ee3
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 23 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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

---
For more info write to <info@kernelci.org>
