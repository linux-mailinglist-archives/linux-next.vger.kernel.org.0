Return-Path: <linux-next+bounces-611-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF7823F9F
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 11:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 899F61F24C84
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 10:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C308210F9;
	Thu,  4 Jan 2024 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="es4DCxXv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D1C210F3
	for <linux-next@vger.kernel.org>; Thu,  4 Jan 2024 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a28e6392281so35258966b.0
        for <linux-next@vger.kernel.org>; Thu, 04 Jan 2024 02:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704364989; x=1704969789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dtLgJ10JUGu29gifzEIMC137KNsEgAPpefsYRRnI/LY=;
        b=es4DCxXvVPYB3dHQECua89GgLM8w2mW57R8Q198PAS3MgJoouY1YqyJxsNN/H02Atn
         YbKrns68FWuMw+U3WyPkw5ROXYJcymivI+JzVt2ObROmsKTyyxdBclbglrRvBR/kXMj1
         46PjkuRvSzUo2FJBFOOC4ncoH0vyzEBfDOe3sWQykw+v53lgtO7V5iMhGC75M4rJIs6m
         gG74tIOgkT9FytxQE4jBwrbDMkW2mUSeAJYXl8G9SWBPMoehSuEXjeq5esNJF7zp2RD8
         jn/aB3qqhO4cjOjS+qdPrrUwyJMN0cH7de8QDsLFR3rPfiIJd4gMt8Y7NtqCmwyf2111
         2gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704364989; x=1704969789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtLgJ10JUGu29gifzEIMC137KNsEgAPpefsYRRnI/LY=;
        b=jZEDn+w1WtW9THx2lhVV1RcYodFtndVfCFZriNiIe8cL0YED0tbipFIdKCqgQFCFGj
         qJHPX8IIyAQqBdpgOY+UyMKl20sQcCXG5PUcgeFN1usUOEldxfS0A17lObtIQu96zRXZ
         TuXqWcL+S31DHQZJ7TOjtr6lpTpA7ggN/ToDf0ds4Szyew1tqnWHVKZzwTRdE+7qVO4q
         TWuSYeGexzdOYuiNtx7Nde3AuBl4YPxm+prXpyhfJdBbj5RyPmNIYEPXvhxJR/gtQf+y
         Q6XBtQOcRnZ+HcdWDY6FAQdOopiraeoBwpKT451WSnWvvcOz7+35tuG4aloxMdbqF+9S
         wGLQ==
X-Gm-Message-State: AOJu0YzKkE8tNOBGMyOhdDPr6PTN7u7CpyZUvnyceB5AVXQ6Q0p0kKuI
	RzBpe+diOiUgHqdHHSQ/czWqGLi+yT21lw==
X-Google-Smtp-Source: AGHT+IErP9SQJfg3eek7PNUhzNdrIRG39juNJVn3VmyuwSfWpv7iZgkPvVL31M+evfZIdAVUr/dsEQ==
X-Received: by 2002:a17:906:db05:b0:a28:dba3:3fd2 with SMTP id xj5-20020a170906db0500b00a28dba33fd2mr229850ejb.142.1704364988823;
        Thu, 04 Jan 2024 02:43:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709060f4500b00a1cf3fce937sm13664229ejj.162.2024.01.04.02.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:43:08 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	atishp@atishpatra.org,
	rdunlap@infradead.org,
	sfr@canb.auug.org.au
Subject: [PATCH] RISC-V: KVM: Require HAVE_KVM
Date: Thu,  4 Jan 2024 11:43:08 +0100
Message-ID: <20240104104307.16019-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
supporting architectures select HAVE_KVM and then their KVM
Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
consistent with that approach which fixes configs which have KVM
but not EVENTFD, as was discovered with a randconfig test.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig     | 1 +
 arch/riscv/kvm/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a935a5f736b9..daba06a3b76f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -128,6 +128,7 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
+	select HAVE_KVM
 	# https://github.com/ClangBuiltLinux/linux/issues/1881
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
 	select HAVE_MOVE_PMD
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 1fd76aee3b71..36fa8ec9e5ba 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -19,7 +19,7 @@ if VIRTUALIZATION
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
-	depends on RISCV_SBI && MMU
+	depends on HAVE_KVM && RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_MSI
-- 
2.43.0


