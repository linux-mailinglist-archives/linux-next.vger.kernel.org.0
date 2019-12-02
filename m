Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF3710E6F6
	for <lists+linux-next@lfdr.de>; Mon,  2 Dec 2019 09:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfLBIds (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Dec 2019 03:33:48 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:36360 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfLBIds (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Dec 2019 03:33:48 -0500
Received: by mail-wr1-f41.google.com with SMTP id z3so43013329wru.3
        for <linux-next@vger.kernel.org>; Mon, 02 Dec 2019 00:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nu7YY/1QxTl8fxsA07f+7GiXs4X2uqiOQ4IMSf7hqlU=;
        b=IaJtEyDSM4F71Mm1EMTPXipPlR3+AodVqhoPIQoVusAlxntccVRIYTjNmcAhONXLQy
         /RKMmCDFqyMD2Iych8o2D5dFcLZuFi8Ytg3w6+C8O7Pq87L0B6NfeP+DlYN4FIk2ooqz
         kM4CkW+PGyZzrLgVNyDKEDbvaMAStppcsrwMOEcnwOSehSzMbLEVG5McuZNhhBd4AqvR
         8Z8/eIDjIAAXY+WeZrrA2G2tnmkJgmQ7EDJaYm4c6gc+ZAH7r6idE0o2S36o/ba2N/WA
         OTEQNtBn6lqMQ3rDjRRcG8WuHdwXawg7GccF7iT495dLNVCa6acgxWXxZF3Phad/HKao
         v7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nu7YY/1QxTl8fxsA07f+7GiXs4X2uqiOQ4IMSf7hqlU=;
        b=jJmb9miQWtrfauWr4NisAZ7Hb2Mb8yQmVcgQx+fhG0icvVz4AdVs4l1z+gzwtkmTbs
         XJGBjbFln4NM2H4woJdWrQpbjBOiWDj55bpSKkJp9qo+bMNz3ip5krjEiweYaZ5lAsuv
         aPBtg0KiqhOxS5a7aZdgDQf/aZqR6JmbodKbilQwwioqcIwj3/wi2N6Ty40auCHWt45m
         lHhQ3Y2LqOn2+BpaSvAxfGyiSed8iSHV/j7FoBnQzNGC4HEq5sc/tCcg/wOsONd6JGgM
         DgZwpW879WhBVfUhfu3pN5gq3HAM/OiCy65pEyco4E8K7bKvAppl4saCT2OQQ3uke8/k
         yP2A==
X-Gm-Message-State: APjAAAWwYIbalOAVhj7AKYfGt36zyIgotChYUiqRZLl45JfWaPrH3JBP
        AmHqm2PlxbGT9bDq6aMuLHBbAIUrTD8=
X-Google-Smtp-Source: APXvYqyyr4ZD++d2E1t2o0s/lnx6FiNwxENTqrx4OWvnOFcN0khlb7Fiy0tQk1kt9PpfMAcLdq1Xug==
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr16740343wrm.80.1575275624695;
        Mon, 02 Dec 2019 00:33:44 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c136sm11492950wme.23.2019.12.02.00.33.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 00:33:43 -0800 (PST)
Message-ID: <5de4cc67.1c69fb81.9f4ff.a8e0@mx.google.com>
Date:   Mon, 02 Dec 2019 00:33:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191202
X-Kernelci-Report-Type: boot
Subject: next/master boot: 274 boots: 7 failed, 247 passed with 19 offline,
 1 untried/unknown (next-20191202)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 274 boots: 7 failed, 247 passed with 19 offline, 1 untrie=
d/unknown (next-20191202)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191202/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191202/

Tree: next
Branch: master
Git Describe: next-20191202
Git Commit: c5db92909beddadddb705b92d3388ea50b01e1a2
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 98 unique boards, 26 SoC families, 28 builds out of 217

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
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

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            mt7629-rfb: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

---
For more info write to <info@kernelci.org>
