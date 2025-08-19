Return-Path: <linux-next+bounces-7994-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB0B2B6F8
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 04:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499945204EF
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 02:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F912287507;
	Tue, 19 Aug 2025 02:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sCAjS4Bg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57313A265;
	Tue, 19 Aug 2025 02:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755570583; cv=none; b=hFWtb/cRXOKySM6rgxtXu4GEXk5nVAMh50DACF1MtKwKOB0wBJsg/ASKPS/oVbZyWcrQ3zaZDpwiPqAcV1OaIoEoZgnuyhyhiFZKRZQ0wIxtQ6+9tFUnbfSVlnwNYqVNZ6GyYuzXU67VcIQVKrGk8OEoNA5I1E5KonLAyGY3JgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755570583; c=relaxed/simple;
	bh=dxQFtiQqBfgcZW7jYK5rAIvwpnQhF5wbmU8vX/hiHkY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FRrMQmA85oila80beRhCN8Bv8Y48MseeoamSk6Ng6mrHygRgv45zNhgwXhgcoEOVPJPyqozdppKuRfob/cn6k2Xog9okysNi18EVhnLz/772xs/Qu7elihvEgIWBEdzk36PNA9W8Vtc8ekkKo4F/oyKz9YD5jtQJqqPiDXqW8Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sCAjS4Bg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D036C4CEEB;
	Tue, 19 Aug 2025 02:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755570582;
	bh=dxQFtiQqBfgcZW7jYK5rAIvwpnQhF5wbmU8vX/hiHkY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sCAjS4Bgjt5fjnskES8nB6XtFvx2P1Na1sz0CzgGO0DXgbwbYHrRAbKeHInwBh0P8
	 FmcJvh9dDGm2dOV+R+BZMf8on9dzq/GTistX95T0nS6E9WbIwOB9zbwOqDY+J6Cz2b
	 Q+K3IqMiaYCkbVq11pjfVHANP3mzO9kuzG4sS/k0=
Date: Mon, 18 Aug 2025 19:29:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Vitaly Wool <vitaly.wool@konsulko.se>
Subject: Re: linux-next: manual merge of the bcachefs tree with the
 mm-unstable tree
Message-Id: <20250818192941.94fa175267dd4e334ca529ad@linux-foundation.org>
In-Reply-To: <20250819111228.6c6209eb@canb.auug.org.au>
References: <20250819111228.6c6209eb@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Aug 2025 11:12:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the bcachefs tree got a conflict in:
> 
>   fs/bcachefs/darray.c
> 
> between commit:
> 
>   97b75b7e275a ("mm/slub: allow to set node and align in k[v]realloc")
> 
> from the mm-unstable tree and commit:
> 
>   808708fe9da0 ("bcachefs: darray_make_room_rcu()")
> 
> from the bcachefs tree.
> 
> ...
>
> --- a/fs/bcachefs/darray.c
> +++ b/fs/bcachefs/darray.c
> @@@ -20,10 -22,11 +22,11 @@@ int __bch2_darray_resize_noprof(darray_
>   		if (unlikely(check_mul_overflow(new_size, element_size, &bytes)))
>   			return -ENOMEM;
>   
> - 		void *data = likely(bytes < INT_MAX)
> + 		void *old = d->data;
> + 		void *new = likely(bytes < INT_MAX)
>  -			? kvmalloc_noprof(bytes, gfp)
>  +			? kvmalloc_node_align_noprof(bytes, 1, gfp, NUMA_NO_NODE)
>   			: vmalloc_noprof(bytes);
> - 		if (!data)
> + 		if (!new)
>   			return -ENOMEM;

uh, OK, I guess a 2GB allocation is reasonable on a 16TB machine.

But why does bcachefs find it necessary to bypass allocation profiling?

