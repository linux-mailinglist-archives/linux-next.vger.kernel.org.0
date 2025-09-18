Return-Path: <linux-next+bounces-8368-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972BB82A81
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 04:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 135AA1BC2F51
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 02:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4CE1C4A13;
	Thu, 18 Sep 2025 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="snD+My18"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93953C38
	for <linux-next@vger.kernel.org>; Thu, 18 Sep 2025 02:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758162685; cv=none; b=VD5s8S0obER2EQL6ke0aUQLDZ2417jmUmRz2wENJvQsHv2MB2Qi9NuBzGAgx2x+sOu9O3xaGbCjeq6/x9/Yir5l/sIZ/y8yMKaJ8U2gHTW0EdLtdEDbwsOu7fyXfL3mrDvaTuSi5IP4BW3Rsb3JGk449m0vtNL8VrDY9Ra3sFqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758162685; c=relaxed/simple;
	bh=0TOMuBQ8mgDt2kq92i8CET3TuGtMNCnbdJ9yECQNBTI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=sE2LcSml/lJTf2ILWItePGuyOoKpmCvKT5WyS9cUL7C0CHaTPAXcDOHvu64r+USPXt2Fdj55IYDPwtZ4hO1YNN3OXM5dnYJCQzcZI/ZpgKb+ubCjIMZ4Ff9+VRK2IAMUWRqGGMIeCn4O+q+hTPYbrOYgeLrhCDjwfRbpt9zxz8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=snD+My18; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2680cf68265so3674445ad.2
        for <linux-next@vger.kernel.org>; Wed, 17 Sep 2025 19:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758162683; x=1758767483; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdBPhU7Ni/CoPSOWftH89nkVj0lUtK+zZYS4HFECzpU=;
        b=snD+My18usATUr39SlKC0rNfb8p1ACbZjZI7cWyenIWj/mBgdEYOXsdNAYSd81r5sc
         bheNGtj9qKw+IKaC1zPb+vlBnD01Xc5KOwBngyA3eCI06Lf7/fAyRXJOdVjRwUbMkkbl
         +xqet+b0zNeUdt29CpaI0jYS4qRGYs6RZ5dAdRE2IqxB0d21a8mZ+NiZU7iRnRDZ1aLw
         InykIV4PIBglIzG/ltGhlDcaId/BnFLMy0/7OfJrBONLqWo6q8x8s9peCp0U8h4zSQfq
         4SEnxf5M6mslu+Ox8oKRgrfKKs/D8z8JgnoR6tRyGcpRyEk/frmb3mWJsaK0kpb3CV+4
         qPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758162683; x=1758767483;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hdBPhU7Ni/CoPSOWftH89nkVj0lUtK+zZYS4HFECzpU=;
        b=sD/7uQSo9DthELoy/ZOlF9edYC/XyljNXGqM26sVG7Kt4YC054vlVaVsIM2JgnAGRQ
         uGyrzzEU22iP1pmAp7xddLrg+MxYZnWTmZS7cMjjVzvEE0jv2aWqC6xkIY5eSZAoZpSw
         DEipiYYM2kHqeTym0kpsCGWxC/NgPw+yDLZ9vAyxzuo/nF9N+wfqgSBz5D6LcDHewFV4
         JGdNYlp78KNlM0QwLl3W/pL629dm1RNN0NmekXVbXoYn3RfYJyHLEKNJpoNV+6d5wHtB
         lndx2PqAlY+CGvdhX8K3yq41ADOjzreqN09NYLco1EBG/XmcbmzJoVZfOVj3l5wEfgEN
         wkPg==
X-Gm-Message-State: AOJu0YxM8UVHsS/lRAIrPAh7nfIHqOoPbMaX96wFrK1lsvNmcfIBjVAC
	7fkV+9Ap5qpBjaHyc4sC+ecL+z/rhCMyY8W7C/76w1966q//UvOfXDd9LVYrDb5IXK8=
X-Gm-Gg: ASbGnct9yytHezvOv4OAQ94/LbbYUC+bLJ812pS+ZHPikACWAqGXew1odF9Q/vjXazv
	YKQS3XFMFkNsCsYloaR9Myv5OFyH4/alhdR1OJfQ4+nwlnpeYaAJ+JZ4u0/YDXhwCsKGwQt1ych
	9gZowmMZw6XDObwMpJpSEpHdwdDq59NRHB+OUw/zislEEO8Z41mGF/uOUPD6OV+mg51L8oAiWOf
	sH7ol/mI93Zk4x74yIkD6H1P9tTadskFwec+1ShgTWamB/IBF/Qzdne4gPehoKOHmBmGrE3KXSK
	iug61Zmgf11do+bCkToKLO4M/VNl4uaBBxlL47uDjO+KeVsMBkJJ6B1+CFTo8IbHCr5KPR8ipMl
	p/CKI9nG8m3VOFCjTQ2432PKAbhSbesk5bND0+qGe2c9l2w==
X-Google-Smtp-Source: AGHT+IE28TtlUEVlDfFCisVf7mFslPMOYPhBrkhL0Y29O+YTUw35m5rbjzP3Sfwep0j7bhaMciS5mQ==
X-Received: by 2002:a17:902:d0d1:b0:267:776b:a315 with SMTP id d9443c01a7336-268138fdcc9mr35377395ad.32.1758162682895;
        Wed, 17 Sep 2025 19:31:22 -0700 (PDT)
Received: from 8ec87411ba65 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033d2a7sm8777635ad.132.2025.09.17.19.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 19:31:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - ae2d20002576d2893ecaff25db3d7ef9190ac0b6
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 18 Sep 2025 02:31:22 -0000
Message-ID: <175816268174.99.11113086892832528251@8ec87411ba65>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ae2d20002576d2893ecaff25db3d7ef9190ac0b6/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
origin: maestro
test start time: 2025-09-17 14:54:22.313000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  135 ✅   10 ❌    7 ⚠️
Tests: 	10674 ✅  391 ❌ 2766 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68cae0a075b320799d2aa233
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cae23875b320799d2ab393
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68cae0a475b320799d2aa29b
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68caefbc75b320799d2ae202
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68cb3fd575b320799d2c21a7
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68cb1b5775b320799d2b8225
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68caf72b75b320799d2afaf0
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68caf70575b320799d2afa15
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

