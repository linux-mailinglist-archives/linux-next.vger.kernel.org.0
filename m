Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3476737F705
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 13:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbhEMLqV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 May 2021 07:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233464AbhEMLqG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 May 2021 07:46:06 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75EC5C061574;
        Thu, 13 May 2021 04:44:54 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id a25so6497271edr.12;
        Thu, 13 May 2021 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fwzbWl952fr1P0i3advgiqJAkCDz6mXDvjh1DVmI6Og=;
        b=hpFaMfGXlNFpwUyf3GqvGgp/CVBDnzn5C/Acnmbqx5YDZ56B0diF/EPDk8I5OjzkCt
         xiqGQqYocsG8LYxn0SG8GDXvL2Jjytw8VEzS5xUz49cuUOcvFwlqoTK0hW6E0L47OKwz
         GbEnOkz/c8mpAXwiifYgktaX8cR3xjIUWrlfgELULem0TrqYdf0T63kucbwYzuHKqRpH
         V1IqqL8Qxhc/Y6yA8K47KM/NGzrYO2m8lvomKC31jWN8LN2L0BwbOJDMo04Vy+vMNUqg
         a6BpQ4lAtf8hNSVfrevXxA5QtAb+Y8yhlRKqf7U2Jdtb0XjAPO1arkG17YbyE2sgpdkg
         BQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=fwzbWl952fr1P0i3advgiqJAkCDz6mXDvjh1DVmI6Og=;
        b=DeeXIx/PjrS6WVxS3PMxAufxRMdu1MVyJrdwEvvFInmsTVQsJwsVRrX7D6Gw580FRR
         Ffz3rAsDlxWf1ANlYKpaJuPfccM8UpUJbfDB2TLEEsfg+THH4JAr2aFysAa+T2z8VrfP
         reM8OLRiiDd7j95vk1KQmAHvQ4dv947EbeglwIOWUQguErUF7FaZmt+dTUde8NBozeHU
         /EHzmccQWocDK5vz5JABOeLl4Y2BEuI8bcMASdb+mocVBqstGl59N/tuz8e6rQli2Nw4
         Pl3vos5u/Q4aD2T8xhLq525BlZwbXdob8dtPMXvXepE6hL65MHiL0SNxutjROzY4zmWa
         iDIQ==
X-Gm-Message-State: AOAM53362KnYYhKyymAOIIzAI/qVECL/LlsQ26plCXhViO94+DQHVyCI
        o3qbaS7tnGMmIgWXM7tMkRA=
X-Google-Smtp-Source: ABdhPJz49bKr2qwULSaCzQhwDbmJIg7e1vfwWmaFbXe1JyB7Tvy61vu10yE5W7cN7cO+asnqdqxiWQ==
X-Received: by 2002:aa7:cd46:: with SMTP id v6mr48523581edw.16.1620906293180;
        Thu, 13 May 2021 04:44:53 -0700 (PDT)
Received: from gmail.com (0526E777.dsl.pool.telekom.hu. [5.38.231.119])
        by smtp.gmail.com with ESMTPSA id k9sm1792772eje.102.2021.05.13.04.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 04:44:52 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Thu, 13 May 2021 13:44:51 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     "H. Peter Anvin" <hpa@zytor.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] x86/asm: Make <asm/asm.h> valid on cross-builds as well
Message-ID: <YJ0RM2JIfFL8a0X2@gmail.com>
References: <20210513120515.7060879c@canb.auug.org.au>
 <YJ0Ew9gjprpCByxF@gmail.com>
 <4A5E6F25-37B6-4114-AB3C-476F6F551DBD@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A5E6F25-37B6-4114-AB3C-476F6F551DBD@zytor.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* H. Peter Anvin <hpa@zytor.com> wrote:

> Needed some head scratching, but then...
> 
> It makes sense for the cross-build: it's building for the host, and a 
> non-x86 machine isn't doing to have a register named "%rsp".

Oh, indeed, sfr is building on powerpc64 I think?

> So this needs to be protected from non-kernel use either via __KERNEL__ 
> or by factoring the basic macros out into a separate file.

So something like the below?

The exception table stuff is definitely kernel-only. The others could, in 
principle, be used by tooling as well.

Thanks,

	Ingo

=======================>
From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 13 May 2021 13:41:41 +0200
Subject: [PATCH] x86/asm: Make <asm/asm.h> valid on cross-builds as well

Stephen Rothwell reported that the objtool cross-build breaks on
non-x86 hosts:

  > tools/arch/x86/include/asm/asm.h:185:24: error: invalid register name for 'current_stack_pointer'
  >   185 | register unsigned long current_stack_pointer asm(_ASM_SP);
  >       |                        ^~~~~~~~~~~~~~~~~~~~~

The PowerPC host obviously doesn't know much about x86 register names.

Protect the kernel-specific bits of <asm/asm.h>, so that it can be
included by tooling and cross-built.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/asm.h       | 4 ++++
 tools/arch/x86/include/asm/asm.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
index 507a37a46027..3ad3da9a7d97 100644
--- a/arch/x86/include/asm/asm.h
+++ b/arch/x86/include/asm/asm.h
@@ -120,6 +120,8 @@
 # define CC_OUT(c) [_cc_ ## c] "=qm"
 #endif
 
+#ifdef __KERNEL__
+
 /* Exception table entry */
 #ifdef __ASSEMBLY__
 # define _ASM_EXTABLE_HANDLE(from, to, handler)			\
@@ -186,4 +188,6 @@ register unsigned long current_stack_pointer asm(_ASM_SP);
 #define ASM_CALL_CONSTRAINT "+r" (current_stack_pointer)
 #endif /* __ASSEMBLY__ */
 
+#endif /* __KERNEL__ */
+
 #endif /* _ASM_X86_ASM_H */
diff --git a/tools/arch/x86/include/asm/asm.h b/tools/arch/x86/include/asm/asm.h
index 507a37a46027..3ad3da9a7d97 100644
--- a/tools/arch/x86/include/asm/asm.h
+++ b/tools/arch/x86/include/asm/asm.h
@@ -120,6 +120,8 @@
 # define CC_OUT(c) [_cc_ ## c] "=qm"
 #endif
 
+#ifdef __KERNEL__
+
 /* Exception table entry */
 #ifdef __ASSEMBLY__
 # define _ASM_EXTABLE_HANDLE(from, to, handler)			\
@@ -186,4 +188,6 @@ register unsigned long current_stack_pointer asm(_ASM_SP);
 #define ASM_CALL_CONSTRAINT "+r" (current_stack_pointer)
 #endif /* __ASSEMBLY__ */
 
+#endif /* __KERNEL__ */
+
 #endif /* _ASM_X86_ASM_H */
