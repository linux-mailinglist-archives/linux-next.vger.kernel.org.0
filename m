Return-Path: <linux-next+bounces-3958-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A049843B1
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 12:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59B7B1C22806
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 10:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B997019E7D8;
	Tue, 24 Sep 2024 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HmKsoeob"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E719B3E2
	for <linux-next@vger.kernel.org>; Tue, 24 Sep 2024 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727173936; cv=none; b=fBssTEegfZtvrDWEv2c8yqMv5qJtj5KONd5VoBNHyFmUyA/0BSnh2dyNB/fCdXyxDCo8EChADZvzPHOkqCFAeUOLS6TbjyuqxGutfCPr1D3T1/tahNSG/fjrEtRqiw8krukTeevVFHMGRet54ZIiza6SaIb+l6M4AIXW3y97x+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727173936; c=relaxed/simple;
	bh=fyhqPJjMO0Z4zP6cnJJ4g3v5FM4CfXmGrlqlyK0IN1U=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=FKOPDGa0dWQHYTfNjD8zL19cEJvNyt1p6pCnU48iKxsJ/ksP/AmlA1bw55p233trLfunt3oTCBNgsYG7YTZjnzxk19mxWS+S3YfOQgyrchVA2B1T4FeJqBfk0+1Ti/OUKvpq+A4E9wkBMlfIieYdlBl+QV8cxDmaZF+VYfrohoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HmKsoeob; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e1d2cf4cbf1so4753886276.1
        for <linux-next@vger.kernel.org>; Tue, 24 Sep 2024 03:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727173933; x=1727778733; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CYd6oBLUDR4UzCBb/C34GDGQs+/oNcVYkRkh/yoB+Y4=;
        b=HmKsoeob7Aw0WLmZwvutHfW02Xr2kGP5BwdelJu/s75JKnFa3T61+gP3UZ6uhJsOTv
         Fy/ElUXlfYZf2XRiv4gKMM03f/5w+N87QHiHIlcj8+nGScDCtOYxV9dmsTKeQnAcPLDv
         qYVk7W/UuKy3pk0K7I8Q7O5VdOb3zvxEXqIOGwaOMiZkh25r8fqApzhkd8pdfCp7mDlm
         UJoST4lscL0stDJXyDWet+T+DEV0vpbBhW8Xc8KUaSSqpT04KyTS5gGvrK6p/lOyoJGg
         8HekTam7m6oLM1NoTQ/0dnluctitgoKcF/TSFJujK7q/eMdqZlVc/b1P8ORgpHsDyCUJ
         sM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727173933; x=1727778733;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYd6oBLUDR4UzCBb/C34GDGQs+/oNcVYkRkh/yoB+Y4=;
        b=NjQltXvZc2N5TcYA5Hy3iAnusjhN9WQ++WEXNNQG2hUPwb1ND/IZHmPJWNMcOKdePH
         TyKRmYiDq10Ro6U2FMimnZJxV30ZCMCcDqfp6BPwdhPaFBq52hGuPQj+LndIyALI8gWu
         Hze4kwRfvTrOR8C/A/5j3RXRRzwv7EqGx/BjqSTGEPoMcdjADUV1lTLV6ccZQbas582h
         VbOsXnmY1tafJilZn/om27aiQ5hm7bjQTnALQSqle6T2UNS51wzvv5CtBdGTfXeQnl/4
         b28E72pE0rbsuCmsTIYpLtGb+hefBsJ0nqtes/Wm6m6q/2l7ChowIF/0RDBRw/H/c8bv
         OT/g==
X-Gm-Message-State: AOJu0YxZyWLumMgqdNHgODSmEX7vsClI7cJchiDsYQh6LD+4t7UhAh8p
	fIA/TGwP11/eTqpdq89mgTnrnWYkaCoQ0cOoHrJa3DG/qWJjhmGfb2JVlxrn1e9D5invxOMCXZE
	a
X-Google-Smtp-Source: AGHT+IGvIlrX7nzr6r2jc5u2NrqlRpBDCVXFzmqdU+kUI/HpvcgHczfEL0YOhtCSC/1f539BnmBJvQ==
X-Received: by 2002:a05:6902:154d:b0:e1d:31d0:c8b3 with SMTP id 3f1490d57ef6-e2252f3400amr11318748276.21.1727173932979;
        Tue, 24 Sep 2024 03:32:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c308efsm935744a12.1.2024.09.24.03.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:32:12 -0700 (PDT)
Message-ID: <66f2952c.630a0220.3857bc.1dfd@mx.google.com>
Date: Tue, 24 Sep 2024 03:32:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240924
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 81 runs, 1 regressions (next-20240924)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 81 runs, 1 regressions (next-20240924)

Regressions Summary
-------------------

platform          | arch | lab     | compiler | defconfig          | regres=
sions
------------------+------+---------+----------+--------------------+-------=
-----
r8a7743-iwg20d-q7 | arm  | lab-cip | gcc-12   | shmobile_defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240924/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240924
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4d0326b60bb753627437fff0f76bf1525bcda422 =



Test Regressions
---------------- =



platform          | arch | lab     | compiler | defconfig          | regres=
sions
------------------+------+---------+----------+--------------------+-------=
-----
r8a7743-iwg20d-q7 | arm  | lab-cip | gcc-12   | shmobile_defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/66f259f670fb87f706c86875

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240924/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240924/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f259f670fb87f706c86=
876
        failing since 33 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =20

