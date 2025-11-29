Return-Path: <linux-next+bounces-9270-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C927AC936A7
	for <lists+linux-next@lfdr.de>; Sat, 29 Nov 2025 03:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E1E74E0F99
	for <lists+linux-next@lfdr.de>; Sat, 29 Nov 2025 02:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198B2405F7;
	Sat, 29 Nov 2025 02:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="DuOQi7CU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02C883F
	for <linux-next@vger.kernel.org>; Sat, 29 Nov 2025 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764383446; cv=none; b=E2SOGM4iTGfX836EfDsJInDVhjGqadRr7wthvqQjG2AzvmHWfj8F+qIGTxlppD5wVcyFT392rs+LBESnuI2Zy4any1sIqfNYdyg+D0GKE1e/jgQ6S6XH9YvY/BxT1nvwjXztGQFSmlvRI9VuVrH6XWbaY4M+y4bvWcwqgbqA+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764383446; c=relaxed/simple;
	bh=INC8Y8aARJqeYDllVMGs4BvCqvrPzkn1+77fJ8obeyU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=JBqDpK6PQBnaD/LPh3z4joKn/OUZBXmY+tH2qk3L2uAhqtmOJRw8oCc4HAhvm4wEpednRsewI/prWU/av5HAb+v3Fgjz5K4VIpxCroMy+OELBCit0RigeyIBGQVf2tGi1vt5Qpjz7ubh39ePRBsVAFqmTcTqBYXQD0GiAcRqLbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=DuOQi7CU; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bdde8f1814fso2018727a12.2
        for <linux-next@vger.kernel.org>; Fri, 28 Nov 2025 18:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764383443; x=1764988243; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oq58J+aSc4LhjXFuW8UyyuSnjGhPDV+kz9XM38zwvmc=;
        b=DuOQi7CUfOWnMmj3e1TDOgF52+BYZJOzG4Ml6htN15MwG6VWck9aEp7TVMhcE2bnFH
         VSKHobWFEcKoRVWNpA1yaG4gkOwynlaNX2LOFJbR8lolj7hJg3NsUIh7UVvKXMkVOspJ
         zxhVfBNd8Z6qESNW4n3NbWKdprH6tJhNUrZ8D38s5koSo4pj9yXGRwiCxZcpuPyGis06
         5nRA3Z0YNn0eSN/bw2vIV4FS2t0XLCkECOSzJ0sKTHmB/5fhwOyltmTnGMIQMSjW2r+Y
         hYHOqFLzR7cTude1TTAQ1VhQlLyC4b5aYnUsEExWbwJlwVa16Z1RuIARQrmtwvMoc70h
         os1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764383443; x=1764988243;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oq58J+aSc4LhjXFuW8UyyuSnjGhPDV+kz9XM38zwvmc=;
        b=SSkW6VjugbXCRU/o0trVPoSLd6j+7njKZMQ5KnNi9jhh+UitlTFvT9mUgBcJIbwcwy
         ZUKk746E9J7/NoMR9kjqRKtrKT4J9WZBPMw1koa3wn3WCHcvYT9f1jzVw/c6GUrXI/6E
         2JJlcBRHFTIJQ/i/7ChMKEbc048Y8NIW3fqhVmaDaa/t7q5yX3OW1PvAslaOkVUyErL+
         fy2tkikGOf0uAdUON5kpQjpJcsIQs85Ad9ji/pQUPMFwm2m02AaSS4LK1xS2zZakUle2
         IXjr86JID2j4Zjb6sYqYlJd4UJgFMXUDBqrD75Jt8skub6m3Jr72ie6yHlfUSW6wHht8
         5j9g==
X-Gm-Message-State: AOJu0Yw9+4nVX52AnoojTxts8fp7dkL3tTRv5t+jqwkTGjIPVcB3/mcI
	8rqiSsPA9bmASz8s74jOVgbmROg4ZcvFkutXAwk8McT8hcHm0R8d9lA6GghJ8V0Cndy/dsVOWz0
	04a8K
X-Gm-Gg: ASbGncspaCwI4VrkYpklWDJAc1bzoYPypQXVzKRR8tdaWqhkKELqGDtpDVZ77jLC4U8
	B7pTAhBLodXRSZqoC0WoYBIWhWfz6G5vDHPKi1/73MTGejmQIcGMM94cbnakUVUn7DQ+WMnA8UR
	Pto1Hx3iMUlw1YCX8368E5cKofkCSQBebgBUrnxJQ4s6Mb8HDacY9MGlQFevHJAkRBzE0UDMjJN
	IbxwUAUCIw7YjZ3G1xfXcU+ddONoSgGI2GVaTUFomyTO6QVCtKWciEtJ0lWsDcbkwijn5EVg/CX
	43ZqBhv6UWAvv4W84Wd7fWmlGDxVsPtMfX5KdmrbaeUSsdga9tWO83gNt76o1/txmoALvnda9fW
	aiUV+3jOmIN7FddBWyug1WOnMF80KBszNI/BPW2pwxee0pGNk5Ocw0rJe+gyzIvnqP5ZoOOvBws
	qwi6RWMNVM5sX4/5A=
X-Google-Smtp-Source: AGHT+IHmppL1khpO+s/q+HnHEdHjkyXkxwTpo1zEhBXsgg8i+Vl0VaviFZaTW2iPSuQSDQFppi0cyA==
X-Received: by 2002:a05:693c:2488:b0:2a4:3593:6464 with SMTP id 5a478bee46e88-2a71929687fmr18161648eec.20.1764383443451;
        Fri, 28 Nov 2025 18:30:43 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965b47caasm22558328eec.6.2025.11.28.18.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 18:30:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7d31f578f3230f3b7b33b0930b08f9afd8429817
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 29 Nov 2025 02:30:42 -0000
Message-ID: <176438344220.1674.791756338530108788@1ece3ece63ba>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7d31f578f3230f3b7b33b0930b08f9afd8429817/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7d31f578f3230f3b7b33b0930b08f9afd8429817
origin: maestro
test start time: 2025-11-28 05:51:36.925000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	   27 ✅    0 ❌    0 ⚠️
Tests: 	 5038 ✅  165 ❌ 1344 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69294fbcf5b8743b1f686b63
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-proc-ramdisk.proc_read
      last run: https://d.kernelci.org/test/maestro:69294f1bf5b8743b1f6866ed
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6929564ef5b8743b1f68865f
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6929417ef5b8743b1f681a3c
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692945cdf5b8743b1f683afe
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:69294fbbf5b8743b1f686ad7
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:69294fbcf5b8743b1f686b0d
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:69294fbcf5b8743b1f686aff
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692941b6f5b8743b1f681aa5
      history:  > ✅  > ✅  > ⚠️  
            
Hardware: qemu
  > Config: defconfig+preempt_rt
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.cyclicdeadline
      last run: https://d.kernelci.org/test/maestro:69294594f5b8743b1f68386d
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.cyclictest
      last run: https://d.kernelci.org/test/maestro:69294594f5b8743b1f683873
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6929459df5b8743b1f683886
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.pmqtest
      last run: https://d.kernelci.org/test/maestro:692945c0f5b8743b1f683a29
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.ptsematest
      last run: https://d.kernelci.org/test/maestro:692945bff5b8743b1f683a23
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:692943c3f5b8743b1f682ad7
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.rtla-timerlat
      last run: https://d.kernelci.org/test/maestro:692943fff5b8743b1f682bb7
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69294375f5b8743b1f68294a
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:69294629f5b8743b1f683c45
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.sigwaittest
      last run: https://d.kernelci.org/test/maestro:69294629f5b8743b1f683c4b
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.svsematest
      last run: https://d.kernelci.org/test/maestro:6929463cf5b8743b1f683ccb
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

