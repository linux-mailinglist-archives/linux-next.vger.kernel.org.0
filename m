Return-Path: <linux-next+bounces-4115-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671629911EB
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 23:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BF2F1C22605
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 21:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2851487DF;
	Fri,  4 Oct 2024 21:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qW7GgAmx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F3B1339B1
	for <linux-next@vger.kernel.org>; Fri,  4 Oct 2024 21:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728079086; cv=none; b=Kw2XYeDBFJWE9ThRnLjBoSmhCQN7suW+dSJOqbs6WQRaF4F+W82G/nNXSGy1Xd2glPrOk5EyiCjtizuKbfBx2Ayp29wlddZTZRrIWAMY+0N4U0qxDQ8rZUcjfKBS74iL8YSKrNUjqXeiPyQZ5a6sng7pKSExQFdAPv6XmbuBxkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728079086; c=relaxed/simple;
	bh=mpntnxihbjsgQlhkUSERZGj5X9TOu64qsmHHNCGejew=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sbsjHdUEV+n/KuPyW8me1pAgSOnTQz/Cmie9/Z4Ro64LVtc4D7V147BvV6aOytx+zwnGST37IksLfnhI0Me512H22t5PyKTv3jUNXrntyL/rs6g2Cf/g85xPEjmwT0+Hu8+S7Znft4qop47mi1tp5Qs+C/aYIwiYdVqmz0dUzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qW7GgAmx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76285C4CECC;
	Fri,  4 Oct 2024 21:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1728079085;
	bh=mpntnxihbjsgQlhkUSERZGj5X9TOu64qsmHHNCGejew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qW7GgAmxaFj3X4gzZeSA3aN3MLoG5jMkyNTIwNwNbpqwXJUYQ/zQaAcHjrHblToWD
	 OUbTCIojL3cjPUcxg76vBRfZe93FGi/m3WZlW6yaH5o6wk8WGbFvnM83ICkKAKLi6o
	 j5dYkURP7TbufN+i4BVLsoMQNmZVSPpaIcRUzqt0=
Date: Fri, 4 Oct 2024 14:58:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Brahmajit <brahmajit.xyz@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, david@redhat.com,
 gorcunov@openvz.org, linux-next@vger.kernel.org
Subject: Re: [PATCH v2 1/1] fs: proc: Fix build with GCC 15 due to
 -Werror=unterminated-string-initialization
Message-Id: <20241004145804.57278eac01c2601abb20c671@linux-foundation.org>
In-Reply-To: <wdpe6qft3ucqxpd6gyvz6pol5ct44g64b3azmnjxtv7buemk3q@kgxvzoxdx6pm>
References: <20241002080534.835250-1-brahmajit.xyz@gmail.com>
	<20241002080914.841071-1-brahmajit.xyz@gmail.com>
	<20241002144806.255d62115286e173bbf42655@linux-foundation.org>
	<wdpe6qft3ucqxpd6gyvz6pol5ct44g64b3azmnjxtv7buemk3q@kgxvzoxdx6pm>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 5 Oct 2024 02:42:12 +0530 Brahmajit <brahmajit.xyz@gmail.com> wrote:

> With Andrew's suggestion I came up with something like this, would love
> some feedback.
> 
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -909,8 +909,15 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>  {
>  	/*
>  	 * Don't forget to update Documentation/ on changes.
> +	 *
> +	 * The length of the second argument of mnemonics[]
> +	 * needs to be 3 instead of previously set 2
> +	 * (i.e. from [BITS_PER_LONG][2] to [BITS_PER_LONG][3])
> +	 * to avoid spurious
> +	 * -Werror=unterminated-string-initialization warning
> +	 *  with GCC 15
>  	 */
> -	static const char mnemonics[BITS_PER_LONG][2] = {
> +	static const char mnemonics[BITS_PER_LONG][3] = {
>  		/*
>  		 * In case if we meet a flag we don't know about.
>  		 */
> @@ -985,13 +992,10 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>  
>  	seq_puts(m, "VmFlags: ");
>  	for (i = 0; i < BITS_PER_LONG; i++) {
> -		if (!mnemonics[i][0])
> +		if (strcmp(mnemonics[i], "") == 0)
>  			continue;

lgtm, except this change isn't needed - testing the 0th char for NULL
is a common idiom.


> -		if (vma->vm_flags & (1UL << i)) {
> -			seq_putc(m, mnemonics[i][0]);
> -			seq_putc(m, mnemonics[i][1]);
> -			seq_putc(m, ' ');
> -		}
> +		if (vma->vm_flags & (1UL << i))
> +			seq_printf(m, "%s ", mnemonics[i]);
>  	}
>  	seq_putc(m, '\n');
>  }


