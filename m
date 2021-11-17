Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FE145436D
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 10:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234917AbhKQJTw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 04:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbhKQJTw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 04:19:52 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4939BC061570
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 01:16:54 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id m15so1685689pgu.11
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 01:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5BPE+D5Vtk8HqhXKwMlu3VGQC2x6A4UQnQfdA8DR05E=;
        b=b04LTy7wLhOwz7yAuBjnGvJkcS2s+tem4h6AZiyUe3cGy/fmgPEpkiJwiYXqEnhYFr
         XZl6vlPf9Nbha7sxNYCXEZ/I79osWiH0ksm/NfYE55CMKjb0Ph0WChZNQawdJA6/1u+Y
         gV1oh0FBmI5kxw+3p3EGcdvlJEtwzu7+CeIkTlL8Hg+ySg6HX+DIsh48KS1zEoHV7QuS
         X3W3npjByO4/ANBFYM/g3qKGhyyNDEJdhn3ZS44C7po26auOZI0ilscofc38ceYTzWuq
         7NULR2CCv/zhJAgxYRQ+elKwDm89/cHUiRCGN2mpj0Avc/cjlegLu+vMRyZuy1T0M5gs
         1c1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5BPE+D5Vtk8HqhXKwMlu3VGQC2x6A4UQnQfdA8DR05E=;
        b=G688hWEk8PoN1zRRaAu8+9Ay8bnTwDdu14f6xsWdHypCYQyXY1MIXzWw7weyCd1xBB
         PG+17TLbih6eeBrGJvJU4JkB+k3DHKfoOvM6GZg9XiP/150cfsptzkNb/ip2gjp7V+KB
         b62tEr+kY1I/zok3coyaIIvHonVAQBTcrcvoo1ZGHaRvAcwrr9A6/v+4jjlYwk3aObjQ
         haVvnDJ3ptYYXfGtAs1vkzM5Azu1wpSlfKAAt9VCc2wDaT5NCLqjOGiA8EW/9c7cI+KE
         qzt7dkpA9cNEZB35LCyHcWfuN5pgzsM7nL2s3VBNkPwhHeV2/JlMzC5d1N0ahXwSbn3J
         ZynQ==
X-Gm-Message-State: AOAM530fofVRsX9d7nblp3uHRu8mt1BIJtybCgWZGk9BcLrcPTGqOi9z
        QuDJ4PNuUAC7BpOwG1iOeUgb5s9K1YT5BqTr
X-Google-Smtp-Source: ABdhPJz5UQefxRotUh336MwCowoDV7kiQUuOsgfpsvULq+2I6lIxxBZKaEM4VAuWVE2IP8Ggtyy8Ew==
X-Received: by 2002:a05:6a00:ad0:b0:4a3:1056:e2ae with SMTP id c16-20020a056a000ad000b004a31056e2aemr1887990pfl.2.1637140613669;
        Wed, 17 Nov 2021 01:16:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j15sm21775344pfh.35.2021.11.17.01.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 01:16:53 -0800 (PST)
Message-ID: <6194c885.1c69fb81.a6bd0.e2e3@mx.google.com>
Date:   Wed, 17 Nov 2021 01:16:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211117
X-Kernelci-Report-Type: test
Subject: next/master baseline: 678 runs, 2 regressions (next-20211117)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 678 runs, 2 regressions (next-20211117)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig          | re=
gressions
----------------+-------+--------------+----------+--------------------+---=
---------
beagle-xm       | arm   | lab-baylibre | clang-13 | multi_v7_defconfig | 1 =
         =

meson-gxbb-p200 | arm64 | lab-baylibre | gcc-10   | defconfig+crypto   | 1 =
         =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211117/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211117
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fd96a4057bd015d194a4b87e7c149fc2fef3c166 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig          | re=
gressions
----------------+-------+--------------+----------+--------------------+---=
---------
beagle-xm       | arm   | lab-baylibre | clang-13 | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/619493af24a8a8edef3358e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211117/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211117/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619493af24a8a8edef335=
8e9
        failing since 20 days (last pass: next-20211026, first fail: next-2=
0211027) =

 =



platform        | arch  | lab          | compiler | defconfig          | re=
gressions
----------------+-------+--------------+----------+--------------------+---=
---------
meson-gxbb-p200 | arm64 | lab-baylibre | gcc-10   | defconfig+crypto   | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6194a8857c331dcb553358de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211117/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211117/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6194a8857c331dcb55335=
8df
        new failure (last pass: next-20211115) =

 =20
