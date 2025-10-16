Return-Path: <linux-next+bounces-8603-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A49BE1438
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 04:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B150485351
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 02:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B384B661;
	Thu, 16 Oct 2025 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="QeJl2GGe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20551CAA85
	for <linux-next@vger.kernel.org>; Thu, 16 Oct 2025 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760581815; cv=none; b=XyFTCW6MfBIp6HjZ9JR3T5zV1Zib7fPpEqE2ijHXUXQhHP2CFSuONWAbIdsc3/6XglHg4EEJEdH0UqHeQ6U1tE5uc8w56FvH8iBF8kp+Ycf1b92RCrqFErGbSzFdsdJh2fSXBwChA04GTyEoSuQGyo37Tdpvf0fYiITwUpLnsKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760581815; c=relaxed/simple;
	bh=S4cnskifFyxstOR2gNP6amCDetzFm3m1d9TuGM2oTOs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=STcSNbWss53RgGmt7c7Hexjnb7ecfqzaweoGcrWtkn5I4dMs21WS8BRhvH+dRCBeTk5p+6EB4JcWwb8DghPF4u43xCFV8J7jyKECPK/LmA4JSanX3OXupOussbNRw5Yv4ZglQQ+6NcyfpeKAasUZeuDxdF33R4Mdc2sjn4hj+fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=QeJl2GGe; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so251486b3a.0
        for <linux-next@vger.kernel.org>; Wed, 15 Oct 2025 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1760581812; x=1761186612; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ql1jHu9e9REbBcgqg8xxJYIC5OTFl+hpKUnuavhkMo8=;
        b=QeJl2GGe0qQyYAYYBgimtBIJhqyb5GupqZd9yDIPG7Z7nQ6+VOh0f8qzo0Niv/thWx
         +qwv4AuhDLkU/WBBrH+HjkJAy0Nw3pPMLEqUmroWrKqU9DlThroE3/IJ55Ox71cM2lfR
         trZV0JVIf+Du9gxtBV8Mlx9urrD3vAUzuJ/9D1GtOYUH8xr4eAyH3m3/+6z6OknSEM9Q
         5Ran0mOp6mBQO+ld5Tk9d4FyjaA+Ig3nptsVGwE7m1A3gnxp+1xYRjSKk0/i1et/2CkC
         0WkUHjAXIJhDF95T5JaSOWdmhT4t/DcQKlPyYSdUInBkzahFhYfnzxkyJfeXYWzAOvqc
         bALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760581812; x=1761186612;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql1jHu9e9REbBcgqg8xxJYIC5OTFl+hpKUnuavhkMo8=;
        b=RSioSG5fEyljyyHMwy3FZ7s+pYsKbQzYbVN4biPNhUXHXbHi2xGhnMSFfibGgV+FK0
         ruSNbvqz+cAql4JkdYMChBpt2mqpg4KJNQNwCyWeQ6lKzNQaN6KUP21esSX6//f8o6hy
         nVKrH6jiB/aHSIgf0zvVkKwKKAjeEyg5vx9VoEBSmAkVwU8gX5rdyH3sMhjpdP60j26z
         u8o1bGlwZKPqK0WkRI8oAUyykecxkuMciy4u9KUX2qXVAzWcXQ1HWaH0TcUJuSPY/9u2
         rBO7ni5Wa5xcm9/YFDUORW7md1aaJzx/jnJGGo3JJYHtE0X69gdRnYKxGolDpeKDusKP
         Akkg==
X-Gm-Message-State: AOJu0YwlWrzpSSUEIYGxcJVvi2nQqVYKtFyNdt8l5v3nDAdQs23SXzVr
	mzsKfRsUDMxDI3IAU1Q8e67ZTASdbxefAZm5WWRl9V2pfkao4EjBH13F6sIygtgVeusskYVj1yg
	95Gkl
X-Gm-Gg: ASbGncuddN1i44Qaam2T3NtA3UABZorF9g1pHZk7IswR1oqxS7vAiU2gWJz+gAOJ5Kv
	oygbRPFMFjDzmiE1bgOD1vPnaNtg9I9un0kQJzHAqV730lzICEHAqwowLobBkKUKPKw53sUHps6
	dMMvKuXjuFVrqLiuGBH2auj7AMbGAREc7GzFN1UJqg6DGL8aoIlSrKMLEqUiWQ92KcYVt7PoiM2
	GNVGVPHDOLTMuvnzz5+pcgb6SUYp103rdUJjbMFS8+mQU+DGTSseIG3SfOwH3OZJ95SEbQ0cThC
	FhzYSzWR6B36SPlZI2kCnAmGOT6nDOdT7CEhn/A1PbttdsGDU7/wdATOK4DlHoht7RSjdFo6BLm
	dZGgSMq15wITcSnjSghIBbCZ9kv7nRCoejI48QEYpMGCTNs6J06sHxJDtXCx4GysJWpdw1EOVUw
	Ma4OAX
X-Google-Smtp-Source: AGHT+IEKdYb69LnF/dHR5vMOPfdXRwLQpmANVUEOe+8+DCh1+lnSCebQnWTJFxspZm6w/YZ1KmfmMw==
X-Received: by 2002:a05:6a00:cd3:b0:781:27f8:d2e7 with SMTP id d2e1a72fcca58-79385ce1171mr33944086b3a.10.1760581811813;
        Wed, 15 Oct 2025 19:30:11 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2774sm20319664b3a.63.2025.10.15.19.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 1fdbb3ff1233e204e26f9f6821ae9c125a055229
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 16 Oct 2025 02:30:10 -0000
Message-ID: <176058181046.2494.10125564910868425671@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/1fdbb3ff1233e204e26f9f6821ae9c125a055229/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
origin: maestro
test start time: 2025-10-15 13:09:24.850000+00:00

Builds:	   34 ✅    7 ❌    0 ⚠️
Boots: 	  123 ✅    3 ❌    0 ⚠️
Tests: 	 5290 ✅  196 ❌ 2883 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68efacec5621556c1f1f446a
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68efa91d5621556c1f1f39f0
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68efb16e5621556c1f1f5847
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68efa91d5621556c1f1f39fd
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68efaa995621556c1f1f3fc8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68efaa995621556c1f1f3fcb
      history:  > ✅  > ❌  > ✅  
            



This branch has 7 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

