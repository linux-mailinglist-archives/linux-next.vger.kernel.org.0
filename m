Return-Path: <linux-next+bounces-8525-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E24BAB039
	for <lists+linux-next@lfdr.de>; Tue, 30 Sep 2025 04:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0851C1924672
	for <lists+linux-next@lfdr.de>; Tue, 30 Sep 2025 02:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1519421B9C1;
	Tue, 30 Sep 2025 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="18JO37aE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97977145FE0
	for <linux-next@vger.kernel.org>; Tue, 30 Sep 2025 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759199415; cv=none; b=h9dafinbkR2gOCd4D2vDWJ0j9INHqpMZ9frj6SijcBDHdDriFTHtfCmrG348t4A0lUinWWh26cVrcC84sFSKHCJxxbjZHEgzUVcSDv5WZgbZebp1uc3OGrMhqMlrR8PcpLhQTE+4oK1qRrsY9m226fYdr22Y+Ih9nTzAOHSsaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759199415; c=relaxed/simple;
	bh=ju6f4AiP3CWshPwQjNX3iUKR6jvWYBJApdGGhhHKcbE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MRCqBKJz4HeMeGvIUELA/KjJxvzpB1jufRcaU+KAvjWEZzpK6lEniO45QbzKrY1SFu79ag6rZ1fVhcYPT9qKQ/b6qXuZXj7KQzRCU5ccIq4b3O4ELTdP0FFgmJAunVU3ZEqN3/+Oi5dtOnd++MvLNwMSZ8t10rBj1btlF5+1apg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=18JO37aE; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso2294084b3a.0
        for <linux-next@vger.kernel.org>; Mon, 29 Sep 2025 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759199412; x=1759804212; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKhI+kwn/MKS+yeatsiFFUrAT5c5urcbPJB4X992QZI=;
        b=18JO37aEo1Fu+MBshx0+NUZEYMXE1lzJTqYwF7ikK2RiDH6JBW0j3z8ekWsSZDMOUj
         6QnoF1uwjnsa1IJWOm/jQan+QOk0ngw7loCYJmiELmIpI/Mx68OBPSbdk/8ODt4rQJME
         Rploj3CTYoJysA19CnBjiFWiffh7GxIIODLcRrLfCtEa+SJrvwmEQOCkBveJwdrV+P3d
         E+u8S+3v+vXqRMyn6ZOmWS+Vx8p2+OgxU/zfzcNOOKKoXfZnSrlHsu3KfnZSDho8TIiN
         83EGuEr5KW5tLZiqMNa1sZfoa5FaUEofnwDd6B78IkKtgfjrDKae/5YVRGarlzFGZl94
         qFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759199412; x=1759804212;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WKhI+kwn/MKS+yeatsiFFUrAT5c5urcbPJB4X992QZI=;
        b=k5tGY6R0/WPZmZ11I/yB80HkjIuEqB1DrTBCRb1qj34OfPF4a+JKbWdfMNdNotuWLZ
         Oak4iuMKQoP4W0z+sfC7R68BIcjSq+AXWwaz/GkhxEEvP0k9u0vl1Q+QFvj5MVfYZ73x
         Vltx09MqTfZfk6yuG84NeuQQqUqicG3eb4CWV3CCB9Rrk9rZLnnpp/MkczBZtZGgkCpQ
         aMLSmwLFVvGkryuVfBPKDJZe7mJQLhAegq9Swx/KCyCpn7vMjHpQh60DfMSOfTBwNu3+
         USHxLLPI6qCcMN0DsxGJRqrDxkZ+9xVqKTyeoPixMgsHv7m1X9Z8/vWaNBPnP9q/m1IU
         ZbmA==
X-Gm-Message-State: AOJu0Yx7zuR993W1I1KI/Yl8r33muBKbhlNQm/R8cYYJPe1RXdk15FMg
	u3bESLrE+IhwBxToWji8hsQsTfjp3jxVIerBAh1Fqt6wtKHEA7cWwzTAUAHi8+dnI0QcTM+Q3b0
	jDtQJ9dc=
X-Gm-Gg: ASbGncuJK3P+g1BuJbgjWQemnDCDIcvK5CMiFbnKEM6F2Q/8siadPCC8kAGhQ8GGFhu
	8tSnsU7jj7b5Ua6+PFyEYznd/li4OZtjRIWN/LJbdlTcE1AhvEVqh7qMOh2SqTVj5gg3KOvT/Yv
	Bsf4DSCkchgfMAVA+5fYGEMSLoPyKG71VYn7FmDoGXuNSV3AXmqOssH8vRs/kJ1Qa0I2oEyiyVp
	PwrdMtDo/8OEDG8AAvJ1O8d1FjS+cdBJlMpiuCF2CCusYkBAjJGo3RgnIVDptqyJ4zTIGH25YMw
	1E1UL4bTQaiZsyy9Wy4cka5D5Qemt4+ZnPRY2copsyAtBCog5iQ7AXhnRU/ol5H5piRSzySGT3K
	wvNJs7UJVwTekFDsuN8qIDrZ42w82Ny3wHJcGpSQL
X-Google-Smtp-Source: AGHT+IHELhR65+KF25UbwoPM3HvX/6jSADGRvEKNzeAHX4BU1qyhAGUwP+MmbYMN3kRyA0VVrNU5Iw==
X-Received: by 2002:a05:6a20:938e:b0:2b5:b1cc:9d57 with SMTP id adf61e73a8af0-2e7d0ad1ef7mr22093020637.44.1759199411624;
        Mon, 29 Sep 2025 19:30:11 -0700 (PDT)
Received: from 1e895cdadf47 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53bacf4sm12754402a12.7.2025.09.29.19.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3b9b1f8df454caa453c7fb07689064edb2eda90a
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 30 Sep 2025 02:30:10 -0000
Message-ID: <175919940964.624.2685464153988977225@1e895cdadf47>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3b9b1f8df454caa453c7fb07689064edb2eda90a/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3b9b1f8df454caa453c7fb07689064edb2eda90a
origin: maestro
test start time: 2025-09-29 15:30:26.994000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  163 ✅    9 ❌    6 ⚠️
Tests: 	12473 ✅  562 ❌ 3371 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm.kvm_kvm_page_table_test
      last run: https://d.kernelci.org/test/maestro:68db1d9e841b167e8d33c41b
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:68dab8f2841b167e8d32f9e6
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:68daabbb841b167e8d32c0d0
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68daad84841b167e8d32cd80
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_18
      last run: https://d.kernelci.org/test/maestro:68dabeef841b167e8d33214d
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6e2841b167e8d32ed06
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331b86
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331b7d
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d3319af
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d3319a3
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331ae2
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d3319a0
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d33199a
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331acc
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331aca
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68daabc7841b167e8d32c14d
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68daacc9841b167e8d32c390
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6d8841b167e8d32ecd6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33ad68
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33ad5f
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68db0885841b167e8d33ab91
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68db0885841b167e8d33ab85
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acc4
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acc6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68db0885841b167e8d33ab82
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68db0885841b167e8d33ab7c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acae
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acac
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68db0886841b167e8d33acaa
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68daabc2841b167e8d32c120
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68daad98841b167e8d32d0ff
      history:  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68daabca841b167e8d32c16b
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68daaccb841b167e8d32c39c
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_pcm-test_default_time2_fslimx6qudooac9_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:68dabeef841b167e8d3320c5
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6de841b167e8d32ecfa
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3308b1
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3308a8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabb0f841b167e8d3306d9
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d330836
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d33080c
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d33080e
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabb0f841b167e8d3306cb
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabb0f841b167e8d3306c5
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3307f6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3307f4
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabb10841b167e8d3307f2
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: juno-uboot
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6e0841b167e8d32ed03
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331229
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d33121c
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabbd7841b167e8d33104e
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbd7841b167e8d331042
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331180
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331182
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabbd7841b167e8d33103f
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabbd7841b167e8d331039
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d33116a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331168
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbd8841b167e8d331166
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331b27
      history:  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabde5841b167e8d331ac8
      history:  > ❌  > ⚠️  > ⚠️  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68dab97b841b167e8d32fc0f
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68dab97b841b167e8d32fc10
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6e7841b167e8d32ed15
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dac3d5841b167e8d333510
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dac3d5841b167e8d333507
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333338
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d33332c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333469
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d33346b
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333329
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333323
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333455
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333453
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dac3d4841b167e8d333451
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.mqueue
      last run: https://d.kernelci.org/test/maestro:68dab73a841b167e8d32ee26
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6ee841b167e8d32ed2a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabf75841b167e8d332591
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabf75841b167e8d332588
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3323b7
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3323ab
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324ec
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324ee
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3323a8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3323a2
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324d6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324d4
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabf74841b167e8d3324d2
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68dab6f0841b167e8d32ed2d
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbb2841b167e8d330f4f
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68dabbb2841b167e8d330f46
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330d78
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330d6c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330ea9
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330eab
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330d69
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330d63
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330e93
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330e91
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68dabbb1841b167e8d330efe
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

