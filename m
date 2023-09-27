Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902A67B00D7
	for <lists+linux-next@lfdr.de>; Wed, 27 Sep 2023 11:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjI0JrY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Sep 2023 05:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjI0JrW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Sep 2023 05:47:22 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7086AFC
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2023 02:47:21 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3ae2ec1a222so4840675b6e.2
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2023 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695808040; x=1696412840; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AH9qJLweAYW4+gpILYh02hACLi681/b60/eHBECqebU=;
        b=ZzXc/Fn0DZObAPVdtmvChaHLaOgKuzrMaH+65Ya35cWjOq0CBv2sI5gl6BF4MAVjlS
         yYGFB8Bmf+VHTM3fEKkgR5Zw6vC/f+TEd0do5hNUqRVA9UHMnov0+BHEBINBk1B+BjnV
         zedXthzx9lz8fda0eoKl35+G8+JUNJavbHwNyC/IYqtowlZzPVQ+lEA2LoPhbXnG/hLA
         QNPA7b6XxezYcpFyrEp3ejHdNXQMEpWneuYrrkTr8ubOTi1DJCQ9+QzZ7DJhv6CP8ksO
         UbVsn1KKdbaAFK/kmDQxAUs3BEtBMG0QyUp5+nN+j3yxjxguN0S+kBAzLV61VY93K6FZ
         P6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695808040; x=1696412840;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH9qJLweAYW4+gpILYh02hACLi681/b60/eHBECqebU=;
        b=B9phUKkTdf1kxLhszRar4rlrKR5qhEBscVM4tSpxt+AXZfimWG2ML9mzxNblTB2Rwd
         jAA690q13l2EQL6T/hqmBeEMVOMrHG6alUzIA4K2v8GXzR83V9P4Sg+Ejqh0vwyW3sUH
         2gNbjfcbV4w+UIeelNxNEXNF2aPujv/4w5w1u+AYK2JXqHh45DLo4uxhF/Z24GFnAMws
         40Ab1cbtyEA4EnIZbI7lai4KlB1BsNAJlvZQ9jldxzEDpJbAUhxrxAvusleP0OSJBJCA
         ZPnRoaD+YZmhsi/P1S/KjyPifFPL+pckKm1nxXmIyGKfULDBi/SunfPYezO8BK/+nmdh
         M7Jg==
X-Gm-Message-State: AOJu0YxPRJGaeUnYO0CBt/pOFDc9bLN/+3lG76V6pBYLR8KcXLqev1dF
        XhgV9wDeH8DrZIL1ww/7BE9RXa9UDntb/TLBPInoCA==
X-Google-Smtp-Source: AGHT+IH+NJicx1AuWEd/TCusGx3tJMT0qQSKyesnyPGdeFOqOMHKxQM5WwxDjos8moegZUhnfIZ4nQ==
X-Received: by 2002:a05:6358:9917:b0:133:428:35dc with SMTP id w23-20020a056358991700b00133042835dcmr2171007rwa.11.1695808040144;
        Wed, 27 Sep 2023 02:47:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fk1-20020a056a003a8100b00682868714fdsm11820564pfb.95.2023.09.27.02.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:47:19 -0700 (PDT)
Message-ID: <6513fa27.050a0220.99427.1655@mx.google.com>
Date:   Wed, 27 Sep 2023 02:47:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-286-g07ffb99534cc
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 55 runs,
 1 regressions (v6.6-rc3-286-g07ffb99534cc)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 55 runs, 1 regressions (v6.6-rc3-286-g07ffb995=
34cc)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc3-286-g07ffb99534cc/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc3-286-g07ffb99534cc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      07ffb99534cc6df026681df85ee321d91995a73e =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6513c97964cdaf18328a0a4d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-28=
6-g07ffb99534cc/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-28=
6-g07ffb99534cc/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513c97964cdaf18328a0a56
        failing since 22 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-27T06:19:19.251184  + set<8>[   28.773620] <LAVA_SIGNAL_ENDRUN =
0_dmesg 135173_1.5.2.4.1>
    2023-09-27T06:19:19.251613   +x
    2023-09-27T06:19:19.361946  / # #
    2023-09-27T06:19:20.528334  export SHELL=3D/bin/sh
    2023-09-27T06:19:20.534497  #
    2023-09-27T06:19:22.033657  / # export SHELL=3D/bin/sh. /lava-135173/en=
vironment
    2023-09-27T06:19:22.039700  =

    2023-09-27T06:19:24.764053  / # . /lava-135173/environment/lava-135173/=
bin/lava-test-runner /lava-135173/1
    2023-09-27T06:19:24.770892  =

    2023-09-27T06:19:24.787291  / # /lava-135173/bin/lava-test-runner /lava=
-135173/1 =

    ... (12 line(s) more)  =

 =20
