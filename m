Return-Path: <linux-next+bounces-8480-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C9EB9D330
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 04:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D29F71BC5345
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 02:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1926D2E6CDC;
	Thu, 25 Sep 2025 02:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NBhNPpB9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99AF2E5B13
	for <linux-next@vger.kernel.org>; Thu, 25 Sep 2025 02:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767479; cv=none; b=j/vtYlVUIn1qJnMUthiXk+dY2w2hJvMfTQMV5x7wHmdOtG41/S6fUolWf7V5FZZWvPv9vXu5rjcWUlTiswkYmSWU3HOoc9+TsAnmgxTzSuMBlnuQovzTsBoJ6BJwAvio4KK6egD0xBux3Q5XWu9o9Rujc1Bz6MWApeuGucu+aak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767479; c=relaxed/simple;
	bh=Z7I90JHA2jGLlkcecyJirF2dJNoG3tJg6/n7Btz1bxg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=UU3eb0HK0by4f72v3basI75kkQmD5NPbej8adLkSco8pd/eAxMGcmWXzHAt4EISB1throGx4D40XahaCiAPSNWMr5wdZQciNIONKwUonTlfjB81nWmCeK5Tp+dug05EJyauvpchlIzijUt2VhGbJqNKMZ4cJPI47hMqbNcNljt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NBhNPpB9; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso367961a12.3
        for <linux-next@vger.kernel.org>; Wed, 24 Sep 2025 19:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758767476; x=1759372276; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XRFaDCPzlNw1XJAScR3R/c8j1eyGCl7Jp/4qwt4nso=;
        b=NBhNPpB96ufL242V5sl2fchfC9+IDYnEVuSFOBretiwPDQFHQyImM/LAo4JpQa0m/7
         gtlagHYRfxbLFbpfP5Kwd96QHTRncrYw2bYFlt5aw9CJ7WURQBNL4jEeaKyzU1jXpSP/
         D7EYT7+Nn1msEIrbE5/wtJyQNGgvgKMHr9oTmQwtgh5/d3754TQnoBIeazuabLa6dI5a
         iHte5J0JyasfYVOcqWvs4gDPQeBhUDwechkjPw7t9AYgOsNOHMd9EXUNz/bU+dUG1V2M
         Js8RTReieksmg7DDp+guCjm4ALDQNTRFIqchhr40VsizARakUZI21+Fbx6BlwV5ECXZm
         Pftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767476; x=1759372276;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6XRFaDCPzlNw1XJAScR3R/c8j1eyGCl7Jp/4qwt4nso=;
        b=ts9GQcq/Juc961jx6+fMOFFfgTsPgk1avAe/C4YNfidy1klWlGyqd9o5PUCwT1hvyY
         CoUFSdb5RSZijB/BkH+ZpT0jG4qnl35TyUMSr568c0UJrPhLcEpiN8ejeSQ68bArj2y7
         zd6RP3R4tkYwMSReJsT4RJrDc7/JOQ4Jw67dgplBS/mdKB2ePb7QhyifrGOQ5RqvudFr
         dJsNya8l+JtdkYSmkyiwqJaYO29cjUKtnN/QXa4+UfKcaO6ouvKnmhcnlkJV3PjC/yRK
         CjjjRO/+a0KAsgHO4WH2gwsuYOxMW2/aCLh0+rwkD62eNWHn08bdaPxPsEqfG25OPZe2
         pnNw==
X-Gm-Message-State: AOJu0YzT8Z554cIa3K7772wYIIAPMAcNFAh8VBCjf5X5vGH9YTZXf7V/
	A/LIwEHkyyUReftdQ3p2/TdG6MKxVdU9GB+yHcXyV7HC3stPXcl8cNcTmIMdMuYakDy/RcxK+Fe
	5du0w
X-Gm-Gg: ASbGnctAaPmZRhP/14L6thYSNm+JJLpjSlcsRBnbMyAzI9bVCP2M4gCHBrJUCiqnaKK
	C0zbKlV3AkiTwEkkWPtxPjgdcK9g2kLfVbGQTvTCrmTVL+yONvww2GnslEipGgt7Yu/H6ofLmxq
	cUlF+oaadpYBDT7E5S066tZ4tlnZujS1Ctw8D4QOYW4lLmMp3Vh8cLgdXLHW1oSuhBZRADiatvS
	yP/dfd210Qz95tr85hUUZJ+5YVxVc+FhRrGy29Qdhaw6F2M+APfpRo5YdP6wHX6DupfogxDCc1F
	FQl9kbxd5CNyi8GyU0zsHCvLVQHj9ROeL7EL7kxpfLm8JCm4yaSuyskhhdCLxlftCGLcjqsrjl0
	uq9yNBGqO59gROtux
X-Google-Smtp-Source: AGHT+IE6/JlS/qwhTIxjs5hqZ0r42ZaAwQYy84YhEdsgIAAzLx3BW1bNCDTZIDV+kJAVEqHuVs6lmw==
X-Received: by 2002:a17:902:f682:b0:269:9a71:dc4a with SMTP id d9443c01a7336-27ed4a96183mr22058895ad.41.1758767475878;
        Wed, 24 Sep 2025 19:31:15 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cf9d3sm7546725ad.15.2025.09.24.19.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:31:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b5a4da2c459f79a2c87c867398f1c0c315779781
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 25 Sep 2025 02:31:14 -0000
Message-ID: <175876747459.1344.13905266130277131596@1dfac204f25d>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b5a4da2c459f79a2c87c867398f1c0c315779781/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b5a4da2c459f79a2c87c867398f1c0c315779781
origin: maestro
test start time: 2025-09-24 15:15:13.246000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  159 ✅   10 ❌    6 ⚠️
Tests: 	11836 ✅  669 ❌ 1244 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d4245175b320799d3bb74a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbf0e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbf0d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbed1
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbed0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbf0c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbecf
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbece
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbf0a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbf09
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0c66
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0cae
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0cad
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0c70
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0c6f
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0cac
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0c6e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0c6d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0caa
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0ca9
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d4245875b320799d3bb753
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc31e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc31d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc2e0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc2df
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc31c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc2de
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc2dd
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc31a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc319
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: juno-uboot
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d4245c75b320799d3bb75a
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc43f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc43e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc401
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc400
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc43d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc3ff
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc3fe
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc43b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc43a
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d4246075b320799d3bb75f
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4259175b320799d3bb957
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d4259175b320799d3bb956
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d4259075b320799d3bb919
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d4259075b320799d3bb918
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4259175b320799d3bb955
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d4259075b320799d3bb917
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d4259075b320799d3bb916
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d4259075b320799d3bb953
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d4259075b320799d3bb952
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68d41d4575b320799d3bb1d9
      history:  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68d41de875b320799d3bb2dd
      history:  > ✅  > ✅  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d4246675b320799d3bb768
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1cde
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1cdd
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1ca0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1c9f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1cdc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1c9e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1c9d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1cda
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1cd9
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d4246a75b320799d3bb76c
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c0419
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c0418
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c03db
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c03da
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c0417
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c03d9
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c03d8
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c0415
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c0414
      history:  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:68d4319175b320799d3be6f4
      history:  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d4247075b320799d3bb772
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc39d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc39c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc35f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc35e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc39b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc35d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc35c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc399
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc398
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:68d4247375b320799d3bb775
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-ptrace
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb9de
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb9dd
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb9a0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb99f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_sve-ptrace
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb9dc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb99e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb99d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_vec-syscfg
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb9da
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_za-fork
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb9d9
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68d4275b75b320799d3bc096
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d428d075b320799d3bca55
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68d4275675b320799d3bbfd4
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d4293075b320799d3bd238
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.futex.futex_run_sh
      last run: https://d.kernelci.org/test/maestro:68d45c3775b320799d3c83cf
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.mqueue
      last run: https://d.kernelci.org/test/maestro:68d424f375b320799d3bb83c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbf0b
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d426fe75b320799d3bbf08
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:68d4274b75b320799d3bbf81
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d4293075b320799d3bd23f
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68d4275e75b320799d3bc0b9
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d428dc75b320799d3bcb42
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:68d4127b75b320799d3b9ccc
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68d4164c75b320799d3ba68f
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_18
      last run: https://d.kernelci.org/test/maestro:68d413d275b320799d3ba0f7
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0cab
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d441aa75b320799d3c0ca8
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc31b
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d427eb75b320799d3bc318
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: juno-uboot
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc43c
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4284a75b320799d3bc439
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d4259175b320799d3bb954
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4259075b320799d3bb951
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.pkvm
      last run: https://d.kernelci.org/test/maestro:68d4319575b320799d3be700
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1cdb
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4458c75b320799d3c1cd8
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c0416
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d4393575b320799d3c0413
      history:  > ⚠️  > ⚠️  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc39a
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d427ff75b320799d3bc397
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.arm64.arm64_sve-probe-vls
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb9db
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.arm64.arm64_za-ptrace
      last run: https://d.kernelci.org/test/maestro:68d425a475b320799d3bb9d8
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68d431a775b320799d3be737
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d432c875b320799d3bec04
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d432c875b320799d3bec05
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

