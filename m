Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEBC645D3F4
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 05:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236716AbhKYEjR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 23:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238736AbhKYEhQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 23:37:16 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EFBC06174A
        for <linux-next@vger.kernel.org>; Wed, 24 Nov 2021 20:34:06 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id m15so4059510pgu.11
        for <linux-next@vger.kernel.org>; Wed, 24 Nov 2021 20:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dFJMiIfTRYfiTRSjxQLTWihZORC2maRFaRV1q2uZz/c=;
        b=DM8CPbi7xxJkHuce3U8Z6lHDekPvzR9pdcHsI2ZlvawxlTFrn5Y0EYXx+uOEA1QtII
         jTxxeVKZpZYDXOx6HX+JLIhdkZzIywEg8MDxaZm7EzBRG23tJ8XyyqVThmG6sjoR51G/
         3d8sEIC21oITl3FJjGJf52QbPBZNHoDsRQtoRkJMdVlJGcE9HujFwF9Uhy35eQfVcssh
         0e8a4kysbCHa+KUjZJNnet5pB39aZryiDD/PDEF2DGAfATGV56kl/lImM3uTZZcaSPRv
         CYsLlkX02k3oXleGdS1RA61xZL3qHpMmQzmnIOm/Q2tib2eze7iDTQyULD4morG3zkak
         bhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dFJMiIfTRYfiTRSjxQLTWihZORC2maRFaRV1q2uZz/c=;
        b=umqTYLiN1+kS4Ly0WXkNMf8mg4QEF5owjpsed4KAI1u9WIfb++ORNFsb/J6pbc4T4H
         NF4a8qBsSTzO9iezQ/nrwtbS1Rl6GLhx9dPMC891TCh6obMPMaUt31Vi534A5TIT+yUj
         xfC7lre8+gMYgwYE1KoDJjxq7JUavyh4CEc6I7+tQKS3+ibtWdJnJ9mn8K0wSIOXNpUl
         vNb+bYxZy+I6xlSQRJlax3ILJdjuB1Y0koeqPdyPGW4HWYhzmxrAf+N+h4ZSHmdZrK3k
         mWVegOVp2c3NC/yIFgvUNKOxOYdaNg5Nh63Edh7u2KnQy7GsljVeFfc8BH2+RDy+622d
         jOgQ==
X-Gm-Message-State: AOAM531Q0FYDjztubQtXs4KsBhfsAzhxPsY9vWZoCp2avn+pbsO7185W
        ajrkQIKq5xLoYbVmE4Y6mjum4eV258qDjs0Hvz4=
X-Google-Smtp-Source: ABdhPJyK5/xNjIkogGVeUlA8dm7TS8Q/Q6q3Q4wa+raMyBc0Hrd9Mgi79lU/W7UWBJ1RDeLXM36J8g==
X-Received: by 2002:a05:6a00:cc4:b0:4a0:e97:fe97 with SMTP id b4-20020a056a000cc400b004a00e97fe97mr11851524pfv.74.1637814845570;
        Wed, 24 Nov 2021 20:34:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s14sm1343855pfk.73.2021.11.24.20.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 20:34:05 -0800 (PST)
Message-ID: <619f123d.1c69fb81.8336e.534d@mx.google.com>
Date:   Wed, 24 Nov 2021 20:34:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc2-344-g60d8b4768c0b3
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 466 runs,
 1 regressions (v5.16-rc2-344-g60d8b4768c0b3)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 466 runs, 1 regressions (v5.16-rc2-344-g60d8b4=
768c0b3)

Regressions Summary
-------------------

platform               | arch   | lab     | compiler | defconfig        | r=
egressions
-----------------------+--------+---------+----------+------------------+--=
----------
qemu_x86_64-uefi-mixed | x86_64 | lab-cip | gcc-10   | x86_64_defconfig | 1=
          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc2-344-g60d8b4768c0b3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc2-344-g60d8b4768c0b3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      60d8b4768c0b3f89481986fd0deb6402557b24a1 =



Test Regressions
---------------- =



platform               | arch   | lab     | compiler | defconfig        | r=
egressions
-----------------------+--------+---------+----------+------------------+--=
----------
qemu_x86_64-uefi-mixed | x86_64 | lab-cip | gcc-10   | x86_64_defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/619ed48ba3a34efdc8f2efac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-3=
44-g60d8b4768c0b3/x86_64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-3=
44-g60d8b4768c0b3/x86_64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619ed48ba3a34efdc8f2e=
fad
        new failure (last pass: v5.16-rc2-295-g43fdd6fe6943) =

 =20
