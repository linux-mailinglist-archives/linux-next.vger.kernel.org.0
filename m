Return-Path: <linux-next+bounces-8947-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ABAC5570B
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 03:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4EA84E202A
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 02:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33382FC873;
	Thu, 13 Nov 2025 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="BNgPJhcW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299C12FC866
	for <linux-next@vger.kernel.org>; Thu, 13 Nov 2025 02:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763001035; cv=none; b=SkhskIVUuXk0GAuW98zRCbYyjHSzseYSy96hYa5obXM+dNmNoDPOyUOj2j2xxNns9CwfISBMUuU7ReXTEkH34u4BUkgrSk2fdx/Bg/IG7Uh/XenQrqRv2TKTF9OEuKa4uQ1VmJKwDdWuGJ/oTreMnlCT9L4NM91h4NuJnaq1bFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763001035; c=relaxed/simple;
	bh=mvtYC7sXErw6MVTXvuyTkmrjYHfiJaSY7uoidF/ERHg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MPfwZcB+acXJabXWfUGQbGgeD4PkvjXsK8QB+JfeN9eSwcnGYvCRYQDqv/QjRwpKdu460xgALCJUWdCGk1NZ4WDFjCCHAj1O9SyzzbZBI2c6KfaUpGZRyk0rXhoykcwDSauxroDLjcimDepkRD2YU0M/qg+B92qJi1HVsqAfswU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=BNgPJhcW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-297e982506fso3068815ad.2
        for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 18:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763001033; x=1763605833; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNJcStpKqKrodsIi4i5i+noaUH8NjgwwqZthIZ613/M=;
        b=BNgPJhcWVGz2Ivp9XKNO+Nlmp/fhBpQg7rp+y+nujrTrY6GGL0ZJ6wylECK0iRMHQ8
         AM43Aw4rdtI7QvTOne+r4otsYmmcoCHTqvUwO53b996x99hKXXVU2oLC4OnSCqiznqbL
         4nNs4KvKbEqHFHPYWZ1wspYgly/igRXXSOlimlZVF9aqAr+nhUNOQkWIcbuKDCp7P8Z9
         isWJYIsNoBoZfwgaayJwgRLbdOz1XQnDhJVF0u7b4bUtAK6k1iRrMQggki7h+BSH70UB
         57TU9jbqpxwgOsIdVn70F2AtwVYSzjL5uLwN31/Kp/ThDaGAy/WDBVKX6F+QhGB5S/mW
         ERNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763001033; x=1763605833;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNJcStpKqKrodsIi4i5i+noaUH8NjgwwqZthIZ613/M=;
        b=G1gC0QMVRUwbZNlGDs1lB0P/1IGeNCCUD4eBbv2cqH7sC9kwNunBl02fzLVw8ERtBq
         N7niqpOoLwd4LZvPG3POG/Q0mgULH3f6zAjHbtLH14AMWVor1I/d2KyDTAXzgJLljRIF
         kJaYDHxdz6mQXCfu4nBAfR1fv+0ukLlsfv3WTzX1Fq6FAU3L51eToCTJiugbn0d4HHp7
         p1Q1XN9dLT+jrVMoOZgTlQCPcj1Aw+TB+mOfREVSJlroUCXe3bAbaBZkPHmB2hsahgy8
         vxmdxMizcsvwtON18TVomEPeJcUrpg138TZc60AhgdSnnQpx9a3/tYCIdq6UN1hRxCdH
         ebVQ==
X-Gm-Message-State: AOJu0YyBIi6eTH7ai7KPoOTd4QUlm6F+Yrk38DSOXpdWAa7FkuIFXr1f
	9eKhQyOSG0V4NmizZD4Gi+HNyThNrfk8aUvMjzl2fj9kjPd5Io4FJ3dxGtO3rNm5iVw=
X-Gm-Gg: ASbGnctGaE8i00uMay6DHL1hShMAbMMjXznAWrvMFEuMdhGR+Imej4auaTMEM8RS6xm
	rZZJgmERYRwB98KpgJaVp2l8sx3bKfqHcskdOzo8EtgdunRpZkF8Qq2WQSgQ0guz/3TUejrNW0v
	P1RNIEskjhCSE8zlQiXc2IaAUKBmCNXf5g3zqFiz0UyHHylrvxaZp3dukAupKTg+inPjcLA0+L4
	7cKc8hi5dNwWKlXSxVWASZqLDqLGMyCWYwcCOz95W3axP6p5lzA8NNskp8aKrTf87+Llo2HMzvn
	mioYwd7wLvNZx74xMzSXfPawcEwYJuJN5QFFHUq1wnazMvcaAPgBAjlLPxlwW5/++wsGB2hN1aU
	kVD8T/zs5zIxKfJXgaK3yKExXq5KGEoVqCWfOPiSJY1ipK9CW44r2apZXJsflkusiaTzgMw==
X-Google-Smtp-Source: AGHT+IHqoxfTnXBilmtn0R8n4aGgZoHrj2tnRANQWfNnooy4aD7M7KRI2khyk0bXOO1T5tnVhr9oxg==
X-Received: by 2002:a17:902:e948:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-2984ee01fb9mr59870865ad.42.1763001033347;
        Wed, 12 Nov 2025 18:30:33 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0e15sm5730855ad.60.2025.11.12.18.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 18:30:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b179ce312bafcb8c68dc718e015aee79b7939ff0
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 13 Nov 2025 02:30:32 -0000
Message-ID: <176300103212.382.2405284449512379909@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b179ce312bafcb8c68dc718e015aee79b7939ff0/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b179ce312bafcb8c68dc718e015aee79b7939ff0
origin: maestro
test start time: 2025-11-12 05:10:36.596000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  147 ✅    4 ❌    0 ⚠️
Tests: 	12196 ✅ 5806 ❌ 4667 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69141c9f2fd2377ea998fe3d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69141e8e2fd2377ea9992953
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69141ca92fd2377ea998fea0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69141ea72fd2377ea9992b1c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69142cb82fd2377ea9996854
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69142d7e2fd2377ea9996983
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69141ca12fd2377ea998fe55
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69141e1b2fd2377ea99914ca
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69141ca22fd2377ea998fe58
      history:  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69141e0e2fd2377ea9991256
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_2
      last run: https://d.kernelci.org/test/maestro:69141e832fd2377ea99926c2
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:69141e832fd2377ea99926c9
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:69141e832fd2377ea99926ff
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69141e842fd2377ea9992753
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:69141e832fd2377ea99926f8
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69141d0b2fd2377ea9990055
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69141ca62fd2377ea998fe82
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69141dcd2fd2377ea9990872
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69141f662fd2377ea99933ae
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69141ffe2fd2377ea999366f
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

