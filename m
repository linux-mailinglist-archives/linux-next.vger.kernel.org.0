Return-Path: <linux-next+bounces-8441-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55317B94012
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 04:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D222E19D4
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 02:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1621111A8;
	Tue, 23 Sep 2025 02:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dmxkpo8B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03397082F
	for <linux-next@vger.kernel.org>; Tue, 23 Sep 2025 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758594622; cv=none; b=lLl2fzsyXqGu+mKq429j/VLSMQwuuJeg0qTmQb/ArTHjl4rTBwbKBFLTs1sE1yP8T1qQt9D8E0BCpErLEOQc4jxetsVmXlwUg1zfWQ0OR6F+AtJdQmgvpVREqvJQcOUiERY+xM03wznAflNI6lnrZi/oe3TqzidXEdn7uZFtR7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758594622; c=relaxed/simple;
	bh=h4HLhThhLjpv++fFH77ng4tWHS+2gMoJawuCno6GVLY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=gWN983aTjuW3mwSgho9zTRrEiD1hAkow385NiEL3ILqBUDaJFiusPt1AN9d5MpRUWvNcdj2tq0STscSAGGOVe6cRnrllee3M2/LHaqbkofWQDY257sBq51w1ixD3hz76zb18aCzVoUkTcvyHe4Hy+mW7pfOJ2ll5iWgeg+NmzWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dmxkpo8B; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b5516255bedso2810298a12.3
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758594620; x=1759199420; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flFvsUyhjyhDa+MeLkR8j+I0MfJBbaGIdOagapyhBDk=;
        b=dmxkpo8BgNq6I4ZAZA3nRbniVXG3SDCw9+iTpbxX3XHQyuyXp7pgS5tSKOvP8/Lv28
         V80ltAMot/XgE4kSDpUT83DRb+Ice/0EE6m24X1I595jfwdeavbu1kSXYwed8pcS5Cam
         IB3hiBJyHWzSCgnSfh9rA1j5HNUHzwL3Zxyq/m2FNY3T5zaijTGE2WOBLH+fRZ7LS6JG
         rAxFhKzJG5P0Klr7MgFNtH+Tx0WUs8BzpP/OPzFFqlyVcBoydZoy4AncdTpxwOY/TGJq
         d3gbP56okyOIhcXOrB3ObYexxSA5WETq69k2NUBopq91xzHhjjtupmHKihJHet5qG8L9
         ec2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758594620; x=1759199420;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flFvsUyhjyhDa+MeLkR8j+I0MfJBbaGIdOagapyhBDk=;
        b=kGzbMCwM1E3hwZgRgvx8n0SpQaBLd2phDKbLjHTbTkG6NX2xeXxeXH/Nlt4zgNnO3f
         LKfNH9VVz1hEJrTQdrbOBOt0J8BQqTj0A/IknaKQ/1K9fPb374XuEaYTseLf0Ab24bff
         yCo6I0LTjSmo58Im7QJprtQ5GiRtZ6wQabsOEBDts21gWhmAja/VL8tfZX7YOE6fiRSE
         5p8gAcia2PZqaRcOuJlR4JTwOW1IKMKECRRpMZFtWolsEDONswDkctuS3Dox4W9b3oDT
         WkuywKRN371tMR1UEDJejckIlkYKv1iekbMFn4hIvKP9Zp0ZwJ9pPbRJLuZxeBz/MH0X
         9SiA==
X-Gm-Message-State: AOJu0YyATiEIve31a4E2OlvfGmGWKb8MyW1LIMrOIT0EEZ2UqpdjG6RU
	sRsRj2mtU+8WcilVj+b1EY21RItCZUw1IleX/9HaKDbY4raOKS6mT869YBTTTuFj1Vf8eUpYWzc
	NWJt6
X-Gm-Gg: ASbGncuzAnH6Qwo1UiP/Yc1nnsH2unXAmu93m+CYT3ZPYOmlIC8VmzwCiauuoenrbyB
	NiL0UV1rjW5fN8dgPgQWzkfWDrMYlu48OD44ioUI88QQDJzDBhyLfAmpNsM1FD9V5eu6SSKGhBM
	IhxmbyqQeJuGrHMunvDmH1UXrJZUWkovfREe4xB0OSB76DScSwA6sT+daa8ODQxT0MxUufJDS1h
	3n1CFGmw+h/u66pDLRXyqHzbKaWm5af72alzeNWeQs4v0UX6ebvPhAxGEalDibmnrBTNDsJhXrq
	EZpHYSQXSR9RH1BqWkv57xffm1qRgkaKQOhlMc6WbkgQ7jHmGD2YWx2L/KBAzj5kIb17ppGsyhC
	ePnmQdJ2g4EP1KnvK
X-Google-Smtp-Source: AGHT+IEBiJS/e3xsU0NWV0SzVbQGCFdfB7rO9b0v0rmrhkcBvOkUZ79J3e5qpVF4Zvh8mgabQWPSUg==
X-Received: by 2002:a17:90a:d446:b0:32b:d79e:58a6 with SMTP id 98e67ed59e1d1-332a990adb5mr1042868a91.25.1758594619965;
        Mon, 22 Sep 2025 19:30:19 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5524c329e6sm9612417a12.42.2025.09.22.19.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 19:30:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - bf2602a3cb2381fb1a04bf1c39a290518d2538d1
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 23 Sep 2025 02:30:18 -0000
Message-ID: <175859461836.980.6393430665706638848@1dfac204f25d>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/bf2602a3cb2381fb1a04bf1c39a290518d2538d1/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
origin: maestro
test start time: 2025-09-22 11:14:54.093000+00:00

Builds:	   48 ✅   12 ❌    0 ⚠️
Boots: 	  117 ✅    8 ❌    6 ⚠️
Tests: 	11950 ✅  469 ❌ 3622 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.pkvm
      last run: https://d.kernelci.org/test/maestro:68d140c175b320799d3729cd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:68d13c6e75b320799d372091
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh
      last run: https://d.kernelci.org/test/maestro:68d172be75b320799d377754
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68d1385775b320799d36fb23
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d139fb75b320799d3705fa
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68d135d375b320799d36f69f
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68d1385175b320799d36faf6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d139f275b320799d3705b3
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68d140c975b320799d3729fa
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68d13c7775b320799d3720c4
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68d140ca75b320799d372a00
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d14a5275b320799d373099
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d14a5275b320799d37309a
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3 | version: 1
  Build: maestro:68d1303d75b320799d36f179
  Comment:  in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-09-22 11:28:27.684743+00:00
  Culprit: code
- Issue: maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3 | version: 1
  Build: maestro:68d1304375b320799d36f17f
  Comment:  in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-09-22 11:28:27.684743+00:00
  Culprit: code
- Issue: maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3 | version: 1
  Build: maestro:68d1304675b320799d36f182
  Comment:  in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-09-22 11:28:27.684743+00:00
  Culprit: code
- Issue: maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3 | version: 1
  Build: maestro:68d1304a75b320799d36f185
  Comment:  in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-09-22 11:28:27.684743+00:00
  Culprit: code
- Issue: maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3 | version: 1
  Build: maestro:68d1304d75b320799d36f188
  Comment:  in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-09-22 11:28:27.684743+00:00
  Culprit: code
- Issue: maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3 | version: 1
  Build: maestro:68d1305075b320799d36f18b
  Comment:  in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-09-22 11:28:27.684743+00:00
  Culprit: code
- Issue: maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3 | version: 1
  Build: maestro:68d1305375b320799d36f18e
  Comment:  in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-09-22 11:28:27.684743+00:00
  Culprit: code
- Issue: maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3 | version: 1
  Build: maestro:68d1305775b320799d36f191
  Comment:  in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-09-22 11:28:27.684743+00:00
  Culprit: code
- Issue: maestro:76d27462ca9e8dd64519bf79c841aca15d98a0e5 | version: 1
  Build: maestro:68d1301275b320799d36f149
  Comment:  comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types] in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.warning]
  First seen: 2025-09-22 11:33:17.015411+00:00
  Culprit: code
- Issue: maestro:76d27462ca9e8dd64519bf79c841aca15d98a0e5 | version: 1
  Build: maestro:68d1301975b320799d36f155
  Comment:  comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types] in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.warning]
  First seen: 2025-09-22 11:33:17.015411+00:00
  Culprit: code
- Issue: maestro:ec1d28aaff2a1b8f5b95187d16e2791bddbb5367 | version: 1
  Build: maestro:68d130d075b320799d36f202
  Comment:  implicit declaration of function ‘F’ [-Werror=implicit-function-declaration] in arch/x86/kvm/emulate.o (arch/x86/kvm/emulate.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-09-22 11:42:02.688249+00:00
  Culprit: code
- Issue: maestro:ec1d28aaff2a1b8f5b95187d16e2791bddbb5367 | version: 1
  Build: maestro:68d130d375b320799d36f209
  Comment:  implicit declaration of function ‘F’ [-Werror=implicit-function-declaration] in arch/x86/kvm/emulate.o (arch/x86/kvm/emulate.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-09-22 11:42:02.688249+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

