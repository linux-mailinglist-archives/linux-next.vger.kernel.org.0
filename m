Return-Path: <linux-next+bounces-8383-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB45B87B95
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 04:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E45A3AC895
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 02:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBDD25B1E0;
	Fri, 19 Sep 2025 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cw0IFX9F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71025C802
	for <linux-next@vger.kernel.org>; Fri, 19 Sep 2025 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758249018; cv=none; b=utH953G+g6TFuZoFlMJ56eZiUwj8qdQgkHX1Gx5p1nc9/VUKz/b8Xv8aCnvXw7mbt2PsfAd9wdkcDI/tQMFZ1yeoejt0V+zlt5c4LmuysliFYvT/zybvV0r7A2WV0lV1zli0b4GXoQBRi9qZ6h/y/lSBeLBqZfMNQtNySaG4OR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758249018; c=relaxed/simple;
	bh=LyojuV3f6Bx/jfEoRrGn+oYRV3mAEoGDs9bo2BvfFSY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=UYeKXvqCNbiR6UM9q0QvJ6jdqZQRevs1+Y6zs1avfth8UDBCu/DaWX848y2LspZ/+dznmZDcJTDAaScyVVcvyu3+JwgqsIVY1G7SWzgMHKSr9lM2eMjqN4UX9Rz6bdT/2BoiiVjJOx3xaqYdt1uYJCrvHndqgZH7V2FgOjjhJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cw0IFX9F; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-777ea9fa8fdso1687778b3a.0
        for <linux-next@vger.kernel.org>; Thu, 18 Sep 2025 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758249016; x=1758853816; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY+vAzNKqVhVC3gSc7Cf82/lIz1g92fk5f25bncxFm0=;
        b=cw0IFX9F5m8Ls5XIqEXik01xvDIp7shl2323/p2sAZdXFuakCV0unK4yluDGrpmZLR
         /hTDcooktChwerZNjFuQHfOT+uEDjv/42FX9P2Ww9Y6GVgNkmJWBGDTraw1Dx7HZI5M6
         UnpnhXsR+6mi9+xzC2j+RNnHGDTVA4HCrEWrJWVhLlEceWUBwab6g4wUwN/a7WzSRtQC
         kCsPkSpQKnbYxX2qU0y7MBf9prgrMWDCx/1yAI/GuXWFXPIjhMIPlwyOCIW2SyW04kGD
         81SoNBMqWENwCKvQ5cir51YYOAz3NA6xocmxLNCP6ULYhTmrSW5bW7KiEyniTqaP7VbB
         cUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758249016; x=1758853816;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zY+vAzNKqVhVC3gSc7Cf82/lIz1g92fk5f25bncxFm0=;
        b=gB/a6T8xJt0peSKgCFhfi3twtwz5NeqNXFsMKc/3iWCWCBXZ1OpKeRMBrOAqGZffqw
         jzObqnUOxbNQvfH8VyiLFdxe5bNBQrT3oTUb2p4SqabKkIsvfJXsrn/O/asn1m1/6KI3
         8olzOX4Zxcots4bWO5+y7UrTv/4rYl/QIIxYNeDtik5SqHsIa1shN+dbG5HNVGAeaM+W
         9+V2pDdLN2C83CKd9QXKwL0iQsL95x6CfrOb1D9LNCUfgBx6QOQEcn+W6yITBK9sIRZ2
         BBgHTwQ8sUxz8Spk9MjQZ4yhGy8LClHnn8EN13h5WaHiTSjNSF4leyd3UrRrN7+q+Lvn
         jNEQ==
X-Gm-Message-State: AOJu0YybfEeD5Gb587jQ5S4l6p81Vb/fTDMfcBoLuCs4NMMAkdN1to2O
	f0EtSN6b/UCbsGa5gVUt43b+P1ijCVA2IXAm4BCiFLJnfx5+6WMDwMbftmzR8uzs7d/YJuj5+yW
	+1FZPCVE=
X-Gm-Gg: ASbGncuFEdniAX0zacSQ+B4E4k/0QsOhxWAfpfoEjyV7bBIi2nAVnXFLJ3zaoEBaL+8
	obdi7K7D/pqvBliBtXFGmrjQDRqRXKMIIVQ6324Hgx923ZXTZbTAjUJdZd0qE/P+j2sjngZcVYY
	A+voGutHZC/pdkSnlJP4ZcXrS2g3S2KIEM30qRzFNL8WvEABxyjHvq8zQzRqr2PwoNtTplYu1th
	gCneeQBNEpVYzs8KXIzgQEozT86H1y8KTp9rUKgyU2TFv3Cj30w4eaHL2baBTHMmZzaeBRtTsLJ
	3zUpqEX53CBncAXtQQwzpvTsMa82nBq63+PJPmh0HTOck1d1vq77uApzRt/kXljOHRMDD9cjj0c
	VvDRAQM4SoYd68WVk
X-Google-Smtp-Source: AGHT+IESdsIffvpSULfW821rzezw0UZOk1rWcVkncH6fXdiMOxl3MdUc8YNeRoCDNMYJvV/jAMp2zA==
X-Received: by 2002:a05:6a20:2586:b0:277:f962:3186 with SMTP id adf61e73a8af0-2921f331fd7mr2857933637.31.1758249016508;
        Thu, 18 Sep 2025 19:30:16 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306064afc2sm3858415a91.8.2025.09.18.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 19:30:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 19 Sep 2025 02:30:15 -0000
Message-ID: <175824901521.143.246383700175245949@166871acc15a>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/8f7f8b1b3f4c613dd886f53f768f82816b41eaa3/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
origin: maestro
test start time: 2025-09-18 17:59:43.453000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  154 ✅   10 ❌    8 ⚠️
Tests: 	11624 ✅  546 ❌ 2999 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68cc5a2475b320799d2e707e
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cc5b9a75b320799d2e7deb
      history:  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68cc523f75b320799d2e550d
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68cc52fc75b320799d2e5698
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68cc574175b320799d2e6851
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68cc574175b320799d2e6852
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68cc5a2f75b320799d2e70f1
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cc5ebb75b320799d2e9925
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68cc4e3875b320799d2e5004
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68cc589875b320799d2e6b82
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68cc541475b320799d2e5881
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68cc52fa75b320799d2e5692
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68cc52c875b320799d2e5615
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

