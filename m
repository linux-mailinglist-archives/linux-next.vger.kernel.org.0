Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C7A1724E0
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 18:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgB0RSw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 12:18:52 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46861 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbgB0RSw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 12:18:52 -0500
Received: by mail-pf1-f195.google.com with SMTP id o24so124860pfp.13
        for <linux-next@vger.kernel.org>; Thu, 27 Feb 2020 09:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kvH4XVhhPYVTmIyacHLw0H2K9bo8dgjOnfjNpM59qXg=;
        b=kzxaaL4hVXdqE5LgdTq+mES13txAegdaGRWi6evlNy+zWIO5vzNgOT40KLH3qb/lP2
         sGAWm811NBbycXOW+bV/H7w+CSEylETuDPvNWUfgRvEghfERTt9TkzAHp0Quo3MFgnNL
         mCxJK3KtZL6G1zJsxilFip4FJSB6Mjcn9ZaEbrrtPdspYHyqnea4ElUKssLhG1aRAEWI
         X2T9fYV0Z/+LYDB7a73a4q+YqwX2GEGOljzTQVxzCo1uEN05YxBE1xwZSNNAcBYqohJN
         Qlhk09Agg2RE4U/pFsl5AceAObxDgypmcw9FereOzOdHJdRC4lXZHI+K45AJb4ZQLYAu
         inxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kvH4XVhhPYVTmIyacHLw0H2K9bo8dgjOnfjNpM59qXg=;
        b=pVWk61KdrFjBy0M0S2sDovPG2sZp24qFwQaFaWgIN7Y2EcsV/l6A4xGFlz/ooIa5eB
         /klI3xyCObliV1fxvugvg3LeHFk8To+eLOl4k1OHZu3/NnzA2+yVAELeFZhpywzMU9SV
         qwAtNsDuUByjXjGRfx9UPozC9WT/of2szznvBo7+z/8QaqWa7DZTFL11fhOiXg8Dv+Ba
         vYMZQ1/2mdoFvCTlzHXmqaJYrXnWExiwehb2yPZtAUA0aOfXn0oXE0xubYTuy7bLm/P+
         iRAJIdXHC6LHw+W34jkhniJMakqG0TDwVqZBjVq0DZ1nlmZ9iF9rRPEoQ2SM0BICGUkm
         0Afg==
X-Gm-Message-State: APjAAAURD4zIC0+7SxBewboor5LBxchNWNVT/+l3Sfu+ffKbbnrrWraf
        Up7YU9MENkKWq1gW+ZQvUhZ35tH4DPc=
X-Google-Smtp-Source: APXvYqydiOzbUYmRILi14ZnNL6BrUUiksuT/TgjtWrMFM9FXmV12xYb6S45afnJWPthbH4F5uYd18w==
X-Received: by 2002:a63:e509:: with SMTP id r9mr422155pgh.274.1582823930551;
        Thu, 27 Feb 2020 09:18:50 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 64sm7768530pfd.48.2020.02.27.09.18.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 09:18:49 -0800 (PST)
Message-ID: <5e57f9f9.1c69fb81.f933e.457c@mx.google.com>
Date:   Thu, 27 Feb 2020 09:18:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc3-250-gfaf01b3dbee3
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 153 boots: 3 failed,
 149 passed with 1 conflict (v5.6-rc3-250-gfaf01b3dbee3)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 153 boots: 3 failed, 149 passed with 1 conflict (v=
5.6-rc3-250-gfaf01b3dbee3)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc3-250-gfaf01b3dbee3/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc3-250-gfaf01b3dbee3/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc3-250-gfaf01b3dbee3
Git Commit: faf01b3dbee3526006a7a2b6bb8c0a06c296b453
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 63 unique boards, 16 SoC families, 25 builds out of 216

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: v5.6-rc3-209-g2bda1ca06=
ff4)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        meson-gxl-s905x-libretech-cc:
            lab-clabbe: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
