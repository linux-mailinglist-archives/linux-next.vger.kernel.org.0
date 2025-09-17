Return-Path: <linux-next+bounces-8345-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE5B7C49D
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 13:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 945B032839E
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 02:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE662F3C2A;
	Wed, 17 Sep 2025 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cIJTQysU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B0E2F60A6
	for <linux-next@vger.kernel.org>; Wed, 17 Sep 2025 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758076219; cv=none; b=Fl1y7kB5BAB5Ss4OOeeYqMpaSPDKeainkWjrYfUqfVyluaDI1X1c4dF0LTC9vVbG1l37y29cnQ2IXFgp4G4oTL78oGZ0JB/o6tkJv21F6ZKrq0L3uak9c6WKyoQL8fhoA8NupSrPqqRd5sjgWKf8S3wYDo6SQ5ZZ5BI4rAaK86A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758076219; c=relaxed/simple;
	bh=TzbUTg7BCMQMNEvzMICgD39rTb3gvZLNea50YxA+C4M=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=WtmbDnEwjypW/8JqFINM5A1N+zvGXl4uJGFQlLbnwrpoWdV+PYs9NNyqLDdFLXhN1xoUZ+NQxTkN004MPftZwQ0RWmtIMWvR4k1L+9A5hW6Y+iUX+OhqRjsNpjrs3Izo2akYCTnIKcW6+fPa0mjKuHbJ7H0aEmIcP3450MXrvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cIJTQysU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-244580523a0so62419005ad.1
        for <linux-next@vger.kernel.org>; Tue, 16 Sep 2025 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758076215; x=1758681015; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipOo1ed8eDNkJAQGRq3EDLm+APcicgj/8g5obxSAwLg=;
        b=cIJTQysUMC6Y0yOdC8OXI4WJBj82T7VOgriOwiqmEiZ7HNJ0nkpwqhOWJiYsrXbxPt
         QJxPwv1eQOv9ShpXftmBi/t1YGLGMex/YxpV9/MvLsBTwBav5vgcUk3Lc2gCodRhEL4T
         fPW124U7FIX73sgKWIpdmh82wv7dG8GzrdCHpjeuGqKdV2upqb0YLjXnJOa2WYTUUa+N
         Iy8D3GkzM8Q8tePeQYBG8RT2xZATgWQaTGEFQFmVrhedk4HC7PZQav6Ihl8PX0LM27AS
         VAFD/8gzkchcmRslxLi4e4nXJjfjSHuSbn0/158wLMC4wgQ8ZUSPDE7P3A1y4et4Bec2
         m+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758076215; x=1758681015;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipOo1ed8eDNkJAQGRq3EDLm+APcicgj/8g5obxSAwLg=;
        b=GbCyTUZaFEogF6f3q1hVJMXG3q5AETLzIYYDOUQqxf0bPhxAZ8aFJjst6PLj3Gx1cM
         Y4NE0nI+3x4fZhqB0A7zwfl09wLNEuHTiFK+P+JuxdBm6gSgxIsvnGnla9JK1xf4FhUQ
         fwdK6ZjZDONJNvDMTRZwFfVay9E7rU13TX3ZmFMld+5LH6TMadpACsP+CriS1pjO5SdH
         WvJi8IujHyqf7Rwny8uAyOg+PikOySOl9Ygsx/erhXdWAxX3NZQxSk0W2ZlI25QplCYu
         BNHTg3ElgIK1lUNDs2L4ohP7bxTx03cC2Sqgk9lsABPnQbfnhsFbtZCl3lgFSEbNNrPv
         oHVg==
X-Gm-Message-State: AOJu0Yz9Ri/GP1qA97oNYzzgNHIbw5pjJcI7SuHahnQTzXT2vdu1Eb20
	54zIygR94zefxK/Prka1XJUSfw+sUZiX4hfSls28YTXSxkWIByKUM2DZ87bqiZTjd7Sevo0g7Je
	FnuGwMDg=
X-Gm-Gg: ASbGncvJ+y2CN5ii++9x8VO5dFVqqIH32NxC72tZY0b7qb+AQIVSTNCn0ZTKkiro2Vp
	UB/52TY4vtwOt6Y7+uEewbROCcg7H5czDubgxxdv3n8qyNyZiD47DuW6bHZh9rilCuIKFcCnM3A
	3wt9USwVwb5YgkgH2/baFMjrZj/rtkw98NGqc8kwvZsvMNXAAPFaWnceoBrGumy171wUtAUF7Lv
	iXdqBH56aTMRL5FnGqxD8nH/9rywLHuEopYptjCDUZSq0bQvHyJ6wyzU8ONWCFlxpoDFjn3sFcw
	9W5rnbs9b36f502objNeB55kpJnU9McRP3CVuVu3Am8iiFKw7dav5BJYHeqsNafwv5sevjs2mH/
	3ettLa2UFNDd3aypN2SIKM/IlX6E=
X-Google-Smtp-Source: AGHT+IHi0QrASgAsf4UktFSqrCYkae3Y/xIXgajgIUVpfA7mVeVqiSAAUr9I1AzEyBmHjkWwG/pb7g==
X-Received: by 2002:a17:903:b0b:b0:261:cb35:5a0e with SMTP id d9443c01a7336-26813e01ac4mr5776205ad.57.1758076215282;
        Tue, 16 Sep 2025 19:30:15 -0700 (PDT)
Received: from 325ff4dc0e06 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2680971b4fbsm5040285ad.104.2025.09.16.19.30.13
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
Message-ID: <175807621331.123.13748059294476052366@325ff4dc0e06>





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

