Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31A63160D5
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 09:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233814AbhBJIVq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 03:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233472AbhBJIVl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 03:21:41 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3C5C061574;
        Wed, 10 Feb 2021 00:21:01 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id z7so782864plk.7;
        Wed, 10 Feb 2021 00:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=y9ueWC+qy7zRAnCAZ9+0eKnj/8u9oJqH4nTZhyJhcxU=;
        b=uhCgB6TtwZ04qIdJFahWJ+phR4sQIelHq1yi3fTzolVjT44jmQOapFamwyNDpHmlLJ
         a7aKVWQ2pI52IPboZv8SB/h32ax4C4pdVIC5K85Sqz2tSOIyNrBZZ4sre95+bxqS7YA5
         WP7ELgRpCGjPw65N+g/9E67vlznfbRhBRue440khdfbCI0TWM0R6g4fHY1/fdbY1845t
         eZ42u7T3cdqd48Ku3JDvQsywE3TQy9mw35XXrQ1vvuaBdOR0TrjdGOnbT0A6jLo3UWIT
         z5/UVOHSnZ3bhkXS82hFOlx6Q0uQEUQpNONKM/eNysQz7sKMZpzYzukcI265H8pn9elG
         4/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=y9ueWC+qy7zRAnCAZ9+0eKnj/8u9oJqH4nTZhyJhcxU=;
        b=eO6sssjWax3eb9+XyogYubdnjcy4JiKXxknN3UKH06fBrgCMKWxW+5WDB4I8NBPCX6
         Edb3p2PF+SQXxVMWPxq7EhC5olt+aIbRDnAcEgS3ijnZUXDZuioiyR7XeinZqDCFtE+3
         gIfdOpdYqByxd1WDnjZJ06tQgpwXcKOx4z6UABBJ9xDpu/kC8vhRmgk7j+3V3eKfkOZj
         LIjB+bfMKWfpOPqqgKetpiGxs1LQ2rhCBn3WN+TYVLQ+JNm7VXU4IhMDVJK5+KU+ihha
         ZnPiZZFidsk+XbHmpSWmCSZYrjTObV2ONvCweA+OdIEQHAgCZv+MbtimZJblTuXkqBBN
         iX4w==
X-Gm-Message-State: AOAM533hI78lFKEvSnlejPvkOpoFKL+0wA8VjeCF2XBeMTYAYnMeptmP
        NCtdhyD5JerKsjZ5jV2M3k4bncOI1io=
X-Google-Smtp-Source: ABdhPJxX/BPSWkTKCX656F5jzGCJybSd/yRy8Lxrt2741SututWjlFOTlsEMSSSPtSfark+udAsv/g==
X-Received: by 2002:a17:902:b089:b029:e3:28:b8ee with SMTP id p9-20020a170902b089b02900e30028b8eemr2039609plr.84.1612945260944;
        Wed, 10 Feb 2021 00:21:00 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
        by smtp.gmail.com with ESMTPSA id b17sm1179361pfl.190.2021.02.10.00.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 00:21:00 -0800 (PST)
Date:   Wed, 10 Feb 2021 18:20:54 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
To:     PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210209211921.777e3053@canb.auug.org.au>
In-Reply-To: <20210209211921.777e3053@canb.auug.org.au>
MIME-Version: 1.0
Message-Id: <1612945076.ng7h3tp2jn.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Excerpts from Stephen Rothwell's message of February 9, 2021 8:19 pm:
> Hi all,
>=20
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x0): relocation truncated to=
 fit: R_PPC64_REL24 (OPD) against symbol `do_page_fault' defined in .opd se=
ction in arch/powerpc/mm/fault.o
> arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x8): relocation truncated to=
 fit: R_PPC64_REL24 (OPD) against symbol `do_page_fault' defined in .opd se=
ction in arch/powerpc/mm/fault.o
> arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x28): relocation truncated t=
o fit: R_PPC64_REL24 (OPD) against symbol `unknown_exception' defined in .o=
pd section in arch/powerpc/kernel/traps.o
>=20
> Not sure exactly which commit caused this, but it is most likkely part
> of a series in the powerpc tree.
>=20
> I have left the allyesconfig build broken for today.

Hey Stephen,

Thanks for that, it's due to .noinstr section being put on the other=20
side of .text, so all our interrupt handler asm code can't reach them=20
directly anymore since the ppc interrupt wrappers patch added noinstr
attribute.

That's not strictly required though, we've used NOKPROBE_SYMBOL okay
until now. If you can take this patch for now, it should get=20
allyesconfig to build again. I'll fix it in the powerpc tree before the=20
merge window.

Thanks,
Nick
--

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/as=
m/interrupt.h
index 4badb3e51c19..fee1e4dd1e84 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -172,6 +172,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt=
_regs *regs, struct inter
 #define DECLARE_INTERRUPT_HANDLER_RAW(func)				\
 	__visible long func(struct pt_regs *regs)
=20
+#define ppc_noinstr         noinline notrace __no_kcsan __no_sanitize_addr=
ess
+
 /**
  * DEFINE_INTERRUPT_HANDLER_RAW - Define raw interrupt handler function
  * @func:	Function name of the entry point
@@ -198,7 +200,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt=
_regs *regs, struct inter
 #define DEFINE_INTERRUPT_HANDLER_RAW(func)				\
 static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr long func(struct pt_regs *regs)			\
+__visible ppc_noinstr long func(struct pt_regs *regs)			\
 {									\
 	long ret;							\
 									\
@@ -228,7 +230,7 @@ static __always_inline long ____##func(struct pt_regs *=
regs)
 #define DEFINE_INTERRUPT_HANDLER(func)					\
 static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr void func(struct pt_regs *regs)			\
+__visible ppc_noinstr void func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_state state;					\
 									\
@@ -262,7 +264,7 @@ static __always_inline void ____##func(struct pt_regs *=
regs)
 #define DEFINE_INTERRUPT_HANDLER_RET(func)				\
 static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr long func(struct pt_regs *regs)			\
+__visible ppc_noinstr long func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_state state;					\
 	long ret;							\
@@ -297,7 +299,7 @@ static __always_inline long ____##func(struct pt_regs *=
regs)
 #define DEFINE_INTERRUPT_HANDLER_ASYNC(func)				\
 static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr void func(struct pt_regs *regs)			\
+__visible ppc_noinstr void func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_state state;					\
 									\
@@ -331,7 +333,7 @@ static __always_inline void ____##func(struct pt_regs *=
regs)
 #define DEFINE_INTERRUPT_HANDLER_NMI(func)				\
 static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr long func(struct pt_regs *regs)			\
+__visible ppc_noinstr long func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_nmi_state state;				\
 	long ret;							\
