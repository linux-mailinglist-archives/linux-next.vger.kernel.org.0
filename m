Return-Path: <linux-next+bounces-8440-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C81B9400F
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 04:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E0F42E1A74
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 02:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A45134CF;
	Tue, 23 Sep 2025 02:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="bshQx+ci"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC39111A8
	for <linux-next@vger.kernel.org>; Tue, 23 Sep 2025 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758594622; cv=none; b=e1OmkQPO4Ljm6J1KBOtPwL0ofl3Y7nXDxL7bNZJz4K3dRRA4l1LLwrp9ko8IMZq8BX7wKPxkQXSzwiRpqiXGGVOCcBoRcT647wc/u13wWn8Cip7WuxhqLL89QbPFG6ShumZ7UT2Zv1LaeO7RC6XAjWJYvGy/Y+csk8EyZlpYDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758594622; c=relaxed/simple;
	bh=h4HLhThhLjpv++fFH77ng4tWHS+2gMoJawuCno6GVLY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=F7JcyA1kuNtpbu/UkzfaNiPWOgUUxlWPY05xDuyWF0fltLbm9X1DwKtQa13H9RoDJ+GKYADz7KpWgFJTbXgTVIW9+Czx0D51TrkiepCDr8je0taAH7EGpGfXa15Krol8645ZSfYICX++xE1nSI7MmQMT7hIYB+FEYIZopHZxc/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=bshQx+ci; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f2e960728so2353933b3a.2
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758594619; x=1759199419; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flFvsUyhjyhDa+MeLkR8j+I0MfJBbaGIdOagapyhBDk=;
        b=bshQx+cixjqGgxIHNlth0IKgWXo8umRF7u/LRKmUnL0g9+RgNOojQ+gjU3tLw3zHP2
         4Xxe87cSGxBB91yiF9qd7njdtVMnp63SeTObKhkDbYbdu9eyVzv0dQsyF7VhwE0kIQd9
         aQgTNmQTt07guI0TKBRkP3BRm3X9XQGMjK6qZIY33q74fo5VO5EiD9WVXvOm5aG/US1J
         jevWPrT1DRSF6lFY5PhRJ1e8Xp3KwBcrb6MuZHKDdDVxOJTLFiYX08TSRtUDXOfgdMsm
         wIPQs93banpuZYvs3p/p6MhyQuLyRb3gxUuV3syk33CVEjaU9Ze4K/AjAz2jORe3TYo0
         OEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758594619; x=1759199419;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flFvsUyhjyhDa+MeLkR8j+I0MfJBbaGIdOagapyhBDk=;
        b=lTjpIhrGs3fR5yIEeMDCjokUMVOno2FdUGawjnjD5OKfGJ8P2qPTdJvI+vaOjjxbcV
         ubI0boFzQ8PQXdnBVc7C4RKWiSyIHyNTd/LQoB03AlPjMYOVxA+Zb59RCnSGx8u18Ges
         XpwBzDNi8d+lxrH6tl3mnj2bThE44OisHsd3Ihi14tHY/82BqtNot+jXN2dT+gfpI2yC
         4Vq/wJmuRb941DZbMmnmolQkobk4w71raFh2ZnCi7yQw7n1z/aErkQbQik3SnWl/mvuH
         yZDJ4gLtj9MZywtHwzboCSuWq6MeBJw+3ZMYBuppMizXmDPwvAK0UmUMw+SPMkL7S0zT
         ztbg==
X-Gm-Message-State: AOJu0YzNYTQvTNasbv8crWmZNMdzUQVxsJC0bP0enaH0Rz1juMzESn+j
	DO98nzIymiVjdVHuPpt/a3CKdFMoNBXLhKG5mf23jGZY1twFyfAHv+VHmK+gNBVAX1Ry9NhOiM0
	YoXOo
X-Gm-Gg: ASbGncuPsdARbdASL4i50UtZAPzN6VnirzyUAn819x2VQRsTar0WBUrtYuxvrjeRniN
	Q/e4VU5It3dQXea/UgYmBO6l5nWFiCiItzhcO6NVDw7dpVIc8ROGK7aC0TxsSKXWvBmMEJD9hkv
	CADBYgXYhN1tF+awn6Rlj+P0f33njv0JrXvfAbzjFVTR89WdOyiJi+irM0bwWDw4KmvqzqSqBu9
	g1V9wwDO46yXXWzBGU/SvhQYdU7zK8jL7Uh6/Veec+nhMDQqvY3cHzhevaemdDLvGCR9lRs0xfi
	Mef4TxYCxwAXVOW8b/zyfqvXSPhSKSgp8XnzWoWWkJb1Iv8gqd8KV1XAW1G0Cj+CeFcBHRyoc4N
	mrn+4FLuuFt6hdx8C
X-Google-Smtp-Source: AGHT+IEUp9WYifL6+Um3Kxu7bdrZwrXVvbCTxd59Db9BrBDbsxh6OzdktE2WiYV00WHq1K1LFc1W6g==
X-Received: by 2002:a05:6a00:1706:b0:776:228c:4ac0 with SMTP id d2e1a72fcca58-77f538f7632mr969141b3a.11.1758594619530;
        Mon, 22 Sep 2025 19:30:19 -0700 (PDT)
Received: from 68eb32e5e239 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0d3aad09sm9958262b3a.17.2025.09.22.19.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 19:30:18 -0700 (PDT)
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
Message-ID: <175859461833.86.13030422432813772236@68eb32e5e239>





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

