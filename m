Return-Path: <linux-next+bounces-8344-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA02B7C5D4
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 13:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F63D1894BA2
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 02:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAC219C55E;
	Wed, 17 Sep 2025 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="etG5ZISp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80D32F60CD
	for <linux-next@vger.kernel.org>; Wed, 17 Sep 2025 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758076218; cv=none; b=AiXqRqHCLyPcGzTjTCrjajMhVHkyC3WlBuXajYScbULYvxAUdqVwuvkV15GMDFgEQsn44AIC5PoFyNajOGnmcJEy08nKYdkWmK2lD3x0EHaXlo/eK6hfwmmyhav+fmZa2mxGo9+vcN4OkEh+qXaNOJOCdFcXGW+nB+/F88rj2i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758076218; c=relaxed/simple;
	bh=TzbUTg7BCMQMNEvzMICgD39rTb3gvZLNea50YxA+C4M=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jorw+AaE+s5cmZ0M84fqT2ACyKOM+E4At0RhVNtfJ7NOBE6BQYTn1KWJJK4U+oGyq1vOt3cogaEIvpzDbyd5aBTPpr3ll+bl7pgBkkIS6dMCD2TbY31ztTKrkWqWV4X7NQi2xhK251jg0yS2rnM/QXIE/QgRPFM8hrT0wRcasRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=etG5ZISp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-776df11e5d3so4073445b3a.1
        for <linux-next@vger.kernel.org>; Tue, 16 Sep 2025 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758076215; x=1758681015; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipOo1ed8eDNkJAQGRq3EDLm+APcicgj/8g5obxSAwLg=;
        b=etG5ZISprmUG+UTRlDi13HfVEcHaJ3/rv0EWILkENqxjYW0Vk+VGF4t1nppGGfQo07
         a9bIZ3idn4bka0X7Ct7en8wrbf4e4aKngTpYmG/A/NqHYYLAmz6Gb1maO+jKCblQ8Bbf
         orGRuD+oQ6HfCAdJCWfTOuxHAXtYqH09yw+YlEMvsu4dUKtzWAWR0JobSc1mC7XbHEtB
         mNcKJvgoMcSte75L59A8kXWXZZMRkWpidNwS7Zbnz6PyOlI+WRos25Y7OYLP6YRVImvd
         gkLM5rMai/oPdbpYiWK3LSOgPsxytp7vAipDZi7CMJ+rMiwNEpOctV4DmSGp+ue4N0AC
         UYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758076215; x=1758681015;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipOo1ed8eDNkJAQGRq3EDLm+APcicgj/8g5obxSAwLg=;
        b=Vp+dfwveZcc20tNsNaGQQ+4cn5C+Oa6sbwIQAt/FKtibnvu/quzKPfzkNwIfZSmj3t
         tzQE0Nl2zfbX9fwOZAcK9s5qw3iapDMmuiCwitebruxb77cZxaSuTct80OvSakvQ9xR4
         hh14Vq5KQDaTpgLzAsL/djAOX4CCxSqCmVLpMhrQoawxtJu0k7J7ph9ZbuevQV5stbi0
         NYev1efFMzRXt3D8da/IUWYwW35Bn8rDb9U0n7152jeY9ivLG0jzYHx53QIJmmd/4wvD
         Jbh1uIifbCdwj5ILwQ61VFq6xT1k1TBS1PcgDpTXbRoiA/LF/NgY94Daq30qMnzk/36Y
         5Vwg==
X-Gm-Message-State: AOJu0Yyu3q1R/2dySdlBnD8xO2wUOzoK871tt3i39HNx2g4TytnyusmF
	/LR0c6Q0eVHxEuEPPgO+bPzuJkCxeWzNID9RPxMswcApTvK5my4FsADmcAHRq9YMy1Wvy07RPf/
	pzRj1oDI=
X-Gm-Gg: ASbGncui08jOFlRR713h+RpvXeNe0phNIctipeHDtqPUrguEClwpA6HRKx1YE7B7MX0
	edfDWyk6StLUeiYdZq1Q7GESlhM/4gUYMB1pXL5h4gekNKh1+yR2oqr6CMprx+JnlM0GfnEz4Zv
	lVwd9x4eWWvBX/PBp6DPQQ2BzsYPEqYFaVpGj2LtFZ3EaYZ3uPxBbBrRUqwXbpwwtSl0IMOfHHP
	N3757x/GilEK/jA5JaEvG1ONXIWm78vogPJ19qt+9h4sON9TGqaPifTi3nXs3LOuQPMj73tORkt
	AayVQ0d0cKp03wzEFIBmHZ5cy6NCs+1Mgo9VnSw0t4Bzg6ENNiEv0aOt1AcLvHirE+hsI8vs0Q8
	IQ6dedkNZcPM2s7u0
X-Google-Smtp-Source: AGHT+IFeU0umuauTYjp6IurgribmrhBK7OaZFdVMC0S9aHth1/tA8CdarYS1STq6Z0cNtQ7CEr4tJg==
X-Received: by 2002:a05:6a21:6d9d:b0:24e:e270:2f64 with SMTP id adf61e73a8af0-27a7c5ba422mr612708637.0.1758076214803;
        Tue, 16 Sep 2025 19:30:14 -0700 (PDT)
Received: from 0383ca870dab ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed275fb3csm891288a91.20.2025.09.16.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 19:30:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 05af764719214d6568adb55c8749dec295228da8
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 17 Sep 2025 02:30:13 -0000
Message-ID: <175807621335.125.17474632139746244319@0383ca870dab>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/05af764719214d6568adb55c8749dec295228da8/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 05af764719214d6568adb55c8749dec295228da8
origin: maestro
test start time: 2025-09-16 13:54:29.037000+00:00

Builds:	   59 ✅    0 ❌    0 ⚠️
Boots: 	  141 ✅    8 ❌    6 ⚠️
Tests: 	12880 ✅  558 ❌ 3725 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68c977d675b320799d276a1c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68c97a1a75b320799d2782a5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:68c97d5d75b320799d278e5f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:68c97d5d75b320799d278e66
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68c977da75b320799d276a56
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68c97a4775b320799d27830b
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68c971b375b320799d2756ca
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68c977dd75b320799d276a71
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68c97af875b320799d2784f8
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68c979ed75b320799d2781fe
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68c979e075b320799d278032
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68c9899875b320799d27ac1a
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68c98ce275b320799d27bd3f
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68c975c675b320799d275cb9
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

