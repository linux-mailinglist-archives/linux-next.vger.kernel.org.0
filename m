Return-Path: <linux-next+bounces-3830-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0C97851E
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 17:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99B8A1C22543
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 15:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C52768FD;
	Fri, 13 Sep 2024 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLxPSwzE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148D76046;
	Fri, 13 Sep 2024 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726242580; cv=none; b=t06jGxrc3mdHtRt/OSEhNammXwUp+lZISVpYuSKOWcLlaDhj9KTeDjYlMjqY3b+5LMe2bY5XrJX+xUv35M4Af1zK8PyT08w/9QBAgA7p4bGc3LeD2QpXQ2TRh0VPyv0p3bdBRa0U8UIcCuliN/gtScpVcgpGp/2yYoWJcEwKaU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726242580; c=relaxed/simple;
	bh=uGdeG5g7YaZNYd+BdEq0aRneEgUwGE+WwMP/V0KR3sU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBzdXZxv0R/lPzlZDp0ORbvBjH2qdTgm+ZYiDoSZTSRJywqR2InNw76CK0BajP+9QXzoicYrr9ZSNhxbjVwjlP3YZla7zGFvHBoBHPmGBkaW4tAEKaZ4vkDohGTan3bnLB+IKHG1tydO2Ol4CpWb4UFShLF1tmVPPrcmTG3IPzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLxPSwzE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD95BC4CEC0;
	Fri, 13 Sep 2024 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726242580;
	bh=uGdeG5g7YaZNYd+BdEq0aRneEgUwGE+WwMP/V0KR3sU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OLxPSwzECO5j8oDRQ7bJS8onDj9zAVk316k6rA0SUXQ+LbuWNP9DuiVnvN0VRSLVF
	 zQM6b6A+uWgKaLSJgdj3DCltSOmwVbVw7VGUyvL4fLXfFR2Ow2dJjj5YYrBXdKUooK
	 y8iUJFIT+U+omqhEIDw4MlSxNmyWbmNDbgmOwhSZ7EF2ynF7vIqxDZQs0Mum650A4S
	 e5KRLHu45ull5SUE9PG2+JEd7MLQC+3iZ0f8xeAjxlqHU20g87GhQihAn/etSd3wAI
	 tHkwfudAzsfGIF2K2sdRxxvvxCPlM0kW5dEYCKpjxpWAEV88doayfenkN/CI9mL3MK
	 hqIvkScOKzBJg==
Date: Fri, 13 Sep 2024 08:49:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Mina Almasry <almasrymina@google.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913084938.71ade4d5@kernel.org>
In-Reply-To: <20240913083426.30aff7f4@kernel.org>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<20240913204138.7cdb762c@canb.auug.org.au>
	<20240913083426.30aff7f4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 08:34:26 -0700 Jakub Kicinski wrote:
> > The second "asm" above (CONFIG_PPC_KERNEL_PREFIXED is not set).  I am
> > guessing by searching for "39" in net/core/page_pool.s
> > 
> > This is maybe called from page_pool_unref_netmem()  
> 
> Thanks! The compiler version helped, I can repro with GCC 14.
> 
> It's something special about compound page handling on powerpc64,
> AFAICT. I'm guessing that the assembler is mad that we're doing
> an unaligned read:
> 
>    3300         ld 8,39(8)       # MEM[(const struct atomic64_t *)_29].counter, t
> 
> which does indeed look unaligned to a naked eye. If I replace
> virt_to_head_page() with virt_to_page() on line 867 in net/core/page_pool.c
> I get:
> 
>    2982         ld 8,40(10)      # MEM[(const struct atomic64_t *)_94].counter, t
> 
> and that's what we'd expect. It's reading pp_ref_count which is at
> offset 40 in struct net_iov. I'll try to take a closer look at 
> the compound page handling, with powerpc assembly book in hand, 
> but perhaps this rings a bell for someone?

Oh, okay, I think I understand now. My lack of MM knowledge showing.
So if it's a compound head we do:

static inline unsigned long _compound_head(const struct page *page)             
{                                                                               
        unsigned long head = READ_ONCE(page->compound_head);                    
                                                                                
        if (unlikely(head & 1))                                                 
                return head - 1;                                                
        return (unsigned long)page_fixed_fake_head(page);                       
}

Presumably page->compound_head stores the pointer to the head page.
I'm guessing the compiler is "smart" and decides "why should I do
ld (page - 1) + 40, when I can do ld page + 39 :|

I think it's a compiler bug...

