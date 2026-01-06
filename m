Return-Path: <linux-next+bounces-9552-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E758BCF677C
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 03:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E61E03024254
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 02:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0111F1932;
	Tue,  6 Jan 2026 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="WJ1WyFDO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1901818024
	for <linux-next@vger.kernel.org>; Tue,  6 Jan 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767666621; cv=none; b=PK6z32L6+WxtQ4VIgnI0ki6LWQi7RJnHfjCdlVJxlZhhR5AapMGq/PPnXXak1ZZxOq4XdifTd4Ymr2F0XCoJQzTh2400wJgNtB2sBO7q1O6gQMmeiLxXoTl3L49A4mxBOS6NQvT7KjCKfaraJBD/irQrJ9QSzojI1qIpa4tM/tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767666621; c=relaxed/simple;
	bh=6K/I9VQ+IgYfarLrB/6Xd/NjOHJFD84cxhY9vKsS9m0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=m1SAGofNmh4YhincP6MJbqYpd3VX7lLJzOtOf8WnPHYSNFCBc3kbUr66hPI9niCUrBj9g9kSlSBxKkbnd34mQ9Q3B53Ef+YN7B6oeDRxlOiM0v2CjiNXis5YuZYkbwiJChjSfUyB7j9+KY8i6lWwIhe3SRKDBAG+uj25fGwuUzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=WJ1WyFDO; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso300127a12.1
        for <linux-next@vger.kernel.org>; Mon, 05 Jan 2026 18:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1767666619; x=1768271419; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/wK/E6YCKp5v0chT8T2wZCnVJUI4BbFkckGecLN2mM=;
        b=WJ1WyFDOgfMUhi9n4CGUL+FITbPUlmc3FUBfLREMEoGLIm7IysXoQ4AnXSeDv6JpwB
         rETDs2/r4AUqJ7LstVVwMlJndh4CVU8joUHIId8NLQI4o4Ya2oylC2Zx3i8VnTWNkUxm
         sNgwlUsXDb8yVeDUAsoUKObmgo4WlxtSDXv90opKfF3kgB4QxVuMFqijZA7ockniXWWr
         ISNeRVf3rB7Iz/jwe1IksiF6FrCYc1x7yMn1Ngmm1vBeRSpP5piz8RpEnfP0Nwy19fQd
         LuSJcDGBrT4LMA3s9HZHY4MZNZn3f2dWWMreWhHnl2sHKG6HA3exZ9PfdXdN5R2v8tdE
         TLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767666619; x=1768271419;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/wK/E6YCKp5v0chT8T2wZCnVJUI4BbFkckGecLN2mM=;
        b=JasACHZSmGkPlpwTq18I/KgSD52CYkQIXUqZGt6+jZ0BoxZOk0kXN6w3nk/i1aNAJe
         jTqEafeDwped+8c7vxD9jvjTOjk30/O2xLuyNmVu+4kL0fiMsZCnwCz2R4wR+nSJaRI/
         tyr6kSQNAWbNxgk9I5UlqF+r4q9KeoBAbIJK2M+L+tah8kcPj1XEseFuZh3Qd9WHn5+E
         PcApTgAQFE04caUmwE93DseTCtT0Y8/AgXT+S2nrSbnKnRWYHbc68zst0QDXzfuPtHe3
         IHsJCNXrMeQYJpFY1vjNhblbp/zYDmfrlhMXINzYYb4GsKiqjg7dGmekw543IvMdIhgJ
         cE+w==
X-Gm-Message-State: AOJu0YxVp/Z+X8ckbQOTFCsN4gMkV21GDW8wHewmlmB9vP4GRGhfYnKQ
	IhR3QcvJUa75O2z2K89BxjyRcYuw7nGfCTD0A4tyzblhYKQs2LDx/OPqmmS2vJ0GnF4=
X-Gm-Gg: AY/fxX7k7DGwHPxzeTEnhTeKA9TPK06Cz23oiKtgx/r1Zdt9i93TCExdH/FEh8yjXjN
	KwrDu04Swu3L475y2krZQDtTvTKxHn2ETEdVSlW5Xg5N2w1dcmxXwqp9JKX2hn8FX7ZR2IyhxbZ
	sQWdQWiJEXHheD8T1g5bnN7qcpIaINRJfcmL/xP4QRYd9t4w98Ws7uuG55tedKsro+UvbjYJ+Fe
	2DtIIAzYPxTZEylVbxXeajWfxx4+dm5Dm3ea5LAtNBTFdOGxaxVSWYL3kkPh9RUA4+6kVf5ABkv
	WuNIno0yH4IpAdQEEq8oUQ0uFvEzUJVyGMEp/4L07lOac+f476J5KPyZXE9fq40ZOZmCV0Uv7XS
	tCJkBOlFgJJm4drdCpmri0v8Ne2PSusgdfn1QSCFgZRkL+BCg29hDKFP9yyfnQIev+Dvn4u35iT
	AgAMH+
X-Google-Smtp-Source: AGHT+IE8MHjBjEYmoEQP9nuzRcqIGTy6+ZL5vaRTnU0e1+k2He630SwBak18i/zxjD4j/Q0sN8XOvg==
X-Received: by 2002:a05:693c:621a:b0:2b0:2e5:228b with SMTP id 5a478bee46e88-2b16f954d25mr948561eec.33.1767666618653;
        Mon, 05 Jan 2026 18:30:18 -0800 (PST)
Received: from 0dbd87e801fb ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b13bdsm1245157eec.24.2026.01.05.18.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 18:30:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - f8f97927abf7c12382dddc93a144fc9df7919b77
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 06 Jan 2026 02:30:18 -0000
Message-ID: <176766661762.8999.18055498503866811308@0dbd87e801fb>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/f8f97927abf7c12382dddc93a144fc9df7919b77/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: f8f97927abf7c12382dddc93a144fc9df7919b77
origin: maestro
test start time: 2026-01-05 06:10:23.373000+00:00

Builds:	   52 ✅    2 ❌    0 ⚠️
Boots: 	  162 ✅    6 ❌    0 ⚠️
Tests: 	17932 ✅ 2055 ❌ 5116 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:695b5e3acbfd84c3cdd98937
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:695b7af7cbfd84c3cdd9e7d2
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_7e300000
      last run: https://d.kernelci.org/test/maestro:695b7af7cbfd84c3cdd9e7e4
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:695b7af7cbfd84c3cdd9e7d3
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

