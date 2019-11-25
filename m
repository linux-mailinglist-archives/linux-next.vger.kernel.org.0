Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79A43108E0E
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2019 13:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbfKYMgR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Nov 2019 07:36:17 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:34265 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfKYMgR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Nov 2019 07:36:17 -0500
Received: by mail-wr1-f48.google.com with SMTP id t2so17822982wrr.1
        for <linux-next@vger.kernel.org>; Mon, 25 Nov 2019 04:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=B54ilVqXghS0foObyYvg55ElxLYfsMc6BV9uWtBj/qk=;
        b=Xq6vIzQuGFDy01jQCRzjGdlBUlnKic3RSHHMdsYVxSvHTH8Khy6Y6CNmjRzkclg6BM
         3j9CzxOCUe8V6kAwUz1DXTmkoMLIvg1tBNuDjVFWTmMdhcEYP2/6l7/TCTHI+vjAkpnG
         YD6n6CZPHWeIoaY63DUrCbRcQX1LlLMXrfTS2cL+usyozB+pujTqn9/e7sAA4nWHGqFh
         iPlnLWX3PdPR9HpoGMzNbItcx2OZb+Qtb4NngHfsoZ8uNtkKFM5mQ5QZJmuqDgqpr8fj
         le5K4hkMcIht7lGjC3w3cj2ptKMwnOsQ2iqepT6vgvFYlGUVjPNsjH1/W6XYfBmYZu2j
         dYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=B54ilVqXghS0foObyYvg55ElxLYfsMc6BV9uWtBj/qk=;
        b=cRPlEpP006/yJLK5vICBqbTg1YDoHWWpRNmF+rEECQaNGWnVRI4tzmygV8w7hoxxLy
         0gOgiMt8pDIV3xfig2gWOoHYmkb9Ct9eScBXJ8T3DsxM1kxgVBJJd/RT68cxQRPMyOmf
         dxGTtb+evYxKwwqDKAq/vjWT9/Dbe9i+aPJvjWXmHMvI5eRVhy9vwy/7WSWQzbImhexI
         wIQlVSYHDxtT36OvlmbYMlovmW/ds6YRMRydPYL4Ug2pvmI0ZKSI4ACIRJpz0J4ob6m6
         YG45x4lHhUnVRcQllcAl2SQV4JU8ddQJGTZRhWM/thLqQwgjw9jEdVOyJfAUooWbIT2U
         WjSA==
X-Gm-Message-State: APjAAAUfM9ynNhX0Lpb1qRqqNRyCksLDqRjsTNbO3wXm/0ca4mM8D2z6
        nhHqCTnkiYgvrB5UM/Sr6vZT/2bcYimuEQ==
X-Google-Smtp-Source: APXvYqwUOVIsuYF0pvSU4EDgnECXyP/KINDz20sW9Tm1LUq8+wgE/ZwGnX3WRYm17j1xpcucvPHvLw==
X-Received: by 2002:a5d:670a:: with SMTP id o10mr32488888wru.312.1574685374758;
        Mon, 25 Nov 2019 04:36:14 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q5sm8189852wmc.27.2019.11.25.04.36.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:36:14 -0800 (PST)
Message-ID: <5ddbcabe.1c69fb81.4f481.9280@mx.google.com>
Date:   Mon, 25 Nov 2019 04:36:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20191125
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 261 boots: 5 failed, 247 passed with 6 offline,
 3 untried/unknown (next-20191125)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 261 boots: 5 failed, 247 passed with 6 offline, 3 untried=
/unknown (next-20191125)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191125/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191125/

Tree: next
Branch: master
Git Describe: next-20191125
Git Commit: c165016bac2719e05794c216f9b6da730d68d1e3
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 97 unique boards, 26 SoC families, 28 builds out of 217

Boot Regressions Detected:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          hip07-d05:
              lab-collabora: new failure (last pass: next-20191122)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
