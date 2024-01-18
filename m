Return-Path: <linux-next+bounces-765-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBD38320D3
	for <lists+linux-next@lfdr.de>; Thu, 18 Jan 2024 22:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4010C1F23DFD
	for <lists+linux-next@lfdr.de>; Thu, 18 Jan 2024 21:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30002EAE6;
	Thu, 18 Jan 2024 21:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Fn/pJhct"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C22EB00
	for <linux-next@vger.kernel.org>; Thu, 18 Jan 2024 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705612888; cv=none; b=G7o6UZBlPPUj1vGYmAVLvnnzLh/YxVMyhhqeSmpomKXd5yWFnX2whMoRq683T27JMxVvYmFOim9hsIkolZIRYHSuCXAp1il+uGJQaXrojNaOXY6xi6lWD8LgVl9c2kf/VCAy45k7qZfClf7Vx2DJdyzZD2rEgxClLuFK3B+FPxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705612888; c=relaxed/simple;
	bh=+NyDWna56jKRxjX4nRCOG0ayBgfwHK46u0ayzUjMQuo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=epEfFftA/5rcOaz4W/zlG6JP+FI8VyuwghXrLvspJc+cXtmYYKFYquInCWqd8eJ36RvQQqvdqEbEjOyKVWOc5um66ruh1GFZTOP9ZW44eTJ/W9Y2XeBrt8D9+4kkMdejSnJe77nJakkQMrrZ+/yuXLPLEmTmoWNOBne9c80Qzrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Fn/pJhct; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e775695c6so782825e9.3
        for <linux-next@vger.kernel.org>; Thu, 18 Jan 2024 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705612885; x=1706217685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urN5IOlkkqGseby2zF94lkjsWOAoFsi6eWXRkVQaSnc=;
        b=Fn/pJhctyfPAKKLVGIPE8Q37KC/7/TFNA6MFljCJmjNPdR0zxrXA0ACuEITw1V//eP
         hsG4qp6J9IMs+MRuxyS/Y9V3ZYnl3anJurzjpbBHCegLdxjtxqLxwjstMcT/XjNO7/1y
         8wAknVUkBQqO8T366XNQHVGzR+QZJiZxbk40Ot+vUtVP7kH3JTx9aOXQeyyIrJ970bAk
         ggN7IE5d6SPcVg4H0/hAEcHfUNRIVOaJKUigo539RtIDEZH1pGqBTIg/nhGHA5CmDv9S
         tey0/dtPL2DlRJyKvNRj6EpEMbSZTK+mkxZ4Xb/3qRXQ1/Ha5NR0OynSrzH96ezjlYcQ
         EuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705612885; x=1706217685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urN5IOlkkqGseby2zF94lkjsWOAoFsi6eWXRkVQaSnc=;
        b=tntLFuovTqoZv4q0lBODk3kOl6Gbp+bK3LqhsLPeF4Xpk0EZcWO7S+7539olTgmjnm
         /+OoBrBniK4qf9JRm6bYtuYg8P+xfQ7UNoiMFcAQFZdXmVbNbAJ4NscRat7vIh5WeisU
         UcwFuNxbAivwJGfA237Mfc3ELrzT1kfH5Ao1xPesExZjJvXGaASeLVeaYiSaBkwVVxKh
         YS/msxz4pMcDv1j1m8/rw95pMIHclFEp1BQqUk/nUPwUrD4oRuRS5fvzQEcBa8MFn+B5
         IDm4ZryYRyUGj1rZYVJrqVcwr+40/SilQwZNpytZf/FBVeFBxwR22jMp10+fB5OI1Srb
         yNQw==
X-Gm-Message-State: AOJu0YwOtQJ1SUkoP6ssfK554+0mUBlGRv7ykqtoVreH1WX0scHaKdzM
	ZL1X5dbiHm+yyV7eFdYzWQQUM2JPSExdVInKj8XHfckXHDw0ihNN1voxuMVtLwU=
X-Google-Smtp-Source: AGHT+IGT2HKqFx5QAe2KTAwWSlOY74v3tpR9NOljC/IgWxHa4M77k5iJTiBdsA6Jkp3CA5L9pfsrWA==
X-Received: by 2002:a05:600c:6557:b0:40e:52fa:9e5f with SMTP id dn23-20020a05600c655700b0040e52fa9e5fmr909250wmb.63.1705612884943;
        Thu, 18 Jan 2024 13:21:24 -0800 (PST)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q20-20020a05600c46d400b0040e395cd20bsm30740992wmo.7.2024.01.18.13.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 13:21:24 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Frederik Haxel <haxel@fzi.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Fix build error on rv32 + XIP
Date: Thu, 18 Jan 2024 22:21:20 +0100
Message-Id: <20240118212120.2087803-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 66f1e6809397 ("riscv: Make XIP bootable again") restricted page
offset to the sv39 page offset instead of the default sv57, which makes
sense since probably the platforms that target XIP kernels do not
support anything else than sv39 and we do not try to find out the
largest address space supported on XIP kernels (ie set_satp_mode()).

But PAGE_OFFSET_L3 is not defined for rv32, so fix the build error by
restoring the previous behaviour which picks CONFIG_PAGE_OFFSET for rv32.

Fixes: 66f1e6809397 ("riscv: Make XIP bootable again")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/linux-riscv/344dca85-5c48-44e1-bc64-4fa7973edd12@infradead.org/T/#u
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f533dd667a83..32cad6a65ccd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1060,7 +1060,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.virt_addr = KERNEL_LINK_ADDR + kernel_map.virt_offset;
 
 #ifdef CONFIG_XIP_KERNEL
+#ifdef CONFIG_64BIT
 	kernel_map.page_offset = PAGE_OFFSET_L3;
+#else
+	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
+#endif
 	kernel_map.xiprom = (uintptr_t)CONFIG_XIP_PHYS_ADDR;
 	kernel_map.xiprom_sz = (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);
 
-- 
2.39.2


