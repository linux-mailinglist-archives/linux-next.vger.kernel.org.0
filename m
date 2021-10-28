Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D9A43E8A0
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 20:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhJ1SwK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 14:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhJ1SwK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 14:52:10 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4588AC061570
        for <linux-next@vger.kernel.org>; Thu, 28 Oct 2021 11:49:43 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id c4so7279206pgv.11
        for <linux-next@vger.kernel.org>; Thu, 28 Oct 2021 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Zfu+HtENEEAusvDFXbJ3h2BKoG5E7LS3LJIm0IeEqKw=;
        b=oQsKpX4KNT+jQYaKdhQlVaJoC2QKCOBVh8mByzBpYqrDXYouGOGcUwDOyg7RGh3TSt
         4hJ8vqRwaF7cVtcQ/sJZ/+vUVpIsp9fGRf6yfkigwWGz1+Hw9rFudUD19w7UsGmdTEbl
         BPMrNNrqIo91nDVW3h4BeZy6o5YWRcsvmyixH5AgcRj904qtLFLMxpXQyZ0dExyyKux6
         Rteqq82ODHx6ZFd+2tHUzR/Lclq2lKo0v/x1MLhUQ43A0mbBy5HcxvA3yJEJysjX5sU+
         ruIIl8d0Fr5b7ZZF5RW6x0Ke+K5U3Iu/Vq15h56QXJsmwU/uiYGSs5lRbn0JdcWYgv8u
         S1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Zfu+HtENEEAusvDFXbJ3h2BKoG5E7LS3LJIm0IeEqKw=;
        b=xSKC9ZzixruNtnVRe96Nu2MirJNHqyY6ioWfFCg79c99ee6NYRrl8A3dfwvdfTgxr+
         Km9K0S6FaGQv7cehPsY96QLygbCPRAYDZ/ru6xt922fA+0jgBGXM18KHW4pBkSIqtpj7
         fUO85Vwlah3A2Y2/jsWso2RGgWIWP5saw/pK6eSTAMzI90TIv/KagQBmcKsziVEm+zmb
         VNuk3uSlQ4OwiSLKDc3pU8gqVS9FrUhCDbsXRqxiMyJAARy5K/XXS5abf4ju0ft16RBQ
         RA9GkdhXMr1lvO5NxgN7iMHZP+mwbqa9JAF2F+LmkIfb/lc49gYHFju2BJOeibqPcrAX
         ksKQ==
X-Gm-Message-State: AOAM532TfMevxyKg3hUdN6XDTCCrkaSmNR3IkjkEoBsdtU5E00oSc6FR
        2rQzGQtJ8SVlPQeLD08rFU03uV/wR1mtTdZfm3o=
X-Google-Smtp-Source: ABdhPJwxoe3QPYh8RH/q4dli0I1joHcGlU65M6DhOFgB8i1d4eFu9ueQ/UQgqmTmRaVGiU3iMbIH2Q==
X-Received: by 2002:a05:6a00:23c8:b0:47c:37d5:430 with SMTP id g8-20020a056a0023c800b0047c37d50430mr6085813pfc.72.1635446982681;
        Thu, 28 Oct 2021 11:49:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c85sm4579766pfc.146.2021.10.28.11.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:49:42 -0700 (PDT)
Message-ID: <617af0c6.1c69fb81.4e6e7.d36e@mx.google.com>
Date:   Thu, 28 Oct 2021 11:49:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211028
X-Kernelci-Report-Type: test
Subject: next/master baseline: 298 runs, 1 regressions (next-20211028)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 298 runs, 1 regressions (next-20211028)

Regressions Summary
-------------------

platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211028/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211028
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      503f375baa99edff894eb1a534d2ac0b4f799573 =



Test Regressions
---------------- =



platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/617ab93d2bcec0d86133592b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211023125221+73dae=
b3d507f-1~exp1~20211023125744.17)
  Plain log:   https://storage.kernelci.org//next/master/next-20211028/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211028/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/617ab93e2bcec0d861335=
92c
        failing since 1 day (last pass: next-20211026, first fail: next-202=
11027) =

 =20
