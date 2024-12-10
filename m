Return-Path: <linux-next+bounces-4934-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 365529EA7DA
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 06:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7CF2844E0
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 05:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE755224AEB;
	Tue, 10 Dec 2024 05:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AAYRabqU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0E1BC58;
	Tue, 10 Dec 2024 05:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733808613; cv=none; b=pww9Jx6AngJeR0JNhQjG44WuDonCzySUKjqCHhPSjq/OQjOsEwygj/0w9TbSH0NvkNCEH279kZNrEacTYMhNVM5XPayNXtE8EUcrGeyhiS0n/YQ0GKCRfosRUwS2vQsqi8n1VJsfvsfCtV9rqLz34c+yoJJs6lK1RyEIMx3X1qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733808613; c=relaxed/simple;
	bh=gKyLl7Ni8EQo6bSoMRSm1z+uDOmvAFDa0qi1Zuxu0PY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jaCnHzI/qIcgzMtoyaNvtNzgyPJ1MhlXbuEtTKHxeRO7A94By+YV0kF+pVbjqY71pIpTY5Mw8RzdAP6IRbHq3fFxtEJq2S7c7aH8w8r6WYXQqkBtgwS+2xVsj7V7de1CZ8ACz0RGu9zClwrFXsoJYa5wjJhAt0v4jnmp6VvgJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AAYRabqU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C30C4CED6;
	Tue, 10 Dec 2024 05:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1733808613;
	bh=gKyLl7Ni8EQo6bSoMRSm1z+uDOmvAFDa0qi1Zuxu0PY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AAYRabqUYAEfJZW8m5Ro7cRX9qy0pZ/k7LUDYS91uGD6RFAmVKnHUWqz5VQ/0Seay
	 OeSRANvCFLZw5Z5BG9+4MQQfflmx75tRys7Z32yl+/IQeA6JTKbzMZx7uobhZKAxY7
	 Yw6gbLcUxvZQE1j+tDNMTJVGg7Nh4GzA5ZW17qR4=
Date: Mon, 9 Dec 2024 21:30:12 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Suren Baghdasaryan <surenb@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, SeongJae Park <sj@kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20241209213012.79c59371f25c08bcedfbc0c9@linux-foundation.org>
In-Reply-To: <20241210160011.00c3dcd0@canb.auug.org.au>
References: <20241209170829.11311e70@canb.auug.org.au>
	<20241209182557.8794e5b886e4ca91994ed0d7@linux-foundation.org>
	<20241210160011.00c3dcd0@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Dec 2024 16:00:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Mon, 9 Dec 2024 18:25:57 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > How about this?
> 
> Unfortunately:
> 
> In file included from mm/damon/vaddr.c:736:
> mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_vmas':
> mm/damon/tests/vaddr-kunit.h:81:36: error: passing argument 2 of '__link_vmas' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>    81 |         if (__link_vmas(&mm.mm_mt, vmas, ARRAY_SIZE(vmas)))
>       |                                    ^~~~
> mm/damon/tests/vaddr-kunit.h:17:70: note: expected 'struct vm_area_struct *' but argument is of type 'const struct vm_area_struct *'
>    17 | static int __link_vmas(struct maple_tree *mt, struct vm_area_struct *vmas,
>       |                                               ~~~~~~~~~~~~~~~~~~~~~~~^~~~

Bah.  OK, I'll drop the const.

