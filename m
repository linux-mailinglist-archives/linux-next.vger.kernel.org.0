Return-Path: <linux-next+bounces-443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E346816FFE
	for <lists+linux-next@lfdr.de>; Mon, 18 Dec 2023 14:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B20D1C241F4
	for <lists+linux-next@lfdr.de>; Mon, 18 Dec 2023 13:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3222D3787D;
	Mon, 18 Dec 2023 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lxPeHijv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333437870
	for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d04c097e34so22179225ad.0
        for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 05:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702904948; x=1703509748; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KouvjNYIEmXJ6CTLr2xqoHVdslJ2/MoQE98zLTtXRRU=;
        b=lxPeHijvpSxbVCnkOoyS+hV7fUgpNyGDMrL146yBeeHs/fHS3WIg7CC768CcK2ZqO7
         whYegTmCYH31ZSZzVfyjBJxnUtBGt/AlerYPtdHqz58S1/PwLcwtak2XvBpGhJEzmMu/
         Jhi56ngiVFxvoOh9dL0sd3a/2p2WEu/Fqa42IVoHsdZ43AJEVz8HRRtSVh+N3wwNY7Lr
         mVRlGW4kZe1L3huuRbg8jUE7PkcYqhRyfnYusZQY1xtPTPzjxmCaU9EHkIHr4Mw7+A86
         HEarqUYFB0CdXt8xsz2p0rP4vax0g3OhhdjT5+MFTHVszzcU2eSOZy6SghedZIz15xnn
         0jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702904948; x=1703509748;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KouvjNYIEmXJ6CTLr2xqoHVdslJ2/MoQE98zLTtXRRU=;
        b=dG6DnBPqW0XqhEL2I6v5yAfSc9VC3y9AjxuTRxXnvVd4yGcOcIcjkwG3pkOxHxpdYu
         vLGxtnGdOacgkitK1SdjjuWqVC7XD4hX124pzhwMMKxbKd1xTFojTdKtRYgnEZ26dJ4Q
         MiVu8MhTG51oWSqKzzxYFWacL77f4Xphx/TY26GHkw/ww2IP/AaWTXhCGwtW7RWSZJK2
         NNwbHfrslFB8l0JbDMp/Hy1+vHL08CS5dT3/95nnRxD+ckNLoCsyZh5saxKe6RNxSzUo
         IYgh18tIsCpN1AloVMA1aA8JRLRBDCBOxCD8y9JYB6xW6fDba8ocvwLFo0J9Z1htAB7q
         tS4Q==
X-Gm-Message-State: AOJu0YyAbVEo93pSVCZ16DiGB66Rl2x/VW1dOH7acydo4atSi4ssZ/5x
	FZqR0oCCI9DNTJT2s6o+04tiZOzS4yGvwoLscI4=
X-Google-Smtp-Source: AGHT+IFjUO5PyTboYeJJ3QZa7Tk6L1ogRu0RJWZTckml4cZ5faf+A+vyJUoL6Z5yih/bM87AC4BQCw==
X-Received: by 2002:a17:902:c106:b0:1d3:b083:f832 with SMTP id 6-20020a170902c10600b001d3b083f832mr2202415pli.46.1702904948264;
        Mon, 18 Dec 2023 05:09:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902704a00b001d35223d0besm5959741plt.251.2023.12.18.05.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 05:09:07 -0800 (PST)
Message-ID: <65804473.170a0220.14915.e4d1@mx.google.com>
Date: Mon, 18 Dec 2023 05:09:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc5-456-g002453f88f609
Subject: next/pending-fixes baseline: 106 runs,
 5 regressions (v6.7-rc5-456-g002453f88f609)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 106 runs, 5 regressions (v6.7-rc5-456-g002453f=
88f609)

Regressions Summary
-------------------

platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
beaglebone-black            | arm   | lab-cip      | gcc-10   | multi_v7_de=
fconfig | 1          =

sun50i-h6-orangepi-3        | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe   | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc5-456-g002453f88f609/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc5-456-g002453f88f609
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      002453f88f6094816d34378e953d87b8a8a54518 =



Test Regressions
---------------- =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
beaglebone-black            | arm   | lab-cip      | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65801da4efe48a5a14e13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65801da4efe48a5a14e13=
477
        failing since 3 days (last pass: v6.7-rc5-272-gc68cf4cd434e0, first=
 fail: v6.7-rc5-313-g501631e4f287a) =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun50i-h6-orangepi-3        | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65801384fd91c59befe13490

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65801384fd91c59befe13495
        failing since 347 days (last pass: v6.1-2435-g5c02e5d167d0, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-12-18T09:40:04.050643  / # #
    2023-12-18T09:40:04.152523  export SHELL=3D/bin/sh
    2023-12-18T09:40:04.153058  #
    2023-12-18T09:40:04.253958  / # export SHELL=3D/bin/sh. /lava-448678/en=
vironment
    2023-12-18T09:40:04.254454  =

    2023-12-18T09:40:04.355316  / # . /lava-448678/environment/lava-448678/=
bin/lava-test-runner /lava-448678/1
    2023-12-18T09:40:04.356002  =

    2023-12-18T09:40:04.361838  / # /lava-448678/bin/lava-test-runner /lava=
-448678/1
    2023-12-18T09:40:04.441024  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-18T09:40:04.441545  + cd /lava-448678/<8>[   19.418893] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 448678_1.5.2.4.5> =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/658014aeae6e0fb620e1349d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/658014aeae6e0fb620e13=
49e
        new failure (last pass: v6.6-rc6-220-ged04e49eed957) =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6580135c693b28ec8be134ac

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6580135c693b28ec8be134b1
        failing since 33 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-18T09:39:21.873174  + set +x
    2023-12-18T09:39:21.875529  <8>[   14.288605] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3887123_1.5.2.4.1>
    2023-12-18T09:39:21.978354  / # #
    2023-12-18T09:39:22.079415  export SHELL=3D/bin/sh
    2023-12-18T09:39:22.079834  #
    2023-12-18T09:39:22.180614  / # export SHELL=3D/bin/sh. /lava-3887123/e=
nvironment
    2023-12-18T09:39:22.181287  =

    2023-12-18T09:39:22.282703  / # . /lava-3887123/environment/lava-388712=
3/bin/lava-test-runner /lava-3887123/1
    2023-12-18T09:39:22.283644  =

    2023-12-18T09:39:22.324011  / # /lava-3887123/bin/lava-test-runner /lav=
a-3887123/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe   | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65801345915adf51e8e13493

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-45=
6-g002453f88f609/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65801345915adf51e8e13498
        failing since 33 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-18T09:38:59.091265  + set +x[   19.757588] <LAVA_SIGNAL_ENDRUN =
0_dmesg 448672_1.5.2.4.1>
    2023-12-18T09:38:59.091600  =

    2023-12-18T09:38:59.200097  / # #
    2023-12-18T09:38:59.301338  export SHELL=3D/bin/sh
    2023-12-18T09:38:59.301805  #
    2023-12-18T09:38:59.402617  / # export SHELL=3D/bin/sh. /lava-448672/en=
vironment
    2023-12-18T09:38:59.403115  =

    2023-12-18T09:38:59.504044  / # . /lava-448672/environment/lava-448672/=
bin/lava-test-runner /lava-448672/1
    2023-12-18T09:38:59.504737  =

    2023-12-18T09:38:59.507718  / # /lava-448672/bin/lava-test-runner /lava=
-448672/1 =

    ... (12 line(s) more)  =

 =20

