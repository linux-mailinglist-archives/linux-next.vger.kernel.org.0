Return-Path: <linux-next+bounces-617-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352C8241E2
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 13:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF228286C06
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 12:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305E22230C;
	Thu,  4 Jan 2024 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mEopR9IX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D921A1E
	for <linux-next@vger.kernel.org>; Thu,  4 Jan 2024 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28ac851523so55543366b.0
        for <linux-next@vger.kernel.org>; Thu, 04 Jan 2024 04:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704371848; x=1704976648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0YjTQ6DAdt/2c3mL0l6eIgN8OTkE75G1dsO8pPOomQ=;
        b=mEopR9IXAZ8ER49J8Uh++34YDIOVbKN5erpP/wHQxrGUcIhH6DTUSS2g8cEBokav9i
         A/lEtutWeDCGupSK7OlJH4mldmC3iuDl7iRxGuEzlbfECllUwkBEfZimJrki1xjBqtkm
         bk6V1yjmESkwv5l/KCjfKGaHNqYF/WZRwFRdNXvx/hLfvdj7uUwnZZhXbmCRjzvDUsfw
         KEkycmZZU3suE1Pn+x/ApdDpBAAF3T6wqrr15aV6vf2luqt05zKw8GYZHtxf9/JdFeMn
         es5lO5Dz5tEtTBYrioVFgNKiDrKbYIG3Uz1UwHazFVo3YLrNKKI0jVzXCcmq8XPTvLhK
         EfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371848; x=1704976648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0YjTQ6DAdt/2c3mL0l6eIgN8OTkE75G1dsO8pPOomQ=;
        b=DVideYTb2h/TEy2Kg1uaLW7QuNA/q6qGUlKihCeqyhh3Nsw8qlmNSqgPbzIU/+acUc
         lCCI7OMEJ8BKbJg+8ptm/7cc2yYNu/lxV5v2KlL0cn/Bnx69fjr9dV7WHPAewgO3Tsvt
         7VrWP+LaDNNKGFVWJ7Gh9EhEs2PlVaakfaKKNEbkgw0XATEZWifkeCACCKHF6ePMTgkc
         AhrPeGMBhg0oiZjZk/bysQjZU9QCm632/+rloB2xCtwGP3cRyFEnokm0YQa0b7SoICGu
         tA3S5ixacQyiB4XSoTo6f754VEjYvz8o0fUibH4xRIIpaq2NR8+cbSvEHJY8BPyfjXy2
         YTxA==
X-Gm-Message-State: AOJu0YxsY6Qxu5/srD7IFh9ALAkB2dlmX+p/l35PdKP4BRWK2GGgMbGF
	/2zyOHQ6Pg7VWZhYtFmUHUSqRn5V05xwnQ==
X-Google-Smtp-Source: AGHT+IGuKrfQ1OvlUk+ZEceVcHij9CYGgADtdAxpjxUb2xwkyYhUHJZIQ7mR+ZBuQE0/8F7kowQcIw==
X-Received: by 2002:a17:906:fa90:b0:a26:b71e:f75 with SMTP id lt16-20020a170906fa9000b00a26b71e0f75mr299486ejb.5.1704371848691;
        Thu, 04 Jan 2024 04:37:28 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gh33-20020a1709073c2100b00a26b3f29f3dsm12649478ejc.43.2024.01.04.04.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:37:28 -0800 (PST)
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
	sfr@canb.auug.org.au,
	alex@ghiti.fr,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	pbonzini@redhat.com
Subject: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
Date: Thu,  4 Jan 2024 13:37:28 +0100
Message-ID: <20240104123727.76987-2-ajones@ventanamicro.com>
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

Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---

v2:
 - Added Fixes tag and -fixes prefix [Alexandre/Anup]

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


