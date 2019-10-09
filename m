Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3681D0D97
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2019 13:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbfJILZh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Oct 2019 07:25:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39440 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727657AbfJILZg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Oct 2019 07:25:36 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so2441343wrj.6
        for <linux-next@vger.kernel.org>; Wed, 09 Oct 2019 04:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AupJdhvLb1R1j2PwQNMmo2jRMBLIDiNHN6CHLuIiSy8=;
        b=Sm8zlNaI5DIfe9DxPFp3oCwht4qgAm7zXg8ECfLegAJwfttJ8GgLb8y4evrIAnatL9
         cVVCljSyEUnNjrC9Nwqmi9SGH8AJ+qizfiYoTLbvdz9C2zQ5BkiGzH7Op6UKR865P04G
         xmr2KXXHE7JAPRoyhdoRvuZw9P8HMYqAk7KhAp8gnNgxSpvWVCGeqlBbi5Vt3gI+4MYb
         9pxp5Dr+ncU9XqIGrPAgVOdfOllmls1AZB2oca7odw9tvSuJdEqZLhAa7hqZdE20GLEb
         +rubQf5iDGHBUDfqX3pfx4wDshfp3662iXHNEQeFTxnsSin3lbFadL40JVY3rhY5Bz4q
         UsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AupJdhvLb1R1j2PwQNMmo2jRMBLIDiNHN6CHLuIiSy8=;
        b=jviRGP41JNt/1opYEyozMGg473MbIs68u0T6CJ3wlnQ3Ap8lCYrhuAx9EpoT4BCM3t
         /ATL6jk7ZaR5klrMDCoKf3rMVq+KprSHhBYMGe3uBP9UDivxKjHgdRlqEpPN05ac4CFo
         j1/OdS1xUVn0+Rd+lC1OCDY4Ze+F/PEJGPJmFzyk2Z31pBkB/zv2+/USov9XpoTqejqk
         1xNNwt78ZUM46EJs8EVt/vlMiG+cUrTQ8NLg27V7RbhCAK30lkR9qAy5VDqIrUWo8xiy
         sC+Zcy3UuAdnqdtTYhfOi3/6yByQk1y/b//sObzgLbhE4Jmp/XA/MZehbUbIe3YUl5nc
         vaJw==
X-Gm-Message-State: APjAAAUmpaKYR9XJ3sx9c8C3rLW7+oS8DJFeOEGhKlh4DcwYyKNifQhy
        D2fUNZQI8om7AjL/A/snDaEObg+Ep1F5xw==
X-Google-Smtp-Source: APXvYqw8PlrEBtSEo9rAhAqFMRiKgW4tPHS9s9yz2GC0n6LnraHlHYDC88HsbAxs63nRvfURHSmUxQ==
X-Received: by 2002:adf:ec84:: with SMTP id z4mr2475064wrn.254.1570620334606;
        Wed, 09 Oct 2019 04:25:34 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e3sm1970643wme.39.2019.10.09.04.25.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 04:25:32 -0700 (PDT)
Message-ID: <5d9dc3ac.1c69fb81.7707c.8dfc@mx.google.com>
Date:   Wed, 09 Oct 2019 04:25:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191009
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 159 boots: 6 failed,
 152 passed with 1 untried/unknown (next-20191009)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 159 boots: 6 failed, 152 passed with 1 untried/unknown (n=
ext-20191009)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191009/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191009/

Tree: next
Branch: master
Git Describe: next-20191009
Git Commit: 1ba4389f4572d716d73f8bacab4e181d82504780
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 44 unique boards, 15 SoC families, 23 builds out of 218

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          qcs404-evb-4k:
              lab-bjorn: new failure (last pass: next-20191004)

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            qcs404-evb-4k: 1 failed lab

---
For more info write to <info@kernelci.org>
