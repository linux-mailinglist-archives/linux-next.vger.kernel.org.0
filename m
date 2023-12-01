Return-Path: <linux-next+bounces-181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A16800757
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 10:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A9BB2817F1
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 09:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3617B1DA46;
	Fri,  1 Dec 2023 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="IPc96GnU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED27BB2
	for <linux-next@vger.kernel.org>; Fri,  1 Dec 2023 01:43:08 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso253429a12.3
        for <linux-next@vger.kernel.org>; Fri, 01 Dec 2023 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701423788; x=1702028588; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3EvyGdHm3xs7M/zhTBUpHv2J6Jcc1lMZTMzAM/hnFTw=;
        b=IPc96GnU+rBxVDS86PbZ745LcjSKtbcnOigo1neUqrdMmyaVfA9a+lmKg+I0sx9jsf
         j0dNUzq15yVR8zfvgcah1NPO9T1u7LpUusr0gMSFLhc+T/UwmHhwJdrDN1gF+B5daE1P
         R0PqFrV1S9ipzUMuNlEyuyLUp25FULRDiabAOZQNEc70wipcxVW2wTNf0TS51/Ll4IRn
         jGssZOHk/TAqb1ZI7gkGFyx2F/AvVyrGUvaCiamomL5poC6oyegPi7067VP0nfx+6IYF
         hSADgRv2qec/92K8CzXVvOq2EbgN/aZfZcN0a3mkbIFg5HHyRCqpDQC4emlQnk4vgQNX
         nRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701423788; x=1702028588;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EvyGdHm3xs7M/zhTBUpHv2J6Jcc1lMZTMzAM/hnFTw=;
        b=OGEIqFO78xQnVEuIIlm2kQjCivKAQFzajxOwKQwCPsVIiFM1ehRSv+Ncc3qoPQbnz/
         WWiHZy384TBFZA0cP3zRTKsCYrP4KfK2O2kq1wFICLmmYXZd3Ea1eAQmivGEh/9CQg7+
         8H9FC6AUnXiVuGXViPSr4ui/KgJ74G/C3eQOom2KFOU541ZDYn7MkouYK8xpOzkQ2/47
         T8hds5SB5sTLgrFvKECnD94NAsi1MgjGGngIjfJXxIN49bQSac8xgr7f2h3IZg3C00fX
         HRwNgYsDZXyscUws4GpxnK7cg6Rd9nF8u/Ng2GI4IRWdxBT5VR2M+oFVciRZionrYwuW
         /32w==
X-Gm-Message-State: AOJu0YzPVkx9W+xBSjli6/LGmoBiLy17MTSyWmbJtRIypnFpbom3QVMF
	EBdG+Q0vocFXuqgLSp3ZLgxATWAq/Cfo/DcaJR2eoQ==
X-Google-Smtp-Source: AGHT+IHdHd3iNFaOr9IOfRkSD4q+XwERTrwHofXPc2V0/nq3Soc7NylDoox1cazwSPy2MElKXJRzjA==
X-Received: by 2002:a05:6a20:4413:b0:187:ef24:358 with SMTP id ce19-20020a056a20441300b00187ef240358mr31902776pzb.60.1701423787873;
        Fri, 01 Dec 2023 01:43:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090a2a4b00b00286596548bcsm1010066pjg.37.2023.12.01.01.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:43:07 -0800 (PST)
Message-ID: <6569aaab.170a0220.6f72e.32d5@mx.google.com>
Date: Fri, 01 Dec 2023 01:43:07 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc3-326-gebf39ec4a6f74
Subject: next/pending-fixes baseline: 91 runs,
 2 regressions (v6.7-rc3-326-gebf39ec4a6f74)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 91 runs, 2 regressions (v6.7-rc3-326-gebf39ec4=
a6f74)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
beaglebone-black  | arm   | lab-cip       | gcc-10   | multi_v7_defconfig |=
 1          =

rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc3-326-gebf39ec4a6f74/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc3-326-gebf39ec4a6f74
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ebf39ec4a6f7492899507840c2b78a4be29b7205 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
beaglebone-black  | arm   | lab-cip       | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/656957fbeddf73e5a17e4a7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-32=
6-gebf39ec4a6f74/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-32=
6-gebf39ec4a6f74/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656957fbeddf73e5a17e4=
a80
        new failure (last pass: v6.7-rc3-291-g1867b4f140ac1) =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65694dc03050b724357e4acd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-32=
6-gebf39ec4a6f74/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-32=
6-gebf39ec4a6f74/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65694dc03050b724357e4=
ace
        new failure (last pass: v6.7-rc3-291-g1867b4f140ac1) =

 =20

