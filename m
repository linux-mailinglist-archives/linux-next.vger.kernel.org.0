Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC238A3B0
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 18:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfHLQs2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 12:48:28 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:46911 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfHLQs2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Aug 2019 12:48:28 -0400
Received: by mail-wr1-f42.google.com with SMTP id z1so105171445wru.13
        for <linux-next@vger.kernel.org>; Mon, 12 Aug 2019 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NgQ6Fvw20b1ZFiEUoxGMs+0+m2Mx44qYEYy/GgIW87s=;
        b=qPXva0FuMks54brSlol4HFqhZL5/lkVpNXKcS1pOOgg9h+pG5HSs82M8FarE88BDhC
         +cDVhOzNEQpHpLTZRjQrSO07oUNRLLaiE3AEf5DEpsrTiUrqB7/BDIthWLlACf87Cz1w
         GCZ8O0CYnboZQ7UX2mk9tpcpyHb4Vts0DF+T1B8BeNvC71fOzMvSrkyD3er1U6/GwH2J
         FrYqdiDqhqyw7R5NTqnzJRzV1ke+jGya7JHcmC43ugTr+qpF4D/9xK8LsbmnDhmMRTcs
         usFdFdZFj1PpJXxa5yUmLNkEkVHJBsQ/fxbF1UR9/GmiS4VSyKBLB44w0nSafR7gMMHM
         fJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NgQ6Fvw20b1ZFiEUoxGMs+0+m2Mx44qYEYy/GgIW87s=;
        b=sAemoCW0zgB5c2PE15vX1Epsg6hDY1WLxtDk5hDjCaSKyKM308lLsrUNzXxNPOaz6g
         rU5jykPckb5APcpGQtp/NcmiYrtkhkIq3gIwkTMRjpZPOsYMxjNOiwD2KIrOQ4PY2F33
         282MZLme+lkNRWGFvp3IvcPJ7+ZQrSWQ4xn2cS8V66b84J+VS/UqvrBvgHv5gtNaBRRA
         y9CMWNF5xnxEXJ3DS5b2rKNEPXKT3lQDfRVGub3iRaUFVWzaXwlSmGjZkqQqYt0MSOGU
         QRktSHcyARnych3CVfVu+xehBOTFsL7PsXaGxcSne0o3eLBvhOLGKWdd8usxxVQzCnCV
         ChfA==
X-Gm-Message-State: APjAAAWT4o71OVeWAHiruIiq7sapsRnWpW3kQ8cR60W7fl7k+yojTwA3
        Rz3s9sCZhchg2ZxET6mdDCQzshHPDe8=
X-Google-Smtp-Source: APXvYqz3rGV2hNzenUBCqbqvox2W9nI9lrGGwh2yeADO41bFGafcWZNFeaaIrZaz5fNjcHq05zsnxg==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr40696507wrt.20.1565628506331;
        Mon, 12 Aug 2019 09:48:26 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id p9sm6489236wru.61.2019.08.12.09.48.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 09:48:25 -0700 (PDT)
Message-ID: <5d519859.1c69fb81.c284d.1965@mx.google.com>
Date:   Mon, 12 Aug 2019 09:48:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-5755-g8e72ac275c63
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 254 boots: 11 failed,
 227 passed with 16 offline (v5.3-rc4-5755-g8e72ac275c63)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 254 boots: 11 failed, 227 passed with 16 offline (v5.3-rc=
4-5755-g8e72ac275c63)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/v5.3-rc4-5755-g8e72ac275c63/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/v5=
.3-rc4-5755-g8e72ac275c63/

Tree: next
Branch: master
Git Describe: v5.3-rc4-5755-g8e72ac275c63
Git Commit: 8e72ac275c63a44c224e9ff1a655889e7ccb816d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 27 SoC families, 21 builds out of 230

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            qcs404-evb-4k: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab

---
For more info write to <info@kernelci.org>
