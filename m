Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6045B4531F2
	for <lists+linux-next@lfdr.de>; Tue, 16 Nov 2021 13:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhKPMTB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Nov 2021 07:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235913AbhKPMSI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Nov 2021 07:18:08 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B6EC061224
        for <linux-next@vger.kernel.org>; Tue, 16 Nov 2021 04:11:06 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id u11so17259035plf.3
        for <linux-next@vger.kernel.org>; Tue, 16 Nov 2021 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=e3UVpdwucaETy33MvfOVkzFxuaHNa3DinkF2ID0yf9s=;
        b=X1171C8Wo0ccIMh3PAla+uVeSIhZylhwXiqA7ibQtca1eXnyJXPWk4tY2FSRyxrNZp
         e4p9Lrxoga8usrlDuEXKON9d/JcdI1OS9+v2FYuhYkr0QSyMTk2ASmVqaqmLeUvWL4wn
         e112zZJyTQx6mpgdbTVTQwgEk+dw0joc/r7eUpkeCsiylUzPVyCxFn6RKH9H6W7uY26Z
         +dTSpLOqFGT99j7jbvxnjz9ZkUoQrX9FOrUnYsOAiOffn2+1lMPGHabRZM0swqB4N13Y
         ZmkVUfhttdnyS5XGw/jjby/4wZ7CkBBdnfQzioYeNQQumS6ajYxUkwIaVsmnngDLwdTJ
         HXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=e3UVpdwucaETy33MvfOVkzFxuaHNa3DinkF2ID0yf9s=;
        b=wFPMMSz4I2JGZpsKyMgzI5BDO6a+NgdayDcKVr1NAN3RArfk8bDKh1vM++70B+TuT0
         7FVqHk4H0VqnlIs2e+XL938SrqhZwHKb9RgU2JHBYp94NLwoqlwDclWG4oe0PSLwZBoF
         FlnwRN7KxW92RnQi/DnPSIJs/SYUypTAnpjTuPEHt+SZHiU8Y1CDMOF8H9wAv16/uNsq
         a0OLVG0/rDbr3hQmzRB4hYqmtWHWMTPAbExgBb+hQi6icTa7RklPCRmfNIlRfaGwWhlM
         WlXMqRsHZmlC6vjlFAOfTz1vK7Q6WcP2m7QN5AwgBq3HAPTQxvbM1Y/+BGAXau/chSTL
         cfWA==
X-Gm-Message-State: AOAM532dzg/HXdeXgcpAelhei19qItNy60aRs5uQi6cPaZCID7o3pUsE
        fQ6ZhK9qtjICKp73Vx22a3Lf1+h+lb3OTipb
X-Google-Smtp-Source: ABdhPJziC7/SO3Z6YBGfyK1iiqTvHiw+d5K0UbFsN6Zb0EPPhSPaElH94sKQl7I8/3RrMqsKxcvLRQ==
X-Received: by 2002:a17:90b:350c:: with SMTP id ls12mr8047395pjb.197.1637064665062;
        Tue, 16 Nov 2021 04:11:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z7sm7824647pfe.77.2021.11.16.04.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 04:11:04 -0800 (PST)
Message-ID: <61939fd8.1c69fb81.9db87.58c7@mx.google.com>
Date:   Tue, 16 Nov 2021 04:11:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211116
X-Kernelci-Report-Type: test
Subject: next/master baseline: 271 runs, 1 regressions (next-20211116)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 271 runs, 1 regressions (next-20211116)

Regressions Summary
-------------------

platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211116/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211116
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a2f3bb245883ba791e46be1f8415186dae346458 =



Test Regressions
---------------- =



platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/619366070f02e2cbd13358de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211116/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211116/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619366070f02e2cbd1335=
8df
        failing since 19 days (last pass: next-20211026, first fail: next-2=
0211027) =

 =20
