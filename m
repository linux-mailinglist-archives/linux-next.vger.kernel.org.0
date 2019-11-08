Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26204F4B14
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 13:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392042AbfKHMNu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 07:13:50 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:41249 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392038AbfKHMNu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2019 07:13:50 -0500
Received: by mail-wr1-f43.google.com with SMTP id p4so6793352wrm.8
        for <linux-next@vger.kernel.org>; Fri, 08 Nov 2019 04:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=21u+tvQZUQFU5DSa5JgnY6E+z7Cft1tavvM9YNrQrhA=;
        b=pNJ+IcJCgurm603S3T0ViHHAovO4IZlXGxU+VdeLhuSVfGMb0+my6MLkItXr+qAOSQ
         Yh6Cyt2y1tHR+1M6dimeNH2Q+pePoNyqqLoz/EL6ls+VOHxLCRVGNEony4bBJc2CBIp7
         09cSOrrj75BN+BSSrHKmSk88fvxwU56+CcRsOcVGxbGDx9GIlYqYlYJe0HQI5Nrx//JC
         uvgbtKgCKlm+FISQcA7zyVWEmrTTDPf+aHy2rql2s/KZFyj8jMkx6JN16b9CQy+Tl1NZ
         SbU9rQIOmriTOpuhSPJOgIppvcH+/yUgO8v2DPLK2g0/sjw5/cseqJDGiNLXC2plgo2m
         g4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=21u+tvQZUQFU5DSa5JgnY6E+z7Cft1tavvM9YNrQrhA=;
        b=ZoU9YM2bDXpGGSA/UybxwTRSK67/2IpYqoybyNhVnXr2HHqH48xyUsA+zITL/TOexl
         46vYmR4F2nrR+qAqdLEixhIFsH1OH3ieUbW3FdXyb0DoP1Vlg+dNhdUQAsm7mJ+8woOc
         Wy0iZPjTvlZ/KDdSOBTyGKX9kjQ8N+QvJPyOymC1fkt51+PAqtBF609OdGbzsBLppI7f
         6Hu7rb4fBcqr4CRRQjD9ckDQInNXAPqOcI8J43v24ZWswKqr0aXJc0gOu0IPp+AnLIwU
         SWVxBx5eyt3jPtjTShX97kU5+pbFlOsZWVJSvDK1yyThgYWO3/gxrxPIzGUqkJH4RwKb
         n2SQ==
X-Gm-Message-State: APjAAAUTkpAvN8Ise2voqC+p8bw4/OX0WRyWefUF2+SvNzNJpTnJ4q6H
        DwJh5C1zMU/FyAZq/Iu7TEdKg2+eVoc=
X-Google-Smtp-Source: APXvYqxMcVzMTpyak6Od/rQ5+SWypvUsj5RSkDdRDiazhZStfHuzaSoaor+7GxYsrk0jCgkTKWABpg==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr7841145wrn.243.1573215228206;
        Fri, 08 Nov 2019 04:13:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w4sm4887177wmk.29.2019.11.08.04.13.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 04:13:47 -0800 (PST)
Message-ID: <5dc55bfb.1c69fb81.6b549.9c90@mx.google.com>
Date:   Fri, 08 Nov 2019 04:13:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191108
Subject: next/master boot: 226 boots: 2 failed,
 217 passed with 7 offline (next-20191108)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 226 boots: 2 failed, 217 passed with 7 offline (next-2019=
1108)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191108/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191108/

Tree: next
Branch: master
Git Describe: next-20191108
Git Commit: 5591cf003452dc3cb5047dc774151ff36c8d9cf7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 23 SoC families, 26 builds out of 216

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

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
