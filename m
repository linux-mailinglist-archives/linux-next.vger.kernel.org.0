Return-Path: <linux-next+bounces-9494-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E9FCD244B
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 01:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 365CB301A1BC
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 00:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEEB20F08D;
	Sat, 20 Dec 2025 00:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/crStLy"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE5150997;
	Sat, 20 Dec 2025 00:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766190984; cv=none; b=Yt1uFQMBgxdi8PUvLUGpy3b1BNHWn/HR32FmDdOECoSBfM69VZmduw7hPIzkd2l+iajFCKTKIjlMS5OwNTWw7yiEuQLTtLjAzOz59Sk/EhcNnzhOIFAVhl4uKXiCJmoV2SF4P25EXIP3oTX90ry4J4xgfyK0fvLfjKZSRKbSKHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766190984; c=relaxed/simple;
	bh=fEEzD1NrrnQmsn0cDTk58zJhqkjnZirFIIQsDDh9fjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P65toWz8/wD1rZ8/tTiUunNAlJ2PZMn07d20nWWcxe+wMjfU62KeE2BDkYXsKgLkDwnjRo3YUMSqYBrC518vsT3OwyfEirJiuqcCrWz3KC/Jyt2pTuEzFA3hWXu1RN1djuYbZgUWBy3eWlAr8w+TiIrCGTXigfVuV8tf1eP75Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/crStLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134B2C4CEF1;
	Sat, 20 Dec 2025 00:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766190984;
	bh=fEEzD1NrrnQmsn0cDTk58zJhqkjnZirFIIQsDDh9fjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/crStLyfRjcEbBZSghNk2GP/toW4QNPGBUbM0I394KsShn/ZElZSBgDRDItSY8uQ
	 Y6yhLNGYU3TICHW6gVQZqP0uhSE0mq1hpoVVumiEH/8IsmTy0XsECoGNzK5wpm1A0w
	 L+kxgMrk1n324Ttaej4zHvdkJlpizo49faQDec/qgf9MbnV5hXd/Nk7quaJHzF1cm5
	 cKXMtQ/FQjB+CdQz5lwI2ed0HNoJh44ZCb0c3DCGJGGFnghx7ubeipm7Qny3Mjc0Lg
	 axtjKe26PyFHBz2pzsKxq1E24yywu2/M7FSQIH2lFFwMRZK1A8M9HTC7dfctbmUjgH
	 mrAHgJlU79IWA==
Date: Fri, 19 Dec 2025 16:36:14 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christoph Lameter <cl@linux-foundation.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Dipen Patel <dipenp@nvidia.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Ingo Molnar <mingo@kernel.org>, Jean Delvare <jdelvare@suse.de>,
	Lee Jones <lee@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>,
	Tyler Hicks <code@tyhicks.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Subject: Re: linux-next: trees being removed
Message-ID: <aUXvfrACjil_Muv0@snowbird>
References: <20251215184126.39dae2c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215184126.39dae2c7@canb.auug.org.au>

Hi Stephen,

On Mon, Dec 15, 2025 at 06:41:26PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following trees are going to be removed from linux-next because they
> have not been updated in more than a year.  If you want a tree kept,
> please just reply and let me know (and update its branch).  If you want
> a tree restored after it has been removed, just let me know (and update
> its branch).
> 
> Tree			Last commit date
>   URL
>   comits (if any)
> ----			----------------
> accel			2024-05-03 11:00:53 +1000
>   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git#habanalabs-next
> clang-format		2024-08-02 13:20:31 +0200
>   https://github.com/ojeda/linux.git#clang-format
> compiler-attributes	2024-09-15 16:57:56 +0200
>   https://github.com/ojeda/linux.git#compiler-attributes
> dmi			2024-05-14 11:23:02 +0200
>   https://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git#dmi-for-next
> ecryptfs		2024-10-21 01:47:22 -0500
>   https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git#next
>   b06c72107980 ("ecryptfs: keystore: Fix typo 'the the' in comment")
>   da22e0dc323c ("fs: ecryptfs: comment typo fix")
>   68c119aecdcd ("ecryptfs: Fix packet format comment in parse_tag_67_packet()")
>   fba133a34118 ("ecryptfs: Remove unused declartion ecryptfs_fill_zeros()")
> exportfs		2024-11-17 14:15:08 -0800
>   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git#exportfs-next
> hte			2024-06-19 12:24:03 -0700
>   https://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git#for-next
> percpu			2024-10-07 11:33:26 -0700
>   https://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git#for-next
> siox			2024-03-08 22:01:10 +0100

I've not been very active for the last few years and luckily it
coincided with less work in the percpu area. I've been sending small
patches through Andrew but I think I'd prefer to keep the tree as I hope
to do more active work in 2026.

I've just updated the for-next branch albiet just with 6.19-rc1.

Thanks,
Dennis

