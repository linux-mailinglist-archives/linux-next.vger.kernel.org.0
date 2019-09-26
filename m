Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89D4ABFBFE
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2019 01:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbfIZXfK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 19:35:10 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:38529 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728855AbfIZXfK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 19:35:10 -0400
Received: by mail-wr1-f46.google.com with SMTP id w12so623357wro.5
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2019 16:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+R35CCbFEElJXINb5hyL0cshKrR2b2CDtvoJLxKzdcI=;
        b=IsmFroA9qnqwe/vG1nUtlDGAIQaLTst6dqr3JCgEuM8YGseOxk7gIeT5MpsKM9Xmfj
         SPsflf4ijJ2jHF/eM7ycP8t3U9ge9E1aY19m2dkGuLUn1xoPnfW4T5VmOV9fG/Rc9mkT
         FhFRgX5d3gTfm7ygPjMOqxsaBm+SptSLFkuJt2Jope/AAfL3GDnWZlXtul+auJftQZOC
         JiACqFPH1P08sbrbVmmYbCau5STtGFCue5AJY9oBP2WTTHE5ze5jTWt4vBTnFXpRhqz7
         NGiq66PgUrkj3nChG6DNgADOojdNNE5mQOol/TpkoG9BM1YI+mKX8w/xxPhnGy+8v2A3
         bzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+R35CCbFEElJXINb5hyL0cshKrR2b2CDtvoJLxKzdcI=;
        b=lreRyKlMk+VkUuOmFOyFjMmQGlL04ne31++YxNpABT4l+t7Lp2soBq2Xj+s/VeZ+W6
         XxrGD+rcyt8SZQIv40HxobWkFEUrVlS8ZnaKNfBFvnu5fZA05iSctt3lViu44C3xsoBV
         lhNiGwV1S6RhC0bY89k2jC02IRo7QdrkLDIC8NV6ctGkD0z4d8zNyjbBeytEokh5ziHo
         yK7+Laof0dVduM0Wxvbm7Lh3uU4paenUv32u3tYha8YnZymgVnRo8NIXuyAVMt84dwA6
         GLTCXHwjOfq+vkjgXtrB2kAvTgiUPZTMynnY85Wr0Df/EkUA21CDoyPOxXAUayg4JQkp
         9ctQ==
X-Gm-Message-State: APjAAAW36ekYv09YzKolryt/Cs7zHD33RTgPmdGKt+RZXrBTv8Bu1I4w
        6NEbV0ev5Pu/LsFb5EM6rxFh6mj+lQP5DQ==
X-Google-Smtp-Source: APXvYqwHu+OVaA+ECX7MT1fybo9PqvxE0Bl3iNahYXrf8PUhJoJWdwAwX0UvfWg70J7iUmGgyCG/ew==
X-Received: by 2002:a5d:614c:: with SMTP id y12mr667072wrt.392.1569540908040;
        Thu, 26 Sep 2019 16:35:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q10sm2090658wrd.39.2019.09.26.16.35.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 16:35:07 -0700 (PDT)
Message-ID: <5d8d4b2b.1c69fb81.5fd18.8e54@mx.google.com>
Date:   Thu, 26 Sep 2019 16:35:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-12689-gd20eeb14322b
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 321 boots: 13 failed,
 292 passed with 13 offline, 3 untried/unknown (v5.3-12689-gd20eeb14322b)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 321 boots: 13 failed, 292 passed with 13 offline, =
3 untried/unknown (v5.3-12689-gd20eeb14322b)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-12689-gd20eeb14322b/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-12689-gd20eeb14322b/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-12689-gd20eeb14322b
Git Commit: d20eeb14322b02c728ce7fe77d41be77a3a37494
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 27 SoC families, 26 builds out of 214

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            mt7623n-bananapi-bpi-r2: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
