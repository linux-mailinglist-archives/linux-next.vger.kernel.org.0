Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08003CFB7E
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 15:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfJHNmv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Oct 2019 09:42:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36515 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfJHNmv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Oct 2019 09:42:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id m18so3209037wmc.1
        for <linux-next@vger.kernel.org>; Tue, 08 Oct 2019 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OyA231unJci4fd9DK5N6XJBMUVBQ/6Hd0HHh5OGX8n8=;
        b=Db+OtXVY/oNLctxtmI1K08Bwzg/4fGJhHG5rI7s0B1+wAD21gH3hrDxmtbxMiZSeuC
         rgTnoA37+ARitK5qVCswotqqAPnTPXQq//X4YXj8ZyczVXv27/vU+Wt1nbnpL/sWe6BW
         xwJejfX2yfkCIc+cDj7yhMMkt+CmQs85gV1f40I+G9328uNiXD/DCIGVjYqSzJIOlDlJ
         UrwfqSyMdx30e300Oj153KxeaU7Euf0I+7pWFMch3s1kMgJvrpLJggyQpUiiSCwYMsuS
         D4IEyYHJ3J7nyxGp0YeKfj0RluLJn++AJopysOcEtQBzf1EOCVAZsfiQqbtocdlC2imF
         HaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OyA231unJci4fd9DK5N6XJBMUVBQ/6Hd0HHh5OGX8n8=;
        b=N4rZkQw030tNwt/xr1D60a8MtwT0x/yYvpu3Vw2jEgdDusHRv+hPdnYrFSOP/VGbKV
         d+YkP8iLtVoctPeP+mRaBlSbl7UegTUCxPJ0S6yx7yHDvES9Tehjbo5OGe77Tw0bJWnT
         fqFSugZ1fmyJdg1ZLetLH3ii4rGBpXs6KSswxQpmF+4CNuqJ/Us5+Cav+smggyrTdksN
         08Ai8gui8TW+trQ58JYk/GALSPZEswYZi+alcukF//bQUt4R2HqWlkaYeW47MR2UEiDJ
         PHMXmQtP3rLqhmyDevEN4Okh/kBhpp2HLrCIM8t8pbcKwqkOCbsv9DSUmyxi7nUA3kML
         +lmg==
X-Gm-Message-State: APjAAAVjH6lcarUPmNzcOTUteFi/tFzj9rza+cbcLHET+mT+Zk67SMPH
        tnKXo5fINa3louGocg7HMx68uiumw/ezMQ==
X-Google-Smtp-Source: APXvYqyYWcHkB3HvWqHxLu7jXtcL0D717NncO/yHoCd9nqMpRcMVm5EuCmFy4VQup1OyvtceNrfOMw==
X-Received: by 2002:a1c:f718:: with SMTP id v24mr3677301wmh.82.1570542169144;
        Tue, 08 Oct 2019 06:42:49 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x16sm16463485wrl.32.2019.10.08.06.42.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 06:42:48 -0700 (PDT)
Message-ID: <5d9c9258.1c69fb81.e323f.924b@mx.google.com>
Date:   Tue, 08 Oct 2019 06:42:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc2-299-gb6f03173ae19
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 193 boots: 9 failed,
 182 passed with 2 untried/unknown (v5.4-rc2-299-gb6f03173ae19)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 193 boots: 9 failed, 182 passed with 2 untried/unk=
nown (v5.4-rc2-299-gb6f03173ae19)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc2-299-gb6f03173ae19/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc2-299-gb6f03173ae19/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc2-299-gb6f03173ae19
Git Commit: b6f03173ae19a33c2ead73ffc68f6d20de4d199a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 55 unique boards, 18 SoC families, 24 builds out of 214

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.4-rc1-298-gb76690ad767a)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.4-rc1-298-gb76690ad7=
67a)

    defconfig+kselftest:
        gcc-8:
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: v5.4-rc1-298-gb76690ad7=
67a)

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig+kselftest:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

---
For more info write to <info@kernelci.org>
