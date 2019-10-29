Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98B48E81C9
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 08:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbfJ2HG0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 03:06:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40780 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbfJ2HG0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 03:06:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id o28so12364519wro.7
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3o/aBme2Iu6U8+ZUXu4241ZISb59BA+YZUsDwrNKQQI=;
        b=SOy+Rioqw2SMpLotMlXBepz7ZcAPptTq7sX3sdNEthJ1u1lPYm/PVnY9CPL2GdQOIR
         N1lD2Cca6nF3gOPAOb5PWUSxrEcYpyxYbq+vx84cPBLK02HmgC7r2pJXkufj8aX6AISe
         VPz6g+tjguho4ZFvAb7zSXK+P79FzmbXrMXDjxJJWqa458aQyGuMlSc1qZifOeAesYB+
         LSBn9EfNgwG+QFaLexPV2nWcb4RFhql5wYunFQqsD+Ogm/egIsjn6oINZi4mHWt9j5VE
         gU6TfzVzBkL0AS3a3goWOecHZ5z3tW0COzMwUxmjZUr0FxAAqYZ/NqViIgR+ux8Y2Pne
         Meng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3o/aBme2Iu6U8+ZUXu4241ZISb59BA+YZUsDwrNKQQI=;
        b=e/XhPtzBwxkeXti5nJK+TR1SicXQ5Cm43rfwGlPbqwnv+A7IoB0lql+e4Y+zQNJVWX
         8cVeyeX0nZpLXcUzbWZJ20be6/cj955/JCwXAt6Rtuc9qFzr9dfmXvR/sHJwIfUxWUtT
         danlUxrRdraB/FycrYBlWqnJ+Cd6o2AJanSrz3qrlpXuDDwvpzTCru7cGYEYca3DEuYM
         sLTBrL8KPVGZtqvqLOpl75fTKFn7t7nxXdKw4oTYzHNyLpa9DAv7+Mc721pCtFLwkBnt
         5BfHF/ddl6vkIVfY8jTYkRQqM8/9pOH62XweMBWdN6E8zxhsObP8VxaHq5ZQTDl4wNcu
         FXUg==
X-Gm-Message-State: APjAAAX5YDNg1/4ySIZoa2BYrjt90Tw62X0QjysJ+ZLIwq5SElr7gF95
        YmDqKmAamNalVgaq+LfRqP7zJ6+RDi3hqQ==
X-Google-Smtp-Source: APXvYqye9StGA5/P/zgBqAy71yVuLWW5oFVAtb/hTPeKcuS5TO0Fr4P8SGCAxNQ2lG/wrbKOtITCFQ==
X-Received: by 2002:a5d:614e:: with SMTP id y14mr19152849wrt.329.1572332784443;
        Tue, 29 Oct 2019 00:06:24 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x21sm2310257wmj.42.2019.10.29.00.06.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 00:06:23 -0700 (PDT)
Message-ID: <5db7e4ef.1c69fb81.c4169.b814@mx.google.com>
Date:   Tue, 29 Oct 2019 00:06:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.4-rc5-262-g1ee65270bd96
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 251 boots: 2 failed,
 242 passed with 7 offline (v5.4-rc5-262-g1ee65270bd96)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 251 boots: 2 failed, 242 passed with 7 offline (v5=
.4-rc5-262-g1ee65270bd96)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc5-262-g1ee65270bd96/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc5-262-g1ee65270bd96/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc5-262-g1ee65270bd96
Git Commit: 1ee65270bd965f2ae100854006f359ca43de76a1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 26 SoC families, 27 builds out of 215

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab

Offline Platforms:

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
