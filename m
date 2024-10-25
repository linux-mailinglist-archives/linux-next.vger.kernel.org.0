Return-Path: <linux-next+bounces-4451-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF8C9B0F78
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 21:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2989C284053
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 19:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CF620D517;
	Fri, 25 Oct 2024 19:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="olxP+uL0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B5F18F2C3
	for <linux-next@vger.kernel.org>; Fri, 25 Oct 2024 19:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729886373; cv=none; b=LgopGAcN/C3qrqNE/qK5JjFz6jkVP6hy/FF31YTknaUEruD6/5pDjnM1lguQE6EigBkuQ4ovRBE5L0/MzYrDzYUguLZgvb1VG3JD0Dqy5vvr3MxZnxx4Lxsyi7K1gsQtqknj+FKl0zOVyn9yGf4DzHg89e8MDyfrnzToYttT6eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729886373; c=relaxed/simple;
	bh=3KWTVDComqU9lHE1fInImk5yqT/WQT4qUHSPrqV3uIw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=aCRZakLbJcDTHxqb7S6Hu9bWT54gEXr5Mm4XylXFCN3HXL59gQQYAEvHWG+Vxi+ys9l8dCyYNIZpHZJce3q1ECLpwJtkuCPRicRHhLbA+I/kSNS7QHdiJIUu5XM8EzQmhw3S3vll39GH+61hifmc99bMvezUC+4nN+yaMfna3UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=olxP+uL0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c70abba48so20267955ad.0
        for <linux-next@vger.kernel.org>; Fri, 25 Oct 2024 12:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1729886370; x=1730491170; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nH1kVIkY3k/AzcZQ17eGEta4WqJ7PGjgKaDkHThsu2w=;
        b=olxP+uL0kW3CZ438Fg4fB3CdpPVSPRhPsFjE8cNDrxguLYmBH5XQy3zfkbuzd30oOV
         yHuNq9PBZH5M/eK3l60Don/+WdIa3giFDN5E5t0wyvGwvCbSH3DDEedQ0BzrK5SnR8Jf
         IO8SCW4tuscZUChxAIMSbmhe3gZ4c76uRBAmkjFhkEzdFeF2h8+iZj/2EdOLStAD4alV
         XOUHaBYIvXEZ9AHcZ35UT6yG2oZK6Fo0XG/EehcHkPPx/YHQ/vCsVHA9kxbQHoIxsxJf
         SV+3QCpUC/QqDu7xGSz8RjU1xoR6gB1vsr9t7f0yfdYF3YowxQ+CKW1rXIvIgq04yTOr
         mzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729886370; x=1730491170;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nH1kVIkY3k/AzcZQ17eGEta4WqJ7PGjgKaDkHThsu2w=;
        b=i6CRB5wI0fmCs4uwK/VV/EbAcQDylsFeK0aFjKEdKCAB9/SocRU/AacvyxuvQ0dQhQ
         4aLHQ+V3J62FmhanlDwlC4dPN12UqBu0gfaDyQKanLtGNm5OX5FhjzDGPKnDOVbrBS2S
         JiDjZZFVuyfhjmyoTvLDHvg0WGp5nVl3zalYjO7AvUOm1+bu+BtqRSuuI5ExA94+dRlo
         u49CVgwfDyVKo49xlixP6tf3eWPEJeyHS+7SJUPcMMUdtFbAmxhvewDc/tk6vTmOFIJ7
         99AVu4foooxgX541PCAx348vVxis5iM7+CB/aizqdNB75HwmkP3dyeJhGk44IMRjC8bj
         kWmw==
X-Gm-Message-State: AOJu0YzWKN29Cii7pcv7gXSJj0dKUdhmRql68DZwnk2V3905izv3vwbL
	VvUh0wWZO7BNKqSIPkpWn4JEJql+3S/c7GUJpi9kkj5SHRDmineJ7Zqvt2Bw8hJWI1m3ieG3PUm
	S
X-Google-Smtp-Source: AGHT+IFHtrH1VX6OXeiek5cZcuZHa51320zmNckPhG0KcKpyYxYbZEQYUiuXVdRxx/zCiLtfWMSEzQ==
X-Received: by 2002:a17:902:ec86:b0:20c:c086:4998 with SMTP id d9443c01a7336-210c6cd2c52mr3485905ad.55.1729886370088;
        Fri, 25 Oct 2024 12:59:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf44544sm12913535ad.38.2024.10.25.12.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 12:59:29 -0700 (PDT)
Message-ID: <671bf8a1.170a0220.2eee05.6916@mx.google.com>
Date: Fri, 25 Oct 2024 12:59:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc4-373-ga06df994e3b96
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 44 runs,
 1 regressions (v6.12-rc4-373-ga06df994e3b96)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 44 runs, 1 regressions (v6.12-rc4-373-ga06df99=
4e3b96)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-12   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.12-rc4-373-ga06df994e3b96/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.12-rc4-373-ga06df994e3b96
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a06df994e3b96f0f6b97e5d2679c41f60d182bbe =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-12   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/671bc5b4763484b17cc8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.12-rc4-3=
73-ga06df994e3b96/arm64/defconfig/gcc-12/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.12-rc4-3=
73-ga06df994e3b96/arm64/defconfig/gcc-12/lab-broonie/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671bc5b4763484b17cc86=
85d
        new failure (last pass: v6.12-rc4-238-gbda3598070c9) =

 =20

