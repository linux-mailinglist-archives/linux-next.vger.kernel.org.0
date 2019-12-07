Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3A0C115B4E
	for <lists+linux-next@lfdr.de>; Sat,  7 Dec 2019 07:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfLGGIL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 7 Dec 2019 01:08:11 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:37432 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfLGGIL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 7 Dec 2019 01:08:11 -0500
Received: by mail-wr1-f45.google.com with SMTP id w15so10149634wru.4
        for <linux-next@vger.kernel.org>; Fri, 06 Dec 2019 22:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5nHHGOkHf88Lo8PD7Qx6JX/PzmjyIIxADMp/InHsODQ=;
        b=L1O5n5kwDx9S2eK5veGg1dobnjlVnsVh16gwn7H2vzgUCVv2F+Yj0YvEviaqKBA2tY
         7zjvyWe/qCLrhk/PVChOtJqj+8ow2Jk86vZnzQtQaGFahyrauKq/t0osvobwGWZOcUIR
         99BRyXFX/h4Z0E6MqFSAN/ODD/nBzcVEmBh8NRFvkShiImYfmlyZezsaJDQhRGX9onaG
         1hpGuaFAxsGC1XTPlUMPhPog7g0P/91amSyQUQi9I63cV75McU2AC/zMGGxcjP+amFNa
         vyimyttAms283VoPSret76hSu3gO8VsRlMXoKpTbYJyCY/tyQWfKvB3UZBFrI3U+xzhw
         lLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5nHHGOkHf88Lo8PD7Qx6JX/PzmjyIIxADMp/InHsODQ=;
        b=T1D1tDm5GbGzABKiWgSuGYeevqhFDI3cx/otwFuHAs9gTIZAQV4IMszWA2rbrAW8hK
         MCNIJbBxuM2IJ3nlKHqK/1ZArIpf00EFC8qBBmkOMxhdVxIR6oalS+rQvy9qo1cpcQfS
         Tpxi+vWRHfWOYtqR9KtSNOA7FEMfwIe5U+J0eXdOts90GHMToH6uPjmcrdWkADT4KbmK
         1BpqXylZtBv4hzpFmnynUpb+W0X0MzQxjXo3lUX3MWzxg7qKLEWd2TzBd1JLlj7QR7tD
         xazcAAx0Y0IUwkZDzDaQOnkAQEf9V0ASTfl85iU8VEy6eBWxJXhvw/A7E3gkbki6K/kZ
         KqZQ==
X-Gm-Message-State: APjAAAWVzzk2uCBt1e7mH+ohz6uKljdC4+KwjeBl6qD1OrqDFpGCZGlS
        QewlcaGxJM3AMNiRauwniTczb4wj3EBAkg==
X-Google-Smtp-Source: APXvYqyjZFlBQeii26MTcSHQwR6sAkOlB1uvTHfd2Kfm30IAyLOwNm3XHfBjfqGJxE4gwVEVsqBMgQ==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr7087150wrp.167.1575698889126;
        Fri, 06 Dec 2019 22:08:09 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c80sm5559861wme.20.2019.12.06.22.08.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 22:08:08 -0800 (PST)
Message-ID: <5deb41c8.1c69fb81.d2b17.e07c@mx.google.com>
Date:   Fri, 06 Dec 2019 22:08:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-13330-gdc6685f19f14
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 276 boots: 4 failed,
 262 passed with 6 offline, 4 untried/unknown (v5.4-13330-gdc6685f19f14)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 276 boots: 4 failed, 262 passed with 6 offline, 4 =
untried/unknown (v5.4-13330-gdc6685f19f14)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-13330-gdc6685f19f14/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-13330-gdc6685f19f14/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-13330-gdc6685f19f14
Git Commit: dc6685f19f140710a11963c857197ba9e6be7e25
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 97 unique boards, 26 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
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
