Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0866175259
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 04:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgCBDjj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Mar 2020 22:39:39 -0500
Received: from mail-pl1-f171.google.com ([209.85.214.171]:33283 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgCBDjj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 1 Mar 2020 22:39:39 -0500
Received: by mail-pl1-f171.google.com with SMTP id ay11so3640901plb.0
        for <linux-next@vger.kernel.org>; Sun, 01 Mar 2020 19:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=U8DVZ0Qkgc1hIzHCy3SOf6k2V4ZhVoc8u9A82gOtdfE=;
        b=wN+e//KXCd3UUMexAi5lqYesFp7PMfzVNnRZk+V1/nQyGA5GA3G5xpyRnyKkllaNw8
         7774vEwpuDhRn+GlRkd+XExuVfQ7bHS3/Wy2ZvMqRUECNM7RT0nPckCnDwVHjMfeoLRu
         p/8i3YC0brwAVzr7SBUi6makBzIj2FfBrs/kQF8yYxjRFNIK+dO01w010Amn8Jd0tiXG
         j2FjzBQTRDG1mS4wlpwp1KeZapIqHnyua/Coum/axzTlHSvpxi/qFNXk0elQpRu4+lvP
         sts5qcTeipD6e33Ka9oLqNqIlZ99yKENR26ydrHn9vu+K5O5TPhSFZYORFKJqyXf3fr3
         Veag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=U8DVZ0Qkgc1hIzHCy3SOf6k2V4ZhVoc8u9A82gOtdfE=;
        b=R7M5sbnZeXHYzcyVNl/vVm6lD9PSikeZIJJHcaE9rESNSXGV8+EXpNS6s6MhEibRss
         WWviIakmOmT7riN5dKhzxs/6e3CJuDaL5ZjtzhpXMo+himeOp80J6b8XCMgxwK4jjuEz
         GYtvvrZJZOxrbh0oDfbrkS1yR5xxhTTsm38Y8uCqG0FqagA0mWor+8P2UD11z2GXtKj9
         50QrlkSL5pfeTISforkwUvYq1RufpNX1IMJokNRqEQ16lk2nP0ZGeOQRLRBW+QjhQJSg
         Pf3RD+EjJ8V8+sOBvjIuHetal+mkFD5ZiiQ/SRXoB7OWYliApiBloMHo/Rc1+LS8bdAB
         tAsw==
X-Gm-Message-State: APjAAAVkg/XpChP+t+bR68rs+AWs6BXFSxyd36ccCJvaDxdnyovat/1c
        h+4IMqSNLI8dXFWSyj3WmOoPvG+p1Ng=
X-Google-Smtp-Source: APXvYqyKD5PoMHe2uCXmY28rR1Hbpsdr9JO4cd6TP5bve4V0hSgT2Pd8lwUfk5avCMUjc9u/MJvyAQ==
X-Received: by 2002:a17:902:c113:: with SMTP id 19mr16147627pli.138.1583120378300;
        Sun, 01 Mar 2020 19:39:38 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u11sm10139337pjn.2.2020.03.01.19.39.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 19:39:37 -0800 (PST)
Message-ID: <5e5c7ff9.1c69fb81.663d.ac03@mx.google.com>
Date:   Sun, 01 Mar 2020 19:39:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.6-rc3-420-gead17be03762
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 100 boots: 2 failed,
 98 passed (v5.6-rc3-420-gead17be03762)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 100 boots: 2 failed, 98 passed (v5.6-rc3-420-gead1=
7be03762)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc3-420-gead17be03762/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc3-420-gead17be03762/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc3-420-gead17be03762
Git Commit: ead17be037620b3cbad30fc74407c9893d7eb42f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 54 unique boards, 12 SoC families, 21 builds out of 216

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
