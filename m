Return-Path: <linux-next+bounces-8425-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BACB3B91062
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 13:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E4417A1706
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EAC2BE7BB;
	Mon, 22 Sep 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nol55mTk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394C2FB97A
	for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542349; cv=none; b=CT8JBavoINf27uKGo+AiIpidT/tLu3dZTS1dBzog/a9kQ2ZDwiCF2puy5oU4V8aeE7vvInrUwiXMBjjcRtUihu9pz3I6FE2tj/qEu404rY5AQa85le+c0+zAV810crJSqcVXLZ7ufBPhCwxfmq7myn1JBwKUHdEFpspNrK+lVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542349; c=relaxed/simple;
	bh=8iOAb7k9M3R892MfyDBFeeAalq8574Z6x4gz4w92fzI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=PHRi1yQloKYK6RtJH5BBxtNXwMN9SeENu73Ji3k7lM7l03QKPfoAFRurWln5P24ZhSHM591x3n2s8YKhYwVzE1kxnvEfidEi4SKLFDs5N23nPj/I40A9aFgfmqVNE70NGwmNg245NdXcUZh36mKl6zJRFAVY9iEpIgtFAXTEeUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nol55mTk; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77db1bcf4d3so2934436b3a.1
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542347; x=1759147147; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3szr+kJTUuNS+iVcKOU+a7GHZg5bpUVvZtqIRdh2MYc=;
        b=nol55mTkHdtc7thCvvZMN0uAvzXe6aiwBYJBd0amqOwlFTAdiAOixd3a+/XPkmE3l0
         Rf97XHoC0n24Ol0Op7EKwlgbpQ6Pfz08TAX1c50HX4BCJGkspxRY8RS5b6zJfeXtOhav
         5+BeQSGxRSrudobCCQPtvWcAMGeUR4vJoFe4efbaUjAU2r1fKFHX4OqkAgGNjvUX1R99
         AoeBIqz2u038SIRDwvglrWPEEkEUesoGkDG9QvbQKkQSW/4sq72MHJM8dQTUqJ3mZsvo
         d906gU/aBN2puc2ror7bJsBTwfomuu+tN4CtevnAexOrt+3CZz9UhKW1hF97vRbDUywh
         QC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542347; x=1759147147;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3szr+kJTUuNS+iVcKOU+a7GHZg5bpUVvZtqIRdh2MYc=;
        b=kAcBVSsTHfbz5N1UQDfEAHsNaWqnqgea/AV1i4KUDM0e4rCHYMjj/npDPC23Uygn/z
         RCfQJdzICezQkLkgL84HwvV7RS0B815Vh3E2Y9Vxk6k5gH525JtSpxmnFf/KcRI/enmX
         s83hGrk7xhrrRlQpdTpylBDkp4k1DyruihNYtCws5hNWJgkt+zy62eU7s6RuStYE3zMD
         Lndp47i/ttAiaodXsrIwBzBECfrBp5P8gtEpGZTtMTrlYkH8UyQlQw3Cb0/lDAWsdten
         4l9hLv0EOHf7XqYd3mtiWvPZXk1tJTH25/lX7rSaneNmNbpchfPfnz5X4BGyTsqUN5Rk
         s0zg==
X-Forwarded-Encrypted: i=1; AJvYcCUs2UiBM1WVpBUYxnv6H5TQH+5l0DM50o8cAot+piw9tyuD95Zy7jX7A+GvIj0MRpY7qAuBfzIUP++f@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh4s2wG/X6dCbP8okMQQ/NvShrv5bfe3padKQWs2u30hYgUBPY
	VapW1m8EOT0i8otfQt5c8s08MwwF0biQuHayarzyjLYxGhuutpy+VSfFY8ORflIAMyg=
X-Gm-Gg: ASbGncuvJSZwCdZXmhBzJt8xDFw3Uqlv6zFzq2MTVw7m8io7yAhD0FA1fMkyEaRqEv8
	uZW3O4lUQeEHPmeoQ4NBwARXdhzy0Px3jYxDoASDnQXfI/ZK9Jx0n5FzI6fKRPD10TkUyHaoC7U
	3fkNWbJ4+iHRKHi3xCkEr74i8ij9RHpqznrVrti1u+zLTAXfWqgDJjx2vWZwfUB1G/G3Wz+MiK+
	0CL5Vx7KiIfysCQcjszv1YZX+sB59L7vImPrJbBK40xNOuVW/VcWw6w+8uA0ecJ+BGw8zmQ29um
	rYKhWomAxRS4Q9vs0cEXYvLqAWB4iTc3wrmtyfcZ1BQFgtxsfomEzg9CdY6a99c+h/bUQzU76Co
	T3YSD9BWaGwDIOS2Qm2KxqQrHi38=
X-Google-Smtp-Source: AGHT+IHo0J6DmO9uvDERQYmbyjGnFsDOfDJfTmhDv2LK6SDL8fW1Y2citMkFq8VMqbDlBoQE2gOJfQ==
X-Received: by 2002:a05:6a00:2d21:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-77e4f29df94mr16875675b3a.32.1758542347169;
        Mon, 22 Sep 2025 04:59:07 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77e0bb98790sm10380518b3a.9.2025.09.22.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) comparison of distinct pointer
 types
 ('typeof ((mirror_idx)) *' (a...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 22 Sep 2025 11:59:05 -0000
Message-ID: <175854234556.873.4742782914953194439@1dfac204f25d>





Hello,

New build issue found on next/master:

---
 comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types] in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:76d27462ca9e8dd64519bf79c841aca15d98a0e5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bf2602a3cb2381fb1a04bf1c39a290518d2538d1
- tags: next-20250922


Log excerpt:
=====================================================
fs/nfs/flexfilelayout/flexfilelayout.c:685:2: warning: comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
  183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
fs/nfs/flexfilelayout/flexfilelayout.c:685:2: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
  199 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
./arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:685:2: warning: shift count >= width of type [-Wshift-count-overflow]
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:195:25: note: expanded from macro 'do_div'
  195 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^  ~~
./include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:696:9: warning: comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
  183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
fs/nfs/flexfilelayout/flexfilelayout.c:696:9: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
  199 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
./arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:696:9: warning: shift count >= width of type [-Wshift-count-overflow]
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:195:25: note: expanded from macro 'do_div'
  195 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^  ~~
./include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
  AR      drivers/phy/mediatek/built-in.a
  AR      drivers/phy/microchip/built-in.a
4 warnings and 2 errors generated.

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68d1301275b320799d36f149


#kernelci issue maestro:76d27462ca9e8dd64519bf79c841aca15d98a0e5

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

