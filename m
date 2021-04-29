Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69D836E4BE
	for <lists+linux-next@lfdr.de>; Thu, 29 Apr 2021 08:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhD2GPx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Apr 2021 02:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhD2GPx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Apr 2021 02:15:53 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F03C06138B
        for <linux-next@vger.kernel.org>; Wed, 28 Apr 2021 23:15:07 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id e2so29873194plh.8
        for <linux-next@vger.kernel.org>; Wed, 28 Apr 2021 23:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Dn4vgBqpx4GQfbbwPp8HHsjab3wV/m3Vx5hyxFgd/6o=;
        b=l0ivBsRfbPSgbJViUvyasx7+NdKE6X78n5JdLnZT9L5qfqwoo+d5N8jSWtXP1tvh8j
         dJrMgXMbWhksh1XTruiCHliyA73gO9h/LT8zgMzybhqV5f9pWaqu6DromUd4/hdiBfO9
         U5Hy9Xnjr5QkaZHwDRUvChs6cWUJcDXtS6Ou7PzAG1q8p2nVQoR1wJh9vGKHsYgIfPQG
         et7nqMtqtFhggbAxVKlkJhYrzRPi8yb/4s4hklQDgr5GkDJKVXZi+u/4EQ3AoFjq43nS
         WmXMTA1qwq3UrgdwhYttRRqTZM+FfWRqQqs99anxbRs/clStSSSZ4dDVasmxgbpvbyMx
         wATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Dn4vgBqpx4GQfbbwPp8HHsjab3wV/m3Vx5hyxFgd/6o=;
        b=JQx2SJUTi0giF4ope9EUkwW2yCHtTBwIgev4nBqyB7KnJ+Hz+/unXGKUbBoWLO6K42
         Hkxx4siacp6ycxWEjppNw5pYsN9mCywBwJvMlOg0RFEJ31uYOwhP9xBh4pMqJ0Y0Jgh/
         SJzLG1kIk2Y28b/6vauePVJJaYA65VL8tjDQ0nHiAwsopboTJnA8psYSraDTgS5acCrd
         Rq9XqDxnMV0oFtzOEGDYaY8hORYcKmLNhzA82X4gGbzpoNxdvuVyvTUNJFJ8cIFH79mT
         TYVyTuiAs9L6sQ12s1uPytZOzPWpMh4XgREvMzMjJuKgA3o/zT6L2kS+HbPe2KS1Ndb5
         Z7Yw==
X-Gm-Message-State: AOAM530vB90ndTjw6coGGDKgw1cjzuRNnlXBQ7OJQe4Q2hfckEqxMm+y
        cyee91NdewIe6SQGqpInRluU9xJrpigIP5Ke
X-Google-Smtp-Source: ABdhPJx35JjjPAYWChJ7Vq9wcsWcY38wLWWjmkbNnqxX538vgKTeza/D+uy+GIMJBP5fj1ABkxy6jw==
X-Received: by 2002:a17:902:6544:b029:ea:f94e:9d4e with SMTP id d4-20020a1709026544b02900eaf94e9d4emr33921608pln.16.1619676906602;
        Wed, 28 Apr 2021 23:15:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g8sm1424537pfo.85.2021.04.28.23.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 23:15:06 -0700 (PDT)
Message-ID: <608a4eea.1c69fb81.69b94.56b5@mx.google.com>
Date:   Wed, 28 Apr 2021 23:15:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-7972-g8db459ff530f
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 171 runs,
 2 regressions (v5.12-7972-g8db459ff530f)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 171 runs, 2 regressions (v5.12-7972-g8db459ff5=
30f)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-7972-g8db459ff530f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-7972-g8db459ff530f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8db459ff530fcf44c2fb8ed6e501dc0d7dad0fe1 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 2          =


  Details:     https://kernelci.org/test/plan/id/608a1aabf6aad349529b779d

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-7972-=
g8db459ff530f/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-7972-=
g8db459ff530f/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608a1aabf6aad34=
9529b77a3
        failing since 1 day (last pass: v5.12-121-g07bcd85dd158c, first fai=
l: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-04-29 02:31:52.880000+00:00  kern  :alert : Mem abort in[   23.159=
500] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-29 02:31:52.881000+00:00  fo:
    2021-04-29 02:31:52.882000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608a1aabf6aad34=
9529b77a4
        failing since 1 day (last pass: v5.12-121-g07bcd85dd158c, first fai=
l: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-04-29 02:31:52.886000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-29 02:31:52.886000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-29 02:31:52.887000+00:00  kern  :alert : Data abort info:
    2021-04-29 02:31:52.887000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-29 02:31:52.922000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-29 02:31:52.923000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a12a[   23.199133] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-29 02:31:52.924000+00:00  000   =

 =20
