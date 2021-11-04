Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDDD444DF5
	for <lists+linux-next@lfdr.de>; Thu,  4 Nov 2021 05:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhKDEkQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Nov 2021 00:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhKDEkP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Nov 2021 00:40:15 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C632C061714
        for <linux-next@vger.kernel.org>; Wed,  3 Nov 2021 21:37:38 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id b13so5272626plg.2
        for <linux-next@vger.kernel.org>; Wed, 03 Nov 2021 21:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ybf2bm4VaVORiYfyAaT+2aSuF7It7Hi4G/Bup2pu7pE=;
        b=Q7BFY1dF+fFBL13FIMYMwhhawiIZRoSqBydtmRiALiEDGyFaX/xHdqh3eECY0XNc3I
         tr6hjGyA7Q34ZMOZCTIioxClPmQeCCDw4GKnLKb26aPvR+MtYNkH/bepE5v4DerOwlsY
         VwOhVjcV/w06a+vyyrQyDAEsiqRHoreiQlWgjCOaPgsZ0lz6FjEyj7invR7vTLln8jrs
         x9dPFFqp8pB3tyv0jebnePGP2rXplgi7FL0Q8qUSve/tav9HKO+fwN3xg1NHJrPDbqVD
         oOVmujvWOabMOVoiPBLApQ196ETWRrevtHJZhfmSFZH0EeYyltGpzwVd5tc3xEzNiwk+
         ftDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ybf2bm4VaVORiYfyAaT+2aSuF7It7Hi4G/Bup2pu7pE=;
        b=PktjY5p0vwvWjJt/+JG5f4D0rA1Tb0FazNDQmLZS5GM8piAA4vXVxztU+aQHXusu1Y
         Fi0EApgnW2HpICSAFSgLtSdbUqojXl8QDdb0gD5bMTg3tbPg5bkAfOQoKalIXpr7Zipd
         edCztnGwOd2bf83fk/q59/F+emLT3M69qcB9lFTo0LWN769Oxu8G1rX4+m8nqRKL9MN8
         IMP/00eggn1xybLAUQeAcd5B5xeCO10fxNBiAsYh6jsi3yonYVWWdvAvT9H6W+KGROv1
         9YIjFvsAtkNO/0IVWlZpLfRiHiZgJGikQVnS+1/0C/pjof35UhhjnzsC2YY3dkh2FbjZ
         yA/w==
X-Gm-Message-State: AOAM533VMgat1u/xOTEF1S+zoP18y69ZGgyrm/yIRAeRE2LsjkocmMvb
        zzYPa6fg9UwGgJRBLnMcTuCeo9r9Q9K6LuYE
X-Google-Smtp-Source: ABdhPJxnfBlACuSYb2NsMp3znsjy8IApraNKbCRqrhcU2OqfbTnSrHSvUh7pOhmrRPsWDz/ZlhDM3Q==
X-Received: by 2002:a17:90a:e7d0:: with SMTP id kb16mr19443218pjb.22.1636000658000;
        Wed, 03 Nov 2021 21:37:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z16sm3754453pfr.69.2021.11.03.21.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 21:37:37 -0700 (PDT)
Message-ID: <61836391.1c69fb81.85295.df67@mx.google.com>
Date:   Wed, 03 Nov 2021 21:37:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-7822-g1fca2beef9c6
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 508 runs,
 1 regressions (v5.15-7822-g1fca2beef9c6)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 508 runs, 1 regressions (v5.15-7822-g1fca2beef=
9c6)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-7822-g1fca2beef9c6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-7822-g1fca2beef9c6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1fca2beef9c61d865067fe776cf49ac492324b8b =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61833303c7cc1f3a973358dc

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-7822-=
g1fca2beef9c6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/ba=
seline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-7822-=
g1fca2beef9c6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/ba=
seline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
61833303c7cc1f3a9733591c
        failing since 1 day (last pass: v5.15-388-g75f097aa9969, first fail=
: v5.15-2033-g53a1f94bc3ad)

    2021-11-04T01:10:15.021415  /lava-4902418/1/../bin/lava-test-case<8>[  =
 12.078141] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>   =

 =20
