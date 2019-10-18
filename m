Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51DBBDCA80
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 18:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442915AbfJRQKv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Oct 2019 12:10:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38585 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442650AbfJRQKv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Oct 2019 12:10:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id o15so6436792wru.5
        for <linux-next@vger.kernel.org>; Fri, 18 Oct 2019 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dNNu9H+ZlwnFd6BrQv9ZF5w/YBbPyK/fpUucYRpcqR8=;
        b=IGSkuU/XhKnocwgGWY+bjF9J1euYzJaWfkM4R+X6mm8LfK571928yABNgcU9qBZG4i
         EifJzG7QRgez4s3Nuinp8UYALJeUv4G04lp86oC2LfzVZrT1Hiyl9s86oYWCoZDpfZWP
         FaY5HIjE5iUfD8KV4nk628ZguW0CX3NhVjfRnP2823S3jMwEO80/A7VyX9pLYDTa2ue3
         PXTXp66RBFodicYJk2o/DkkZwT8Z923+T/DWzXyLAKz31VUF3gZrvy6jvNSSJ/LDvB7B
         3R/ZdLHHg/fX0REDNezo9VDnsr2CC0qCodwBApnIOHve0cvZ6QOo3vYQmYCc5sz2SwBA
         YnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dNNu9H+ZlwnFd6BrQv9ZF5w/YBbPyK/fpUucYRpcqR8=;
        b=c1mdUaokslASU+i58+wAaPik3TH7j+YlcRQJoDoduVs0WSCAdCxwmJSAnQygMptATj
         lkv8FpKuJ7r15URsfYF/81LAo3BQdW16chRYr721QhbXGrtZgZlPI/Y6Su9VXAeqLCDC
         F+jZS89zVs/qAsnVRMiUpekk6gckPaqytD5M6TWBypcmEJw0YrNUT9gLFr44XQSRwfeN
         z0rVfznqXstUFapEoZRoMJVlx69p8LbYq+ifCh/nsV0lTqdLP8XIr0PhNGfNgX+nZ4Ea
         w3RGqgenvqe3bCzZja8T+r9Tb/UMej9KhZE9AAsklalFRIDcm9Um0YxQBNtC/UXNCh2m
         Qf7A==
X-Gm-Message-State: APjAAAXtYKgu9yQWO3LznVuLQ9Hc7pzbxDEkI1tOIff5M85LNv7dA7D+
        YJ2h37pN1jBjfNlDhJGi+eikT7d+jhgKfg==
X-Google-Smtp-Source: APXvYqx6i+wlQALFn25+B3aqmAir2dVACJBTCW8lxBriS+pFqKRaL846IkK3YP+Bc0+7JXkZqCdnYA==
X-Received: by 2002:adf:e80b:: with SMTP id o11mr8654737wrm.231.1571415049350;
        Fri, 18 Oct 2019 09:10:49 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d11sm6620407wrf.80.2019.10.18.09.10.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 09:10:48 -0700 (PDT)
Message-ID: <5da9e408.1c69fb81.bfbac.4c90@mx.google.com>
Date:   Fri, 18 Oct 2019 09:10:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191018
Subject: next/master boot: 274 boots: 9 failed, 257 passed with 7 offline,
 1 untried/unknown (next-20191018)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 274 boots: 9 failed, 257 passed with 7 offline, 1 untried=
/unknown (next-20191018)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191018/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191018/

Tree: next
Branch: master
Git Describe: next-20191018
Git Commit: c4b9850b3676869ac0def5885d781d17f64b3a86
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 24 SoC families, 28 builds out of 219

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

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
