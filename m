Return-Path: <linux-next+bounces-8059-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB21FB2EEF1
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 08:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A62A1169CFD
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 06:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334CD2E7193;
	Thu, 21 Aug 2025 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="B/9Vj/E0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE2028D83D
	for <linux-next@vger.kernel.org>; Thu, 21 Aug 2025 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759548; cv=none; b=hZTmcO66mbg79jti56ejsYRHTG+S57h8YClVwg9ZT/Dll4Tf3CrmjDdw4Cc6Hq3DDq5akZMdwMRmRjxXxmzRq2KIwbrrYBTJ0r8fQh7NeVQ+i6RzigrJc21UFtDWZpKUrcXyCxFbyvc9MiC74SLHxiXWiBvrbeh8CEThuLolMw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759548; c=relaxed/simple;
	bh=ZSv4wB36PfS5VGVUvJHoEWowEtmZNAEhcpaOx0Rgfow=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Q69PfVNbnnnfIvrOEq0sEg3lkk+Yttb6DxPgUnnh/WgW4jrcitZNqFEYtUuCDEhxedZmnVzg+UujxSAue9R62T/oPqi0XyPLUqvCzsCOg4Ot3IGOWXjqa74HRGpb9ampo91g1qgYxQO+0BL0oz9HiyB1UYNjlMDi3bPItEuYBfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=B/9Vj/E0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2445826fd9dso7901295ad.3
        for <linux-next@vger.kernel.org>; Wed, 20 Aug 2025 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755759545; x=1756364345; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkmYqFYcjlIoTyAuPZAuVl8TGuuRtgnNe9g9iFR96f0=;
        b=B/9Vj/E0IJnAhl1pfyRPb7/gNQMNCrxK48qSp1k/2NHQVSj0upT7n+PuNPDncsfymI
         cDZJxkWTwUJRHIusDD/0UfgPp2+rp7NLJhLA16ZHTj9v2soYpDg18SH6CCYsHE+HjOff
         ELStSsSaaAjAnCIYWUdxyRylTkrDsgQbXCuBh1UMx1nbvST3BouU4qRJhZxSN7OZ+PSY
         on3qmEoLXJq6HMLt1wpA+TFCAM4c2NoQX4obDa56JtJYqxxVUZJfoCgCqNCfRgTcbiCA
         i4mqpBzjPwxFIa4B8thF2uDYmA57COHytHQi6vGDl8/xOuK2wnxWNEBEv1r5JPjnAVxX
         ZvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759545; x=1756364345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pkmYqFYcjlIoTyAuPZAuVl8TGuuRtgnNe9g9iFR96f0=;
        b=iETovOywBW0DsuUbegKVngRgdwa8BbuHToyCF9LcCNb8OBwY4/VjoVn57zIhSTOXph
         evU8ATKvVWWWRzzBReCvQVK0uG6NSZpVibde+pKokBvF4hrBEx+rEuMTavV3BU8Je9+l
         RISSeL0kczC9MDbSCdfiJ3PKfGTF0B6OuiSjxMt8cOAaSCgYo0GXpAm09OBPn8buRrc4
         UIdIZA/uGIF65fw+7zPRqxEvaJCcY+Mm+RrbnoRObWgPDZVRuaFzrvZH7U4/igy7e8tx
         0WF4HViiXwEzFKUWtYmB03G0rqKT4yQXty6L9kVJbiZb3tEeOcDpJ2LPzdb3BpF9GQjq
         b0MA==
X-Forwarded-Encrypted: i=1; AJvYcCUXHfv2ntWyZrLRv9eCTkymVriayoIP8n5ltIC9qsfPoMH6+wnKExG8mujyUQykoPXtf4T8sndJU1+u@vger.kernel.org
X-Gm-Message-State: AOJu0Yz74BAXrfPUAwIHFHvA0X/OEQoYCNhaTbMIoE7LuOSw7geqB5j1
	lPEXTKA2LP1qw8PfIL8QTr0RxQDGGD7zKlI4TCf4WzkrGwSfEjo+PTsPNFhWx7SZbOs=
X-Gm-Gg: ASbGncsdJzSSfXJltAm0W6H/ozdnzQtKIfdAItKyqGLuhPziHHY0aeCZgW952q7xegi
	DjzuThAZmbCEyhjc6jAaSu7NdNntKRXnlC4U5s/2XDlKNgy36707ieEmp+VA4femrgQpfkbJ/qt
	ovxpUi1qGd67oONPozIL2RZ/BA7qh6BfJ7JnFGVs30QD7xQQuIcu8n5XS4kGY7Ki0RzBrwZxdKv
	OY0vLLkTAJTo5VvkfEGMD5L0B4fK0ENvUKZKEGJD3PcgpKxFbUQZ5gVSBFBPqnir/rVenFP0o03
	WhER+xf1hjPy0fQ0lUZt0OMfVfBcIKZFppOtTOj4xSTwM6X6IpItdaxrkrEa3GpoSFnKvjPlGgB
	ocKnC1Y2srv5xZrmIVJGEKjWe+Rs=
X-Google-Smtp-Source: AGHT+IG/B5stGNdGiwG8KC7dcHDlE7l2ZKDOB0YFdWhSQXQwzaKtVXo2UoJt5gDvGcZfJ2c7sYJGJg==
X-Received: by 2002:a17:903:41c7:b0:240:671c:6341 with SMTP id d9443c01a7336-245fed7e771mr19297955ad.26.1755759544756;
        Wed, 20 Aug 2025 23:59:04 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f384ddc1sm349449a91.0.2025.08.20.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [REGRESSION] next/master: (build)
 ./arch/mips/include/asm/cacheflush.h:42:34:
 error: passing argumen...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 21 Aug 2025 06:59:03 -0000
Message-ID: <175575954332.147.3671353627841122443@16ad3c994827>





Hello,

New build issue found on next/master:

---
 ./arch/mips/include/asm/cacheflush.h:42:34: error: passing argument 2 of ‘set_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types] in arch/mips/kernel/asm-offsets.s (arch/mips/kernel/asm-offsets.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:dfad1cace3166f976876f942be0d5f653324d85c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  7fa4d8dc380fbd81a9d702a855c50690c9c6442c
- tags: next-20250821


Log excerpt:
=====================================================
                 from arch/mips/kernel/asm-offsets.c:12:
./arch/mips/include/asm/bitops.h:89:70: note: expected ‘volatile long unsigned int *’ but argument is of type ‘memdesc_flags_t *’
   89 | static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
      |                                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
./arch/mips/include/asm/cacheflush.h: In function ‘flush_dcache_page’:
./arch/mips/include/asm/cacheflush.h:42:34: error: passing argument 2 of ‘set_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
      |                                  ^~~~~~~~~~~~~~~
      |                                  |
      |                                  memdesc_flags_t *
./arch/mips/include/asm/cacheflush.h:70:17: note: in expansion of macro ‘folio_set_dcache_dirty’
   70 |                 folio_set_dcache_dirty(page_folio(page));
      |                 ^~~~~~~~~~~~~~~~~~~~~~
./arch/mips/include/asm/bitops.h:89:70: note: expected ‘volatile long unsigned int *’ but argument is of type ‘memdesc_flags_t *’
   89 | static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
      |                                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
cc1: some warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## 32r2el_defconfig on (mips):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68a6c16c233e484a3fa4cedd

## 32r2el_defconfig+allnoconfig on (mips):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68a6c169233e484a3fa4ceda


#kernelci issue maestro:dfad1cace3166f976876f942be0d5f653324d85c

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

