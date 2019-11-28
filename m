Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAD4810C3CF
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 06:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfK1FxJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Nov 2019 00:53:09 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:35765 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfK1FxJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Nov 2019 00:53:09 -0500
Received: by mail-wr1-f43.google.com with SMTP id s5so29503297wrw.2
        for <linux-next@vger.kernel.org>; Wed, 27 Nov 2019 21:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bCamXCi0o2t7TKjUjhUJxH0EkVQu56H/O0TOK/V8qLY=;
        b=GzetlYgAmcZNtzOxVUHcRiRUa//8KaY5Vm9IOceerjMQ32ap820NjzOEQ69fFwtKW1
         A8dtpDKS/bm+IXFWnT9uOuFR0MnupJw3kgWxusrAclyt8fQ3tbJ5nWyqiNeuTw3ZlIFg
         cVOoIksxTFvZbgdvFD/Ruq4rJhy+QeQJ+FmWtqPJVcS2kI3z/oOiYHWGYenyyJ7jmVGm
         l3GAV4L36H8MzVpZkttkSkaVnqHNqeL+i2Lnq3fy0yKuAN4dVoF0nUR0XYNpfpj72pOS
         EtiJ9O5eQ0DpncrBLalmtSjkwNAqFFYCbBj78RjhEDkPuKLtAoOnWi6o4p8ndYjVC8yt
         e0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bCamXCi0o2t7TKjUjhUJxH0EkVQu56H/O0TOK/V8qLY=;
        b=Ut0eBCIbrgXec25kgdqYKBe5wScrzTQQOy2xxYUpRPJt+V1Wjr9K5zdW4MCd6YXEsH
         Q756fnIo3IkKnODfSmSFAabXunIHhSBKi2SrP/i3n6Ip6hmS/aFgQAwsV7E/Z1+4iNy5
         oWGdPWTBE5gSqdXRM+pJMUnMPopC5BaW9+HQZhPXE9v26F1cz8uh0+SXbGGyN1huLXw0
         SmDhKcIySbxYwDwdRRnpYe3eP0FFLduBvwiTRfh55c79P24cnavSF0rOJldwCZdWpSmc
         u3L+Fe89apxYZFi6lyq20eWwZLbj0ZO3o6KqxxAx+wMYz0uw1DsIJUjCkqsXtmW+uebv
         Ikbw==
X-Gm-Message-State: APjAAAVjUOCSlcOmlXyvVgpcbf41U6Q7eHuNERK+2dGbZYY07hsDdIPH
        79PK+qQOy0jLdWTpsDs2a7d3srUTIixbsg==
X-Google-Smtp-Source: APXvYqy3pAQfvluKME0vhg1PNNpZUFVlYGjlwr+rbaIuYh2agOL8Z+03WeYKGhGr4psjmzHboKQlVg==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr44694918wrt.14.1574920386681;
        Wed, 27 Nov 2019 21:53:06 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t16sm9678219wmt.38.2019.11.27.21.53.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 21:53:05 -0800 (PST)
Message-ID: <5ddf60c1.1c69fb81.77be7.0476@mx.google.com>
Date:   Wed, 27 Nov 2019 21:53:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.4-6969-gdb674a52ed96
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 263 boots: 4 failed,
 252 passed with 6 offline, 1 conflict (v5.4-6969-gdb674a52ed96)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 263 boots: 4 failed, 252 passed with 6 offline, 1 =
conflict (v5.4-6969-gdb674a52ed96)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-6969-gdb674a52ed96/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-6969-gdb674a52ed96/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-6969-gdb674a52ed96
Git Commit: db674a52ed96191186050c371743371babcc6ac0
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 26 SoC families, 28 builds out of 217

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab

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
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
