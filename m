Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98E88E4FDB
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2019 17:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440572AbfJYPLj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Oct 2019 11:11:39 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55088 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440574AbfJYPLj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Oct 2019 11:11:39 -0400
Received: by mail-wm1-f67.google.com with SMTP id g7so2525379wmk.4
        for <linux-next@vger.kernel.org>; Fri, 25 Oct 2019 08:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7UqTSAx0tbYx7bxJcsFEyxozJoYabncJO3o0k62KB7A=;
        b=DiuNRsMnDFowyxM5erCakBVqBiHyDczB7KIUdCy4tX+kULZAcuf7OS1Agjs5twL3mK
         ikCRhTGNNAmnmgK+9XJBwHe9u9sDApQhrogrecZ11+CvBkL5ArX4OXly7XrHzLN58dBF
         N3eLSDDV4+5AUw+9DCuGeJEVfmmd2yrqKjUHjuTPD/vnYvZx5KCKzWtFBG25Q0BUtFvp
         vgV4fZ5c4iY9VbCEXjMEZqvPytT0WwYAeSaao+85cXBeYt1JRLvv6W/qGCoZZ/C6LrTN
         UDCdYCh9ksiBdEIRWulOmez2Qfrlod9t4osFB3JnPLZDhi5rHnXolwGjfOcsoSJ0HK7q
         sZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7UqTSAx0tbYx7bxJcsFEyxozJoYabncJO3o0k62KB7A=;
        b=fYAmKnswGEggoWH+BKE8g+3EFl+54QREyBihXzYzAF2e9wgbRrbTIrU//JYjpdy9hs
         mOGTKeF6JBwJNgEyfnLWfAkgYC7+gV4qRTvv26Rgw7gxb5QvE5IDFcIAw02DYnePW55Y
         QlmXMXgRT8V7r7wgHR0Wq+/A7GkzL0BL7qWy4Y5F789JNPyHtXskm6J+29RlJZ1jXTYB
         9DyKWvJGUamoIpSzVdX0YT3bRzpcJEsa0cv0YW7MSjrEZ8zt1dEyOR1iu65Soa1vCP8K
         eRAoUtlL8Nt+tMrBUdGFft9miNtHOGCLpEedR0ev78DpKc4ZS2A96A/SPSCpsMTJwyEL
         tk1A==
X-Gm-Message-State: APjAAAWSA8oryjj0qIQ2ARNJNMTh1lqbzP1CrdKSB6edCDutV1zQKzdD
        9sv7hQv89LrXs1bIjczjvF8s39k11Qdi7w==
X-Google-Smtp-Source: APXvYqyNxhuvLjt+L6J1giR7mtpbXOaFMGF82hhtzlFblMv8NNrmKiBkVFNlRXiVQYq6LXXJAJOyJw==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr3998638wmc.80.1572016296934;
        Fri, 25 Oct 2019 08:11:36 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n17sm2594950wrt.25.2019.10.25.08.11.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 08:11:35 -0700 (PDT)
Message-ID: <5db310a7.1c69fb81.4ca85.cace@mx.google.com>
Date:   Fri, 25 Oct 2019 08:11:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191025
X-Kernelci-Report-Type: boot
Subject: next/master boot: 258 boots: 15 failed, 235 passed with 7 offline,
 1 untried/unknown (next-20191025)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 258 boots: 15 failed, 235 passed with 7 offline, 1 untrie=
d/unknown (next-20191025)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191025/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191025/

Tree: next
Branch: master
Git Describe: next-20191025
Git Commit: 139c2d13c258bacc545fc2a4091f7fb0a6fb08fd
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 25 SoC families, 28 builds out of 216

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
