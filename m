Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDA7226154
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 15:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgGTNwb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 09:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgGTNwa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 09:52:30 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7951DC061794;
        Mon, 20 Jul 2020 06:52:30 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id br7so18112105ejb.5;
        Mon, 20 Jul 2020 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F/UbNWIBaeF674uXxxrVs12lknTwnRrVE0eK/PDNsco=;
        b=EiaOlkSAkiXnvBxrUoOX/6AmFKWe9GmqAQVnnPQ37yNptmuZCpQx05OkZCyBzq/sd1
         ApWKsfV6HW8zSXYHkFIjCkRqyQPaAR46HdQWor6et0u12r2FCtBrJlt7BOHfivFoskCQ
         oyLPvuM+2sptH27hO3rInki0Pg7TAAK4jKMyJQEPX1CIcglNR07yUCFd1eMiNzoqFpp8
         uBa1uXgkE4CEZyIhAPsXdBYfFYZonF+8rZywOzbMxsm1iXUWzFm4KiQEd3c8wSU4NtQX
         n9ng48kwgbvP8OYSMFuUvX7yplWyT2T/8RYBkSLgd1VIQndyxIZq/zXwpu9F35gQ927l
         pc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F/UbNWIBaeF674uXxxrVs12lknTwnRrVE0eK/PDNsco=;
        b=Z11d6g6YECqRp3UPf5lWmtPACwoeg+e6W9DLP0omEWKlhh4x1C2zacHIcuhHC+D7Fz
         cr/RdCrIKdIV9hZLZwojtqkhYUBETFaVjrMqgG9K7+prkvQGaavljnwjbLISYqBy4p3h
         IIWJiz+WxZgBjOfpKbC5fTC5nfJI3OSZYeUrfQv5dPW5o5ELtEBxS1ovG5uC4gtA9+nd
         elWinEXnmiECMhQwh9NJqMdF8sRHedm/6ZGA4LC1EXqtC+Gw4MT1uovdqHOU4uOTwsBJ
         /hUWDhK367SgdEwIf7kVlw+ufNpA/Nb4E5ldTmPnLXT0HdJ233qmFDlH3y4nSvIZJvbT
         /t/A==
X-Gm-Message-State: AOAM532+dacMDC/cFNGAQwXDkYEfbNexeFojuDeYE+8I+0xU/44LU0HD
        pz80Fho/jwfG64scElZYJGj/58e4E88i2g==
X-Google-Smtp-Source: ABdhPJxpCBMEOoQnmoFIEri+t+8SuKntZy6icjwOEldQ9d2CgpK28AnzEgsy0LQfw83fBMZ3Bl3iYQ==
X-Received: by 2002:a17:906:9244:: with SMTP id c4mr20215259ejx.60.1595253148866;
        Mon, 20 Jul 2020 06:52:28 -0700 (PDT)
Received: from localhost.localdomain (93-103-18-160.static.t-2.net. [93.103.18.160])
        by smtp.gmail.com with ESMTPSA id r17sm15167779edw.68.2020.07.20.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:52:28 -0700 (PDT)
From:   Uros Bizjak <ubizjak@gmail.com>
To:     linux-crypto@vger.kernel.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Uros Bizjak <ubizjak@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH] crypto: x86 - Put back integer parts of include/asm/inst.h
Date:   Mon, 20 Jul 2020 15:51:57 +0200
Message-Id: <20200720135157.4332-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Resolves conflict with the tip tree.

CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>,
CC: "Chang S. Bae" <chang.seok.bae@intel.com>,
CC: Peter Zijlstra <peterz@infradead.org>,
CC: Sasha Levin <sashal@kernel.org>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/inst.h | 148 ++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 arch/x86/include/asm/inst.h

diff --git a/arch/x86/include/asm/inst.h b/arch/x86/include/asm/inst.h
new file mode 100644
index 000000000000..438ccd4f3cc4
--- /dev/null
+++ b/arch/x86/include/asm/inst.h
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Generate .byte code for some instructions not supported by old
+ * binutils.
+ */
+#ifndef X86_ASM_INST_H
+#define X86_ASM_INST_H
+
+#ifdef __ASSEMBLY__
+
+#define REG_NUM_INVALID		100
+
+#define REG_TYPE_R32		0
+#define REG_TYPE_R64		1
+#define REG_TYPE_INVALID	100
+
+	.macro R32_NUM opd r32
+	\opd = REG_NUM_INVALID
+	.ifc \r32,%eax
+	\opd = 0
+	.endif
+	.ifc \r32,%ecx
+	\opd = 1
+	.endif
+	.ifc \r32,%edx
+	\opd = 2
+	.endif
+	.ifc \r32,%ebx
+	\opd = 3
+	.endif
+	.ifc \r32,%esp
+	\opd = 4
+	.endif
+	.ifc \r32,%ebp
+	\opd = 5
+	.endif
+	.ifc \r32,%esi
+	\opd = 6
+	.endif
+	.ifc \r32,%edi
+	\opd = 7
+	.endif
+#ifdef CONFIG_X86_64
+	.ifc \r32,%r8d
+	\opd = 8
+	.endif
+	.ifc \r32,%r9d
+	\opd = 9
+	.endif
+	.ifc \r32,%r10d
+	\opd = 10
+	.endif
+	.ifc \r32,%r11d
+	\opd = 11
+	.endif
+	.ifc \r32,%r12d
+	\opd = 12
+	.endif
+	.ifc \r32,%r13d
+	\opd = 13
+	.endif
+	.ifc \r32,%r14d
+	\opd = 14
+	.endif
+	.ifc \r32,%r15d
+	\opd = 15
+	.endif
+#endif
+	.endm
+
+	.macro R64_NUM opd r64
+	\opd = REG_NUM_INVALID
+#ifdef CONFIG_X86_64
+	.ifc \r64,%rax
+	\opd = 0
+	.endif
+	.ifc \r64,%rcx
+	\opd = 1
+	.endif
+	.ifc \r64,%rdx
+	\opd = 2
+	.endif
+	.ifc \r64,%rbx
+	\opd = 3
+	.endif
+	.ifc \r64,%rsp
+	\opd = 4
+	.endif
+	.ifc \r64,%rbp
+	\opd = 5
+	.endif
+	.ifc \r64,%rsi
+	\opd = 6
+	.endif
+	.ifc \r64,%rdi
+	\opd = 7
+	.endif
+	.ifc \r64,%r8
+	\opd = 8
+	.endif
+	.ifc \r64,%r9
+	\opd = 9
+	.endif
+	.ifc \r64,%r10
+	\opd = 10
+	.endif
+	.ifc \r64,%r11
+	\opd = 11
+	.endif
+	.ifc \r64,%r12
+	\opd = 12
+	.endif
+	.ifc \r64,%r13
+	\opd = 13
+	.endif
+	.ifc \r64,%r14
+	\opd = 14
+	.endif
+	.ifc \r64,%r15
+	\opd = 15
+	.endif
+#endif
+	.endm
+
+	.macro REG_TYPE type reg
+	R32_NUM reg_type_r32 \reg
+	R64_NUM reg_type_r64 \reg
+	.if reg_type_r64 <> REG_NUM_INVALID
+	\type = REG_TYPE_R64
+	.elseif reg_type_r32 <> REG_NUM_INVALID
+	\type = REG_TYPE_R32
+	.else
+	\type = REG_TYPE_INVALID
+	.endif
+	.endm
+
+	.macro PFX_REX opd1 opd2 W=0
+	.if ((\opd1 | \opd2) & 8) || \W
+	.byte 0x40 | ((\opd1 & 8) >> 3) | ((\opd2 & 8) >> 1) | (\W << 3)
+	.endif
+	.endm
+
+	.macro MODRM mod opd1 opd2
+	.byte \mod | (\opd1 & 7) | ((\opd2 & 7) << 3)
+	.endm
+#endif
+
+#endif
-- 
2.26.2

