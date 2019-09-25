Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8431BD619
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2019 03:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389624AbfIYB2d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Sep 2019 21:28:33 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:45794 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389140AbfIYB2d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Sep 2019 21:28:33 -0400
Received: by mail-wr1-f51.google.com with SMTP id r5so4213392wrm.12
        for <linux-next@vger.kernel.org>; Tue, 24 Sep 2019 18:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0pvXq9ZNtAuUY8GF1lYs331/clwHymhcVlzt/Id5etk=;
        b=bz9TUtT4LyQDILhUMzj9slSBZxN2LayMyy1pRsZIqglyAZh4x/ZnbwJqo2RTzhbZNy
         GWnU36+nDO64ObRS5pNpk7ZfZWi49K3NHet2st+FtqiM9NIBRt9RDHWXcOWlo8iAOxhB
         zQ4QmTDllCmRuFbKXc01URq+NEGT2nc4k5oYosGUE96jVocGyuxH6Iyssj4R3JkuaSC6
         zOdflPBuMPOv73lylhcCjkl5PvQWgU8NuPhyMfWXv/VMaC/2DrbECFUmzDH4P+RGA7oX
         h3ZSUZTwzBSy/jlvhD2CDsNYCkqy4xjrAUF5p8tpwBs54wRCPDTlcC+kfiMoVX2uXWP1
         /e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0pvXq9ZNtAuUY8GF1lYs331/clwHymhcVlzt/Id5etk=;
        b=A0OpLKmGcgUEFwBPMa4ZWORpYKP8TncGZQoYz5MbsmgGS1bwKvsyN6IGBr2ifqK8/i
         XXNlDidVhrhGj5At9wAfci9XQA6pCaRzbmLtP9ZNSfumDxq76isHWXajsYpBDkN6y8Gu
         t9y6q8A0Je8BLqopYmjCRoYFPQeJjDaH9SplXHfvxpCQypYDOIZXuPJmobn/csAO31fn
         dX3CX6VTirKi1wZVRCkW/wTLg3m/bezl9rNjL5CAd9OkgBbxSmAgcbfdFhE044By3rog
         mVeF29UjF2xlai3Y8MJM2xs4AjZ8INs78dO1DBAqzONhuK3+fUmL/vOq/F8BT/LKNv/e
         a/MQ==
X-Gm-Message-State: APjAAAVoLZkvY+sSPwrQg7nQHsFNSynmpaIOZXkbZu1umMh03tTunVap
        bWZeelyZeCLFYX5qdYDCVw2gmvRDLExEUA==
X-Google-Smtp-Source: APXvYqxyFL0+2rX3hq0asmtFWUelmqe8tKul5IlD8cw+APZFJiokV6kBiJzb793svo0xuM/2d1id1g==
X-Received: by 2002:adf:9029:: with SMTP id h38mr5790257wrh.155.1569374909776;
        Tue, 24 Sep 2019 18:28:29 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g73sm2301009wme.10.2019.09.24.18.28.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 18:28:29 -0700 (PDT)
Message-ID: <5d8ac2bd.1c69fb81.2e286.c0e6@mx.google.com>
Date:   Tue, 24 Sep 2019 18:28:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-12188-gc7e0ace95443
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 296 boots: 11 failed,
 272 passed with 13 offline (v5.3-12188-gc7e0ace95443)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 296 boots: 11 failed, 272 passed with 13 offline (=
v5.3-12188-gc7e0ace95443)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-12188-gc7e0ace95443/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-12188-gc7e0ace95443/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-12188-gc7e0ace95443
Git Commit: c7e0ace95443cafd98356ecc472f639d16fb82d8
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 26 SoC families, 26 builds out of 214

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            mt7622-rfb1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

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
