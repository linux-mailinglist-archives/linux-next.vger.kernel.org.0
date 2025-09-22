Return-Path: <linux-next+bounces-8426-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E4CB9105F
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 13:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D4BF18A382A
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64085305E2E;
	Mon, 22 Sep 2025 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="djwGunM9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F71A9FB7
	for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542350; cv=none; b=V9TAEEk2+IBznlo+RSk2qlEV7i1SfI1qwL/ilEdxkr8oFlgbXOmja+g/VhpChLcluwCz4tZBOo11xsdfZp3wuvn3ngGX2WkO/8EIaohv+HdtpkkwN5tmW3TqFe6y3b6IlBajMR19IfOuA7xbdanjeOMD893k2DVuzsSOUaL4WXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542350; c=relaxed/simple;
	bh=8iOAb7k9M3R892MfyDBFeeAalq8574Z6x4gz4w92fzI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ZWrRp1S5+ttas6NLPRjxioOZN+TxQusQ2H3wwuRYVuJn7qJAOveMUOmd0NnIQaBK44Eri6zFKlsJmubZa6k07OiwMiLq0aMLyQmY011BeTIJEcgqca6xUI/LxJkGjGyXaW0Tmmj/19H4t2qh5Ac7bDBHkzgy5tkOM4nF0k+nneQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=djwGunM9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f41086c11so629553b3a.0
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542348; x=1759147148; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3szr+kJTUuNS+iVcKOU+a7GHZg5bpUVvZtqIRdh2MYc=;
        b=djwGunM9oKmkD9PlQKjT5nsZXOVSNQFID6fuAdtBe4S3NRaEgDe22f1vBAOfQIMf5a
         S91T+4BHfrNW5SlP82epqKEticeKkOWE+dAbFDDVrp172cQFsav/AT6K2vyGdxgjt7Ce
         LbVwIugNgBPiC3v/pdiQkj/VIbOEY6gtqWpmacWbPqgLastRbN/6LzpfXQb2U6gnszbz
         jyB+x2zJguIvSR7tAboMd4CqFsgYE5+mfSDeeAP/nVbUgVi7OuowRJY+0w0EcNBBZlNp
         eCP3h77/vjQfe6udkuCFje+4trCkgKPmn94cAPEr4wdQEQhTffWZs0ChC80O5+dmvj0t
         tFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542348; x=1759147148;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3szr+kJTUuNS+iVcKOU+a7GHZg5bpUVvZtqIRdh2MYc=;
        b=odW5C3YtOjfczNxrLhUABIQ9vSungDGBniY7DvhFgxupc7+P3AOu8ykLwooJ1dPjgr
         aOQ512AZ2RRCWLynqZro0rsiG9s/TGZ99cQPS//a/9MiOy8jPs7PHnHDqmc4wu63FSuy
         5SrRwej9sfNQAuFNUCAVG2rmtnfm6XtsgWpU0BI0iTxvFHIgABBMvi07ttcHWjK21g0A
         iPMArC97pxlnzfyLhG1wL6e6AKVvEzIW+t33ZnnDCdHoLo0Y/BcnuHXcsrKexfeKstzC
         vDcyQcv3rWo04qiQ+1IcWY4WzkSnsiy96aAJ/+KvxjE9o4oexjWUSwAFYARpsFVkTw7v
         4Jew==
X-Forwarded-Encrypted: i=1; AJvYcCXWnrHZ0sTnOblLh3qAIiP16voRbECX1WuRaaPFDCTMKGM0xEcQvX1WBVZOyn0BVvmqvi4pYsqvQEJU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdb2s3coffyOhYGWGS/E+Khu78WyRUz4kfoXB93rAcmSTIMUFb
	+Jxe0kUzjlEc6v/1xVyJBv+OmF2/oxb5abeqFsLnjAE2lVMGhoLWoi4HuGQLLMxM2psmfjDqWqD
	oesshgTc=
X-Gm-Gg: ASbGncvujeZYnh7F+M2Tah98J8SYrD8s+GQWhvnV0IBsVufpya/kpEyZ8domjLE/HFJ
	ZVl5jjr0VB84T2v+FQTVlGaZ3LLu6/BM6V0Cs83+2+U5TDM4wQZBxaMdUXoO1HGnA5ZKTd/b+Wv
	+JyXk/Xjw2cSuQaT3C5eo6+WWP4Lir9F3U93N4MOIT7iACDb8cpLXODL1ihDJVae1/BA31ND9Y7
	/InIkVPl2WLNnStN2L7qzmp6ul6KCP3VwR/JLyr++9uZUECaEaxPm7luzQUheKboUSPbkOSREl8
	wU2cz61nNEp7LbgQ+PhF8e96wQcUKTVSInMk3E92vXho0JVmp3dTsRnTOCe/UzHJ2jqcbatBnB2
	mz6RjSqHIXQyKjw85
X-Google-Smtp-Source: AGHT+IEo6TxyeKQFPnH7fFjO/SFRiLs45bi+V+6/rjTaNwCleBNEA0whKIvyEP7jO4bUrtuvNsLcZw==
X-Received: by 2002:a05:6a20:9149:b0:253:1e04:4f4 with SMTP id adf61e73a8af0-29272b52720mr17042976637.48.1758542348016;
        Mon, 22 Sep 2025 04:59:08 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff3fd7easm12057676a12.30.2025.09.22.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:07 -0700 (PDT)
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
Date: Mon, 22 Sep 2025 11:59:06 -0000
Message-ID: <175854234627.725.771324603757490830@166871acc15a>





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

