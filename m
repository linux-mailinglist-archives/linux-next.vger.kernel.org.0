Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D0F4670EA
	for <lists+linux-next@lfdr.de>; Fri,  3 Dec 2021 04:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350923AbhLCDzj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Dec 2021 22:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344703AbhLCDzj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Dec 2021 22:55:39 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32ADFC06174A
        for <linux-next@vger.kernel.org>; Thu,  2 Dec 2021 19:52:16 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id iq11so1331966pjb.3
        for <linux-next@vger.kernel.org>; Thu, 02 Dec 2021 19:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1d2hl/8NMgqDDnZOi9ZD+z+SVAgXIvdP+g8orbpTRn4=;
        b=7e4o2o6pwo/bQbmXk7ATRIjZ8K5Ny5XE4P1o6w7p618zAue+Eb+h9y0EZKVknFIMbz
         jgA4CaEgltK+hBdejVrP2iwg0NGJcDK+dTRdN2sg1GbgiQvhrdZjoXsxnPLv0p2O34y1
         j91jacxy7VQyQN96WsW7JNH81eLkcpS9ZPot2Y0XglNPijS0lSNP5eeg095NpauLfzCE
         N4I/X/asG0bdCAo9iAN1qMTDbURcRg5cayggw5kYvMDWbWYFbHPAD04iM5W0vHT49pp4
         66iKssczr/GPwH0JMLj/werfzlSDh5NhSKDQ0QLQJNEkQ4PEyN4x8EUGqXOZCqWAX1DM
         ch/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1d2hl/8NMgqDDnZOi9ZD+z+SVAgXIvdP+g8orbpTRn4=;
        b=zEsem+9bbJ9pBQcEXexRfB9jcFqPRl7QWc5PcH7WJ6McRlf1U7cd/TlFxJcCs/GYqT
         PVziXNuHVPL5Svt9jzS9uVfAcckVqVRAL6ZAx6GNq4P0qfxxp8dy7fvbnMZSBAWzwvE6
         +Neb5qoEPE51vA3uOV6EKPWbjuhHa1Q8+3zGUSjr35ijt+F/J/PpHFF2eGJwJwxIhgwW
         iPWkRWHmpzen7nxR/YWk7UUjeRfbSxIaFrTPwM/QuYky2tdfYqkZjojSRw6InvQlHXkx
         UPTaP647UbsWetvKDEjAFvxGxT+BatYXyf30ZbwJUIHZdW0sDbZxui9NDHUvIVUTFMLx
         5xEg==
X-Gm-Message-State: AOAM5312HaL51UKEHkNt3jzHUhqOIDgexS0MpTOJfO2coAVUcP1DIhnm
        fDNu90rapEbvUr0o7tsQim0BJ0mw6wBpl54W
X-Google-Smtp-Source: ABdhPJz4Foti9c/xuELIbmnNEgvRCbjbEsNqyWfTnfvhSzj9mkHACy0pGItJmEX3RHIftC/TmVEePA==
X-Received: by 2002:a17:902:6b47:b0:142:82e1:6c92 with SMTP id g7-20020a1709026b4700b0014282e16c92mr19767058plt.84.1638503535561;
        Thu, 02 Dec 2021 19:52:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d17sm519997pfj.124.2021.12.02.19.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 19:52:15 -0800 (PST)
Message-ID: <61a9946f.1c69fb81.fcb54.287a@mx.google.com>
Date:   Thu, 02 Dec 2021 19:52:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-rc3-406-g807a2a7da6bd7
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 273 runs,
 1 regressions (v5.16-rc3-406-g807a2a7da6bd7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 273 runs, 1 regressions (v5.16-rc3-406-g807a2a=
7da6bd7)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...BIG=
_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc3-406-g807a2a7da6bd7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc3-406-g807a2a7da6bd7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      807a2a7da6bd7da417036b144aa18c09ab0dac1b =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...BIG=
_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a96294b1de3243201a94a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-4=
06-g807a2a7da6bd7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-4=
06-g807a2a7da6bd7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a96294b1de3243201a9=
4a2
        new failure (last pass: v5.16-rc3-332-gcdb70004c3588) =

 =20
