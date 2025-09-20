Return-Path: <linux-next+bounces-8395-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C4AB8BD77
	for <lists+linux-next@lfdr.de>; Sat, 20 Sep 2025 04:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0EB27C83CF
	for <lists+linux-next@lfdr.de>; Sat, 20 Sep 2025 02:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567461E47A3;
	Sat, 20 Sep 2025 02:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ScNo5+Bl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1731155C87
	for <linux-next@vger.kernel.org>; Sat, 20 Sep 2025 02:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758335500; cv=none; b=Fyd2qXjQGww+wiy5UaA1sVy3eh+/yzRE/etJaVKCKWBGCIza20bf4X2vpm/mxVPrcwH1un/gfcMRP0sIiUKIsrfXaviVXC6bQdAerHR0VHPjLpC445Jxf0sFm4UQshYiZTk0IYxE+aVLx5MKleT/4tmV7+X48iXBaTk1+ggbeU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758335500; c=relaxed/simple;
	bh=4nWQQA8wYv5Mjy+SQ99u898YvhrcaCjZ3+cEpggFOPA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VdcG84KuFiEzA2T8xicSV0D/7d5PS1RAhE/eBlMEV3+zrht1vMHWHSfeq0tleqOF3cSx3Lt/hPrLorZ1lPS7wzrUxpY4nXdWOhZBPhu3F7vi6AXo4UHh+nsVP4LHLJe6Dzmzqnn0eceXmoMccGRSH9sl5SOXt87TuAT4ekyRSUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ScNo5+Bl; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso2559598a12.1
        for <linux-next@vger.kernel.org>; Fri, 19 Sep 2025 19:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758335498; x=1758940298; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3kjWqltEPAfprzlWKqn3DoaRj32kRQ7AZubMrlagfU=;
        b=ScNo5+BleJgV7lPgy7dcxo77S1548TbCQx14JsfiKLmbaK/ZGLb6Tr4MhTcAyGWcYG
         m/U1rK/FJKAAq1Il2KOk8fwkqiQqfnukSvL90iXFpGyUoUWKOJsc3BjigCwvrwBJwvkt
         MrK1DsyXOAGMnHj7iQlFHT0SpP+nJBb7IjCluV9875m4SqTND4ffkDzyJTp3BRAOu4CG
         GZHAsrS8AXpmcbr2MOTKL+L5wb8ytfItD24rOW3D1/yB1EH2/Sl5SWkPM3/okU7kuhUI
         yq/frfDomqCscljNqAL19SlDxeqmi3U09fSK40HRKcDQnr8UqQr5FbUSqainxrtCSmIH
         ANWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758335498; x=1758940298;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b3kjWqltEPAfprzlWKqn3DoaRj32kRQ7AZubMrlagfU=;
        b=lbyJNWZp9QpKA1cRLjzm2KN9o5ZDQBWDOAXRnICm+rXK29K7p6BvUreuX8aBYb+qpH
         fP1Ycmtw4owMIYA8oAhRt6XYp5EjYJ9IfuacWVSRzZ8SMFu/naCcAZ+pYSPcW8JjfJEY
         vV3lBKbGxOF+/Siw+xLFgo5ogdxQ+P67aIIB/Sv6MHL/HrhPPFgGr6ZWqO+5J8G82Fmh
         HnaDfVf2az4iawzsBlFgVJQb/dwPjQAYTCwHVFBuOLclPDPa9ki84h25/ceLk6oO6sJ1
         5od/lc2GOLcstlSuvEMveZDpmQx8qqPIve1NjRgv8EmZapdkP23OqnIUdCShxkXATr4Q
         D9Vw==
X-Gm-Message-State: AOJu0Ywysvg+2PADDsQQ0aRoS9i99f89YuSkWajp5FI7KWynzS52RQ3+
	8P5cKQP0ufomYG8RYuq0EZSB1kvX2puNlg0EzCycQS0skRBojeW7cB/2xxgFdZn+lfk=
X-Gm-Gg: ASbGncsX1Om0Az7ufZ9eNEgnWhiMwpYmi0ItAEiqerAuQyy5gjK7l3XssGJ9QvN+5Bp
	2EXQLwa/E0XUylitCvJfu3Y1T0wmZpQuHCTev/CcYr1QSyNzM+IytqfgYEN+k+GLMLlMZfJNvtA
	c8g0Q7wo7SM/9gVVwOEQPprq4eGWA7rq+kgZeCneyvGhWCGpG8n1FkAxksz4RQQqVQmeISfGBkN
	rvfF+z7vw/Kjgvnt3z3YjkBJNsDWfFMo4jyOB5hiO3x091x9U9ISuKNf5vKXp0BnYuOxroYhfCN
	HoiJlrAs5L/5BWsoiJVgTRJySSaVhRCDTTHlcmhv4fYp4dUIMs1lvyK414bnIIFrc3X7Y2kYP3O
	qIt+7IcilIJzGhgTB
X-Google-Smtp-Source: AGHT+IEad7+qQGSucLOswpnYwyvzG43b4Soc+QojtGpBqE/7PT0gSnFQLLZpoaR/IF26V5OvJ0JRtg==
X-Received: by 2002:a17:903:1a0d:b0:269:6ed4:1b0c with SMTP id d9443c01a7336-269ba429b63mr76662785ad.16.1758335498027;
        Fri, 19 Sep 2025 19:31:38 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26e80409ee3sm13688155ad.80.2025.09.19.19.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 19:31:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 846bd2225ec3cfa8be046655e02b9457ed41973e
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 20 Sep 2025 02:31:37 -0000
Message-ID: <175833549692.315.18290232346855742264@166871acc15a>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/846bd2225ec3cfa8be046655e02b9457ed41973e/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 846bd2225ec3cfa8be046655e02b9457ed41973e
origin: maestro
test start time: 2025-09-19 16:49:43.518000+00:00

Builds:	   56 ✅    0 ❌    0 ⚠️
Boots: 	   68 ✅    7 ❌    8 ⚠️
Tests: 	11946 ✅  550 ❌ 3258 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68cda16275b320799d30d128
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cde39a75b320799d320bcd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:68cda96675b320799d30f424
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh
      last run: https://d.kernelci.org/test/maestro:68cda96675b320799d30f425
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68cdbe1b75b320799d315c7f
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cdc01b75b320799d317073
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68cdadcc75b320799d310ace
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68cdbe1575b320799d315c43
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cdbf9275b320799d316bfe
      history:  > ✅  > ❌  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68cda98c75b320799d30f4a8
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68cdd3d475b320799d31c34a
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68cdd3da75b320799d31c357
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68cdd4ea75b320799d31c7a4
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68cdd4ea75b320799d31c7a5
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

