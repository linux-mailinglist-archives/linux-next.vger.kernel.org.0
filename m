Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67CA7175B19
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 14:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgCBNCe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 08:02:34 -0500
Received: from mail-pg1-f176.google.com ([209.85.215.176]:45231 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgCBNCe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2020 08:02:34 -0500
Received: by mail-pg1-f176.google.com with SMTP id m15so5395377pgv.12
        for <linux-next@vger.kernel.org>; Mon, 02 Mar 2020 05:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3fzS79x24F9nMUwvFYYffFaxct1pmvwgvPvOh4TewMo=;
        b=m7InFATyz3AvINiwxSOrkXJOnpUG7SywZROGa79pDsKyAHdvUdEr621TLfy9JWqAOf
         S5ZRiNj/Q+4PGNQwzlvzqpMwFAM+Vq5C9Y/1LI00JDiMEzg5h/PjC253k5XupBDz1lcf
         TMMhaTYzefjNwsyxnFEI5rFqHpcrjgCW0NfL4A2gZN753RdJS2WIOBsBCCBFHBegmDsi
         iwk8sO8Fklvt4OxDdmfmay4Qq513fe0/hTkf5VXfMIwGJbSPrdYgiJ6AQa6KmiqPaled
         /mOcfQw7XQbHqPoIWz1z7MVM8gb7aB09ahIbHH36FJ2xzFKrrvZjGIjx+vcyBLlRy5eu
         N9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3fzS79x24F9nMUwvFYYffFaxct1pmvwgvPvOh4TewMo=;
        b=gMa4VsY3puU50nFDzB9+OIKLhpxm05nWk4Tcq/68wkjRZVZv642MlheV+y4Q+5XyYs
         kGItSV0R/nfmWhza/lcaHAN8WfgI1Bl0SzW1FKDNNrgpsYVYmVKfe1nQfnnJnAp2WPyP
         Hhabb/2CXXMQU0JKKbFFtTzsqSY767dvyGe/gSylHAn1MnRlH2DEhv6FZzb6Jr+4LQyR
         1g+gj5jdLgDjt+o97hjnkBMaG/3YTuLJVj/b0SAIvmCM/xj4QJ6RlPXXihWbe0zCAO4h
         5teM3nhFVyWf0x6w92l6t7nTefWRS6PW/0RMDw0pw2C1DOZIIhcCgWCHvOn0t4Ir2kkf
         VW9Q==
X-Gm-Message-State: APjAAAV3InwtI1fqNFLp/Nj3NdJIi5gx/M89cFRWjjpRCXhAGVzZo0vK
        FvKcsV87BnnUjWMTqIdf8NWjTaSnDpc=
X-Google-Smtp-Source: APXvYqxneg5XTWEgaT6bP4QliiJh3taGsZ61x+oLwyp67HNkcuiJtO5+PkuZKHfvb9zmnTfG6fkwNQ==
X-Received: by 2002:a63:a062:: with SMTP id u34mr19905009pgn.286.1583154152661;
        Mon, 02 Mar 2020 05:02:32 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t7sm4014690pjy.1.2020.03.02.05.02.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 05:02:31 -0800 (PST)
Message-ID: <5e5d03e7.1c69fb81.82d6c.a613@mx.google.com>
Date:   Mon, 02 Mar 2020 05:02:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200302
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
Subject: next/master boot: 99 boots: 7 failed,
 91 passed with 1 conflict (next-20200302)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 99 boots: 7 failed, 91 passed with 1 conflict (next-20200=
302)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200302/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200302/

Tree: next
Branch: master
Git Describe: next-20200302
Git Commit: b56557c8e5210c25b008da636ef804b228967aa6
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 56 unique boards, 12 SoC families, 20 builds out of 329

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 13 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200228)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200228)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-puma-haikou: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        meson-gxl-s905x-libretech-cc:
            lab-baylibre: PASS (gcc-8)
            lab-clabbe: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
