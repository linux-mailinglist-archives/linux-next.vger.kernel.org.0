Return-Path: <linux-next+bounces-8369-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3ECB82A84
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 04:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A2283B59A7
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 02:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FB51FBEB9;
	Thu, 18 Sep 2025 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uLJzgYUy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211E71B3937
	for <linux-next@vger.kernel.org>; Thu, 18 Sep 2025 02:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758162685; cv=none; b=oHxj128fOTWxq8qqXSmI1hLRi8bcVZdojrb5ZKtEKYC3PwiQtt01XXNK4ECoxUux+6EzQQxW1c4qp8Yl9B5cUhEPe2PciGrqaxuUtsC4QY0mCJeTV213qMa1TjSji+GWdMIOW42mxko7a4CJqf4x8NwA/G7+IG/xkgVb1QKpKog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758162685; c=relaxed/simple;
	bh=0TOMuBQ8mgDt2kq92i8CET3TuGtMNCnbdJ9yECQNBTI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=WOgRMbjwWNOnTXrH5QL965i3NrFkFchtsyk4sVOApXzXvDbxUqa73JuW7p4UUOzAt7LEtaV9Tt7JTmXcnm4e9ysCEjYqCikuCS8cwQJEnsiCxKYk/pkW9BG8yHZdt61XTGRn7PDlOfJZEn1Pm+thAi+h+RLt4ySuiR7+ydLGuMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uLJzgYUy; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b55003f99fdso279727a12.3
        for <linux-next@vger.kernel.org>; Wed, 17 Sep 2025 19:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758162683; x=1758767483; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdBPhU7Ni/CoPSOWftH89nkVj0lUtK+zZYS4HFECzpU=;
        b=uLJzgYUylgcWh7Ijno15nC90gIgDFXx0kJIhrsOSs+pG1fHlglubd5/Z7mAQSVVMsW
         Cx/7W/vLXln1Y7z7VWK14+kcq98AcBhlRcp/fh5arX1kCVnPXJOyeqGEmIZkxgyxG6nj
         pHBOTJF+MECUIz+PqQAdYNwYL5oJaAFlcyDU6X/LIITIt/l2U7/cQtPsqF+pFk97suku
         Q36s9bGgoapUZVUGmMnqKJ02mqDlwWlKCN6ErIq/7GFB0EPC9Tr8Duxn3sPSgNthnIoJ
         1Pjxn/Cc5vopih0IYGXsGZ+yIXgzy4UiL4WITdDmL8wySWcrIbA/p03YJsMaAmhwOdys
         EBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758162683; x=1758767483;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hdBPhU7Ni/CoPSOWftH89nkVj0lUtK+zZYS4HFECzpU=;
        b=pqU40grFeSm9atUHDZmxZrfm7rShnWxfHsqIib3JJLI/cZeH5m2BtJYbP1ctl75lwq
         A9TdTMw1cPaF8SPHxY9Y0UKnv19Aj784Amk7PA2Noak8bQC749jT8nJM8ggRa91z5oOT
         FJ5gIV/XZYbLDyAiK0ArWrSHFzLv9ZHE9Dm4G2O7iWzlzvL+Vmisv4eRAjEBpFPGnVRq
         2t7wMh9RaTu1DZgR2TGoMCgFSj9NNPkdHATxIrVNOfBMJw+B9M+FXr7ye4d3LAaqS14j
         /eOoEPXsGk4eiXAN21uhhv8Ihf/MMRDU+JYi3KSQh8BYmRktXfQUvC1yGnQxbzKuJBAf
         bUMA==
X-Gm-Message-State: AOJu0YwSLW6nICp047F8XTSE/BYYxGGDgaUGUGB2NWCUk0COB8nPg0gV
	upTHZTZ2bMrcxUjjwzONEOZtKd4U9lVA87gsiYjbD35o42x03iV0dyERKpAPWeKx1Yb4R4ZHFqe
	PRoT0ruQ=
X-Gm-Gg: ASbGncuRN4mTKpDBNdB8nqQlgJD2AGB0rkd3xp6eWE0rlobP1nJxqGOGNTKrYT8viOe
	AKiYJBG4jv4eAZ+Dq2WdQEsp7UHzuLbkoynNN2n3aa5pbd3xgXcBgGmQK6CMOHqfwTp7Aa2wPVM
	JloDqXkoFM7RPFgOsFx7lLSeqjAw4Kb+y0/LrBRwazMhFClsLbZDfckNivAkPDfPOYvndmC0Cgm
	D4krFC9r8STMKACReGnGqbHAIE1AufpPdeqwdwSKuM4xA9mGeGa1a5Jv/0XNeRzdoKQrcqkdpIT
	gf7pR87jjeGLVY0u66sjICpHcqqGZz2Idon5SfSWhN2izEoKaIDfYC3LgMVJMvxJNukQUj4TkBJ
	p/vr9dA6dKCOEPKJ3Vphfu/j/T4A4SlS7wyI=
X-Google-Smtp-Source: AGHT+IEG7oICQI+Vn99QFnFdqrMHvK0N6nx6IaEVXwivPRSJe80X/pbzlndg5hOdGVRC8DmYml3wKQ==
X-Received: by 2002:a17:903:388e:b0:24b:bbf2:4791 with SMTP id d9443c01a7336-268137f231fmr50603245ad.39.1758162683341;
        Wed, 17 Sep 2025 19:31:23 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb7c1e4sm761015b3a.18.2025.09.17.19.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 19:31:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - ae2d20002576d2893ecaff25db3d7ef9190ac0b6
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 18 Sep 2025 02:31:22 -0000
Message-ID: <175816268172.75.13793092659526897947@1dfac204f25d>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ae2d20002576d2893ecaff25db3d7ef9190ac0b6/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
origin: maestro
test start time: 2025-09-17 14:54:22.313000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  135 ✅   10 ❌    7 ⚠️
Tests: 	10674 ✅  391 ❌ 2766 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68cae0a075b320799d2aa233
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cae23875b320799d2ab393
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68cae0a475b320799d2aa29b
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68caefbc75b320799d2ae202
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68cb3fd575b320799d2c21a7
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68cb1b5775b320799d2b8225
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68caf72b75b320799d2afaf0
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68caf70575b320799d2afa15
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

