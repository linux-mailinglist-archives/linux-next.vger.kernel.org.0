Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6590D7D9A89
	for <lists+linux-next@lfdr.de>; Fri, 27 Oct 2023 15:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345998AbjJ0N4e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Oct 2023 09:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345996AbjJ0N4d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Oct 2023 09:56:33 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A0DCA
        for <linux-next@vger.kernel.org>; Fri, 27 Oct 2023 06:56:30 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6b5e6301a19so2070183b3a.0
        for <linux-next@vger.kernel.org>; Fri, 27 Oct 2023 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698414990; x=1699019790; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mBPCwThcXP0SooeePksEtiwr+ubOn9cKz43DvNT+158=;
        b=YjLGEYPsaV1iM/LLvg6yEw1phaGfNzP1FqaMVXHXo37/dPFMqtcmjPiaOW6nL/nraJ
         MvaVVTGlGAP7NzVeBhshGK4PiFVcOrF0ebSm4MC1hpxaaImEPK7/Q5/DGvBKGH3q8dQq
         4HC38igRCaEa8S2VrIqBUxl75WmCd1x3d2bTarQ3i/YWUoQ2CKGgqRZbLi7nwyLo5hJB
         2fvG0z8fprOBsQKBbTWdghp9VJfizlmB/Yjxh/j8tDG+xEHJQX1iUz+LL4HBYklXdTOS
         CNHuFn7nnAvJHXEHnVvudjUOsbO3wlRiv6uzH8BUt5LYHWySKmLnuY+cEMOKkRtOMNWX
         eprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698414990; x=1699019790;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBPCwThcXP0SooeePksEtiwr+ubOn9cKz43DvNT+158=;
        b=NJbYkAxyiGEK3T0bppar18rzdu70/Ik6NrYxj/jcEAbiviisAJRtiz9OJJmNNfJT9T
         S+sIWVIIoZ82XgPqPhWWlKJCY3kH8w8JWiAiI1RM0nd2SOfyGRIKunP72Ag0Ge5+0hE6
         hjib+FfZuX7rbMg3yjmF//DwjLRQMAos+70rGul0TvzZ6IGDdFz0s+xz7kaFHex7l8Rs
         24q75JusCR42zqUyOeYyGEn32Hf5LX5UxzQm7em+6K8WcLAaZ+qsZ3GwNMYgGFh1CYzq
         S3yLcVTu6z7t4NmVAaA95FBgMR6GvZH3OoddRIk757LfBUZJYF+M5SEAnWYwWuk23Lfj
         mieg==
X-Gm-Message-State: AOJu0Yy2b/xeGLncWHiPuIJ1Bd+LA+enNVki6Cg4662YvIB67UML1PUO
        rrnBE7e7Sf/ss/yZTtJ4KnrRTd11i3YitFXcRmE=
X-Google-Smtp-Source: AGHT+IEE39rOFjtivgBZ/lnDlURbCltu52okDlvytAkTPifIWKxejDX/f1seuaHus9Up6Cg4V8XWUA==
X-Received: by 2002:a05:6a00:2494:b0:6bd:f760:6a9d with SMTP id c20-20020a056a00249400b006bdf7606a9dmr3189155pfv.14.1698414989994;
        Fri, 27 Oct 2023 06:56:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f29-20020a056a000b1d00b006be0fb89ac3sm1406343pfu.30.2023.10.27.06.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 06:56:29 -0700 (PDT)
Message-ID: <653bc18d.050a0220.e9327.3d20@mx.google.com>
Date:   Fri, 27 Oct 2023 06:56:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231027
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 232 runs, 2 regressions (next-20231027)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 232 runs, 2 regressions (next-20231027)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe   | gcc-10   | defconfig+=
videodec           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231027/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231027
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      66f1e1ea3548378ff6387b1ce0b40955d54e86aa =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/653b8536d23ebaf016efcf0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231027/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231027/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653b8536d23ebaf016efc=
f0e
        new failure (last pass: next-20231026) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe   | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/653b7e5e05f81d86a0efcf3b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231027/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231027/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653b7e5e05f81d86a0efcf44
        new failure (last pass: next-20231013)

    2023-10-27T09:09:36.137913  <8>[   21.798009] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 440854_1.5.2.4.1>
    2023-10-27T09:09:36.242586  / # #
    2023-10-27T09:09:36.344067  export SHELL=3D/bin/sh
    2023-10-27T09:09:36.344581  #
    2023-10-27T09:09:36.445495  / # export SHELL=3D/bin/sh. /lava-440854/en=
vironment
    2023-10-27T09:09:36.445997  =

    2023-10-27T09:09:36.546932  / # . /lava-440854/environment/lava-440854/=
bin/lava-test-runner /lava-440854/1
    2023-10-27T09:09:36.547752  =

    2023-10-27T09:09:36.552405  / # /lava-440854/bin/lava-test-runner /lava=
-440854/1
    2023-10-27T09:09:36.600145  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =20
