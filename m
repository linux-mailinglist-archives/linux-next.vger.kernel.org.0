Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7073116785
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2019 08:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfLIH1L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Dec 2019 02:27:11 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35837 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfLIH1K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Dec 2019 02:27:10 -0500
Received: by mail-wm1-f68.google.com with SMTP id c20so12205318wmb.0
        for <linux-next@vger.kernel.org>; Sun, 08 Dec 2019 23:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sn/bcvRfjZF24wy9LHYn+HfhzsKBIYRZ7hiLEouRPEY=;
        b=qqUBfIzuDQGYef4op63jjjuzbCwRGRrMLmOmHEiIcJgssGSXI0xg5qv+O4C8kwaWcY
         ccZpP4yY+YqHzfGqGTxKNgmAOnj4Z+N+g+ADn7JfARbCnZjzEesMpHDvchlz2pzfAg1v
         o3Ln+vSMeEmAfeaWHwM/sEYDiz7Qv7ku8hbfFI+GFPS5C1zvmyM1pLic1DSxLU8pC0uI
         6VGXK23iSdvdFmtYCq97Kjre1W0CCIoFcLHNi99b8r2W/WzCavzoRccC7Yx7ZTaZmo8y
         ZaSBebjYRAnflFjQMGz+2EBXLhh+wSsdXNfBPZjUCvagBarg2ln2QoAcrcIbzTxgmRZL
         J/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sn/bcvRfjZF24wy9LHYn+HfhzsKBIYRZ7hiLEouRPEY=;
        b=Xb/D/8BuaniA2j0+1+6sXZx78EpBzMsiTmlkL2KMW/DYxKC9ujs8DDPUy5k59rNaDJ
         tTFWQiAD/u24UO5W6b1xN6zYKN0xQroGYHt3TgsWPX0yjVTfISVpnAZb0/EWdfp04/hx
         PbWZ6075sns2oANU2Bfi5UAaVSHiJfJqPKBwsRuJtu4w7M9glR1zrcHgRgsK/iZ2AmOH
         KBZ5qEBms2crJSqRU1rMGxNFrno/6OCbbubrNKhiXnfoBXsRZZKSnOdJPv0yBP0NK/WZ
         CXdCin6E0iyz7NZe8xRYaeNqWZbxtrxiLPY3EfqbQiExtlCXHKMzNMsoIuhbn8gwzQFd
         Lcww==
X-Gm-Message-State: APjAAAUGKTo8wGvmlH7RxovgLuIEIe6m4wkMvILrqWItk2xClk0rPmVF
        qLCGEeb/XgzJJ+8+B7nZr8KRYR6G52U=
X-Google-Smtp-Source: APXvYqyoTryRKHvBW6A7oVq4ZU0obqKJq1Y14Ws5p5xUX1Jh6lTM58rRvpa3RDDdMC7fePypph+nCQ==
X-Received: by 2002:a1c:dc82:: with SMTP id t124mr16928657wmg.122.1575876428498;
        Sun, 08 Dec 2019 23:27:08 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u189sm12749650wmg.40.2019.12.08.23.27.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 23:27:07 -0800 (PST)
Message-ID: <5dedf74b.1c69fb81.8f244.6d09@mx.google.com>
Date:   Sun, 08 Dec 2019 23:27:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191209
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 223 boots: 5 failed, 211 passed with 6 offline,
 1 untried/unknown (next-20191209)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 223 boots: 5 failed, 211 passed with 6 offline, 1 untried=
/unknown (next-20191209)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191209/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191209/

Tree: next
Branch: master
Git Describe: next-20191209
Git Commit: 6cf8298daad041cd15dc514d8a4f93ca3636c84e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 97 unique boards, 26 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-nyan-big: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            juno-r2: 1 failed lab

    defconfig:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

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

---
For more info write to <info@kernelci.org>
