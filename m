Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCB8EB05D
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2019 13:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfJaMcU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 31 Oct 2019 08:32:20 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:33962 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfJaMcT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2019 08:32:19 -0400
Received: by mail-wr1-f46.google.com with SMTP id e6so4213407wrw.1
        for <linux-next@vger.kernel.org>; Thu, 31 Oct 2019 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KDjLx3yJJv9cH5NX8bNMdUx7XS/xHegx4kHzwSgMg1E=;
        b=qex+bW38gbkGHD5RV7+/+P7tVVQisXXqOWYHGsiG0jOKTvRHjqq3Lc5nQNJ+bVUOhw
         d/IlRh3vcrCU4c1i/yIyZi17LMlngJE6NPSLDmv9ZpTQgv199ST06j2QUTPavPN8YTPn
         FICa3ErXF2IcD6rJJHtrja5Hpabe6y8tLXQ3R2Z3S87gEu/WGdzINz0U6Wui1rMQbUAJ
         ZR8eYidhEQk+m1fkr2P+m3v/lJrMcg8qU+a1UzUmVZqwDWjPx016ZzSR3vnB39h2DgJP
         9W13TyEIGoV38tJCKTZ1pc6xRDyUSPkt5GJXJlyIbrbWnbmKSXGGTq9j8Jj4zlc/rstT
         4xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KDjLx3yJJv9cH5NX8bNMdUx7XS/xHegx4kHzwSgMg1E=;
        b=Xo/PUAxqBUUk3Uc4ChZ2KpsDHNr0ihMInCRboxa22qsYLDaWsvUvqR/5VBJxNfbP1n
         Lg9mNz+ExppMBeTOZbiMgOLtlt5gH3CMchEm0n1n+gXyhBITgLWcR1KMpUT9fo2Wb6L0
         LuSLXmivBVXt8qOymIOronYIx1sVTGptmRVWxaLknnqUCINF1AAwpjdXGdR7HZ84RZq7
         MrgIznAg098Mt1I3w8Gt/5WjOupAw2S8rWkaoXRJJm8gYV2J2FZuawUScrZvMrAtr2ha
         4bayUuhhRqm614KyBTw0mBgMuTuaDhijdphfoWTP76qDRidytHjTvX+d5UR+ELBz7uv+
         jTwQ==
X-Gm-Message-State: APjAAAX/rIz69UOE3XtLGI4f59sRTuelYr1GxKORLNDGwDRLgKhEOrwG
        aedlhdc2mpAcDukMkLtDs+qIXI9s0TG5pQ==
X-Google-Smtp-Source: APXvYqyyZMpufs0nR+I9lXZo4fqoNWtLhy5uds82X9zNsaLsW+LdE2gRsBGwGn+IzPFYRFRCdJFNgw==
X-Received: by 2002:adf:f905:: with SMTP id b5mr5408236wrr.122.1572525137731;
        Thu, 31 Oct 2019 05:32:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x8sm3708261wrr.43.2019.10.31.05.32.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 05:32:17 -0700 (PDT)
Message-ID: <5dbad451.1c69fb81.e78ff.49e3@mx.google.com>
Date:   Thu, 31 Oct 2019 05:32:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191031
X-Kernelci-Report-Type: boot
Subject: next/master boot: 185 boots: 1 failed, 175 passed with 8 offline,
 1 untried/unknown (next-20191031)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 185 boots: 1 failed, 175 passed with 8 offline, 1 untried=
/unknown (next-20191031)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191031/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191031/

Tree: next
Branch: master
Git Describe: next-20191031
Git Commit: 49afce6d47fe05ee01f1a41129b835fe4cca7eea
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 24 SoC families, 24 builds out of 216

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

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
