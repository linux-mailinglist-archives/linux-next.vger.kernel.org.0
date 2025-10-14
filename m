Return-Path: <linux-next+bounces-8589-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E5DBD7168
	for <lists+linux-next@lfdr.de>; Tue, 14 Oct 2025 04:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4187C4F1510
	for <lists+linux-next@lfdr.de>; Tue, 14 Oct 2025 02:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC552BAF9;
	Tue, 14 Oct 2025 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HDHs/rQJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087DDDAB
	for <linux-next@vger.kernel.org>; Tue, 14 Oct 2025 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760409036; cv=none; b=l7zEbepXVVsitFf5mcn9jKHiuBkdf61EfQnZPPbDiylBMlTTpiQsv88QixzMce334Crxv//sByM/WZqQca45A+bAdodRzQnRqjT6O2LRxhYdm7aWCF5J51E0+OR9c7HVO8HLeBde5bAYnyIY27zs4HpsAaRsq12zpA0OZjbXalA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760409036; c=relaxed/simple;
	bh=vPRPbfGM2PcZTVZiATw9d5KJgBfULgFmujaEgmMmj1M=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=uqEA3hHYXtAb0rFNU6ksGJJYnhL4JM9GAI3DI2qqurNg10UscnNMOZkLxFrqks2nxdtxWf01SW6QkkY9ePZFaWkXOEXyV1a73WqTXj7KdeGVGRsLmAHKNIdqWXbE83afIfIjNcBZPZ0uS/yU4sTkOonyzIOIj05UdiR1X0cdvQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HDHs/rQJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-26e68904f0eso49239595ad.0
        for <linux-next@vger.kernel.org>; Mon, 13 Oct 2025 19:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1760409034; x=1761013834; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReKWRkDma4rpL3VNqYTjaV5t3LklElYSLONY6S0oX5I=;
        b=HDHs/rQJJPA0CsD+kcoH/GErM5/j2a8aNUxcO+JfYNN3D6xKfdRXOZPZADeVsRVhhj
         PLUDih9L/Ajw6vFiwKSPY1ILJqP/eQ/+nCackqqQgzSpZDLenAdvkMXv208F91+Yet7B
         MiAEyqwZYm4VWkJThJZAsvMqMn7I/Wo7DcfP3+fPvG02lwEvzE9cuLdmvLvfJvYH2ys6
         0XxXXEKUfj/LOvJOlnhx908CiyAgnotsZIhQHyG9Xhb3Nl8XxDsKcRyl8RzboKiEGCBx
         rS76M0N0nmaOVZ93gXe1pc/AXKEYZCde45uc3EKyw/5y+gv5SSV/n/qffxmL77tSXUG2
         k/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760409034; x=1761013834;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ReKWRkDma4rpL3VNqYTjaV5t3LklElYSLONY6S0oX5I=;
        b=O2GEVWsNwf++J1T7APmFeqILfiFnKipAsu1F2/Xg6yl9wkEQOqmjyS9GnB++zBrWcT
         JRmOzDxXTmnEsIKDmkvBd8lPVLWGjRKsgUqEO1/PGeYTR7k5qMRVsjDI4bc+xq4VPm0y
         XdI36RGBh/Zapb8eYYHvKKEBjOZJ8sxmHe3CgaHBpTuxwdAmxNPjiz/ALQPcOstbq8T8
         y50OlYsZxonZ1JJYXkVTSfiWMVk6nzWNhsvELcPzDbtpjP3SRFbVxp+B8sTa770/trYz
         sRa2u/2U9qhBba2RYHkfUv46FOX65JCc4V2Qsy92+7fubMrkb2L6MYrt3wBWC9+/NDLR
         coiQ==
X-Gm-Message-State: AOJu0Yy12Jtn5Phdvhm3a692Bny6cKQF6PpoQ1qjcC/ODigqagVFou5t
	ElPbYvZ9pw8rDNQcVuR1568Y0P2AKjMRISqW54L5QctpQR7qxd4qLvx2kmPRVrtzbow=
X-Gm-Gg: ASbGncvvyjyc+127EVmo8TuvoZo72BSglNXoKXWo98imRNQe/2m21E9oFUZe1kkrzKm
	nTzpswt0JMaIOcCD808iZO0yQmvWELsY4+b+EZTW16aTu83T7ybusbUM0EqrD37s1O9WJtSjeXJ
	F2cIxEnJ4ThxFJiUbcgTztm30nsYopD6m5rTtwMzJY/1uVJeDBZQuraE/bb1zlGosIrdwgyaSwI
	3WQVU2x1pHTz1Z/ObW1UU8dJ46t/SRocjYhvPWAnpR5xC85tsS98Wz5Fu23YDQlREouzkxDB03L
	FRiIxdqiYs0nRFvm8zUDC5st8q8w3IQqxLkdbTaNjl7bsjwfb/KbzZrUcNMXw2/mSFZYMgGqGNt
	vL4G1E8VAp4MKAhi9BMAUafDeEua7Ts/AWpxikp5LuJtGew==
X-Google-Smtp-Source: AGHT+IGIJqvAsIqCiQem8enQ8obc6jK1vEqrjKsPoNL6Hk3Az7COIwk8ab36Z1266lMEaWkdOkfVWg==
X-Received: by 2002:a17:902:ecc6:b0:25c:e2c:6653 with SMTP id d9443c01a7336-290272e1b44mr292037435ad.48.1760409033980;
        Mon, 13 Oct 2025 19:30:33 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm148666975ad.24.2025.10.13.19.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 19:30:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 52ba76324a9d7c39830c850999210a36ef023cde
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 14 Oct 2025 02:30:32 -0000
Message-ID: <176040903221.1570.7979070788225724268@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/52ba76324a9d7c39830c850999210a36ef023cde/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 52ba76324a9d7c39830c850999210a36ef023cde
origin: maestro
test start time: 2025-10-13 11:22:36.868000+00:00

Builds:	   54 ✅    0 ❌    0 ⚠️
Boots: 	  132 ✅    1 ❌    0 ⚠️
Tests: 	 4559 ✅  171 ❌ 2346 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68ece8a3a6dc7c71db9e09d2
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: x86-openblocks-iot-vx2
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68ece83da6dc7c71db9e0450
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68ed06e1a6dc7c71db9e2a73
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68ecee80a6dc7c71db9e11d4
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68ecef83a6dc7c71db9e13f5
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68ecfd74a6dc7c71db9e22bf
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

