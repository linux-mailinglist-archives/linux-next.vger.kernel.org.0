Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A5E42FC2E
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 21:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238365AbhJOTey (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 15:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235221AbhJOTey (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 15:34:54 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EE6C061570
        for <linux-next@vger.kernel.org>; Fri, 15 Oct 2021 12:32:47 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id na16-20020a17090b4c1000b0019f5bb661f9so8076767pjb.0
        for <linux-next@vger.kernel.org>; Fri, 15 Oct 2021 12:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9IFeY4yX3UmQ+wLXYX8jMjDql6OjKr5Q0mAoNViUgMM=;
        b=GSl9UTqazXNX6ZJEOU6LQr1xXAGWW9RuPRlnwRS9XEqa1N8vzYcY/DYKYlQenyejzf
         kmxkkUNs22bIcwE/573dVWbpniJQsWV9eyjVmZXMisEtQ3dyIyQP05ByQtn3+3VaSqIn
         Vu3U2A+RNE9bxW5DLpqJhBXMc+7W8mRaeL7EemyhtI+qtGdN6SxLsMreDMtHTYQH/YWJ
         iOjUftOgI4NmY1I90QMa1q1nRpJ6TuK7DWuEL9Exri0Yt3C+9AM0hhV1FH7RuK/WNtEs
         IdLHdIRf1L01p4KVswFWMj/2wwf/TNQ2kKoC+i8YaygPMwv69Bx2yN+5mjJzKly/wMsn
         rsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9IFeY4yX3UmQ+wLXYX8jMjDql6OjKr5Q0mAoNViUgMM=;
        b=RT1+CUrDsn5xqlr51DkSNnrIVc4OIASC5YcZR0NfbHUbiGa9SFY6xwGzgg3d8PqShL
         +TN0fIG0Qvwnv0ljbJhVEgBPBrYtvjteShjm5zwFmhCmZ2LrJd0RP3dfcQ7+nwq+JC8r
         rBUaB3ZEOG9I4xAxW5gCEtUQHtnHJspAuAW39B9IVsEhFPceai/T6noLsI1i0pEn77lT
         DARtnCfdkm5KASynE1t7kB9rOztqTgMUW5QW7hURm3RxBi0Pi4ynESxRnw0/woe8UlpJ
         9blYF7NgFsmxCRFbhzIoacEGqi/k/vt2N3XbwVVyzo2KUIA7A3hMM5Eyp39gyNhEpkcZ
         nLSg==
X-Gm-Message-State: AOAM533cGPyxGzGiqN5awIIfbe1EAqDW4Wq4JusDkQ2bsIKMp4zGjIM7
        3gJ7RqwcntWWG1h199xNSlEvo6luSCI4aA==
X-Google-Smtp-Source: ABdhPJzhH29DfERrrtEOIOE9U+9pBZjKur6JaLmlZYzu4XOq7QdE8APtWOxwQnkNnP1y2KdQ6/wdYw==
X-Received: by 2002:a17:90a:6b4d:: with SMTP id x13mr29927069pjl.208.1634326366813;
        Fri, 15 Oct 2021 12:32:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w19sm12431861pjy.9.2021.10.15.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 12:32:46 -0700 (PDT)
Message-ID: <6169d75e.1c69fb81.9c159.6525@mx.google.com>
Date:   Fri, 15 Oct 2021 12:32:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-rc5-341-g89908780460d
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 80 runs,
 1 regressions (v5.15-rc5-341-g89908780460d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 80 runs, 1 regressions (v5.15-rc5-341-g8990878=
0460d)

Regressions Summary
-------------------

platform      | arch | lab     | compiler | defconfig           | regressio=
ns
--------------+------+---------+----------+---------------------+----------=
--
imx6q-sabresd | arm  | lab-nxp | gcc-8    | imx_v6_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc5-341-g89908780460d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc5-341-g89908780460d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      89908780460d1af6bcf13382adf7f83a133a7131 =



Test Regressions
---------------- =



platform      | arch | lab     | compiler | defconfig           | regressio=
ns
--------------+------+---------+----------+---------------------+----------=
--
imx6q-sabresd | arm  | lab-nxp | gcc-8    | imx_v6_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/6169a0fcb924628f853358ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-3=
41-g89908780460d/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-3=
41-g89908780460d/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6169a0fcb924628f85335=
8ed
        failing since 354 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =20
