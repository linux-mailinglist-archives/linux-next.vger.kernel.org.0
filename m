Return-Path: <linux-next+bounces-3946-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A89C97E88F
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 11:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64477B20462
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 09:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEA11946B8;
	Mon, 23 Sep 2024 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="gYvAM6FR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A901940B0
	for <linux-next@vger.kernel.org>; Mon, 23 Sep 2024 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083478; cv=none; b=Eer3QOt8o0jxYO9ecUTwpQuE3nNV/Ea7HWOlDVz5L1Fq6wbhW9AloEeW1iwZAVAW7rSBHgTduIkc86a3QMpw4/vFQqK6kMZn7KHUnsAtvHB9UQRglD6cLNej7Sgo3xVkX7tVcnpdvFwGD6Y76ixAKXmw01aMLy/l+EYdUw0bTNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083478; c=relaxed/simple;
	bh=bxVLoy7wJNLeqZbizBpzIkHF0c6JeBBsslcmfFNQQBk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=RBTQYvosGxTkQ/C2AQmVqMMvqxgQ7G+5nop2CXXLmOxLKDNnzjE2fwBneF//1lZAKCS278UcPXMgHdvCPZ3WxTRMWe4nC9nuxT5pj0IEpUEatHE7epp13gnbxhPKtxZLbOk0TRDcfOXST2GGgbgirlDcY+j+dQed6KKly2WxHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=gYvAM6FR; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7d4f9e39c55so2825230a12.2
        for <linux-next@vger.kernel.org>; Mon, 23 Sep 2024 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727083475; x=1727688275; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DTyTPkEwxZZw6ODObKifJttvkMo6bWs2bjPKeBeZHI8=;
        b=gYvAM6FRMQk4+69nQDDnb51AvbE73brbvES+tiHe8FkqizzAL9S65fY+bFEu8zoVpK
         wKPR3wcmEBvNhbS0fJKxMqQhyVmKsvgbwlXMYhGMxeCMVmI83cMo7lJ8gwriT+Dh7u+t
         wBZX+LQiryzUf2nL5bx97vBWKsjrr+xOUY1AlwRMUIMLHlMoipe/XfZgPb35J3ZRsMiq
         9HrMl6JTh7gihDAKaMAJWnIG1oeUJEAMvKjC4UIYrmfzgYz4+HkPtRu+qddO4MctaasX
         BI6OUTBXl+AXLmrQZ8/XxD6zLGbsT6jfQZZA0hx75+61eI7lhoIozB33XMg11o0MpFbu
         HAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083475; x=1727688275;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTyTPkEwxZZw6ODObKifJttvkMo6bWs2bjPKeBeZHI8=;
        b=rbYJaybhzNsmlSTRMmRI+wHU7ov0UKlycIKi4T0tWC5d3JkiFdFJHlilRBIQO3UAkc
         wgdalI5d+Rp8v6LADxeIP3COF6gQpygI+gAt3dYyir2R0s3Xc1zRKMzBgdGR6XU2K8TE
         x5ffsSR/R4NIztCdaQDDoQIip2V8I55WQlDZ4ZiWut8rzGFM9Froe3GGQjcDkfX2PKa7
         wOBf8K5NCJj5gZYDw9X6wxCkaAWIfejoL1i1aBtMVfrizQyacBGa8Hn5DKztu0LPXgJE
         zdfGETaQ333IgJJWaQURQDT9HxTGtnot8a/rtX7TZ2zJu7fwkEl3BkiGPPY9KLrVZtz4
         HaAg==
X-Gm-Message-State: AOJu0YxBaVVu/aulZBmDZUHFCQFHea7vuA9mcDzthwRmdqopLcbYYCjL
	5YoZsD4AKR6H1HU23yGU/g1Huxp1N3+DdN1pxcKR3w3TnoNOOwOKb0CL+X9IOV16Rgmhbr6ZWJY
	6
X-Google-Smtp-Source: AGHT+IGC7asy9b0oWL07S6KAa7bva2nR87nEI2BdyhDcSh24P5b8s+AYVWGbp8eihn/mQuHEFFqOLQ==
X-Received: by 2002:a05:6a20:b68a:b0:1d0:2533:1a42 with SMTP id adf61e73a8af0-1d30a8ecf33mr12508780637.9.1727083475221;
        Mon, 23 Sep 2024 02:24:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ad2dsm13530001b3a.101.2024.09.23.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:24:34 -0700 (PDT)
Message-ID: <66f133d2.a70a0220.2541d6.3a68@mx.google.com>
Date: Mon, 23 Sep 2024 02:24:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240923
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 166 runs, 4 regressions (next-20240923)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 166 runs, 4 regressions (next-20240923)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240923/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240923
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ef545bc03a65438cabe87beb1b9a15b0ffcb6ace =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66f0f4450deca993b0c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240923/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240923/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f0f4450deca993b0c86=
860
        failing since 26 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66f0f4464ffaa9934ac86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240923/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240923/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f0f4464ffaa9934ac86=
856
        failing since 26 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66f10268d6ba8ea064c86957

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240923/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240923/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f10268d6ba8ea064c86=
958
        new failure (last pass: next-20240829) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66f0f9c25490164886c86866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240923/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240923/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f0f9c25490164886c86=
867
        failing since 32 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =20

