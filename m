Return-Path: <linux-next+bounces-2250-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DA38C1BE5
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 03:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 335361F218A3
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 01:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AE21C01;
	Fri, 10 May 2024 01:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Gkhk4Y8h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F6B3233
	for <linux-next@vger.kernel.org>; Fri, 10 May 2024 01:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715303206; cv=none; b=KElMlxCZfzB1qJpXA2bfxQwTWi12aNRvzReanid5QvnwqFsIiW32CDoiJNvQxYSjzy52dtvKQRt+wV98IZ+GxfHKoUF/3oJKf8s8gvklUzFY1MHD8vKbXM52BtSx2JDKEMgLSE8ZcpqG4igzU918El4c/3mDtV/EtaBkRa0FRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715303206; c=relaxed/simple;
	bh=3flX5ClQHc1Gr/bEaPSHgQF6YZtnhJ3oJPwsi3/QqQA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=HHFMCVzjskK0DPrR0HXi862t2H21l4m6t10Ju+SdPOss0QEhwXHbivHEpbaxSBlKIA8XJHGrWhIfCoaGNOAz5ehqO3VkfJ1FfpOj+iRAngVxVAWbr/fIVvnKC6exC2smvKlc0Yzyh9cXRBoYCyOLsm4NARx7b1JIulfb5x0qXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Gkhk4Y8h; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f44881ad9eso1292313b3a.3
        for <linux-next@vger.kernel.org>; Thu, 09 May 2024 18:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715303204; x=1715908004; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3flX5ClQHc1Gr/bEaPSHgQF6YZtnhJ3oJPwsi3/QqQA=;
        b=Gkhk4Y8hF2l/K/KJyyltdy0g3xAngFg3ym/5KA6Du0HZRa9HtfCpC8VTiTaDYP37BM
         Tg6Rz20T2cgUIoRqpMXNrUb0YSltLh53fc7ZVbJ8cWV2JOeJSaFb+7DoNHBJbwUWmwPG
         Lz/STutmet0Zcd4b/jfkOHu0timLJe4gCYqSDdTdlirREL+vZC3oMD/JiJvnKFl8Xtc0
         FA8hUq56GlaeI+KOk4OJLYL727L42wakiMau12yZFmdXD0at4aUzEHMFNj3z8HPRSofn
         yPupRPNaZEdfe7fQa9uYqQQy27ZzN3Uc+UJ6rrTk/HNZVMki60nr0Uux5vrNEPDbRSPZ
         LRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715303204; x=1715908004;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3flX5ClQHc1Gr/bEaPSHgQF6YZtnhJ3oJPwsi3/QqQA=;
        b=LBehlryJqM6N1XemUgM9gDML8EDGqh3wtRKeaAQiyrykln2YLIYK1j3SW7c26qoCUS
         6brHwlOTVcdeILK6gI2qttxd7qiEOdonWAHvPfaJSh8nCSZmVGAGDvGJzjGmgm540tQl
         7Y5OJPILmZOazjauEDc0dnjbQvyo8tRK+6iBsUhDeef1HbxgUbUzcIorredjVl/N0ZoT
         3AZvYbj63GutNpZxg32qIRlzVD7H/K+xurn/VP7Jz3WBww1bikSFGvJ4blj7pN/Ywd2I
         LgV4+uZA/D7YwYfMVijmGECZ+7cN1VYnlRoByqcE+PVKe3mYesVHVMVRXEDpLjh9lUqR
         Q+rA==
X-Gm-Message-State: AOJu0YwzL/PcfnHiSu2pOMSV/c+Q3iOkY4efSWWF/zULR88gvYtgwXeb
	tEg8sJsm3XIIvdl5xCwdx6eNBDxNN7iDNy7nWZ0h2w21qceJIXxQII/nzq254A8BaDor6v7S/mP
	k
X-Google-Smtp-Source: AGHT+IGKXcMAlWb2IelTZaMDZiPmfggBrfXVJ+aLJCsCLfv9Ovn+gStUpgfHofA9TPirL6acFYhUcg==
X-Received: by 2002:a05:6a00:3c91:b0:6f4:74b5:f536 with SMTP id d2e1a72fcca58-6f4e03e7fabmr1242392b3a.34.1715303204056;
        Thu, 09 May 2024 18:06:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340a449ffbsm1981102a12.2.2024.05.09.18.06.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 18:06:43 -0700 (PDT)
Message-ID: <663d7323.630a0220.406f2.5dad@mx.google.com>
Date: Thu, 09 May 2024 18:06:43 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc7-198-gb13b271a6bce0
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 1 build: 0 failed,
 1 passed (v6.9-rc7-198-gb13b271a6bce0)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 1 build: 0 failed, 1 passed (v6.9-rc7-198-gb13b27=
1a6bce0)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.9-rc7-198-gb13b271a6bce0/

Tree: next
Branch: pending-fixes
Git Describe: v6.9-rc7-198-gb13b271a6bce0
Git Commit: b13b271a6bce09c09ffde5d7ed44bc9b0b74021f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 1 unique architecture

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---
For more info write to <info@kernelci.org>

