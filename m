Return-Path: <linux-next+bounces-4130-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4E993CA6
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 04:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE3C61F2229A
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 02:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8423C1CD0C;
	Tue,  8 Oct 2024 02:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aYk30I3I"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93B125A9
	for <linux-next@vger.kernel.org>; Tue,  8 Oct 2024 02:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728353295; cv=none; b=CS/6iLMoCIuuBDi0Tz9RKrawdOi6fzb+74ILIXueDZRLKmMYFCu9wJ0ELuN4KxD3Lmwvnn0ZFkT52d9IlXpkB9NIeHHAYFd1fPzVC81AyokUG4gcp0bi8nyjip3hIhJoOvB4DDPwWg2RJGBavoeNGvL6kvYmOa8e/vHXs8SZSK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728353295; c=relaxed/simple;
	bh=txEjyYwDK6Dw0nPvpf+z5iHXSCsXbk9TAgRwz00w2K8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gr9ItPagBMEm3xv23NP8GLedmLOnARF5I6HfstxbCPJCaSsadb02y1o1CsKxhr4FfaLiLKvY5HSNlvDeyP4+hfgA2HfHydSvEkvN7f5ShPGIZ9CVwZY7SglEZBf5LNs2yTTNcZ7v91WiuqWcNX6Nn6Pvdg+tZGFQPttijjBGpi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aYk30I3I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA45EC4CEC6;
	Tue,  8 Oct 2024 02:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1728353293;
	bh=txEjyYwDK6Dw0nPvpf+z5iHXSCsXbk9TAgRwz00w2K8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aYk30I3IMZEsQ6GcC6UWU8MtLxoxVpySrqACVXrYHIh/EXMB8YAUObhdSJxZEq2Ls
	 6leWejhe8yBGRfWWzhk1n0GgHGmiUHt9R2pvLh4+Gt1ngjSqta66GndwID0f+8lRw4
	 N8NOQAVUBiieDd4ZFHJHWK5ftNIZI44RMqRRS/Jo=
Date: Mon, 7 Oct 2024 19:08:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Brahmajit Das <brahmajit.xyz@gmail.com>
Cc: david@redhat.com, gorcunov@openvz.org, linux-next@vger.kernel.org,
 sfr@canb.auug.org.au
Subject: Re: [PATCH v3 1/1] fs/proc: Fix build with GCC 15 due to
 -Werror=unterminated-string-initialization
Message-Id: <20241007190813.f4effd5788cf7362a4fda19f@linux-foundation.org>
In-Reply-To: <20241005063700.2241027-1-brahmajit.xyz@gmail.com>
References: <20241004145804.57278eac01c2601abb20c671@linux-foundation.org>
	<20241005063700.2241027-1-brahmajit.xyz@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat,  5 Oct 2024 12:07:00 +0530 Brahmajit Das <brahmajit.xyz@gmail.com> wrote:

> show show_smap_vma_flags() has been using misspelled initializer in
> mnemonics[] - it needed to initialize 2 element array of char and it
> used NUL-padded 2 character string literals (i.e. 3-element
> initializer).
> 
> This has been spotted by gcc-15[*]; prior to that gcc quietly dropped
> the 3rd eleemnt of initializers. To fix this we are increasing the size
> of mnemonics[] (from mnemonics[BITS_PER_LONG][2] to
> mnemonics[BITS_PER_LONG][3]) to accomodate the NUL-padded string
> literals.
> 
> This also helps us in simplyfying the logic for printing of the flags as
> instead of printing each character from the mnemonics[], we can just
> print the mnemonics[] using seq_printf.
> 
> [*]: fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
>   917 |                 [0 ... (BITS_PER_LONG-1)] = "??",
>       |                                                 ^~~~
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]

> Cc: david@redhat.com, gorcunov@openvz.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au

It is strange to cc only linux-next.  It isn't really a development
mailing list.  Please include an appropriate development list and/or
linux-kernel on patches.

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
> @@ -987,11 +994,8 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>  	for (i = 0; i < BITS_PER_LONG; i++) {
>  		if (!mnemonics[i][0])
>  			continue;
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

Patch looks good.  I'll add this to the changelog:


Stephen pointed out:

: The C standard explicitly allows for a string initializer to be too long
: due to the NUL byte at the end ...  so this warning may be overzealous.

but let's make the warning go away anwyay.



