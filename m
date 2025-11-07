Return-Path: <linux-next+bounces-8890-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A97C3E400
	for <lists+linux-next@lfdr.de>; Fri, 07 Nov 2025 03:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 037B23AAD8D
	for <lists+linux-next@lfdr.de>; Fri,  7 Nov 2025 02:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893F918DB1E;
	Fri,  7 Nov 2025 02:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RjNNvZC/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B70282F5
	for <linux-next@vger.kernel.org>; Fri,  7 Nov 2025 02:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762482688; cv=none; b=BfLRdl0zipUFYUekwcDMV/QzNdtQVCjMFwL4+EEZQ1pKG/y4bxf/NswB+DMPhisES61QpqTCfHVSI6uYiVK1vPunoVlX9qDQ1zU6s+8cpLvMuY6Bir5v/LfkDCCu7donMBgUjqIlBXJvLo5wr1HQ5xKW3BYu7/T+ed2pYS+yi/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762482688; c=relaxed/simple;
	bh=qUlfLRapY6svyWrr1gPioYJq70UgPOf+0B8sezDP3xE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=cHzk8Z0FmuyunmLLuTdWPvcM7U4gb/qkk0tndipIbVhfz0OLveWpx6Rk03nnkgbsqIYxJVy3oT/h4q2wWUZGraBbg90tPRWulRxqF4QzupNJCTvuIt3NEftajHoksxioy6HN95Qpju4tYXryI7FjXRCEmhZHj/2NniwW+7zC6lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=RjNNvZC/; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b0c3451272so403081b3a.0
        for <linux-next@vger.kernel.org>; Thu, 06 Nov 2025 18:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762482686; x=1763087486; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZNLI7dP+U6alsDoE+/A4meoiGQMC7Ah50NNQx9kU90=;
        b=RjNNvZC/i6QlQnCu1/c3Df3Zbtb27gtPUwh/d2z26cQKU3LrGiEws39t+zy7c31Z66
         lBawqepEJ+03enwTXm8PTjyrmQxo2gNCl0NvF5UokiFqqbXTvFqiIG28Cg+IqB20YK86
         6gdiXCz0WL5uigiMKrULHXLk8f6YlpufjVf8AHPRgVXmFBe/eJieKB14XLp8K4PEWnGn
         G+Shop0D8XKZZEiKImk7aHxHfJ2nDIVkbLauUBrv+sHOftn+6T+tovUtJW1ALoEBFQsi
         DBozRcuIwo5BzXKO97x/QkZmksXv+ilF+62sxc9NWPrNuJ4IMHHoeEs2/4IOSe2x3M4e
         f1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762482686; x=1763087486;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZNLI7dP+U6alsDoE+/A4meoiGQMC7Ah50NNQx9kU90=;
        b=mv4u1QVnpqL6EduC/blW/mDK/h3o06vw4B8SeK8uA9sayP9ekFFHx/BkCVU+xaptLm
         jysBkdktqVwhGDgQZbM39s4sY14iwSzbpFQG94LXLYrUHDQQkVPGdYsQ/Vasbn3//j0n
         wE/ZhF4pI+VDxwGArnSUi91DxYZKDvPsL4whKxvijdXAo+2wJJ4AeWgeQ2TmmV7HBGxH
         dfuEYVFDcXUR/7a3dtBJeRvJq/jHCnIwf5zTrUEKNbOpWoH7QfXfTaDjEvlQWPR8KaWJ
         O/cJEoHGYcDOMfFByJ4lVreyuHIf2rPCK4o57AqwJ7QHvMF1F3CqP+oMUWCqy2WH6UpB
         NoEQ==
X-Gm-Message-State: AOJu0Yxi+OEjB2KTyQ+lUOrJTwKrhFg3Q+jNUsAZhWrQhUIRFCnQYaDz
	AC1nYmIqVZacFEwXyqPnjsH7UyWo5dBVqOsFpEKXb0ckc+GPIPUsCpUREyDZh60sZH8=
X-Gm-Gg: ASbGncvwMY1Vh4Xe0MvRQv9PFbiNfLzr93cjNKWcQbYz+LOT8dEtU0onrn1tg1fg6yO
	26moUtdxEqY+1h5sVN/UKuTgyKkyPBujtgHpfy3m/JlB1KBtzD1ViZjiCRNxf+0KmM4l96TNwJc
	25GWATTf0gStHLokmjnCShHplziR7TxxTJlD5aNmOKvesXHqPqhd6elE3mwwfMZIhTHCSmUiYo5
	gcbUlq1LH8zofgyn0GwMWf5hCRVmYHAt+4S+LsN8OmWe8YbitI2dN5rdGnSrQm+kONisXXD5HiU
	rxsUzK7Wunr3j5Lre2cCeMb5H/e8cu7fGnvmVLGYEZcq2U0R4z7tzuS2rhCSqrSQVklu6acnK9w
	0DCBTIsXNOh6h/FFpO8VSLwp93qoLksVsf4+ln1WCB4E8ryNtCK7lnGbHAoYOyorlGPcaKg==
X-Google-Smtp-Source: AGHT+IHilIA1KsWnHyutZVYThqnA/mrcsEYs4DLdQ3XM9p0xvYXqKftt68zCFiW0tGSHpYo9LdHoGA==
X-Received: by 2002:a05:6a00:1144:b0:7ad:e4c5:2d5f with SMTP id d2e1a72fcca58-7b0bb4421c2mr2270359b3a.3.1762482686100;
        Thu, 06 Nov 2025 18:31:26 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953d103sm1044084b3a.5.2025.11.06.18.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 18:31:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 07 Nov 2025 02:31:25 -0000
Message-ID: <176248268499.4864.2857251149314767148@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
origin: maestro
test start time: 2025-11-06 05:22:41.977000+00:00

Builds:	   41 ✅   13 ❌    0 ⚠️
Boots: 	   90 ✅   39 ❌    0 ⚠️
Tests: 	11068 ✅ 5541 ❌ 3794 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690c3860f21f07610dd20cdf
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:690c3bb3f21f07610dd24055
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:690c3bb4f21f07610dd2408b
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:690c3840f21f07610dd20b86
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:690c39f1f21f07610dd22783
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:690c3bb4f21f07610dd240d8
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:690c3bb4f21f07610dd2407d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690c385ef21f07610dd20cc7
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690c385bf21f07610dd20ca2
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:690c3840f21f07610dd20b83
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:690c39d2f21f07610dd22199
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:690c3a5bf21f07610dd23438
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:690c3f90f21f07610dd2567f
      history:  > ✅  > ❌  > ✅  > ❌  
            



This branch has 13 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

