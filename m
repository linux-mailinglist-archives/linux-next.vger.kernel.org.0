Return-Path: <linux-next+bounces-509-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA881B050
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 09:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C941C21914
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 08:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46950168A3;
	Thu, 21 Dec 2023 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1Hu8txHf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FD2C12B
	for <linux-next@vger.kernel.org>; Thu, 21 Dec 2023 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5ca5b61f101so212856a12.0
        for <linux-next@vger.kernel.org>; Thu, 21 Dec 2023 00:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703147447; x=1703752247; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rpJqmmuU3RsV3WU12xAoaTlzNL7f2emlaHxpsaQ442E=;
        b=1Hu8txHfWKsF6JwfgvKr7Fsf7illBG+dW/iq9XnJQnLLhYJHvxOjaP/64rvArPPHPG
         wGhAx1Vc0yoS3XmlOPYutJ1lH/Z9QR7ENtc/U0eTBg1s/twUm8lmcdb4aX9IG0aMeNyu
         NI4OEkLsqNBU7yfkvBCfNVwFiJgjvdQJ9Pn4L8SgEGwogKy95gV1TjfkTtObqqtKQjAs
         NrM2CqsDnm9CdWtzrZ4jxIT8cHxIAaNGp68CvXFU15sE3RN/6U3fbsmZ8h5uVsEhdLzC
         wqy0PD054wej1Kdj2+DxZqWTMKKaHW3NIxFS4xkSbMOQKB270zktjZdBzswZ/4hqGu/J
         X1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703147447; x=1703752247;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpJqmmuU3RsV3WU12xAoaTlzNL7f2emlaHxpsaQ442E=;
        b=mVjgJ1nnUv/zokN3JJSKSbFgRHTwDkitKnrvx4a5TRW7KIVjdirFH8/+7nWshv1rgr
         pHp5/8rf+xmSlFWLk14DP2OKB0z/r5Y6oIRgmtmVddTVWxflVN4EVVOd1Xqhfl8ls3fc
         CswSFZm6sWdczRH9l6XqJMGSKj+AI+1I12xMG8JeF3VXZLcnhqxboytSdMQmhjW7eeci
         LQwBiX/ufybYpwhbXK7efmQvLLCEU7bTyyE6uhpP48TN+oh5H6CLsxCqVnktAJTco57+
         n/1Om/A/OmHkDR/Ox4QYeoEC/3uAveYJCBz84qQGORIAU+r9XZU64swbG2MmBpkWooRV
         C6Xg==
X-Gm-Message-State: AOJu0YwjVFpXi2x5iTY5YjGp014HSyhiHeh7l3W3Bo7n3Tw7YtIpB6yn
	cTbotEVxIUifNLkMm1O125LI8+FrTALOQgApU1Q=
X-Google-Smtp-Source: AGHT+IEqZGiSZfXV2BNxuVWO+bM+6CCuyewgPuedf23NHEpDEPPrByPIKjhaQs9k1wQHd2Xf9N7aQA==
X-Received: by 2002:a17:903:32c7:b0:1d3:6110:32fd with SMTP id i7-20020a17090332c700b001d3611032fdmr9676075plr.110.1703147447272;
        Thu, 21 Dec 2023 00:30:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y6-20020a170902700600b001d0ca40158dsm1035373plk.280.2023.12.21.00.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 00:30:46 -0800 (PST)
Message-ID: <6583f7b6.170a0220.c5a23.2eaf@mx.google.com>
Date: Thu, 21 Dec 2023 00:30:46 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc6-268-gc6eb02b33bd24
Subject: next/pending-fixes baseline: 70 runs,
 3 regressions (v6.7-rc6-268-gc6eb02b33bd24)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 70 runs, 3 regressions (v6.7-rc6-268-gc6eb02b3=
3bd24)

Regressions Summary
-------------------

platform       | arch  | lab          | compiler | defconfig | regressions
---------------+-------+--------------+----------+-----------+------------
meson-gxm-q200 | arm64 | lab-baylibre | gcc-10   | defconfig | 3          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc6-268-gc6eb02b33bd24/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc6-268-gc6eb02b33bd24
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c6eb02b33bd24f8f4a60947b539db4871ef914cd =



Test Regressions
---------------- =



platform       | arch  | lab          | compiler | defconfig | regressions
---------------+-------+--------------+----------+-----------+------------
meson-gxm-q200 | arm64 | lab-baylibre | gcc-10   | defconfig | 3          =


  Details:     https://kernelci.org/test/plan/id/6583c6e4d6836b66e0e134cb

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-26=
8-gc6eb02b33bd24/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-q20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-26=
8-gc6eb02b33bd24/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-q20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6583c6e4d6836b66e0e134d0
        new failure (last pass: v6.7-rc6-238-g46bcd2aac1f1f)

    2023-12-21T05:02:11.116258  kern  :alert : [00000000000000c8] pgd=3D080=
00000126cb003, p4d=3D08000000126cb003, pud=3D08000000126cc003, pmd=3D000000=
0000000000
    2023-12-21T05:02:11.116882  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-12-21T05:02:11.117378  kern  :emerg : Code: d503233f a9bf7bfd 9100=
03fd f9403c00 (f9406400) =

    2023-12-21T05:02:11.120455  + set +x
    2023-12-21T05:02:11.223281  / # #
    2023-12-21T05:02:11.324721  export SHELL=3D/bin/sh
    2023-12-21T05:02:11.325357  #
    2023-12-21T05:02:11.426445  / # export SHELL=3D/bin/sh. /lava-3891279/e=
nvironment
    2023-12-21T05:02:11.427064  =

    2023-12-21T05:02:11.528157  / # . /lava-3891279/environment/lava-389127=
9/bin/lava-test-runner /lava-3891279/1 =

    ... (14 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6583c6e4d6836b6=
6e0e134d2
        new failure (last pass: v6.7-rc6-238-g46bcd2aac1f1f)
        2 lines

    2023-12-21T05:02:11.046620  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-12-21T05:02:11.084962  kern  :alert : Data abort info:
    2023-12-21T05:02:11.085257  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006, ISS2 =3D 0x00000000
    2023-12-21T05:02:11.085687  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2023-12-21T05:02:11.085898  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2023-12-21T05:02:11.086129  kern  :aler<8>[   16.265228] <LAVA_SIGNAL_T=
ESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-12-21T05:02:11.086328  t : user pgtable: 4k pag<8>[   16.275448] <=
LAVA_SIGNAL_ENDRUN 0_dmesg 3891279_1.5.2.4.1>
    2023-12-21T05:02:11.086519  es, 48-bit VAs, pgdp=3D00000000126c9000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6583c6e4d6836b6=
6e0e134d3
        new failure (last pass: v6.7-rc6-238-g46bcd2aac1f1f)
        13 lines

    2023-12-21T05:02:11.042602  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000000000c8
    2023-12-21T05:02:11.042943  kern  :alert : Mem abort info:
    2023-12-21T05:02:11.043365  kern  :alert :   ESR =3D 0x0000<8>[   16.22=
0385] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D13>
    2023-12-21T05:02:11.043578  000096000006
    2023-12-21T05:02:11.043780  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-12-21T05:02:11.043972  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-12-21T05:02:11.044209  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =20

