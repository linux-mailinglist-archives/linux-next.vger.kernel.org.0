Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88F188BEA1
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 18:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfHMQcB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 12:32:01 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40245 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbfHMQcA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2019 12:32:00 -0400
Received: by mail-wr1-f66.google.com with SMTP id c3so77266wrd.7
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=d2trJ/ej4VMTNzFk/bAsVYSPK4M0ADiTLJiYUg2up9w=;
        b=2COw/YLbeB22B22rjCugAE2WKbSDbOSakcdrrQnQ/w+GHL5aJVKSQQIMCSbzSUV1CX
         S/+YaIEA8NGjaM+TMULgwgOLctVbFQfZJjfQwsaWVi5So4jg09qYU4TuqHH2Y0EnaCLn
         qQn2Z5gG7t9cV0DXDGHdMlHa9ggjuLaQhEv+Oj2r0NrG8iPpT+JdgAu8LYEhp+ieMtCg
         hBdJr6+vIz17kxz0h/ElcNpTSeNwN3UXQqc7P92SVEBPvGP8yrO/+ZxkeVjvLAWm57C5
         SlBpOhtq7BbpG83UzNLuP5Jvvzots3QvUbTnSc/nSbWlmMGPw6UiGu8DiIG6YCkbIgnP
         IzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=d2trJ/ej4VMTNzFk/bAsVYSPK4M0ADiTLJiYUg2up9w=;
        b=SFrM8UI5hVK/SehHumxa098OwRHLw8z/v3WiZuNtV5sHBi1XVv9GJBaQcsuj22n34K
         /9LhTLZ0sDa5h84jHcmNY2drJ09fI8Bj5YPPu+SIIuphjHwp32ggR//9Jxr5kg81Q9EB
         XW9D8Rea1ZpVg+s6ltw3vwIgPiIgLli6Wr2/plrBDfk8wv1gqjWwQWx+LCXoPLMjdwYC
         JQaYahCRTiOaCVmr5o86NTww1tjnJoPg+TjrJAXh4hdyTwdPEJMhHodIztoo6rpmy/fS
         p7A43LkQRIdxeOSGF0O8tTaH+AfrUPs8vH8o0lYoSV0H9+NRCU9GLOj+/53TRP/vAIrq
         X6xA==
X-Gm-Message-State: APjAAAVu4+VTqYI8DS/if73JL7OUSgDHMiCsrrZMUeTbs//Za3zrHvZe
        5Xf7va+NqRnn83h/Ssc+qagYE//PyZd6pw==
X-Google-Smtp-Source: APXvYqyVJjow6nwPhiYxrp7NWq+g8EyffN6MKYH7PX3B4JWo1r+WeoNxnlmrOJ7PS1XFUK0zDyW2ZQ==
X-Received: by 2002:adf:f646:: with SMTP id x6mr50463547wrp.18.1565713918819;
        Tue, 13 Aug 2019 09:31:58 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r23sm2267208wmc.38.2019.08.13.09.31.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 09:31:58 -0700 (PDT)
Message-ID: <5d52e5fe.1c69fb81.b97c2.c96e@mx.google.com>
Date:   Tue, 13 Aug 2019 09:31:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190813
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 274 boots: 11 failed, 246 passed with 16 offline,
 1 conflict (next-20190813)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 274 boots: 11 failed, 246 passed with 16 offline, 1 confl=
ict (next-20190813)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190813/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190813/

Tree: next
Branch: master
Git Describe: next-20190813
Git Commit: 0b821f0a8339ffe55411857de6bb1d3480a034fd
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 27 SoC families, 21 builds out of 230

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            qcs404-evb-4k: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-cubietruck: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubietruck: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun7i-a20-cubietruck: 1 failed lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
