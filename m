Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C8315AA81
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 14:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgBLN4O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 08:56:14 -0500
Received: from mail-wm1-f51.google.com ([209.85.128.51]:53207 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbgBLN4N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Feb 2020 08:56:13 -0500
Received: by mail-wm1-f51.google.com with SMTP id p9so2379673wmc.2
        for <linux-next@vger.kernel.org>; Wed, 12 Feb 2020 05:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AGSzCNX3x9N1r6CmqlOE+qHCYyE30MIAQFGKGTLuh4U=;
        b=E1VUmliaiLxGuwJfj7kJS39qlI8ckBf6L5j+0n0xpXJR0qJIttKFEabnIQJM7C0CGg
         SKOPHfGumAeR2/JR8AdREnj6RWLsxlK3XYT4cDIh4geMxFXhev1uvBe7eW4JqBKKp5ii
         Y4h921Nog32gdOrVGmIJKDR/bV1h3SlAdSLqqustJk5nlNwyCNqHtQAf3sEYMumOn8Kf
         2sY//6Rj/zj1YfR7ztCvLA+KueEWngYmayNB1SfhfDATWxKZ5GDWql9PiJ7ZzkhwA1JQ
         Ta/cYb010BWC/cZRYN+g/IVMSnmoDErLUqB4KlJOeTMIEqjzL+VdT+UTKXqdQs+YNMC5
         ipkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AGSzCNX3x9N1r6CmqlOE+qHCYyE30MIAQFGKGTLuh4U=;
        b=rUiN5rCXLzZsjAB/tItvxEc0tJceyBXLFxzTd4+hghCBLtXawZAgAM0DMn6QVv8O1W
         nVaVWz/+qwCYlfJ9nooUSKPw9wH5iJKPpHll9RPpH2XGziInkSf1aHe2UPkiC0IBKABv
         D9zAMY2INOGqEUH6Te+mpuUWtV1Dbw53/+L8EAq0tET/MwPNqbWppciGagQsKw4HReOC
         xT4/A1PwgVKl+sFq/TJBCUsXyIDtDuhxxo/yRQ5YeywW3FzS2zCKmVePXQe4aMVLH2+M
         1fIpmPk5IW20dU5DJEGgO5VMtOOJTmLHs/6gcJv6Pm3gLoGor92264xf5eUxtW7tkjTA
         eF+A==
X-Gm-Message-State: APjAAAWuTaaMJV6JlIhG5U73SNLTkYobbwuGz5hGkDlZa74+VGOtD8IH
        IEIG9jNJsOOYNCf/wMTD+DfhewVZxPDM5g==
X-Google-Smtp-Source: APXvYqxc/vd+3iDP2GX673bjX5uer3MUpA9hQIED7jrGfqU94KyeoJcAEArBLlYIAmg/v5Kn4rBQ/w==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr12870997wmi.0.1581515771927;
        Wed, 12 Feb 2020 05:56:11 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n8sm689528wrx.42.2020.02.12.05.56.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 05:56:10 -0800 (PST)
Message-ID: <5e4403fa.1c69fb81.561fc.401a@mx.google.com>
Date:   Wed, 12 Feb 2020 05:56:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200212
Subject: next/master boot: 154 boots: 4 failed,
 145 passed with 5 offline (next-20200212)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 154 boots: 4 failed, 145 passed with 5 offline (next-2020=
0212)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200212/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200212/

Tree: next
Branch: master
Git Describe: next-20200212
Git Commit: 12975989976505c36ae24229eff0cff35dc5b61a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 22 SoC families, 21 builds out of 156

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20200211)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20200211)

arm64:

    defconfig:
        clang-8:
          apq8016-sbc:
              lab-bjorn: new failure (last pass: next-20191202)
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200211)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20200211)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200211)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: new failure (last pass: next-20200211)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

arm64:
    defconfig:
        clang-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
