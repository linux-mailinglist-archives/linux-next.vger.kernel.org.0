Return-Path: <linux-next+bounces-8975-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 31733C5B028
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 03:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AB2A4349FDC
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 02:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88AC1DDC0B;
	Fri, 14 Nov 2025 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qhIV1/SQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2E9186E2E
	for <linux-next@vger.kernel.org>; Fri, 14 Nov 2025 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763087423; cv=none; b=AeUhHluqjHMTPMt3ON6CLPZsGcvk3EkkIek66eY7Ibgbka2DyniMuGMT4q6AvATiDZGSXuXsB3EW/d+mhnJMp4QZMsQ9yjombsOV+jAjNS232tKNR84sD6dAx4PAIgUcs3ARBTdspDjsfw+VEv8fVU8SkDnkaus6sOg2wIYrfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763087423; c=relaxed/simple;
	bh=7IZp5CIkzkgcwG/Uk3VdNOlzmu49Hzhs6pUnUs5u7QA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ZtNwdq2pUAtfqbB9hgKKnQJ7Lz9/QEaFzbHvI/0r7ltwm0azRu6BGTH7LfcKK/A9WKreSRd4+Lrobu1pkL4mIbpwBmCXrMG4uxRbKFGLTP+JwMafBM3bToRjtD8LFGEWlISgXSVKZzn/WE5FtPnXNkD0y++h0t5hR2yxtawIBTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qhIV1/SQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b553412a19bso936715a12.1
        for <linux-next@vger.kernel.org>; Thu, 13 Nov 2025 18:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763087421; x=1763692221; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4xhEiVEFGr5x3zDWzv0NCwWSrcGg100EHuKxW8+bRU=;
        b=qhIV1/SQq9QQXwr1HFL5ThpGIrFGQksLoF/bmtqJ6Y/XDDl/mGLMsXVaREceFgehLc
         hvIcno+8VWC0IzT8NHy7QCdvXPHKk5KNp6/aIiRF5OQqa+Lnvnn0jaUWpEb1qRsh6toB
         +DSVTLSFx+fxMWzH03N2KHKRuwogcfz5YmkHzz2t1W8QAt/+hcXooGyLZzr5D1vD2ei6
         F/ZkpojQ6OaA/ubPd7xuoq7SZn6LAAVdjl9uZczdAXLyibAAuyVypS6XhOgdf+9rXKU5
         7nEuMZWAZ815dyzfIZgrAckd3uy5eSIKxLxrAMaRb0jh6uKdjTY1SQaPCtFNfZso+Qls
         Rb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763087421; x=1763692221;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4xhEiVEFGr5x3zDWzv0NCwWSrcGg100EHuKxW8+bRU=;
        b=P5qjjSPymZst02LWIt+mviR5iYnUMUkRA4OxLQtAIBh3No7B+D6RKB7olkb/t/f4j7
         KVNu1mdLkyrwkhyriJem586IUZyOasU97+eLVMzMk2e4N7OM9pVwkAy9BuqDLQKQb2ks
         oYdxw/E8xeeju0/qYsMM/yG0AG40Kc8ffm/sDgIBjVUzQivWtbB8qPN8PXp4YmoIY+74
         j/Tq7fxlpL7VDC+qCv7+JnOeuZyRosIwYSCqRcHmsN/JzWCVzQH3QzIK4aMVXdXGnbP4
         JE/hGEXj873RgC/MwgxQTOZxH24PBzGkyCSoDRceqCEBfp122tepqPXRUHZPkSHyr6Lj
         UolA==
X-Gm-Message-State: AOJu0Yx7vHm4FtDzapp624VVijte4lTl19uCkZHu4zui5isAL+QnSslo
	+Wyjxoz8hMbYj57uHa3ZBA+7PreW6r2roAG2sXsUGvLms8pby7YB48+deBLXE7lT0Zw=
X-Gm-Gg: ASbGnctUQj5pJBzeGzdil5EUqYE88Zl3BxqkTqOwYcN7VYYJW++jUUPu/is5WmGRAcq
	LBn3CPRnpKdadre6vXKu1vGLbGTnItr3cIyGssAiuok0pmltBsYTJGI0/8V4eugzuMkRZgpYU2/
	sGou+zGHtwSeZPDYShC0Rbi2USFHsHBUrqCl6B6yMn+OrB0X23LBopbjV5pl8UPiTio3hEErYeW
	ERiX/Z6lIObp7l4cjjxq+I6zK4h8u1ozzSYoQU/ZHWkIHNoKalpcxSbJJTL9xk26QlmmPniZEHO
	SJPTMVK2NSVS0kZ5xpOaUSarakKk7kvSUXtaaC2lK+3WTgojDQ3ILtSJbLjcQtKA6Gy+UX1FGMQ
	f9yGBdxsU+O5MKvGZI3npSyBr1qVQ1J3LiqgBbU4aw5z7p7BnAbBxkJLI036YdMvrlMGdJQ==
X-Google-Smtp-Source: AGHT+IGZLLPXGDQh6ZFSiT9oGTP97ox4ZaCq6R0Skk1X9KoOcKUddgRVJ+Tnw8xeacQQJQfefGUxvQ==
X-Received: by 2002:a05:7022:69a5:b0:119:e56b:957e with SMTP id a92af1059eb24-11b40e7cae6mr719219c88.3.1763087420839;
        Thu, 13 Nov 2025 18:30:20 -0800 (PST)
Received: from f771fd7c9232 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm4201277c88.1.2025.11.13.18.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 18:30:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 14 Nov 2025 02:30:20 -0000
Message-ID: <176308741960.310.2682414916800496798@f771fd7c9232>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
origin: maestro
test start time: 2025-11-13 04:06:19.413000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  151 ✅    2 ❌    0 ⚠️
Tests: 	11704 ✅ 5558 ❌ 4581 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:6915679b2fd2377ea99b6a0b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691569df2fd2377ea99b955d
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691564cd2fd2377ea99b5c15
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691565902fd2377ea99b61bb
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69155e6b2fd2377ea99b315b
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_2
      last run: https://d.kernelci.org/test/maestro:691560ac2fd2377ea99b3f7d
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:691560ac2fd2377ea99b3f84
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:691560ac2fd2377ea99b3fba
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:691560ad2fd2377ea99b400e
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:691560ac2fd2377ea99b3fb3
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:691567ab2fd2377ea99b6b31
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691568d42fd2377ea99b72c8
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69155e722fd2377ea99b3264
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69155ee72fd2377ea99b35a2
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:691567a42fd2377ea99b6aeb
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69156a1f2fd2377ea99b9b27
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:691567ae2fd2377ea99b6b53
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691568b32fd2377ea99b70d8
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

