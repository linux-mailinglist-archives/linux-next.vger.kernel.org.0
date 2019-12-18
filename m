Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A489E124CDD
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 17:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfLRQMX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 11:12:23 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38772 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfLRQMW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Dec 2019 11:12:22 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so2532379wmc.3
        for <linux-next@vger.kernel.org>; Wed, 18 Dec 2019 08:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ndsJoApL/85/7YB5qQHXoIAeCbi1P4fhg5uSEk7aQ6w=;
        b=yFaAikfMA34oWg+fHz9xKqmBN6ZTvtFKbg/w69mFZG8B1QxIpK5dWiMt8r6+c7BZn9
         n7bSa7XafumWGbmIrkX4lyAkCkQOvG2vKcXYsjZW1ILpHzDnRTR3//TEn/D93ejj3uIH
         uyZ2yXwKfP5T9K/b8vcscUnK4maWo76UqfpNuYfo+o+ekj46f7I3ynMfjng8Pz2XRR/X
         zIswQkiQF5SGY4eWL/U4jzzIR47xu284TE2v4d6spm14sxSMcV9Ihwy/usEs1y53c8zE
         iJjx8cYRdda2Ux3yQ0+4RL4CmtN3QlpzgxeGvtBxFKFHOaHKa4Zx7m1xwg+cbnxNcoih
         KldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ndsJoApL/85/7YB5qQHXoIAeCbi1P4fhg5uSEk7aQ6w=;
        b=jtBDUTNugr/1yWVq1azwySXhPtLN5vFkrdfID4EWidloIgaD5ossYQpc1e4ur/cO3X
         CMvgSaVMk1FfUpG16UV31AeMWhySBEMw7FfKNDucnWqnjKFJFZ9nJIWSCM6EYC2w6BX7
         5mMttpwj1ltaKbpFKvRkm+lkHPgeW99RFbDNOUNB4d5v2Txky/t9qznYILgI2jBSCV3v
         2HSa1zVlBw5963cuMuSa8UL9piMoHBEiaz/9PVdy4ktFZV0Zd01TnAucI7/35AgNMVJg
         6jDxFxO+rht4KaA+3WoOYgHzbVJMcfeb6JNh5tOMY1QvrL2emyhw2JaTTNftVWdMYwGu
         Nffw==
X-Gm-Message-State: APjAAAUTS0kDppiORN5kFz+H5Q7KL6iOZM2EINkdugYBTH925pLhEyyD
        nER6N/OzxqOuW7ltAJhIWw5p4qRJ6mcY1Q==
X-Google-Smtp-Source: APXvYqxe0heY8qhP3SORcnvlqyizUEvMJr+c3pe6ZpDCB2256sbk8UfsNOScLeMt85jpSrUovl6KEg==
X-Received: by 2002:a1c:16:: with SMTP id 22mr4324969wma.8.1576685540603;
        Wed, 18 Dec 2019 08:12:20 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x26sm2769750wmc.30.2019.12.18.08.12.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 08:12:20 -0800 (PST)
Message-ID: <5dfa4fe4.1c69fb81.8d266.d6b5@mx.google.com>
Date:   Wed, 18 Dec 2019 08:12:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191218
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 152 boots: 4 failed, 141 passed with 6 offline,
 1 untried/unknown (next-20191218)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 152 boots: 4 failed, 141 passed with 6 offline, 1 untried=
/unknown (next-20191218)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191218/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191218/

Tree: next
Branch: master
Git Describe: next-20191218
Git Commit: b9c5ef25038d14f0e02d4c5077bd3edb2e577034
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 65 unique boards, 21 SoC families, 27 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

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
            stih410-b2120: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
