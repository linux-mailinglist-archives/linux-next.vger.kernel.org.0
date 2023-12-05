Return-Path: <linux-next+bounces-229-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9127B804B02
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 08:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6625C281723
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 07:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3D915EBE;
	Tue,  5 Dec 2023 07:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RIABjkL0"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DE4184
	for <linux-next@vger.kernel.org>; Mon,  4 Dec 2023 23:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701760700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nk63w2FM4PAdC43nY6LXoZWQzTzQEt+cPn1qq6XLAvs=;
	b=RIABjkL0fzXnrj9umCX0thSlL1WLa1PoI+LOxLgKCFrw6WClqyLbJMSFMBV2jmqY6ppdOL
	DUy7aYElfbcKcW+GsAsE94BXbjPAGgyTwFuQRQiDbHq3C9OqoQEF+LneLFIlyztLHtzyHf
	HwS+IjDUkAKg+ZCPrlG1XHmlsdssvTc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-YDj-lje6OVi0pLS1qQl3SQ-1; Tue, 05 Dec 2023 02:18:13 -0500
X-MC-Unique: YDj-lje6OVi0pLS1qQl3SQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C081835144;
	Tue,  5 Dec 2023 07:18:13 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42989492BC6;
	Tue,  5 Dec 2023 07:18:11 +0000 (UTC)
Date: Tue, 5 Dec 2023 15:18:09 +0800
From: Baoquan He <bhe@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org,
	ignat@cloudflare.com, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, eric_devolder@yahoo.com
Subject: Re: [PATCH 1/2] riscv, crash: don't export some symbols when
 CONFIG_MMU=n
Message-ID: <ZW7OsX4zQRA3mO4+@MiWiFi-R3L-srv>
References: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
 <ZW03ODUKGGhP1ZGU@MiWiFi-R3L-srv>
 <694baf13-65d0-4877-b6c7-56e3006f83be@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <694baf13-65d0-4877-b6c7-56e3006f83be@infradead.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

On 12/04/23 at 11:14am, Randy Dunlap wrote:
......
> > ---
> >  arch/riscv/kernel/crash_core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/kernel/crash_core.c b/arch/riscv/kernel/crash_core.c
> > index 55f1d7856b54..8706736fd4e2 100644
> > --- a/arch/riscv/kernel/crash_core.c
> > +++ b/arch/riscv/kernel/crash_core.c
> > @@ -5,17 +5,19 @@
> >  
> >  void arch_crash_save_vmcoreinfo(void)
> >  {
> > -	VMCOREINFO_NUMBER(VA_BITS);
> >  	VMCOREINFO_NUMBER(phys_ram_base);
> >  
> >  	vmcoreinfo_append_str("NUMBER(PAGE_OFFSET)=0x%lx\n", PAGE_OFFSET);
> >  	vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
> >  	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=0x%lx\n", VMALLOC_END);
> > +#ifdef CONFIG_MMU
> > +	VMCOREINFO_NUMBER(VA_BITS);
> >  	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
> >  	vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
> >  #ifdef CONFIG_64BIT
> >  	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
> >  	vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);
> > +#endif
> >  #endif
> >  	vmcoreinfo_append_str("NUMBER(KERNEL_LINK_ADDR)=0x%lx\n", KERNEL_LINK_ADDR);
> >  	vmcoreinfo_append_str("NUMBER(va_kernel_pa_offset)=0x%lx\n",
> 
> Both riscv 32-bit and 64-bit complain:
> 
> ../arch/riscv/kernel/crash_core.c: In function 'arch_crash_save_vmcoreinfo':
> ../arch/riscv/kernel/crash_core.c:11:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
>    11 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>       |                                                        ~~^
>       |                                                          |
>       |                                                          long unsigned int
>       |                                                        %x

Thanks for all these testing.

This warning is irrelevant to the kexec patch, it's becasue 
VMALLOC_START is defined as 0 which is int when CONFIG_MMU=n.

Below patch can fix the warning.

From 46984a0287e5f1b41ae3e9adfcfa0d26b71db8f4 Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Tue, 5 Dec 2023 11:02:55 +0800
Subject: [PATCH] riscv: fix VMALLC_START definition
Content-type: text/plain

When below config items are set, compiler complained:

--------------------
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_CRASH_DUMP=y
......
-----------------------

-------------------------------------------------------------------
arch/riscv/kernel/crash_core.c: In function 'arch_crash_save_vmcoreinfo':
arch/riscv/kernel/crash_core.c:11:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
11 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
   |                                                        ~~^
   |                                                          |
   |                                                          long unsigned int
   |                                                        %x
----------------------------------------------------------------------

This is because on riscv macro VMALLOC_START has different type when
CONFIG_MMU is set or unset.

arch/riscv/include/asm/pgtable.h:
--------------------------------------------------

Changing it to _AC(0, UL) in case CONFIG_MMU=n can fix the warning.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 294044429e8e..ab00235b018f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -899,7 +899,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 #define PAGE_KERNEL		__pgprot(0)
 #define swapper_pg_dir		NULL
 #define TASK_SIZE		0xffffffffUL
-#define VMALLOC_START		0
+#define VMALLOC_START		_AC(0, UL)
 #define VMALLOC_END		TASK_SIZE
 
 #endif /* !CONFIG_MMU */
-- 
2.41.0


