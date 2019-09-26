Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44018BEE33
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 11:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfIZJOz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 05:14:55 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:40486 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbfIZJOz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 05:14:55 -0400
Received: by mail-wr1-f48.google.com with SMTP id l3so1808452wru.7
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2019 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WQFNtfuyhYcy80O43vxa3rbpqG7/cRklK0tysIk7IME=;
        b=xLAtEJdgQo1Htjs+IqhhUmf6li01V11cai48DtSbSwlleUB2KXO4RQsbSQjXCphWQY
         sNdDM0/+qS+vTNyoPfQVdMHAqM3mzES+y0GwmHhNMJDczpGyVkVXC9tLVX9vpUOes/44
         TKq4zJyrAAzstsAlM0H24Fguyy7Fb/HeSp+tfh6z4JXbTcXmCIQLKj2OTWrqYLG8T5w2
         wzEdSXir098LdeTq4JF/p8Hg99yk0I7Z4hV6Ki8soCWuMDE7ixccBQsptXA3gxP1gpnR
         yA1ueSdRuxN0mTdagA/1lRAcaV3APw4pg2jjIvuIP4JcAOLBIhqu56kAsA59vA1uF1/7
         FX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WQFNtfuyhYcy80O43vxa3rbpqG7/cRklK0tysIk7IME=;
        b=Q0VX7aEsdHJWuRrzG5aBXKw3SSTNa65cJG50n7wrrh3jrn1LsVRkKh1MjRz/HGN6Qd
         zUXxs+EcO+SORPuhKSU7VcB7cx4e6/2n1cUckPdYqR2C+m4zJZeVNgUBUDbyZfNbvKv+
         vbbNSmgiVgQJ7pdMsWwoRt3Yd7JPkyf/BHMYNkB+couQPpiot9Dt1E9+JnyGzVHwUxgC
         bSGgmWv4q7LMhVqDdQSNybNC+n5+uiowPZolfOXecXZnVPsHdnrfMXib/qqW6Px59Lc8
         0hHklX0XZUXKAriocwVq4OK0NCpcQfjb1u26WuAyYVdLpSGoxQx+G3x5OjxxKKOw+rP8
         SnfA==
X-Gm-Message-State: APjAAAW1rPhgGoO3nYC6gbYlm1GrLyT2P7STEzf3FFGWs7e2jSJ2iKyA
        tdKJVC+2wlfZcqlLLC5nqI5mfs4h4RZYqQ==
X-Google-Smtp-Source: APXvYqzLrbgV0oHfK+bo6XIVpRGOUQSsLf7OCZDYBAbUXsPKtcoCpw3fth0bg10GtLu8kw/j7I3nDw==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr1924612wrt.337.1569489293694;
        Thu, 26 Sep 2019 02:14:53 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d9sm4080033wrf.62.2019.09.26.02.14.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:14:53 -0700 (PDT)
Message-ID: <5d8c818d.1c69fb81.f9257.0f51@mx.google.com>
Date:   Thu, 26 Sep 2019 02:14:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190925
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 334 boots: 14 failed,
 307 passed with 13 offline (next-20190925)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 334 boots: 14 failed, 307 passed with 13 offline (next-20=
190925)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190925/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190925/

Tree: next
Branch: master
Git Describe: next-20190925
Git Commit: d47175169c28eedd2cc2ab8c01f38764cb0269cc
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 26 SoC families, 26 builds out of 218

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
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
    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

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
