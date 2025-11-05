Return-Path: <linux-next+bounces-8828-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAF5C33C60
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 03:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8081890920
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 02:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F081F2BA4;
	Wed,  5 Nov 2025 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EmGgNJo3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F527713
	for <linux-next@vger.kernel.org>; Wed,  5 Nov 2025 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762309814; cv=none; b=TLjpBr+lAH4KoFGiT49JSitUv7yjZmV6YTgCyujDQZL1e3fYFzzIffUscelIJQfta19sV80YzB7uaj4zkYDZ6PvnHJ2v0QhOna8kx2qEG1IddjQfwPVGzGr8G7UQr2Pn0gUGFFTbnPl/JxNdhWdi793n7mY5IlFQebBbpME1FDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762309814; c=relaxed/simple;
	bh=vRXnHxPocBo28384WSdw3iXhQ/vq7v7SfIVupTChdgo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=HwNYjhQfKfKQ+SnAo03V+xp7FzUgai+cjnZdCXbvbC9a25vBhMsX3lQqhDW8Bim63SDQbu0LD+LPz6TNlWhauKzEzj6wGN7W9WyAkjqwnw1oh7d3QQ94RnDf8yQMkl3bjR0m1p4HiV9QvuvOuH5dCbp2uflIiBEfL0dLJe1ArbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EmGgNJo3; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b8c0c0cdd61so6007113a12.2
        for <linux-next@vger.kernel.org>; Tue, 04 Nov 2025 18:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762309810; x=1762914610; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI/b88ow3hSozBckff4UDyMXYYjfxqm/2EWcycNRnG0=;
        b=EmGgNJo3dmEjui1PLb5HosGFaB+tARKpGDaGGoTkGWUQNuylygbTJBw4LtKdtzUYSL
         SWq6SLk6BnCO+yNwBaJpkQj+IgPe7THY5ZkDPhHr8QxLmEjlQAmtutZkMitnuWMLPQmx
         igSjPWabRJzQLwb7V3z4i/pIoC09IsyJ7WyCIuaj8ACtumUjiKp1WR1K5FLTzZOD+bSN
         rilHO50ntIFI7OwlGS1ftn7lhumZPCB5F8NWA1W/ey4GYBShSlz5rlWhTJ3BA8tuecCJ
         s8b6+VBfr917MEVYe68Gyuf5p9xL+LgIjC1WWRIBtdXOOxgdBg20sVUodeOawMsOXWXj
         lRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762309810; x=1762914610;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sI/b88ow3hSozBckff4UDyMXYYjfxqm/2EWcycNRnG0=;
        b=s20Mw50ZcwkhNErwqdRawmpZj4xKsEJmvMcCePaUr2DIr622QFCC8KbMMKqvc8Z1Nr
         raqQJHssFLzV6v1hJFGgIT5BgqcSZTWZ/JlmNMXzNSXTEzB1ui9pK62UGFCuj0XlOwb0
         mgtf+6t0XPuQF1IHuC7r6xqbjY3aozxWSNwM3zZ6YwnUzdlT4e+dZdKxf9ntcquyqQ/K
         R5fr91FifsgOmXdqVkPceaXagMq0eTjFfWOPp4Or7r4y7W+lo+OLQ4W2qBjQdJCaIatn
         dwXqodOTJjLAazwZZkNMiw6wL3ilmaL7zJg1LkEcJNBJF7qaJwbtjr0/d5zVRn+sc9b3
         UsvQ==
X-Gm-Message-State: AOJu0YwfOUCUsz4RoDoW56i3CN49bvoesBPVUyEQPvk1pLAOM6Sci0VH
	M63uAAaqh91bueBwbzSAc3VC8+B6JIc2ZG98nYmDgPc5cYO1jdPHM0M8ccFB7ytyjzD/6t8N5jU
	vZa9j
X-Gm-Gg: ASbGnctU5DO7CTQKY07WRMIny2AWECNAan6Nh07TsGF2tuyo5gtq7zXVrAJV0C34WB6
	33iiAmRZfdHV1Y+oNzLDhoVWJonJYdwvQsIC8LklUV/n2DEv3GdGMBkpcWtDCczxDrfjWcB6QJB
	IIBq19lit3E4CxWzzZFFCt4VA6KNx9FPlrY6hBhm5YEIChKkf5sFA2DYP9B8/jmb74EV0SMnmTt
	I8qwLBTRBrQklLGC4FbCDby6w7vCT2T0ZKMBWcWI6VEFfrhZFZgwNBmmkdFuDk6Lmx4lGIR3Zzo
	iWzqAtoW2sThWV+lfkYiDYJqiqBwRddR+qkfSjzGBQ6irT+L2A6GcLe49oQWD1deG5c+ONX6O7i
	EGuN8YH9y46NeTmtIyK/2FsPagb/qJ0oz1NycAu1pEiI49kEc7ztt0WTk6MpESFo1+87haw==
X-Google-Smtp-Source: AGHT+IGgbkaMvZxpXI97ncMpxJ7emionxk2BBtPjjq6DmKGCccYUYHZUcL62Op16WfbEfgnKzQouyA==
X-Received: by 2002:a05:6a20:3d26:b0:342:3b8a:f33e with SMTP id adf61e73a8af0-34f85517f1amr1979706637.39.1762309809906;
        Tue, 04 Nov 2025 18:30:09 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2987e95sm3804259a12.13.2025.11.04.18.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 18:30:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 17490bd0527f59d841168457b245581f314b5fa0
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 05 Nov 2025 02:30:08 -0000
Message-ID: <176230980830.3944.17709133613458832916@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/17490bd0527f59d841168457b245581f314b5fa0/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 17490bd0527f59d841168457b245581f314b5fa0
origin: maestro
test start time: 2025-11-04 09:35:13.407000+00:00

Builds:	   41 ✅   13 ❌    0 ⚠️
Boots: 	   84 ✅   44 ❌    0 ⚠️
Tests: 	 7759 ✅ 5433 ❌ 1709 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:6909dde0f21f07610dcaa42e
      history:  > ✅  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:6909d4a0f21f07610dca21ca
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:6909d4a0f21f07610dca21ff
      history:  > ✅  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6909de11f21f07610dcaa748
      history:  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6909e09ff21f07610dcad1c2
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:6909d4a0f21f07610dca224d
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:6909d4a0f21f07610dca21f1
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:6909ddb2f21f07610dca9e6c
      history:  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:690a0d0df21f07610dcb879e
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:6909dddcf21f07610dcaa3de
      history:  > ❌  > ✅  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6909d392f21f07610dca1e35
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:6909ddd5f21f07610dcaa2b8
      history:  > ❌  > ✅  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:998dc5815603ae4cd3767a506a6f94b75d982ffc | version: 1
  Build: maestro:6909cacaf21f07610dca06ab
  Comment:  call to undeclared function 'topology_core_has_smt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in drivers/perf/arm_pmu.o (drivers/perf/arm_pmu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-11-04 10:01:04.226237+00:00
  Culprit: code
- Issue: maestro:998dc5815603ae4cd3767a506a6f94b75d982ffc | version: 1
  Build: maestro:6909cacef21f07610dca06c7
  Comment:  call to undeclared function 'topology_core_has_smt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in drivers/perf/arm_pmu.o (drivers/perf/arm_pmu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-11-04 10:01:04.226237+00:00
  Culprit: code
- Issue: maestro:b25c03bf6acc100aaa7e71de7eb2cb32868b54f5 | version: 1
  Build: maestro:6909cb01f21f07610dca0839
  Comment:  implicit declaration of function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Werror=implicit-function-declaration] in drivers/perf/arm_pmu.o (drivers/perf/arm_pmu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-11-04 10:21:24.412980+00:00
  Culprit: code


This branch has 10 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

