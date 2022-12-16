Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B324364E60E
	for <lists+linux-next@lfdr.de>; Fri, 16 Dec 2022 03:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiLPC43 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Dec 2022 21:56:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiLPC4Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Dec 2022 21:56:25 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7952EF1B
        for <linux-next@vger.kernel.org>; Thu, 15 Dec 2022 18:56:21 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d82so880558pfd.11
        for <linux-next@vger.kernel.org>; Thu, 15 Dec 2022 18:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WLVAdR9rFgpc5BB2vN9cFQofErXxJcx56TlxmQAboBM=;
        b=eEfBtl9dzxWt4BuP5jsssNzIkNa1VtNHpTSlKVezWdMcyxC9VmOju3PMQ5NER/f3ik
         cIyhVDr31XCQCgn7ggc2m8vFZQJP8kTz3mIGALloRnlf1g8LoI+IXpRE/dmmcJ+FrodF
         C1brR1UIcIbGX58zS2fHQaTsDwb9uJP0A1NezeXXyprE4Rt6vQpP9k78fSCrEmYCv44e
         fj1I9S9/LLDungfPTj1E2oyaAA8P/j46pIVVSCpC3xp5LHJVLag6xvVTX0N7J8wNyz0m
         tttvXkZ844if5YFXjx4/+iAjQr1UgNvP/J1FSUMHh7L49jo0WdaiaDa+fbvL+7pr01uL
         fwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLVAdR9rFgpc5BB2vN9cFQofErXxJcx56TlxmQAboBM=;
        b=XNr0PWjsRhYy5t5oilfeLdoYUpAaGV0qmhtoxryLXHX+qur4Md3zz1vd+yyqbOFm4p
         3jS+YLzJE6lXRVIIzj56X+Q7Vzj6KOzsPxktPTOy7dmgZe35k2wk4ElZLs6y8XRfR3oT
         gm2VAGXQhrvRGPLTYFl7JFLOzDgymqS/oDA3x6HBNCtMg7OL6gSICnDachw2Xw70UxyX
         TvuzLalYEmQCI1MPn0Mi8YSKUnYbxjmYbtHPsuFwuKqftDmRNzqXOWwzbXc5Mwt23K2V
         wMZDt8OvZD0Dv+OTOO3vtoL0HwKUyclOuolBM7BUuCMGKPd/FvOAylfpCE6NKWBq7dyI
         KgwA==
X-Gm-Message-State: AFqh2kqc0IEAsx+ookAYEPNKJQyjzMdt2fH2m0Nmm5s1AkPSn7xf1Fai
        IZdnfa/CXIM9UpRbOQ8oAmIF9+fYpylTnG2aMSMw+Q==
X-Google-Smtp-Source: AMrXdXvs9qhX/uEfG0JbjrNtqu9Rae3L1mYhDXY2ZNCCGzC/4a9g8mt9IasABNBHRBU60GV4UD8wwA==
X-Received: by 2002:a62:7b82:0:b0:57d:9b8e:92a7 with SMTP id w124-20020a627b82000000b0057d9b8e92a7mr6853255pfc.7.1671159379356;
        Thu, 15 Dec 2022 18:56:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g26-20020aa796ba000000b0057709fce782sm320517pfk.54.2022.12.15.18.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 18:56:18 -0800 (PST)
Message-ID: <639bde52.a70a0220.ab3be.0d07@mx.google.com>
Date:   Thu, 15 Dec 2022 18:56:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.1-11705-g1f2422ba386d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 38 runs,
 1 regressions (v6.1-11705-g1f2422ba386d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 38 runs, 1 regressions (v6.1-11705-g1f2422ba38=
6d)

Regressions Summary
-------------------

platform                     | arch | lab          | compiler | defconfig  =
        | regressions
-----------------------------+------+--------------+----------+------------=
--------+------------
ox820-clouden...lug-series-3 | arm  | lab-baylibre | gcc-10   | oxnas_v6_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-11705-g1f2422ba386d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-11705-g1f2422ba386d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1f2422ba386d24aeb56e269b605409811bfcc679 =



Test Regressions
---------------- =



platform                     | arch | lab          | compiler | defconfig  =
        | regressions
-----------------------------+------+--------------+----------+------------=
--------+------------
ox820-clouden...lug-series-3 | arm  | lab-baylibre | gcc-10   | oxnas_v6_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/639ba832f3ffe19bb02abcfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-11705-=
g1f2422ba386d/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-11705-=
g1f2422ba386d/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639ba832f3ffe19bb02ab=
cff
        failing since 64 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =20
