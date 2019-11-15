Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B39F3FE56A
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 20:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbfKOTIT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 14:08:19 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:45793 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfKOTIT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Nov 2019 14:08:19 -0500
Received: by mail-wr1-f46.google.com with SMTP id z10so12088141wrs.12
        for <linux-next@vger.kernel.org>; Fri, 15 Nov 2019 11:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZlBdQ1Yo3hiMweUUt+kpU/FRbEVlO7qkQ8kBd5YmkUw=;
        b=O/mjKtKFyMOtFo7AKSDBG70tj4n2xpJRyU5z5hrPO9Gm3/ZTaSA/8tyUo2V9dAuBw0
         1AGJLL9BjI6AsI39JPeJi3o04vwIUSUCIo95toaH6mo5OQw670n4yaoU1JdzbAvlOm6J
         fHU6tygtnLMgaTeBe/FlKEGB9jkJ8KTIX3xY+6F0jQHamqQZDMuvTHP7l1dweC/wk0mD
         rbIhLYySozNCNJeFCPPta25hPiWoGLFjiAMfobpOYBrbEVUe4SVXm3oi7Vz/7rwlP99c
         4VuRk0Xp71aZEpcpKZUatgeLB9s5J0xqxj+LL1vubKpa7uSEQ/VnT+dCJ7ENa5hEsAqz
         9qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZlBdQ1Yo3hiMweUUt+kpU/FRbEVlO7qkQ8kBd5YmkUw=;
        b=t4Uf86/K7gCfNwI3VvkE3I/y5TFSXD09nEW+G35sJ0ONZWPxshgE9menmrvP/p7MGC
         NwVkm2DJWlm0kJzCP++JvPfHjR5/3974JqlCcU47ryqNDQ9jy7RYoIlUDW0Pfc3m0Rp1
         P4imJ4faEPsYAlidY91/yX5COfPjL97txKKWYXgIQUkf3i+GHtxlKBTJpqaceZ7ALpXp
         KyXSi+JCGgs+IkfRqlnFc3MPbGxI20rcHxcLxZX+24rQbTi92f3BF/5mlhQpuPhImlJu
         Z8YjnaU/lOSovdEdMvYkdWkhnEZN0j1bO+9rPmLnBMxsY6/csYhsOSMhslh+UVHDg7vj
         5C+w==
X-Gm-Message-State: APjAAAVqHWxvJJrx4iXfVxa6YVbboRxviRdXF2s4GqTlSe5GTT9+PBgo
        5xo/x4R+lojbPVQN3DkKErYlfRCBVgc=
X-Google-Smtp-Source: APXvYqyAxXEpuuwBnkOn5ajqNvMzByugHaLshhAj47Yby8k48PQKgkVk+C5JSqyUBV/nfJTLWCPh+g==
X-Received: by 2002:adf:fe89:: with SMTP id l9mr16090839wrr.368.1573844895823;
        Fri, 15 Nov 2019 11:08:15 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x7sm14914115wrg.63.2019.11.15.11.08.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:08:14 -0800 (PST)
Message-ID: <5dcef79e.1c69fb81.22607.7bbc@mx.google.com>
Date:   Fri, 15 Nov 2019 11:08:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191115
Subject: next/master boot: 177 boots: 6 failed, 171 passed (next-20191115)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 177 boots: 6 failed, 171 passed (next-20191115)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191115/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191115/

Tree: next
Branch: master
Git Describe: next-20191115
Git Commit: 5a6fcbeabe3e20459ed8504690b2515dacc5246f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 60 unique boards, 18 SoC families, 22 builds out of 216

Boot Regressions Detected:

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: next-20191114)
              lab-collabora: new failure (last pass: next-20191114)

    i386_defconfig+kselftest:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: next-20191114)
              lab-collabora: new failure (last pass: next-20191114)

Boot Failures Detected:

arm64:
    defconfig:
        clang-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

i386:
    i386_defconfig+kselftest:
        gcc-8:
            qemu_i386: 2 failed labs

    i386_defconfig:
        gcc-8:
            qemu_i386: 2 failed labs

---
For more info write to <info@kernelci.org>
