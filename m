Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1F8AF6D48
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2019 04:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfKKD1e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Nov 2019 22:27:34 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:33797 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfKKD1d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Nov 2019 22:27:33 -0500
Received: by mail-wm1-f50.google.com with SMTP id j18so2165757wmk.1
        for <linux-next@vger.kernel.org>; Sun, 10 Nov 2019 19:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rj/emwgwPd6cNvTJ3lndd7BVFdIoGzWoyUJHNXzcY0c=;
        b=qK4G7+nTzBh9hsD6PSria2/BsVEUUviJ0oriH1KnHYf7l2xOBIPxb+vqukCQKznImd
         MHHvCrmUxebc6fWZP4I2VJRVTgV3s/EePmyfeEQ4qd2RknFlZmXlKCQB5lEfFmEK24se
         vbYZcT6is5TTDV14g3BKieQ2ni9dRWWkBuUbaosJPkLx9/N+NlumZJwNapK7pMxkMUfK
         C+5UjiAiFiadatsfB9UJEjTcPsqjSgCbEno0vZXKfICuCGq/Hd1lMkLmJ2vMODNpI4wR
         f3qtROqqExYJWlXu5aJAtCDBzK8qI7TknRj/TPVCnOzbUh0nmD1ev7PLR/4nrDgmkjpJ
         YswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rj/emwgwPd6cNvTJ3lndd7BVFdIoGzWoyUJHNXzcY0c=;
        b=GuMuHx79W7wEZwp1fxqjA97+6vdGbtndQIif698b40ptfj5I7wf7JfQ+6HRdg03ZC7
         XhRMmixhruhQfwSzbRHswmqss3xkytRs6g5sY74t+8CEksl21J9fb7AeA2Do4eL5W3D0
         zoHT0csXtdKfq4TCQeZ8TEmqSuIxe3OWt4XgEdLa/TQABuXpIXvvQ70iULNdojRQgUj8
         Ofi92234SqjmlBmF6pBQzCgFfjKVrvGkIKxdDOJLS7gfmIh3Cb1AOnAyY2XAFzFATChS
         Y6Z5ZOSPbFQRymoikBqqu4Cpnb/Yn5/FPpdEs2to1WRZc3Gt9t0jFbBm1WJVRrDapXzf
         aEEw==
X-Gm-Message-State: APjAAAUP18L+0+rb6VaX9i+ecQGpHLug83ZuYpyCsYWKHOH6JO6CAKAM
        jDtPhj+HGzQwff0rDJN5/02fGo/YVZU=
X-Google-Smtp-Source: APXvYqy6PVeB7o2ZXNlGXdxrRTxnNZAH62G3kJOONFoRKHi1FbgLrac+r1dbqdH2pAY0FHOs8iO7lg==
X-Received: by 2002:a1c:7d47:: with SMTP id y68mr18344141wmc.157.1573442851386;
        Sun, 10 Nov 2019 19:27:31 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a206sm16024493wmf.15.2019.11.10.19.27.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2019 19:27:30 -0800 (PST)
Message-ID: <5dc8d522.1c69fb81.fdd4c.ccc7@mx.google.com>
Date:   Sun, 10 Nov 2019 19:27:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-438-ge03355daf891
Subject: next/pending-fixes boot: 233 boots: 3 failed,
 221 passed with 8 offline, 1 untried/unknown (v5.4-rc6-438-ge03355daf891)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 233 boots: 3 failed, 221 passed with 8 offline, 1 =
untried/unknown (v5.4-rc6-438-ge03355daf891)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc6-438-ge03355daf891/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc6-438-ge03355daf891/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc6-438-ge03355daf891
Git Commit: e03355daf89179e3552a44366713122e7803227c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 24 SoC families, 26 builds out of 215

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
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

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
