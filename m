Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6040E13896B
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 03:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732487AbgAMCJE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jan 2020 21:09:04 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55360 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbgAMCJE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jan 2020 21:09:04 -0500
Received: by mail-wm1-f66.google.com with SMTP id q9so7921640wmj.5
        for <linux-next@vger.kernel.org>; Sun, 12 Jan 2020 18:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Wi+j/lN1pbtwmf0T5dKavGxUoAnG5w95TAFnZ/RVq2E=;
        b=i0J7asN3lvTWMrvn/tkkPi3A8v4TSdBFGVcYyfK2igdodhmnNThTxICFRurxhLbQQR
         /JpszVGaCu1DLjwu13hfAo0fX9JlkfJpQVWXxo36hCd9UXCMUg9Xhdyz/to9CPTM3yar
         DnnQOlj+66N9EdpEXUHQm75gPkf2gV8ca/aYfjzqlhi2E9jjYr+oR/ecLPKNWCWn87lJ
         RcDM7CtgEtupY3Av5566a/bAsJtcIjB4/pYX87r8WYjnZ9UIFJ3vTkjA31413iXs1eSt
         PnKdUyHvNCGrssNM4YNLEsubgcM2rhLgRCvZex3a0t/ly6CsdzfT6n0DCLEPN5gJy/5N
         pE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Wi+j/lN1pbtwmf0T5dKavGxUoAnG5w95TAFnZ/RVq2E=;
        b=FEVJWdjFgTKf5YgFEZnirobhwANRgkziRfzU4gJwgSfy47AN4Q59lcLXsBgRuL1gk+
         jA02USPQWi8b3PGD+isl+0z8ahomkq9kwNO1KlPvM4QfyMUB3f60ZlSQJegv6CYKAGlQ
         6CCmIsEH4jP52bc5ld2P4xgiEjvsYaek8AofP7mOHPv+E4gl9D4pE7G6wPe+MNbA0kl1
         orRaQkzPKPa82PHyficPMGmVpHG3bgk3KAJJQwAjmmQwYNXY4uIP29Q01hUMZB3bfjoN
         +1xSZJGS68siBI3zg+sQK5lY08qGB5inHm5Rm5cY9wxYEz1O3dpwowrsEZ2x92fZkr+Y
         +tmA==
X-Gm-Message-State: APjAAAXepZIfb2DUq0ikzY8ddwGsyL3ttnbB0qTsrCOm391b+JO8+NjO
        fABJ9jO3Ct8bolf0PakF8jUnvWXXo86AtQ==
X-Google-Smtp-Source: APXvYqxwqMkh58NThkbQOlL9NFPOG92xtUsHpoO2USfQr3nuoEdID7zePVJzOs2BoRPq7x+ecy2LdQ==
X-Received: by 2002:a1c:cc06:: with SMTP id h6mr16168077wmb.118.1578881342088;
        Sun, 12 Jan 2020 18:09:02 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d16sm13711064wrg.27.2020.01.12.18.09.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 18:09:01 -0800 (PST)
Message-ID: <5e1bd13d.1c69fb81.d5d61.7b1b@mx.google.com>
Date:   Sun, 12 Jan 2020 18:09:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc5-558-gd3abf62b4f01
Subject: next/pending-fixes boot: 188 boots: 4 failed,
 181 passed with 3 untried/unknown (v5.5-rc5-558-gd3abf62b4f01)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 188 boots: 4 failed, 181 passed with 3 untried/unk=
nown (v5.5-rc5-558-gd3abf62b4f01)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc5-558-gd3abf62b4f01/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc5-558-gd3abf62b4f01/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc5-558-gd3abf62b4f01
Git Commit: d3abf62b4f01fe9b1340eaec81b165c1165a4266
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 64 unique boards, 17 SoC families, 25 builds out of 214

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: v5.5-rc5-445-gecb24723e=
078)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

---
For more info write to <info@kernelci.org>
