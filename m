Return-Path: <linux-next+bounces-9402-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98081CBEB8C
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 16:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B4F73001519
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 15:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045413346B1;
	Mon, 15 Dec 2025 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nREYZYlb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4733342A;
	Mon, 15 Dec 2025 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813440; cv=none; b=uFOzgbWtwocXHnToBTZcZAu3Jmt84cW2f4mt31W/0dUdOH2a1enw3u2dB+u7uQiIPKYnu84H9gGp4+kd4SCf6Mw3wcbwi6ZYmQHrArpIzDjmaMWLp8aF4rWUttFG8ibAIth38r9DZRFnTTUZmhqZj1nUGWR4fdO7MtP3gsCpGe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813440; c=relaxed/simple;
	bh=ib+hMHl7J+Wf/SRUxIYKmwNC2HMBMmBy68inY1aiO58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQgEymdU9E4RVZU8d46UwTBO2iJ0rrxjCD+XJqBePaysy1VW9gDz5fHNcmNq9LoC/WNLbrA8c0rBP+GuTdD0CL3frDowQviDV0Iar9pLT7Lb9QMmlkr0pEkAgA0FI/DB/+dWrr+fNUcBOf29jOZG8cQmSxzCftZje4uPa9hUCwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nREYZYlb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641DEC4CEF5;
	Mon, 15 Dec 2025 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765813440;
	bh=ib+hMHl7J+Wf/SRUxIYKmwNC2HMBMmBy68inY1aiO58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nREYZYlbZqx7sTV9yw1OOfp1SWPAKt/3dFZRkFusDN0BQXsyuZpM+5Vbc3gyGXO0I
	 KbWMIKnk3Kh2MOYmSNfqRQ4jnecZ/lqcWGssXzo/9b3mTrFavB14jo2C00m7xqRBN3
	 OCUsdKhTFD4qoDpPbCemRypR0bnlBCY+Edx42Z7m9ovcDNbxnic0A2Qc9Zyh9ygOl3
	 8ljy3Qo/2Jv7dIy7Nvqko+HNefckzJdWrtTaoZUCuOXKjq4tBZsPr7VPO7u0Uh3NRO
	 v+zDbq+TrlcZBjkVjBV61Rsduzutr9hVcUxYJDnRvqBeO07f1hT3RWc4kswgxI+0/W
	 lJnMChpa6zFyA==
Date: Mon, 15 Dec 2025 15:43:53 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christoph Lameter <cl@linux-foundation.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Dennis Zhou <dennis@kernel.org>, Dipen Patel <dipenp@nvidia.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Ingo Molnar <mingo@kernel.org>, Jean Delvare <jdelvare@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>,
	Tyler Hicks <code@tyhicks.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Subject: Re: linux-next: trees being removed
Message-ID: <20251215154353.GD9275@google.com>
References: <20251215184126.39dae2c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215184126.39dae2c7@canb.auug.org.au>

On Mon, 15 Dec 2025, Stephen Rothwell wrote:

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
>   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#siox/for-next
> unicode			2024-10-11 15:02:41 -0400
>   https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git#for-next
> xarray			2024-09-23 15:16:41 -0400
>   git://git.infradead.org/users/willy/xarray.git#main
>   c88414f56c37 ("XArray: Prevent node leaks in xas_alloc()")
>   6684aba0780d ("XArray: Add extra debugging check to xas_lock and friends")
> 
> 
> These trees of fixes will be kept in any case (please let me know if
> they should go):
> 
> backlight-fixes		2024-05-26 15:20:12 -0700
>   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git#for-backlight-fixes

Yes, please keep this one.  I have updated and pushed it.

> sparc-fixes		2024-01-21 14:11:32 -0800
>   https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git#for-linus
> tracefs-fixes		2024-11-01 08:57:55 -0400
>   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git#tracefs/fixes

Thanks Stephen.

-- 
Lee Jones [李琼斯]

