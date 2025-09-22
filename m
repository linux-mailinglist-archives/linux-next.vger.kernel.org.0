Return-Path: <linux-next+bounces-8427-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E70B91063
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 13:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF03E423D7B
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4481B306493;
	Mon, 22 Sep 2025 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="oO+gMRXc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEEF306485
	for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542351; cv=none; b=fDZeH03yyfAtRv24RKvFH1XvKIMEcW1JCXBVrOyjZIDI82XF2x/6b/tfBQVpUt6nPVZXOKRUFZOShUkd2U3Eyw031rneSP8uY9tDgh+GFJVi+ArckQX/XCwVMQSrTy1n2gST1DCxlGQ1VREBUZbwwKLLwuFi3hoiqgTN1sPk9pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542351; c=relaxed/simple;
	bh=kNHccVyhVKFN1OQ3GbJtvkWS9i6VeWKckXRnMPsrSv4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=syM60hIXt8AIQBBpyOduSPIxY2dWmtoEOn7nxXA5ixrz4DVbC47uvvQva8lBGJk1MoMU2pXbLSPH3VoOyEWfhWuA8OfX2HSXG4Tt5YILCNwrY7UPX9pc6GpSX5hEGwVpGs8foLusTne98dvmCygdOnZNi6joxzYwqJTgSqo35P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=oO+gMRXc; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33082aed31dso3401375a91.3
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542349; x=1759147149; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc/ZaEN5reK8P6OfyJuXUb0G94xSPoKCeSzYTJwvaOU=;
        b=oO+gMRXcN4Qwj1+aLmqG/W7LVVAwps/xhkE8dKb4QbnbLwDqY3/Yup13+MOSQ2XUZm
         UW1Usb5j+Ql1t11pm2ax38QGM3MsCb0gVYLznxxLcE70VPurA9WD/jjLvs1jrOx7cDyr
         vLBTX2EVfjVaIpzXcLjn/2J5zXbWyX0TIngBZUQs4LQ0oohv2zd/Y74JNUCR5WQJzatR
         EHB4ojllAtn6Yq3eaUSmz9rHaLlic6A0JiNFn53767weqwr57y4elxyitVpaGP4ig4dB
         gcUMPaBkFgEm7jwm16PDdh9bQiMucO4VkUXH95D20P1K9MSXdqOpCHgwK4LCDsGm0+n9
         cEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542349; x=1759147149;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jc/ZaEN5reK8P6OfyJuXUb0G94xSPoKCeSzYTJwvaOU=;
        b=BWrkLUEKiPCNxJqEA5093N9p8qYF11gjhQqtAIaBuN6yPOtLWMLQISoHlgbh2qHomN
         +oFsykg9hjhuxctMpl+mbNLAv6HVhlviGkiC6siMBlt0VLorq+1t+7ZjJOIkv3Z+qj2k
         jOSXjhYX+PHjeNz+Pib6DqAzzgM06WoTKELSxWvvISDyYVwjIOhqGsRYyYTS0dfu8ZmD
         qpBtr72VszqZUBSnVBo9qho8dByUdux4u4vqBDD6hOHIGegoyO+CykT/EIbeWwpEjKFg
         wetHB/Yrje732eV/+jAUXb+kDLHnStvx2qWXmZ6e0IZeXjTaeaZt2/BUBm2vZukzz73B
         +H8g==
X-Forwarded-Encrypted: i=1; AJvYcCUsObRW45BHXv2aaENhzOxRiQ7MvBqflZUBzNTp+ijvNQhhqf9p2x/XIS3KDz7dNprsz/wsyEGFhUUN@vger.kernel.org
X-Gm-Message-State: AOJu0YwoznkDj8Fu+d9sO5FmIPQP5V3hDvsslytacG58aZsi55FFuP7p
	zfOCwEtNZz8X6CRsRYWlMcjd0mxaViZPBmMhLswRlJOKHFBFIhyCjsu99bTHZxOL3jB3SvKFB8g
	wPiERino=
X-Gm-Gg: ASbGncsXSJrfvD0oJrdiQZZzzSmrBmHoAEATZAoUnI1mvVTNj5sbMz/VYzFcnBG3HoE
	hVeAEJ/p14oo9v9M5DfCq+VccVcXfwerW9n1FIBrzmq4j2AdGQ1ozdo52FMHE0T1zuscLDvq7ko
	COJIWIcSTkCoQcu1JSn/lBBxs4NJqdZ+Gma2Q4JmWE7lWF/CGZgls6Zxww32F/rtmkE1eWY3TAp
	zKTEcBHUT07KY63fkhS5DBVwCG3JUaUw2ShdDwhaTZ7idwHfoqUtYM3b31B/AJD2IHyO5+Mguiu
	g3KpMn2UdoPRmpGHHlv0E15/jAOOVKJXurdOzHY6QMhOnkCAwREdz854hgTc3Y+aqZQVVAUvPUv
	mk1SQQ5ft8emK/Ina
X-Google-Smtp-Source: AGHT+IGaah20WWf6zDyy5pEROJgGsdgzHlGhdH0dWiABEOwpsdDWWFvP8zAL12/abVSK3xo8Cf3v5w==
X-Received: by 2002:a17:90b:1fc7:b0:32b:aee1:18d5 with SMTP id 98e67ed59e1d1-33098385e48mr15232374a91.29.1758542349103;
        Mon, 22 Sep 2025 04:59:09 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55138043b6sm9742415a12.26.2025.09.22.04.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:08 -0700 (PDT)
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
Date: Mon, 22 Sep 2025 11:59:07 -0000
Message-ID: <175854234740.873.17699577477730961398@1dfac204f25d>





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

