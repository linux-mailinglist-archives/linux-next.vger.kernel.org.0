Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3983180F99
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 06:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgCKFON (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 01:14:13 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171]:45883 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgCKFOM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2020 01:14:12 -0400
Received: by mail-pf1-f171.google.com with SMTP id 2so597116pfg.12
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2020 22:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=92dhMrq4RadqmdTssB1FVKtqtRVsC4xC5jV3susNzmc=;
        b=qhjHBo9BXrRY331ODvuHV7djhQd01r6iocUSD+hmSVVc3YqMkqAXalNXRR7eVjJFY1
         Aez0NRyH4T22KFBf6BpSb3ZHmHvKC0Xi0kxJL4ks3mnj6ceBbs877WODiFYPX/DO3NX2
         tAHnbtbOvZEUyFKPDctws31oelXFYKF8ESHuYgswV/Dj+04DC4Bv9lNC9dhrEOAmLHVl
         jNQN2k+GdXOG0SC4MUh5CQGIZbnL1ZitSTjI4IYhEFGMi5bFZxR7xSkDZ55nV3HVH4zc
         UH8YVzSZSlEGHNcNoLdFM/2lh4ntDgyUgcL8OLVpQi/mNifbAzWwHRYbqKN5KY8He9I5
         9rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=92dhMrq4RadqmdTssB1FVKtqtRVsC4xC5jV3susNzmc=;
        b=fHSY7z4NSqtb/9zRC9ERK14EBykU4uIOjwDJLgp8/yk2Bm8LXPKqdeDfW4wi7/OB9r
         KRnpW2wowwQo5oZnlLzb9hsyFRB9Nhj176B85XLaNY0i9WMRKEjPUxR+bAZSgpmhFBx7
         VFGtSHKNGwr+VNBEe6uXfMXoHUZ1OD1ngVKRSoJo9u+uZAjOUdEIz9KgIEVM0xJCS7R4
         PNVIJJEQlT2RdIOwRCdKTFrKWBA5xtiBk1leCfeFWaXRl5zwK1jlfIeeFEjCJBs3atAH
         4D/tPwy+qjS58c3jbcSvoa9s+98BU3yddzGUm892Og/OeQkwFzNhC1UUDtIqxnlhHTq2
         yAYA==
X-Gm-Message-State: ANhLgQ31CAwNXOMiayIFClUWeFaVQng4QAEGzmZlsH+W7o6fbKuiYJcF
        mB0EKpyjd4gw3HnU15zmuryutXZJttY=
X-Google-Smtp-Source: ADFU+vvTmbrjuQSWZR+3ZKfgO9FlnA4FXgqjT0AAudpDdZ+UNuGJ1zNbOmW2bz4L8hfDUp/UbrpBvA==
X-Received: by 2002:a63:cb4a:: with SMTP id m10mr353556pgi.101.1583903651344;
        Tue, 10 Mar 2020 22:14:11 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k1sm45898443pgt.70.2020.03.10.22.14.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 22:14:10 -0700 (PDT)
Message-ID: <5e6873a2.1c69fb81.3f268.d17c@mx.google.com>
Date:   Tue, 10 Mar 2020 22:14:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc5-213-g683f454b6b26
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 201 boots: 3 failed,
 191 passed with 4 offline, 3 untried/unknown (v5.6-rc5-213-g683f454b6b26)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 201 boots: 3 failed, 191 passed with 4 offline, 3 =
untried/unknown (v5.6-rc5-213-g683f454b6b26)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc5-213-g683f454b6b26/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc5-213-g683f454b6b26/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc5-213-g683f454b6b26
Git Commit: 683f454b6b2603237feaa043f7535b933310ced3
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 97 unique boards, 23 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-158-g8=
3e1475cd019)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.6-rc5-158-g83e1475cd=
019)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc5-158-g83e1475c=
d019)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-158-g8=
3e1475cd019)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.6-rc5-158-g83e1475cd=
019)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-158-g8=
3e1475cd019)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
