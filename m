Return-Path: <linux-next+bounces-1453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F986FB42
	for <lists+linux-next@lfdr.de>; Mon,  4 Mar 2024 09:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12CDE28228E
	for <lists+linux-next@lfdr.de>; Mon,  4 Mar 2024 08:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CED168BC;
	Mon,  4 Mar 2024 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="a47X/CRM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D2134D1
	for <linux-next@vger.kernel.org>; Mon,  4 Mar 2024 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709539373; cv=none; b=fMyDM47KHSYglVIYXyPZlZuKGEFbtnc13a8UZgoehfy0KMDTWFT0j1soRg7UyCcGrQk8IgpNLmdf3NFHzpXPgrWvUWS432u7BPykHaC2HGpWZmVdz4ybDFMsWGM33rRXZd3wnYUlZxiSezaidB/rHXZET7kRziHsq1Ial3jgF0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709539373; c=relaxed/simple;
	bh=dKwN8A7GUBExPlqO9KJL6ingVu5qBoz2pvjqaMOQanc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ct9xdU/SAx5GGuUU3HeikLw4N1mvdwY/37WYrOLT44GCM84ZWvFKtlcCcSetIuePutcaZvKz/FknQ2vOBPL6XUHyhwGO8cbU8YCRYI2nimasfqAeZvnUKnE31bWYfwyyoZvNeH0J+GvEKN7ZOu0ArlJLFNBXCgVK0+wjfiUaqRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=a47X/CRM; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d24a727f78so50248701fa.0
        for <linux-next@vger.kernel.org>; Mon, 04 Mar 2024 00:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709539369; x=1710144169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gtlvrgqpZklQkEKYnLjgHRVt/fow+xyugZpWWHGtqds=;
        b=a47X/CRMe1pwSH3l8D0X5us3ht9a0zWRkiQEQ2HaODeydmcTp7I4j4BTwFjMRYwWhp
         r2iurDox9mt+qv1v354sbpRjCZNMOJEF6uwPlx6grTouGduuCRwljFT5hUzQ/i2/5YiT
         QHNMkzkGKTG7ipn8zYcrQERiAzcapuFTqdHXXTVzcvfMin18CZLnyzmHvPDQ/d7ILDd/
         8fS6awIQDy/7cFbTS6UPA2xyeF0J2BR5viDoIbNB2JPvSJYEkr10G1rmqa0CxJDSe06W
         1Vv5YQFtI4kBuHFFn4zbbGr5XGXEkoY3JxMHda5C1ubi1DYmCf6ttAmeqRS/pbgsyyXb
         phyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539369; x=1710144169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtlvrgqpZklQkEKYnLjgHRVt/fow+xyugZpWWHGtqds=;
        b=g83Lymt0SqTSGavS50ylotaeazPToobjPL1nZsBYVsIpOz17eaFPpA+2zbyRZlu9Af
         oYv96VrFhPBSqkxsWHQceontTUtpY1+u3/AOPJeT6RL4LFZDnl9hywhyYrqViJJn0IH7
         TCQaQ1AOMppFhFo3fVyjaEve5exsgoyp6EDL6N884vb9U+LK47VIAr3P7mKBkIyIhZEB
         Lqx+ggKojNTR42+KgpC/LI7OqkAcpFkJmM5o49444Tp4A06/lttrCs/kTZ+B9AblZMoB
         aDHr5ZqY3CPO5vGyydklTdZpkaOFFPMem67NUb9EcQEuCpi7ADPlLNpmrenwl5vn+x41
         q5nw==
X-Forwarded-Encrypted: i=1; AJvYcCWBuXwGbscBQNtmrSrCjUmOoYDtlCvT6fVvrIH5x9ih4BixCA1EtUmbHJ/1zkfsVqMt/r6V4UHUKWcCtNe40j7CWJSSVYkQDT6GTA==
X-Gm-Message-State: AOJu0Yxtg2aitNaqAjcTsKYKaJTWKYciCciAtZNbTk4+qAXKKoUpBDfY
	OowJQKOTfTjiKuLaydvxKyTReQ5U0cF6dYEGvdmsFag5Oy4hQOrAoYV/8egxHbQ=
X-Google-Smtp-Source: AGHT+IFED/yYEBIF1j8I6CFBLLSnSkchoxI3Bvz64nJ6NMI0b0uSnfEaPsXBLlJrn8oZCubMvR0sfA==
X-Received: by 2002:a2e:958b:0:b0:2d2:7e19:f6 with SMTP id w11-20020a2e958b000000b002d27e1900f6mr6052452ljh.23.1709539369591;
        Mon, 04 Mar 2024 00:02:49 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d4583000000b0033b47ee01f1sm11442472wrq.49.2024.03.04.00.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:02:49 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Fix compilation error with FAST_GUP and rv32
Date: Mon,  4 Mar 2024 09:02:47 +0100
Message-Id: <20240304080247.387710-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By surrounding the definition of pte_leaf_size() with a ifdef napot as
it should have been.

Fixes: e0fe5ab4192c ("riscv: Fix pte_leaf_size() for NAPOT")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 25ca14f6942c..54d26a07fa63 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -439,9 +439,11 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
 #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
 					napot_cont_size(napot_cont_order(pte)) :\
 					PAGE_SIZE)
+#endif
 
 #ifdef CONFIG_NUMA_BALANCING
 /*
-- 
2.39.2


