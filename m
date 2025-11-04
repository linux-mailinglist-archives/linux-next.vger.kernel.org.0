Return-Path: <linux-next+bounces-8808-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1030BC2EF89
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 03:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B0AEF34A2DB
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 02:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB5D7260A;
	Tue,  4 Nov 2025 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="E6VHM6t0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614031A5BB4
	for <linux-next@vger.kernel.org>; Tue,  4 Nov 2025 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762223413; cv=none; b=TC98M7pqOTsMCekOgu5FYoyUwkm3FblZBbWZ7Qby+bw3NFbF5pDPCtu2YnW1RQbPBxY6nD2VPc4pHQNDuAO5knIbdM3miBvyIHYId60t0TJYVEZ0ufOn2d/zvvt/T+zWJdZ+L22QlKX+cwk4M/lDb8573bFSOgKoYo1PzBRDQdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762223413; c=relaxed/simple;
	bh=Pfg2Xnr0v3rWIxHIQXyH219murpdxmqhB6M+MsNTekk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=G0459ALO25+M80Q0eWm8Moj8NKRgiAaxNXUWT3WONntBhvcO15lpp1NJx2O4ygzH458AaRBfGOVoYzZc751Mx5ba0lMNYp+HvP9xIQ8xPj4Mg6LfFAQEZ+CqHEPOO5p688XkD6RfqU1HbRZFbJrREujsLYsLRthIf/B0aEm4OlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=E6VHM6t0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so63060995ad.0
        for <linux-next@vger.kernel.org>; Mon, 03 Nov 2025 18:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762223411; x=1762828211; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQiYIfOgDiJKDi2jx8TLiVXPQ3j6BlIwkVCUvJ5IlKo=;
        b=E6VHM6t0LzYMxWwsFYMrWMOXPttGi1fi03AtW6CRTy1EzsM45HD2m/M1WadlB8xkqT
         jeWl1TzpyDYOQDQHMK/r94TXUc19T5DIfG9AOYYVAYNcZjv+/4pD+UGGe7UQ+pxUBogI
         eSk1FgsKIl9yJAgJOLDnch4I8/C+vsbo2cDxF5MsVr2KrLj5xkKoBsByYwGkL0RKU26D
         39STJF19o14bX/+Y3fZRzb5b8ZYB4PaXC61FNwilRy2DyUUbCpt6pf/9i0AlBhNybwzs
         HTsulIvyNn/Hv6L/Pit8AoBWNCDJoJxQXBwUAulYiqIuT9EPhQctKfWSMUvRrqga2Z2M
         0E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762223411; x=1762828211;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQiYIfOgDiJKDi2jx8TLiVXPQ3j6BlIwkVCUvJ5IlKo=;
        b=hm/mDpW6ExyVQGyFkbmEmeAeARGZ+A73i1a4cMgBviyY2HBKCDlYSMDlwtzaj2N//S
         CN/8SP/K+eemv0UKQqX4fl6uUWrwtFDucuxwwpjEI6sguVkHumDGzUm2OJh8+IDJYhGz
         43f9D2D95wOpfGWdV9+6nv4okE19e/tiwWw/+em2e+WS9FR3exdX+vTJPjMnAmlHfTIM
         y3MpmqW/1VN7w1gAAzvxbt5rKmYrwioXhmOs6T0AdT4m0Hsa+eeNfqrhzyLxUvBmXUo5
         1Msw5Im8qvsZy2/OQpefQEG4wzO9x/AjuzaULGOkfUI8557zZ91EUyLarEM4l7fmJ210
         fu/A==
X-Gm-Message-State: AOJu0YxsbSp9SQfVHnZ0kCsiEDOVr0i1vUQL02WEr6J49E6brqeRuY/F
	vRKbINzXTm5o1c0i4/Jc7RNQTMdHDlfw6Ba7X9oa1BWdPTS6SEY4rXEfpG9SCYhY5R0=
X-Gm-Gg: ASbGncv4NDez9xODNSf6WvrCycqR8w6/VPtqilXIZKVb0UsquSnpQuqA6evWXTNpO1W
	Ve3ABtGxfohPT2NZdEJIdO0OEyTONufdD5d7fKDjpptnN4JB+sYUQfj3Pv1f13pxA1GzA968NJT
	WuAFD6BAY9ChPmyUXLyrxCCVmwc6J2LMfqLKdNcMNpWmXUjIc/RmQ1azn6gsyaSTVtTEb2SUKbW
	Al4NzzBG2QA+5rLht/W4iGsfN3gZobGLrW3wxlEK+I4WR8cyCH3DaWK9ReuHpfPMoJCCzdnVD3n
	93MUs32e8NWU8YdItvSIEyvPCejHIeZQ7P+STm/hWa9eHG5RfcAcnKLb8hw91db8MLRhLWS32Cd
	UW8RVnq2fc8OaLNAe4fHx4YSEceo1oZWST7wPDj9QGuVl0gH+GFHFrWH+HojX0T/ctZTuuw==
X-Google-Smtp-Source: AGHT+IFYAsOF3E8Sz6zoMox9CiIdu06ER/+MBBfkd5AK014VFqS5mf8Kpo9eeKrG1FqZ7uD3qp5UCA==
X-Received: by 2002:a17:903:24f:b0:295:24c3:8b49 with SMTP id d9443c01a7336-29524c38fcdmr182415415ad.46.1762223410563;
        Mon, 03 Nov 2025 18:30:10 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a547afsm6506885ad.80.2025.11.03.18.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 18:30:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9823120909776bbca58a3c55ef1f27d49283c1f3
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 04 Nov 2025 02:30:09 -0000
Message-ID: <176222340923.3484.7243004938542639873@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9823120909776bbca58a3c55ef1f27d49283c1f3/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9823120909776bbca58a3c55ef1f27d49283c1f3
origin: maestro
test start time: 2025-11-03 05:24:31.430000+00:00

Builds:	   44 ✅   10 ❌    0 ⚠️
Boots: 	   89 ✅   44 ❌    0 ⚠️
Tests: 	 7418 ✅ 4736 ❌ 1400 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:690848369df0fb426d1a52c0
      history:  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:690848369df0fb426d1a52f6
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690842bf9df0fb426d1a2281
      history:  > ❌  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:690848369df0fb426d1a5343
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:690848369df0fb426d1a52e8
      history:  > ❌  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690842bb9df0fb426d1a2256
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.



This branch has 10 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

