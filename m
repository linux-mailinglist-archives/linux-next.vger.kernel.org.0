Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBECC7F0B6E
	for <lists+linux-next@lfdr.de>; Mon, 20 Nov 2023 05:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbjKTEeq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Nov 2023 23:34:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjKTEep (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Nov 2023 23:34:45 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEB6DE
        for <linux-next@vger.kernel.org>; Sun, 19 Nov 2023 20:34:41 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5b9a456798eso2208985a12.3
        for <linux-next@vger.kernel.org>; Sun, 19 Nov 2023 20:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700454880; x=1701059680; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YI/SFbnIHM1Alr5253xwz1dVFI9UR036e9hfX6MZx90=;
        b=ZnkCBvqINCPYw2EEMYwo1qOmQH9T+6jiTNS7RyoGx9FDpkzblg5ljQ38BG4zIwsyfM
         4Xi4GhZyRELxoXTKAkrlt1A2enrfgIFlu+qthbiN1hLfwbXkEnwrjZ1QJqov2xDOgadw
         mcivknSJtA0VAB58WX+CccfgmgJn+nKy6xyWsbraadx374WonHUwMwN6ghhMW1Z56mxb
         Zb1QzLI99OpkLwVwuKnPnbjSeV8/jkuQxLnHE4oXeBJ2W8nYNrQdYLL5ddqLKVR694rz
         fYbr8MRlYp432rO8cYFGFIApLvrs+RA/dJZ6+WkgCmqeXql2uevm+P/Zgcbt5SCFGpYu
         aiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700454880; x=1701059680;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YI/SFbnIHM1Alr5253xwz1dVFI9UR036e9hfX6MZx90=;
        b=pte74rmU3ucmZgSmxUOhJSLNmm0GD6yULBO/Ndgrgbmmxw9JZgEfmscVFF5zX44Ux1
         GseinZOj7cXtqF+mB7AE/54dCziuCV7D9OOhtIyc7xEMRaY71V+C2Ejsw/eWeSv/ypCQ
         XptMlIQgv2eGwQZJ2yWcNKIGNZwvLhMOx7Q/6PPTRHXHwDpdZ8fwWlNJVIhJigntPEhL
         g2TKbVvS+OlgWE+25BympgzHfD6oCo4hi+e+FfcA5YD0xoAcBwPBqypGkZSv3iG4guPz
         2V71gFkhWJ3Qot9feSign1kKHp02FOoQLH/JI9mjp4bOvlUu7yxfJqHfETaIvy3xa2U2
         g6+g==
X-Gm-Message-State: AOJu0YyIifXX9IaUl9nHTvc5KXqWCm8VWsQIPJSeEQ7FJYA6imF5bPYo
        0SV4vBPcPmDQ44yUXZRYDYezp7b7prahydnAsxs=
X-Google-Smtp-Source: AGHT+IHpe/AbhKF0cQfnOqSQVI5JoUtazpQo+mu0yNpTuJVne+h+9MulvoyHqmzORUOY99ICF19UIw==
X-Received: by 2002:a05:6a21:61c:b0:186:bd68:facc with SMTP id ll28-20020a056a21061c00b00186bd68faccmr3627465pzb.28.1700454880026;
        Sun, 19 Nov 2023 20:34:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ip4-20020a17090b314400b00280976d4ce3sm6494307pjb.37.2023.11.19.20.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:34:39 -0800 (PST)
Message-ID: <655ae1df.170a0220.c31af.1073@mx.google.com>
Date:   Sun, 19 Nov 2023 20:34:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc2-118-g64e6d94bfb47
Subject: next/pending-fixes baseline: 108 runs,
 2 regressions (v6.7-rc2-118-g64e6d94bfb47)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 108 runs, 2 regressions (v6.7-rc2-118-g64e6d94=
bfb47)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc2-118-g64e6d94bfb47/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc2-118-g64e6d94bfb47
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      64e6d94bfb47ed0732ad06aedf8ec6af5dd2ab84 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/655ab13f8804a32d917e4b03

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-11=
8-g64e6d94bfb47/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a=
20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-11=
8-g64e6d94bfb47/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a=
20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655ab13f8804a32d917e4b0c
        failing since 5 days (last pass: v6.4-rc7-260-g7124fb0a8216, first =
fail: v6.7-rc1-127-gaea4a488542f)

    2023-11-20T01:07:01.779237  / # #
    2023-11-20T01:07:01.881210  export SHELL=3D/bin/sh
    2023-11-20T01:07:01.881937  #
    2023-11-20T01:07:01.983148  / # export SHELL=3D/bin/sh. /lava-3840454/e=
nvironment
    2023-11-20T01:07:01.983569  =

    2023-11-20T01:07:02.084326  / # . /lava-3840454/environment/lava-384045=
4/bin/lava-test-runner /lava-3840454/1
    2023-11-20T01:07:02.085759  =

    2023-11-20T01:07:02.104491  / # /lava-3840454/bin/lava-test-runner /lav=
a-3840454/1
    2023-11-20T01:07:02.224176  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-20T01:07:02.224588  + cd /lava-3840454/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/655ab0fd93531204b57e4a79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-11=
8-g64e6d94bfb47/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20=
-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-11=
8-g64e6d94bfb47/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20=
-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655ab0fd93531204b57e4a82
        failing since 5 days (last pass: v6.4-rc7-260-g7124fb0a8216, first =
fail: v6.7-rc1-127-gaea4a488542f)

    2023-11-20T01:05:42.047477  + set +x[   20.928258] <LAVA_SIGNAL_ENDRUN =
0_dmesg 444628_1.5.2.4.1>
    2023-11-20T01:05:42.047789  =

    2023-11-20T01:05:42.155916  / # #
    2023-11-20T01:05:42.257732  export SHELL=3D/bin/sh
    2023-11-20T01:05:42.258369  #
    2023-11-20T01:05:42.359364  / # export SHELL=3D/bin/sh. /lava-444628/en=
vironment
    2023-11-20T01:05:42.359896  =

    2023-11-20T01:05:42.460894  / # . /lava-444628/environment/lava-444628/=
bin/lava-test-runner /lava-444628/1
    2023-11-20T01:05:42.461722  =

    2023-11-20T01:05:42.468223  / # /lava-444628/bin/lava-test-runner /lava=
-444628/1 =

    ... (12 line(s) more)  =

 =20
