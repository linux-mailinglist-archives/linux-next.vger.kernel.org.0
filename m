Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA83168C65
	for <lists+linux-next@lfdr.de>; Sat, 22 Feb 2020 05:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgBVEyQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Feb 2020 23:54:16 -0500
Received: from mail-pf1-f175.google.com ([209.85.210.175]:33980 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbgBVEyQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Feb 2020 23:54:16 -0500
Received: by mail-pf1-f175.google.com with SMTP id i6so2368790pfc.1
        for <linux-next@vger.kernel.org>; Fri, 21 Feb 2020 20:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=peIaqhskgco/YuoJldPvqUnsIJmCjfWDrJCq8W2HjEs=;
        b=AebYQEZh6eYYbAPXuabTVXPVGdrIlx5GZwFkiW2zmpzadko7eNrZzoWvW5Hh5Jqdhh
         ewGbFVfizGOsIXtfQn/XZldTGVJ/58xE02+/U+CkOmzQsoYuiKVtOXpqoVYDijXcnMgF
         qaK5O1D+UzKNiNzgOw7MznYFL/Uo/J5MUq/HVl5XsyQswFq1B0QtG9dOxSU3oSMFnRJS
         NklosgYki9PYZmCG/dYNWxjDhPmQHCmTtAAV37tQf9y+SwdHbnKpaOi3nISoRyTTN4Un
         U4eij7hd7EDO/7tB7d7fJSDuxmia/AQTNd+8v4oEUYTIrEdH7zZW7jbAw1cSfSrKeKKe
         jCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=peIaqhskgco/YuoJldPvqUnsIJmCjfWDrJCq8W2HjEs=;
        b=DCfaFHMzBrq6ptohBErqIl/rej07D6isZZMqEXcNCFImo0yhQsZwdK4drgXxjnVahI
         7y94rn/zl5GHKuEPfQqdbw01hAOZUSwYlWvbUZYqZT3Ou5wVX6gxAcaz8OCHECz5UTz2
         APtywcidIk11hFX6tD7l1nwPgpk/xKwUmRysAfHDJxkoAKlvS05O0vww0CEZQHFAxlg5
         H7m6iooMR+wroLyDJD8FxgaGaUBK0z1671HQTy3cW1GVwYUcvUYa9gyvKlPCZBZDo37E
         SDZMAY+sDqQ4Ho7xO1c4VuG8XRVUUQtG+Aq4OGLAbxF0myK6zxYusR2qS19vEA9BRl9D
         01IA==
X-Gm-Message-State: APjAAAXHHoD+f69rPghwDiz3e87sz9j9Rfd3fPBkiNo8BKTXXwBLofPo
        Mz+2cIf1Faec3h7CtE2JQuu/SQUwn0k=
X-Google-Smtp-Source: APXvYqwI3zyv/xDO1PQCntk8ARpeXeIXb1lSj6GWEAOFVjRVb58ycbOZj6TOg3Um+FKVYQ4fqSrntg==
X-Received: by 2002:a63:584:: with SMTP id 126mr42381629pgf.447.1582347255278;
        Fri, 21 Feb 2020 20:54:15 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y10sm4529123pfq.110.2020.02.21.20.54.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 20:54:14 -0800 (PST)
Message-ID: <5e50b3f6.1c69fb81.2f4cd.ee55@mx.google.com>
Date:   Fri, 21 Feb 2020 20:54:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc2-429-g943e218edd5a
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 113 boots: 4 failed,
 109 passed (v5.6-rc2-429-g943e218edd5a)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 113 boots: 4 failed, 109 passed (v5.6-rc2-429-g943=
e218edd5a)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc2-429-g943e218edd5a/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc2-429-g943e218edd5a/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc2-429-g943e218edd5a
Git Commit: 943e218edd5a2125dc1bc50877b6447e4e15a021
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 63 unique boards, 16 SoC families, 19 builds out of 139

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-rc2-356-g476afa873=
6ca)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: v5.6-rc2-356-g476afa8736c=
a)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.6-rc2-356-g476afa873=
6ca)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

---
For more info write to <info@kernelci.org>
