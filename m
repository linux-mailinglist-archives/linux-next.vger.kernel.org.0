Return-Path: <linux-next+bounces-9267-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F9AC92E7B
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 19:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EB82434266C
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 18:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5D3262D0B;
	Fri, 28 Nov 2025 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="y0o0BUr2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB0E23370F;
	Fri, 28 Nov 2025 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764354275; cv=none; b=sB+Ud2jZM0mmUqLvFK0MyFFvVHRinw98LkCBBGxJy5v+MVYtfU9gCR/fzgH+31rY00m1fg4Vethc5AO98Pbqyz+hDkAw2xjhaZsM8g12ujrHdrsR+mScxVSBEyKolKjEmNUjeB5JFTJ3Yszy50EPLd7v0NAaZbTwAu+02Hhi/2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764354275; c=relaxed/simple;
	bh=PFqestTo7SYrNkhzWRHsh9OobWGXJgcO++km6bIhFQQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KOhtH0XHe0k4j5OOARq8vh8rvgYhHjgiDpNKM3XADKjv998u9LnUG5jAfU4zjs4GwngIZmilsqTla9Ul0A3EeU6iBuvBVOKllBp+ZO6poVM0xbCLKB0d/0Q2PDEStBRs1lLkVP03qIrsB0nw9KL2ePMMDy2y5G+28PEKQmuiF3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=y0o0BUr2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2146EC4CEF1;
	Fri, 28 Nov 2025 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764354274;
	bh=PFqestTo7SYrNkhzWRHsh9OobWGXJgcO++km6bIhFQQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=y0o0BUr2Sdu8FZc7oabYHrLEZ0i1G4eUAxWWq6dY9Mq3EcT+kBjGRCB9oL7yPtJ1X
	 m76QKurmDUfP8/nPUCJ7ZhCGn69vD/nLVFC2S4taV9by/4xQbzkrpYeuJ2rZMclTpM
	 Fu73KTkwo0XR/PD0Rq71MeOO6+3mddgQsx3NQUf0=
Date: Fri, 28 Nov 2025 10:24:33 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Deepak Gupta <debug@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <pjw@kernel.org>
Subject: Re: linux-next: manual merge of the risc-v tree with the
 mm-unstable tree
Message-Id: <20251128102433.9078be7e10ef9d97171e5b50@linux-foundation.org>
In-Reply-To: <20251128102707.15b3f283@canb.auug.org.au>
References: <20251128102707.15b3f283@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Nov 2025 10:27:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the risc-v tree got a conflict in:
> 
>   include/linux/mm.h
> 
> between commit:
> 
>   554156bd610e ("mm: declare VMA flags by bit")
> 
> from the mm-unstable tree and commit:
> 
>   ae8460ac9db2 ("mm: add VM_SHADOW_STACK definition for riscv")
> 
> from the risc-v tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.  Looks like a huge mess, but in fact it's just this change,
from the riscv tree:

--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -380,6 +380,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

which should be simple for Linus to resolve.

