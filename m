Return-Path: <linux-next+bounces-9018-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E3C5FE5B
	for <lists+linux-next@lfdr.de>; Sat, 15 Nov 2025 03:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5420E4E06A3
	for <lists+linux-next@lfdr.de>; Sat, 15 Nov 2025 02:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40A81BC4E;
	Sat, 15 Nov 2025 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Dyt1OSX0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A209C14A60C
	for <linux-next@vger.kernel.org>; Sat, 15 Nov 2025 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763173825; cv=none; b=h8M2ltnPk9sG/xBaKknj3mat9sDX//HMNvVwa/cXJW1pAHoNzs3Jvpo8ZmgHvMFqzgF0qx6dtNX9NaJ7rmVe/ys4iztSvVzvc9H94H0o03gS2n2pU5F8cBGBi2U9T2va6tJsniMl7C5sSy2X1DxbElkXZZDic237pEl7rw0ZtKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763173825; c=relaxed/simple;
	bh=6y9CzTVpkyq9H2ekjgY2Kuf2bDqkb5cxg3lTlFLYE6o=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=IcpKhe7Vwury5JYxzQJ1zX0cR7VIPdqcoqU92FEyuYaDXG9ql40rUu6XthjCjxvLw4IFf0MylAoXJXMzf8iJkqSisCTPDpF5T/6kjKf8lSNCt4b2hxbdauGWgVD3Vn2Wvyi+VvI/82Am7mjuCtnFwhYBnZmU1WuLb/0nwtVR/E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Dyt1OSX0; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so1920776b3a.3
        for <linux-next@vger.kernel.org>; Fri, 14 Nov 2025 18:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763173823; x=1763778623; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZMPM3Qbe7sJu51Y5+cYuOXpdv4/PC4PJviYQBvT1OE=;
        b=Dyt1OSX0QW/CsggbfUlWom+VGOklzx7fYbtkXlnmLw5YilqT/zzFrBO8eI8iwuFA78
         hi1AUr5KqysDZxMlSfdz5NVcCXZOXqk7qLQvK8mJKQG9hzAocdq624HzG1gby7V3Mg9t
         FsEkV6raWrdQ9yGSGmGMw/NJf4Vkauy1V9Fwa1grMqrcgssRPtYF23DLgVHo+Ghlqcpv
         c8ztUaitjRtJ4RnOjgV6JLCgm9R1in87M2GRqkcZGAInCtqvY+B0bhbLUV7jCMHsbXNM
         ZusApfsBNM07V5CRqYbu7sIuseRdS8aNTfVx2XG5aVQqFalLJl+NDpdqvWSODsLRTt7t
         HBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763173823; x=1763778623;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZMPM3Qbe7sJu51Y5+cYuOXpdv4/PC4PJviYQBvT1OE=;
        b=md/11IlgJFC211XOm/lSZ8nEAyBgO3paWSOOHoM6ORVB7CJN/nSG7SJyV4FryXahgW
         7lJWE7EXiaQeHQuc7vSummV0l/AKKs2EKvgf5yLgiQPEeZS171uUeXBeSmVAQyLJQLE8
         o5FSs6ygSy7jk71EajuczRowIY32CIXRD2rUblA6Nzwc44kgqFH5bIIBB8A1r8qRoTQo
         Cb9ny/haIawLQtiiVfm74NaLbYRDSA4W6dvPPAjJsk1o0SZ9FXJxysFIHaijSKO6czSD
         B9IytgExEvcq0VUnBk6bqVZaubX8uTAexBCx7A5pgrcWGS9CB2z/E6+Equ1nlsFuQKbz
         5JPw==
X-Gm-Message-State: AOJu0YwjetC1/mQcTWKU+O9c7W2PahXlMmVTEUcFvD9wLZlsxLsvC2+D
	LfScsz0LuUHBla/pIHV4tlG5EtZ+icbPj1aiK3v0Xl1STQLC8NYEGYHc+xVgl6U5RfM=
X-Gm-Gg: ASbGnctCBfkOaT8Rsabc8My0CR2CMVNcM85RoktC23oqx+Awjgua2RhiGBe9LxiE8EQ
	wLTmcA3EUxYiIcIUB8uZIgRvf9D37PyEKH3VctLm0ENKX/M96DgCVKyed6EtePGW9owXJQAWUTT
	z6nXpouRLKujxwrlTns3yKX7Q6TYpfiASfeHKYKe4L7PlIEmc2hf9BUAbyd9hlAvdpQFTV04a/X
	YMMcnt92ykN/IS9zwpNM1/ik+BJ/pscraUXwWcNNO9v4tise8B7GuVelVz7ygnp1awszc4mWO8J
	4qkNblfpwV2tp6v9lUzEuEgsVqZ2hsMH4mUgOgd9p3fCTZwLGJbcvSAivXnwGjngQ32lfpyU0E1
	dJ+8eAryAjsHHHoHmMC5rUFoWUhYHmMm4IVCcPDxRZZALEa+BQuP2sNcwKpy6eEwzy+/RqokLCu
	F3VrUJ
X-Google-Smtp-Source: AGHT+IGmZTtjo1fbbihDuSKxalI6W7jTLEgRQcZuIU/W8k2ds/Ao1ieh/igX1f+aDIsSHWOadrwRVw==
X-Received: by 2002:a05:701b:2601:b0:11a:6136:1f8d with SMTP id a92af1059eb24-11b411ff15cmr1549902c88.22.1763173822620;
        Fri, 14 Nov 2025 18:30:22 -0800 (PST)
Received: from f771fd7c9232 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b86afe12esm3909092c88.6.2025.11.14.18.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 18:30:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0f2995693867bfb26197b117cd55624ddc57582f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 15 Nov 2025 02:30:21 -0000
Message-ID: <176317382115.770.18263574155514261638@f771fd7c9232>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0f2995693867bfb26197b117cd55624ddc57582f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0f2995693867bfb26197b117cd55624ddc57582f
origin: maestro
test start time: 2025-11-14 06:09:50.737000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  147 ✅    8 ❌    0 ⚠️
Tests: 	12095 ✅ 5566 ❌ 4591 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:6916cf762fd2377ea99f0628
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:6916cf762fd2377ea99f0637
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_2
      last run: https://d.kernelci.org/test/maestro:6916cf762fd2377ea99f05d6
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:6916cf762fd2377ea99f0630
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6916d01f2fd2377ea99f09a2
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6916d0d62fd2377ea99f0c78
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6916cd292fd2377ea99ed8e8
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6916ce812fd2377ea99ee76f
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:6916cf762fd2377ea99f05ff
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:6916cd1a2fd2377ea99ed84e
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6916cdf82fd2377ea99eda91
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6916d9fd2fd2377ea99f4485
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6916daca2fd2377ea99f4f30
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:6916cd222fd2377ea99ed89e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6916cedd2fd2377ea99ef1c4
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6916cd2b2fd2377ea99ed906
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6916ce8c2fd2377ea99ee794
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

