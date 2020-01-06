Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFFEE130CB4
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 05:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbgAFEL6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 23:11:58 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:39232 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbgAFEL5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Jan 2020 23:11:57 -0500
Received: by mail-wm1-f48.google.com with SMTP id 20so13955155wmj.4
        for <linux-next@vger.kernel.org>; Sun, 05 Jan 2020 20:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WzqrilD6F70vaFfkTdyh9HUf0daYW8nbQ9F6G61dayI=;
        b=hWqHHIFowt0ltOlKkjbPA9HZ5UvdFZscCpAHEap7I2GX0jv7Z0nNe3pGEox3mrVTGT
         LKRngwP5PlTlaBzBYEiNKXCAdHDjITKlH3doDRupaFIB06qubxGZzfT0y/dSlFP7MfQD
         lnNfkKRoSzSAXW4ht4witZ9Kxww6vBhxQZkqZGhuxkdVsPm4GUit8AWjodHNeLoorFxM
         WHevWwQpfuNaZj35t9MY1coDiN+1+sNgzvgGb2NzdaT7ZEFh8qfsEywxn4dv5TcpxhP6
         bOFOUeNqX9BJvIq6TT+SmFbU/4t4c+jH09evP0hJKzmY3BpqD65dOtUY8lvpcMByGNbw
         2QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WzqrilD6F70vaFfkTdyh9HUf0daYW8nbQ9F6G61dayI=;
        b=dFsXhND8l6bezZa0JngmU7eoT/TPZASHtECKpfljW/mjc6/9PFAIp0EekhwfJozJcm
         sUjqfYNMR6TK/0JUdZYKXyK0gcTshW+T9wrcRvu3mBrrgixW+R60srUHE3AuVpoSwcY1
         1zs38SKcipICO7U6oulshQdbS0a51ou90bD3GxLZWbZewkQxb3QckcVVOz2serOal9vy
         4kYO3FHvM3IseEiwhJzWvioNzgBs4KY+znfwtKay9BiYoo/ljUnygs9bT9OrHmoamGPL
         7DleiGTXNIb34DUr8cpVshLnJJPtpV1xhsjRTf984HqduzLW+Tantd+2+mHMIDDHlgAy
         KIAw==
X-Gm-Message-State: APjAAAVTr6uJ1hAWlErO63OHzhmBTXF0yl7wfwfmQxW3XruQW7HWQCqb
        i8HtE9Ne/rki1wxF8Fn4Pke/bi0K8SI=
X-Google-Smtp-Source: APXvYqyZc8e+tu+PIMnEhFSMKN5FbtuvyH5fyG56Wdthe9EPAVgtnOQgfFIq26tJHNzxN9KsinO+6A==
X-Received: by 2002:a1c:5945:: with SMTP id n66mr30148156wmb.98.1578283915689;
        Sun, 05 Jan 2020 20:11:55 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i16sm21913855wmb.36.2020.01.05.20.11.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 20:11:55 -0800 (PST)
Message-ID: <5e12b38b.1c69fb81.c27dc.ff14@mx.google.com>
Date:   Sun, 05 Jan 2020 20:11:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc4-312-gb224c14fb049
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 139 boots: 5 failed,
 133 passed with 1 untried/unknown (v5.5-rc4-312-gb224c14fb049)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 139 boots: 5 failed, 133 passed with 1 untried/unk=
nown (v5.5-rc4-312-gb224c14fb049)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc4-312-gb224c14fb049/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc4-312-gb224c14fb049/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc4-312-gb224c14fb049
Git Commit: b224c14fb04909aeeb6d17532d5e9cbd42c21544
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 58 unique boards, 13 SoC families, 22 builds out of 214

Boot Regressions Detected:

arm:

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: new failure (last pass: v5.5-rc2-432-g9eed7d73a=
938)

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.5-rc2-549-g9125728fc=
f86)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.5-rc2-549-g9125728fc=
f86)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-rc2-549-g9125728fc=
f86)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: v5.5-rc2-549-g9125728fcf8=
6)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxm-q200: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

---
For more info write to <info@kernelci.org>
