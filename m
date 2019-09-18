Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09278B67FE
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 18:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfIRQZd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Sep 2019 12:25:33 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:32858 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfIRQZd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2019 12:25:33 -0400
Received: by mail-wr1-f49.google.com with SMTP id b9so123692wrs.0
        for <linux-next@vger.kernel.org>; Wed, 18 Sep 2019 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Z1tT8/2gKaI/sfsHJppMTluldW2aMJOSisF+MoAia6w=;
        b=mC58EHPhcU4EbfSWrnUSO4fZoroYkg0Ofgxjg633Frv92XntoLFRXyFmLtTe2uGsBB
         04JqNB9ZFVledTIgxHC1xznu/kX1xcNoyVzyA5dfTcxXpstjwculQ0GNPLpfU5EMa3yD
         cHecCHvkFs8blq87TmaXvVF+VPDqPNFr8XK0MtJFTSlY1KKAMN1SQk2SAeGVUbMBXxx6
         Y9DO0RRStC2JpP/eo8xwoEfe32kGJ4o0W89V+0ovEA0NpbwDqxW/UxI0+sy7Vfmz0bR5
         HDE/8HBL244Ac10U22mhyGj7nxtfxQeca87JxdPdXjR1XAH84aqybp7mJgQfNKLHxuuU
         SLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Z1tT8/2gKaI/sfsHJppMTluldW2aMJOSisF+MoAia6w=;
        b=RAUph+EPG2tX4PVPrFK5JvcUT5dP+B1Pq0OZ8ohIZDQekMI1VnlopPVlRJU9GU6DZx
         VtaB7FZm04P+tFWwlYhM50gcNoZBO0WALqLbhSYOhBF/+amkYF0mYCOwZSdyG+kK37TT
         XNk0Op9BLBS7Vq8OD8lJILEbEg5ULLC3NHc411LUukQFjQUEKVItFHcFyZZQOaMHq69A
         x79ewN4BVT1tf6Un6WcI5vgWm7YkM8d2ygisvdF+qwdnHr+IUBEpeVzyGGyjyOpvIYwx
         /vxMbe01aNRxjWIv3dkWkvSN0twNXLDzH5vG8dtl4T+XLt/Ib2naZ32PdaEVr7tqqJXW
         1N3w==
X-Gm-Message-State: APjAAAX+MgiEb+lRs2JwBljXt/Gh6kZhDx6fpAjT00g/2Pkx6vWtldUE
        1/njNWid1RqxTvcSQU4LWn6Q6oDMpXcs6Q==
X-Google-Smtp-Source: APXvYqxlNncGQolxraQBqyn3qjfqQzIG+Yf2Aa2gG3vY/nlrAov5nHByrjB3HyYIPYqcp8NWFqyrqw==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr3754504wru.148.1568823930796;
        Wed, 18 Sep 2019 09:25:30 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s12sm10913277wra.82.2019.09.18.09.25.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 09:25:30 -0700 (PDT)
Message-ID: <5d825a7a.1c69fb81.8c2d9.30b6@mx.google.com>
Date:   Wed, 18 Sep 2019 09:25:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-4249-g733f21b14e9c
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 325 boots: 12 failed,
 299 passed with 12 offline, 2 untried/unknown (v5.3-4249-g733f21b14e9c)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 325 boots: 12 failed, 299 passed with 12 offline, =
2 untried/unknown (v5.3-4249-g733f21b14e9c)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-4249-g733f21b14e9c/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-4249-g733f21b14e9c/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-4249-g733f21b14e9c
Git Commit: 733f21b14e9c3cdd1f834e2c44061c114c41c390
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 28 SoC families, 27 builds out of 214

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
            r8a7796-m3ulcb: 2 failed labs
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
