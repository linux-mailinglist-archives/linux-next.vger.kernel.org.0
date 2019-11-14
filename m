Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254A2FCC46
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 18:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfKNR5A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 12:57:00 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:51853 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfKNR5A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 12:57:00 -0500
Received: by mail-wm1-f54.google.com with SMTP id q70so6617049wme.1
        for <linux-next@vger.kernel.org>; Thu, 14 Nov 2019 09:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yK3IG3FjcNAqW8rN4zyy08l/aRlvtoFDkVsbOEBe3hg=;
        b=R0293y+ndhGuzGAOUhs4UqHwjiCwYbaWoYkASTEEVQYfKsr23Xo9TWBt7jGxXg+2v0
         QK1FlN4yc3oK+Sb0NBRBsANS7m7m+eoQ3YvuL1AKKFS7vu1YiZZrEZQZNZBpmEYkCQba
         6dr0mdORpR69TvMPYSnhltAIXGXtUO+eTbVo4Wg6BOXAVJ8h6BdHr3ZkEyyuvX/hRDuu
         rnpkBd2iquRBcE//UvKI9/ASDFpmWCm9n3c/URE34dFDFERAq+BHnbPoMYW2SAg4V5ts
         vdriZhfGQpowT0EbFGrjn8ZLo9djSr46twFR+IbAL7O6dOJqexCb84LIFpUKHx1HNUgN
         F6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yK3IG3FjcNAqW8rN4zyy08l/aRlvtoFDkVsbOEBe3hg=;
        b=OMbHkNpUtJhDi0vVMG3c28A64/qg2j+qjm1OnKhQaDpfDG4K5VAgFYnLRloZXHoE/H
         gLQAzj3EcJ6XwXiN1gyGNFWRzItDYLLHF6QpzWYSA5pd0gZcVQWfTnsGqRnruUagNeRP
         goCpgm4UBtHQmhq5eMMSgQ2L8KmwNfVj2VOEgCbTiyyh0UhJ0vWnyFmYbLpcweQwBVPl
         3WdtM915wJt3Y3YB6awG6s+8/Cpfov2WjkIxz0+WI36+3il6SGMJjuvsRYcgPoZn4nT2
         hATU9YGeK+O1jqa2FAN3TCv3uCWIvWABivnW9wVUcjN/MywlHs3r4op9UBAgeqz/Z3E3
         62WQ==
X-Gm-Message-State: APjAAAWGj/tsc9xOKZKFICvGzh+mRcIqrPmiIbWDS2b8Uzv4AYiV90LX
        I+77IW0I831jrMw1NydOi9Vyyef42MFxrA==
X-Google-Smtp-Source: APXvYqzvm/XgYCyoQ9L+YvHL7dPLAOfnNq0PmZL/VjhulW9G/8aTYvpsK5mQ6lB8I4xVlg4cxWUSeQ==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr8772621wma.1.1573754217948;
        Thu, 14 Nov 2019 09:56:57 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a2sm4354499wrt.79.2019.11.14.09.56.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 09:56:57 -0800 (PST)
Message-ID: <5dcd9569.1c69fb81.4b78e.5374@mx.google.com>
Date:   Thu, 14 Nov 2019 09:56:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191114
Subject: next/master boot: 246 boots: 4 failed, 232 passed with 8 offline,
 2 untried/unknown (next-20191114)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 246 boots: 4 failed, 232 passed with 8 offline, 2 untried=
/unknown (next-20191114)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191114/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191114/

Tree: next
Branch: master
Git Describe: next-20191114
Git Commit: 8466d23e6e677cb58e237d1f35588497b8dd5c5c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 25 SoC families, 28 builds out of 216

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

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

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig:
        gcc-8
            sun50i-a64-pine64-plus: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            sun50i-a64-pine64-plus: 1 offline lab

---
For more info write to <info@kernelci.org>
