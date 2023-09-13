Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331F879E3DE
	for <lists+linux-next@lfdr.de>; Wed, 13 Sep 2023 11:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239284AbjIMJhH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Sep 2023 05:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239027AbjIMJhH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Sep 2023 05:37:07 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6049B1726
        for <linux-next@vger.kernel.org>; Wed, 13 Sep 2023 02:37:03 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c3887039d4so37053895ad.1
        for <linux-next@vger.kernel.org>; Wed, 13 Sep 2023 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694597822; x=1695202622; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hRkM+l5jbFH13S++8GwChH9h/EdNj8WyqePrLRAHr+Q=;
        b=2msov1DL6xfY6e94b1bskgK9Mkc+jw9x+C6ezuytS0iMlFI4w7Z45OsPE1giRSxHoP
         vZ0ogtodEoUO+yXQGmVeyW+AorJICyz/5wcXMVVMgqPnZdUIir/5BYcSIuByoHoiPh9X
         +9REptrQkZgvp9bMi1BleDi54Ll385GApT5W2FV9aACfOpneIMsEmkHAEjbnIZYJj28k
         vN4ykOKBY0d3u74wnqSD29CHQyMPNtIkjaLn3fwWZgrwtvzy9h9JzO8GJ4M4IUcsDA2u
         QGEdaEa3i56/gO8FGUCwfckaraq0hfm/j0K0HnFKwjf/zd+sS3AIlP62ouOKzgNvWOrY
         mcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694597822; x=1695202622;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRkM+l5jbFH13S++8GwChH9h/EdNj8WyqePrLRAHr+Q=;
        b=lvb4+uDxe0ZKQcFyg7kmQ+hhL18Lbm7qwBftKuaeSnh2P/fNMlXwwFUBKD6SfbMqKq
         S8eLN3+/NdXKb628nXAw632KvVbL4apBWmWmH+IlzxTAtykyCtPPAGEQm0Nqpgyt8czm
         mpNJISZfy4YXMSRf10K9Yp4kzdBWPHs+ikXkZp+fFtg6RSmpzVBUN3QduO4VIvhg3WZD
         Z212G+jNUUAndYdcfFqKb1tezcS5lrLVPb4zuEVUsE2cQFPCBNV492Ll7jikFp/0xKQ0
         cwG6YFp2LRfwgHa9joUt6pgdPlEIk0z+yrmysrlfa69qiguyVCDP0fePHsQNzwrK+9Kd
         3BwA==
X-Gm-Message-State: AOJu0Ywo/xVWmNW1pYDQ5fR8ZWQWIURU08tjp6os69zxWwj7uFLDAE7V
        N6XLYP5YatsYNHwYIH5HWKoQY+fJSmQ50uGwaI0=
X-Google-Smtp-Source: AGHT+IEcGvQgq2v5rL0navr1pRMuyYS9W+sFU34atzB0hVaiHslNWNZ22UsqgD+gBs22qQ75jyWKAg==
X-Received: by 2002:a17:902:c949:b0:1c3:ea60:73e2 with SMTP id i9-20020a170902c94900b001c3ea6073e2mr1367889pla.27.1694597822303;
        Wed, 13 Sep 2023 02:37:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jk22-20020a170903331600b001bf52834696sm9986446plb.207.2023.09.13.02.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 02:37:01 -0700 (PDT)
Message-ID: <650182bd.170a0220.1d982.bfe8@mx.google.com>
Date:   Wed, 13 Sep 2023 02:37:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc1-220-g17eb7af5bc73
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 54 runs,
 1 regressions (v6.6-rc1-220-g17eb7af5bc73)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 54 runs, 1 regressions (v6.6-rc1-220-g17eb7af5=
bc73)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc1-220-g17eb7af5bc73/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc1-220-g17eb7af5bc73
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      17eb7af5bc736455ed1f204a72d9eef7655fae2d =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/650151ae9394885c978a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc1-22=
0-g17eb7af5bc73/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc1-22=
0-g17eb7af5bc73/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650151ae9394885c978a0a4b
        failing since 8 days (last pass: v6.5-5353-gb22935905f9c, first fai=
l: v6.5-12059-g16fdf769151b)

    2023-09-13T06:07:20.412932  + set<8>[   28.870770] <LAVA_SIGNAL_ENDRUN =
0_dmesg 104221_1.5.2.4.1>
    2023-09-13T06:07:20.413333   +x
    2023-09-13T06:07:20.522403  / # #
    2023-09-13T06:07:21.688243  export SHELL=3D/bin/sh
    2023-09-13T06:07:21.694532  #
    2023-09-13T06:07:23.193676  / # export SHELL=3D/bin/sh. /lava-104221/en=
vironment
    2023-09-13T06:07:23.199795  =

    2023-09-13T06:07:25.922804  / # . /lava-104221/environment/lava-104221/=
bin/lava-test-runner /lava-104221/1
    2023-09-13T06:07:25.929655  =

    2023-09-13T06:07:25.932731  / # /lava-104221/bin/lava-test-runner /lava=
-104221/1 =

    ... (13 line(s) more)  =

 =20
