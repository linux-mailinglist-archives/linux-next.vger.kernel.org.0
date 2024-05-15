Return-Path: <linux-next+bounces-2312-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D048C6002
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 07:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9BCE2883FF
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 05:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E36039879;
	Wed, 15 May 2024 05:01:49 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E474738FA3;
	Wed, 15 May 2024 05:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715749308; cv=none; b=le+HDXIB3UNYX6YG9GgMZeS297Ko/roVPTJPd/QVcxBjtJzLhu5E6K3wORIl5phv2rDf6bkmNzOaQ/OJRVER1qIRG/Y5NxzA8KbmlEBjr5OKC5f88R/Oe8rPlgE70+TNgvyoLFkXRDksFmZnV6e3BPOoSeRDOkCNqvxzAF+QT2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715749308; c=relaxed/simple;
	bh=2JNsWSb6+JXCXc9vlcYXDp7vufJpi+RxAtdqzSy7QzI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kuFqWhZxmryxb5omPMWpW1onLCQA1nvFLVm/8iRKhtTFRKotelGdGUZmLJCH5C+2BMYi/bs11j/SZfP7sbXO5ou8h11O2HBmvbdjQl3ikH9vfRCF6WXQfqPKo5lyoCeXlsmSFypeguvNIjvzcMPNIpEOXAjY/khWS86/Va47JyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF38C116B1;
	Wed, 15 May 2024 05:01:48 +0000 (UTC)
Date: Wed, 15 May 2024 01:01:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Vincent Donnefort
 <vdonnefort@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20240515010141.6457d409@rorschach.local.home>
In-Reply-To: <20240515004931.0d2e7af3@rorschach.local.home>
References: <20240515124808.06279d04@canb.auug.org.au>
	<20240515004931.0d2e7af3@rorschach.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 May 2024 00:49:31 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> > kernel/trace/ring_buffer.c:6286:72: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
> >  6286 |                 struct page *page = virt_to_page(cpu_buffer->subbuf_ids[s]);
> >       |                                                  ~~~~~~~~~~~~~~~~~~~~~~^~~
> >       |                                                                        |
> >       |                                                                        long unsigned int
> > include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
> >    37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
> >       |                                             ^~~
> > kernel/trace/ring_buffer.c:6286:37: note: in expansion of macro 'virt_to_page'
> >  6286 |                 struct page *page = virt_to_page(cpu_buffer->subbuf_ids[s]);
> >       |                                     ^~~~~~~~~~~~
> > arch/powerpc/include/asm/page.h:228:53: note: expected 'const void *' but argument is of type 'long unsigned int'
> >   228 | static inline unsigned long virt_to_pfn(const void *kaddr)
> >       |                                         ~~~~~~~~~~~~^~~~~
> > 
> > Introduced by commit
> > 
> >   117c39200d9d ("ring-buffer: Introducing ring-buffer mapping functions")
> > 
> > My arm multi_v7_defconfig build produced a similar warning.
> > 
> > Is this really intended for v6.10?  It seems a bit late.
> >   
> 
> Well, I submitted this for the v6.9 merge window, and Linus had issues
> with it. So we've been tweaking it for the entire time and it was ready
> a bit earlier, but due to my vacation and traveling I missed pushing it
> to next. :-p
> 
> Most the code has been well tested, but because it is late, I kept it
> as a separate topic branch in case Linus still isn't happy with it.

And it looks like one of the "tweaks" dropped a (void *) cast.

This should fixed it:

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index a02c7a52a0f5..7345a8b625fb 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6283,7 +6283,7 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
 	}
 
 	while (p < nr_pages) {
-		struct page *page = virt_to_page(cpu_buffer->subbuf_ids[s]);
+		struct page *page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
 		int off = 0;
 
 		if (WARN_ON_ONCE(s >= nr_subbufs)) {


-- Steve

