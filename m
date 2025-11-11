Return-Path: <linux-next+bounces-8919-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBCCC4B37E
	for <lists+linux-next@lfdr.de>; Tue, 11 Nov 2025 03:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B49BF34C6F8
	for <lists+linux-next@lfdr.de>; Tue, 11 Nov 2025 02:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBBA347BA7;
	Tue, 11 Nov 2025 02:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="q6WOJJ09"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BD53054CE
	for <linux-next@vger.kernel.org>; Tue, 11 Nov 2025 02:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762828320; cv=none; b=aYw5maeDSDkdiyJZwPsk+CpxYav3dLSkHS7boDOT0uaJFzaJo1NrkhkJoWrw9iMlDn/HyS9XZDxFBbfS20L3D2XTrnisvK0jjcnjbcVSKJdHYZVk4XzmC75SBBx02RVrnnI9b/cte0Qur+VSyXnhyNMSlYj8lfNIadkOuQwLLj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762828320; c=relaxed/simple;
	bh=BkJWGOwKQS8paBNz/ZKHHqsVHzc5Up3e8zHsq7lWUc4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=K9dihzR48ZrD1oBQIJM8jj+I2bnCjMYHnp2ivSKAj/By2Vq0fXnUI3DPjvrNGb/XDxID0hA8vbQHyEcZekZBmf48zBiMX93h/Q3/tMUpHCOb9drQt5SixduZi26G8h+ufnHszpesFz4w3Ot4sx+XeZWZobd1ZKieaTnGQQyEV8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=q6WOJJ09; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29555415c5fso46595375ad.1
        for <linux-next@vger.kernel.org>; Mon, 10 Nov 2025 18:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762828318; x=1763433118; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJC8K8WlQEv8hN3oAEejKV2X3e/USexF+dS82o9yun8=;
        b=q6WOJJ09P/AJsukNrDZ6mI1LdaAzvBea6+VJGIl8gZlbotNLv3qNWTy4ePyPn0Ikhb
         oR2Co8IVAEKD4wwb8XO0+YG9KRuQ+VLgyO82QnJDXbA8Ph2C2NjjypCTv7iJAb+44Fap
         0CiysqVhqekGyUyugA9gQYJzG0nVhRrJxZLQ1pAhZVFtVupMRzrKF5qVusxMvGYwl7jp
         oAnnKJ4ERFFhBu92YxWd1RmAPMW4rAcrfCoWGyQpVRkBCXyjs+BOuU1u7Vyl5Ze1w9+0
         /yi0UDs6vaLONVwO1q+g54emYnvI2T2KtdSGQ/5+mXQFrpBlAm04WAcXKbZyzDT3bTDX
         mJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762828318; x=1763433118;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJC8K8WlQEv8hN3oAEejKV2X3e/USexF+dS82o9yun8=;
        b=SVoPsGz8fVrYEmBMrvjSGTs307BCvg39cAXD4Q2UxA1c84+ROTGm3gbPD7SNySRmSQ
         VfwTB9uAaDXkG6iXhEsnsPEpgA/GpATsvJ1MrAA43f9YBKTQsaE0ooR4qjsY+k55ogN9
         j+VgCa+B8r2EgzITvRVUeHv2s1IeBoFPRUD3diVi/7oxBBBhemcKDosHdbtY4nNHQlqz
         3ndKwFsTsvGUhZULkQZNsNJrDH1l8gzLHuEa7xXUqXAH+ZgVbGssG61/XieSSDUw+hfD
         H7M/lZu+1b5fPE5QyPbjntiVMq4QqFKAavaPmjQ8Y3SY97vUuumPGuzApq5pfS/QhyA/
         QTwQ==
X-Gm-Message-State: AOJu0YxFU1jIRl6N4dZHWj5JjQzfe3b8VY6HKu+ej8RRbjUqT7mmDM1v
	I+FQHWn04ETkqC/h+giauaiOKKWQmbeM7FAqmmVomlNeLC1qf9H4X+9FGn3b6jWAPL4=
X-Gm-Gg: ASbGncs8fbT+iu1uUTdSxNpKcBuwTohiq8znHkTUdJThCUaqpLuDyuSG9jpDCyjvb7h
	PcoJrxyKvlj2KzOYo2t4AI8mCdePt302TdgjX2H8M93Wxjtutsl9CXmhh5xtTh2nYCdwM2fd01c
	6I1A4+XTW5HBJKB7sVvI2NDZ1jKnxSdc3kG8Nguqh0X0G2tnlO3hTr1xZEcFj4sIxtCX4hQTpyV
	ajKfondt55ZbP78Km91YuSp+KLgbBehARAh+u8LgXiFpXExr7uFUFDH6pvo3oWHT1LkEhuUX/VJ
	p7je0KoiONR7exjQIU2kjrajBaOIWVmmpRM8oUaPp62c1nsk176r6VKqd4uczf7b/5BX+zYez28
	htWwhMstMeK0jqRPXgeAc3rsAU/fgGPziYFcTDrS8zFgShpdJ4e0a3G3HyDcSfeBFlekUCQ==
X-Google-Smtp-Source: AGHT+IGD7RiEVUyg0EY3U6eZ5eRQsC97H027yF3vDfSjhZtgCFW34gV1TWRj5YFQyAgiedsLVCpcgQ==
X-Received: by 2002:a17:902:d485:b0:294:fd3c:6de2 with SMTP id d9443c01a7336-297e5408d00mr133758505ad.12.1762828318186;
        Mon, 10 Nov 2025 18:31:58 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297fe688c96sm69118025ad.58.2025.11.10.18.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 18:31:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - ab40c92c74c6b0c611c89516794502b3a3173966
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 11 Nov 2025 02:31:57 -0000
Message-ID: <176282831707.6705.7707292970662701054@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ab40c92c74c6b0c611c89516794502b3a3173966/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ab40c92c74c6b0c611c89516794502b3a3173966
origin: maestro
test start time: 2025-11-10 04:07:52.125000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  145 ✅    4 ❌    0 ⚠️
Tests: 	11619 ✅ 5799 ❌ 4202 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_2
      last run: https://d.kernelci.org/test/maestro:691174f4f21f07610ddb418e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:691174f4f21f07610ddb421f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:691174f4f21f07610ddb41c4
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6911740bf21f07610ddb3f3d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691175eff21f07610ddb5acb
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:691174f4f21f07610ddb4195
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:691174f4f21f07610ddb41cb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:691173b0f21f07610ddb3c9a
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691177a6f21f07610ddb6d7e
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69117881f21f07610ddb7263
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69117406f21f07610ddb3f10
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69117517f21f07610ddb4350
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

