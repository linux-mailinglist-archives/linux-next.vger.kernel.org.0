Return-Path: <linux-next+bounces-8428-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A1AB91068
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 13:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 299E0423CDC
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA52306485;
	Mon, 22 Sep 2025 11:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="JVKZdskF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24BE30648D
	for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542352; cv=none; b=PaS+41I8kAksS+qaW0OttAPAhfva3IBwrEo/tus+jHAwSBRa/X7mqj6a0wOjwHss3Ud/0FyIXATACdR2BxBzVvk8N1qVbsGqD1biSDQAUSjJayA6Yzm0CSuJdNkFTLSPCrWhB0flQfy4mtGL+j8RZbRCS8MYuAVNUqwPQxSrD74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542352; c=relaxed/simple;
	bh=kNHccVyhVKFN1OQ3GbJtvkWS9i6VeWKckXRnMPsrSv4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tDutcNTrxLcZwhb8wFsuiR6RD8Zm2Lh5jpuefgoQEqHp2sfreZYRURtwyy9XLYVYX5tW2QKtdEbipooPCdznK8RE1faR22xS2npbfCWyV2ESx6Ig47IIj72MBGlH4dShW2eBbkvkMdA3en6PRlP3a45HKDFkr8grLFZF+b8LRbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=JVKZdskF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2445806e03cso54326185ad.1
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542350; x=1759147150; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc/ZaEN5reK8P6OfyJuXUb0G94xSPoKCeSzYTJwvaOU=;
        b=JVKZdskFbyMs6tnmxN4cLMpj3VLWrS8+4JJF1tfoH3HLk8BcJY7dlhdHjrlkq42LCO
         42QVgVz7dVK3/eLx36SPGb1u454wjms8+iQEoRMeqBVRHvlr9t+b+4sZlz3ewzPR0XbQ
         fe7nSwt+Gln2UTznPJqb0WRfDCwQ7oF54zj2VZCoD8bozASMMQu9gsHTB0BloGqz/cYB
         RHppC17gTsDndfUHmCNKRi5YvF1EKg8k4YDY+pFGwTKKI9Zo66treFt35LRlF9XwGjbv
         idVRAjT0zcD+idABRnuaomIXAReGQ2C11eCdsoVmIMoYnr3V6riItBIYHm5W7Lgy/OmG
         aLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542350; x=1759147150;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jc/ZaEN5reK8P6OfyJuXUb0G94xSPoKCeSzYTJwvaOU=;
        b=n+3X8n7wi5EV10OApt0clUmEeCfAjd1vd1YniDBt9e1KStVR49kLy1rATOz4KhAOHq
         J52QE5tvrV+LmSKYUg9mUqIEHoPOdH9FhA1r2LQvQiIiainEFoWpZzb+NuU6zxj9Ykfr
         tT/HgA9Y1+zPbY1ydBzq03JFc3zhKKogswa/B7/j4K6cjoIWYP4WyY+pqO3VxtxPiG/A
         KAa9B3upKKZV7Exju2f5+DV1InCqthQP0rcD6DZL8vkotdTnzxhZhIEmukg7jXBdCI/k
         sgCX+fkWeI2Ssey5Y+oJOlwN+4Zvtz5a9cxS9fu3LyrXKBu91lP/AqLMLCewXV7WAAGo
         Iasw==
X-Forwarded-Encrypted: i=1; AJvYcCW2dDxlX3+inJoKHB9PfRV36yR3HngX3ZKEBewur2p/22jmHFZGOqwWJFyNfhMvp24coJXdSsi0PbYj@vger.kernel.org
X-Gm-Message-State: AOJu0YyNDpTPBvUNiqg8L6fWVvYa3TzCaP0ILSr5+9hFLgYCoTGSUw4o
	2xfX5xU2BxNCfABfks1pD9UeEv8X3zzJtrwpHxnfosyJipN7txhmYc85fHaUzD4LXPc=
X-Gm-Gg: ASbGncstqcgV96WmDPB2q3nUWnbRtIXWDXiCOZI74HQuefwiOb50EI+UdOtK3+cxSU9
	RIvlO4melZna1aGK/9ctErNzFb4UCtuKDOtzxgrAP692qhS8Y7cFe9yYTA/oA/+aVOObo9vDVuU
	f6r3nXQeUwDz9J/77K9lmr1L0uahcuArxLd/KluBwqarZpdJDpc6k9olZNZ5vyCV1fvq3TNzcet
	3tBJs8ucIBDsBqZzEKUqGirBisqyFBGz7TF289bFE2MXLSadj96aBakQFepCu74srBgWBF22VCI
	waXmfBwXnq48wwUgzdRLcx3gVkfme7K/xn6ZF7RMJervnrgoaoH59zkJMsuJUmwE1rCXUjj7T2d
	I/rLjonieRmSUZjH+
X-Google-Smtp-Source: AGHT+IHxWR26+hZsTnhMi81OB66VpMIebZyUX89KVSEEBfQ9MSMsxB6Ng+SwCJAKHMr62MsJr33gZw==
X-Received: by 2002:a17:902:c40d:b0:24c:da3b:7379 with SMTP id d9443c01a7336-269ba43eed1mr193329255ad.16.1758542350080;
        Mon, 22 Sep 2025 04:59:10 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607eaee3sm13100258a91.22.2025.09.22.04.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29_in_expansion_of_macro_?=
 =?utf-8?q?=E2=80=98do=5Fdiv=E2=80=99_in_fs/nfs/flexfilelayout/flexfilela=2E?=
 =?utf-8?q?=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 22 Sep 2025 11:59:08 -0000
Message-ID: <175854234825.725.2649537149392155937@166871acc15a>





Hello,

New build issue found on next/master:

---
 in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
---

- dashboard: https://d.kernelci.org/i/maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bf2602a3cb2381fb1a04bf1c39a290518d2538d1
- tags: next-20250922


Log excerpt:
=====================================================
fs/nfs/flexfilelayout/flexfilelayout.c:685:9: note: in expansion of macro ‘do_div’
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~
In file included from ./include/linux/array_size.h:5,
                 from ./include/linux/kernel.h:16:
./include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
  195 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^~
./include/linux/compiler.h:76:45: note: in definition of macro ‘likely’
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:685:9: note: in expansion of macro ‘do_div’
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~
./include/asm-generic/div64.h:199:36: error: passing argument 1 of ‘__div64_32’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  199 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
      |                                    |
      |                                    u32 * {aka unsigned int *}
fs/nfs/flexfilelayout/flexfilelayout.c:685:9: note: in expansion of macro ‘do_div’
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~
./arch/arm/include/asm/div64.h:24:45: note: expected ‘uint64_t *’ {aka ‘long long unsigned int *’} but argument is of type ‘u32 *’ {aka ‘unsigned int *’}
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                   ~~~~~~~~~~^
fs/nfs/flexfilelayout/flexfilelayout.c: In function ‘calc_dss_id_from_commit’:
./include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
  183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                                   ^~
fs/nfs/flexfilelayout/flexfilelayout.c:696:16: note: in expansion of macro ‘do_div’
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~
./include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
  195 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^~
./include/linux/compiler.h:76:45: note: in definition of macro ‘likely’
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:696:16: note: in expansion of macro ‘do_div’
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~
./include/asm-generic/div64.h:199:36: error: passing argument 1 of ‘__div64_32’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  199 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
      |                                    |
      |                                    u32 * {aka unsigned int *}
fs/nfs/flexfilelayout/flexfilelayout.c:696:16: note: in expansion of macro ‘do_div’
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~
./arch/arm/include/asm/div64.h:24:45: note: expected ‘uint64_t *’ {aka ‘long long unsigned int *’} but argument is of type ‘u32 *’ {aka ‘unsigned int *’}
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                   ~~~~~~~~~~^
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      fs/lockd/clntxdr.o
  AR      drivers/pci/msi/built-in.a
  CC      net/ipv6/ip6_input.o
  CC      net/ethtool/pause.o
  AR      drivers/video/console/built-in.a
  CC      drivers/video/backlight/as3711_bl.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      drivers/pci/pcie/aspm.o
  AR      drivers/pinctrl/sunplus/built-in.a
  CC      drivers/pinctrl/sunxi/pinctrl-sunxi.o
  CC      fs/fat/misc.o
  CC      drivers/video/backlight/backlight.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      fs/lockd/host.o
cc1: some warnings being treated as errors
  CC      net/ethtool/eee.o

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1305075b320799d36f18b

## multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1304375b320799d36f17f

## multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1304a75b320799d36f185

## multi_v7_defconfig+CONFIG_SMP=n on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1304675b320799d36f182

## multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1304d75b320799d36f188

## multi_v7_defconfig+kselftest on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1305375b320799d36f18e

## multi_v7_defconfig+preempt_rt on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1305775b320799d36f191


#kernelci issue maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

