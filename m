Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0943F3E18
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 03:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfKHCbD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 21:31:03 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:34600 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfKHCbC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2019 21:31:02 -0500
Received: by mail-wr1-f44.google.com with SMTP id e6so5357318wrw.1
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2019 18:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=d9hMWX1LMraLviOpuoheVptY2nyt/iYNZ4J9nN4QSxo=;
        b=Gq/eznXaGbPhDivlglvIQEEm89Hi4rSs27ER8vHoZnTi4KTSCJS0YUiGfjWwsWIS6Q
         YcU0dX81J3emoa+FSqHXtWNeEHnTUL/gkTqKMaU5f6rZWwGcY9JO1PK3Dso63yVUHWKa
         5G7HvrpuAAKOqRoBsREx/6zxpYhNygfNtLB3MYviRHMoM6jU32Z1G1JV5h4qPQ7BcUmo
         YtOzEiUn+VCXnKIEFWQpqOM6cAH6cnabcoCp83K0kC4mO6RyhAR87oGS6mFZlaUvYfE9
         uwWka5H6R29m080TTMsdspwCeHoF74v7bg7j2GV4IpLPy+EZiqXax1r6RtWUFl7qkK/r
         zdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=d9hMWX1LMraLviOpuoheVptY2nyt/iYNZ4J9nN4QSxo=;
        b=gPFghNUd+0p+bIVxHh2Ih7SNYSqZrVDB3I3+KHqvWlfGm7yRdCCdwOP1r4hjzJtLiT
         iH+QVldFwUHmdz0JpgcuRwLqQxxZnnb8fV2zfgKnD3VkNwjq9/T+Zj1xzDzkhfE+M5b6
         KOB0D7BzTmlqNTSmeyiLn0fp/M5CyF2vvnm0aREILktYCkCvpuVFZS0+aEtdvaIHaYDK
         PRiU9avkn2tUlRpU7b94WKopT3JfeEQWZjRBxAL+6U9FFzjNUWF0J8mzvLMbKksHLZ1I
         eNFZb3GvhoPNVCpo96pDRU4R0wrJ8rBao2M9F9kLM8eGGsmf+rLtpdKb1f54Wt/hzGrK
         oTRA==
X-Gm-Message-State: APjAAAXNPAHJYpCh44m6Yafsnc1Q1B9daxzpP5iiyZiofyLZcLvTpTIP
        N22Jl/uN18JpUKD5EWW4++uL7EKDLDk=
X-Google-Smtp-Source: APXvYqxDjLDrJGOXu8E5TP3KMGsba181E1NKn7bOwaCw0nKIAjnKngwDhrVqzm1HT2gkd+kN4aeseA==
X-Received: by 2002:a5d:6585:: with SMTP id q5mr5689784wru.158.1573180260434;
        Thu, 07 Nov 2019 18:31:00 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s9sm3464885wmj.22.2019.11.07.18.30.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 18:30:59 -0800 (PST)
Message-ID: <5dc4d363.1c69fb81.b057d.37a2@mx.google.com>
Date:   Thu, 07 Nov 2019 18:30:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-315-g0afdb084c8ad
Subject: next/pending-fixes boot: 229 boots: 2 failed,
 220 passed with 7 offline (v5.4-rc6-315-g0afdb084c8ad)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 229 boots: 2 failed, 220 passed with 7 offline (v5=
.4-rc6-315-g0afdb084c8ad)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc6-315-g0afdb084c8ad/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc6-315-g0afdb084c8ad/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc6-315-g0afdb084c8ad
Git Commit: 0afdb084c8adc6dab97ae27ba0e4323ab88963e6
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 24 SoC families, 26 builds out of 215

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
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
