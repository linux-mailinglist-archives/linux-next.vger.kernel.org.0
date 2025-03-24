Return-Path: <linux-next+bounces-5966-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B48A6DEA4
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 16:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E85A7189293C
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 15:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D38C257448;
	Mon, 24 Mar 2025 15:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUt0tQQe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1484964E;
	Mon, 24 Mar 2025 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742830053; cv=none; b=fOb32zTvUA6FrFMosAAuElSO19wkyrx7dGeu8waF5s+nyDWZFKrD5dkp0jwuFKlDxc6HTN3VWbrnil3xZzxxRhefjj5R3e8kVY0tR8YL0L8kj7yyu8wFmzCwYQC7BTlTMcfvanJ3EfqtGjIJHJBXQvFzlxbwmOx4OTl0ZChyDMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742830053; c=relaxed/simple;
	bh=MyJPgttOop9GSoEGOLEhcQ5HHbF3X3DBdLYSg4Piq6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhwJnIyYgHNrP7tclusFl7EnA/kj+xHEboIsCSaY4ATyg7UGrlAcymK/PEDkN8z5K3aXpDm5GlR0bC7LRUVl73bUB0K6S3l7WnHJiX/VOwiTS5w6Ih1HTn+arhVRQP5XkMuwpZXrw3XFMFj/qFgvHCOTk+tnwlHSI4SnuSockpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUt0tQQe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DC8C4CEDD;
	Mon, 24 Mar 2025 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742830052;
	bh=MyJPgttOop9GSoEGOLEhcQ5HHbF3X3DBdLYSg4Piq6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GUt0tQQeVxdhOQJAq8A0nJvr2aWUlf6aUTqhobSF0gYHEUskTGEGenAO5ElxOQQgD
	 jyz0tW/WP/kxDO1d/xsDuQuTnXHiPw2Ml5YFVqIQeK+lYJRXVJXgtozGCZw5NZAZFK
	 0E0vBibauK6LRyyr8YdjCxSFA1EF5/VfuER7WMjSgeHXFdqiUhn9yh3EEpvXzwta+4
	 PxiVnMrcwADSWwCzc7eU+fBm5fTk/AJksUsTvl82+9sqUa605g/VOONW6M3/adAl7P
	 MKQKcdckK5Fs/KSQWgHJahO4tQxshoSN/b7PUVStyqzpipV8/K6P01NugVqXHkJG0l
	 X4tqfeA4LlMGg==
Date: Mon, 24 Mar 2025 16:27:28 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <Z-F54IQXiY9IHjeM@cassiopeiae>
References: <20250324215702.1515ba92@canb.auug.org.au>
 <20250324220629.1665236b@canb.auug.org.au>
 <Z-FJH628-j2HCuaE@cassiopeiae>
 <2025032443-recharger-legacy-93bf@gregkh>
 <Z-Fhf3Cn8w2oh1_z@cassiopeiae>
 <CANiq72n3Xe8JcnEjirDhCwQgvWoE65dddWecXnfdnbrmuah-RQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n3Xe8JcnEjirDhCwQgvWoE65dddWecXnfdnbrmuah-RQ@mail.gmail.com>

On Mon, Mar 24, 2025 at 04:18:40PM +0100, Miguel Ojeda wrote:
> On Mon, Mar 24, 2025 at 2:43 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > It's the DMA commit that has a bug, that was revealed by the fix in the
> > driver-core tree. So, the patch to drop is in the rust tree (not sure if Miguel
> > changes history at this point though).
> 
> Just to double-check, the diff you show below is the combined one,
> right? i.e. it is the one that Stephen already had the previous week +
> the fix you posted above (`Send` `impl`), right?

Correct, it is the full conflict resolution of the current rust and driver-core
tree.

> 
> If so, I think it is OK, and we could put the new `Send` impl on top
> of `rust-next` -- given the trees on their own are OK until they
> arrive to Linus, I am not sure if it counts as a fix.
> 
> i.e. something like the attached patch (crediting Danilo and Stephen).

Thanks, the attached patch looks perfectly fine to me to add on top.

One small nit: The "Link:" tag should rather be "Closes:".

> 
> Cheers,
> Miguel

> From 6a152af23cb49a3bcbb8c4457a612ffa27d54693 Mon Sep 17 00:00:00 2001
> From: Danilo Krummrich <dakr@kernel.org>
> Date: Mon, 24 Mar 2025 16:01:00 +0100
> Subject: [PATCH] rust: dma: add `Send` implementation for `CoherentAllocation`
> 
> Stephen found a future build failure in linux-next [1]:
> 
>     error[E0277]: `*mut MyStruct` cannot be sent between threads safely
>       --> samples/rust/rust_dma.rs:47:22
>        |
>     47 | impl pci::Driver for DmaSampleDriver {
>        |                      ^^^^^^^^^^^^^^^ `*mut MyStruct` cannot be sent between threads safely
> 
> It is caused by the interaction between commit 935e1d90bf6f ("rust: pci:
> require Send for Driver trait implementers") from the driver-core tree,
> which fixes a missing concurrency requirement, and commit 9901addae63b
> ("samples: rust: add Rust dma test sample driver") which adds a sample
> that does not satisfy that requirement.
> 
> Add a `Send` implementation to `CoherentAllocation`, which allows the
> sample (and other future users) to satisfy it.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/linux-next/20250324215702.1515ba92@canb.auug.org.au/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/kernel/dma.rs | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 9d00f9c49f47..18de693c4924 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -301,6 +301,10 @@ fn drop(&mut self) {
>      }
>  }
>  
> +// SAFETY: It is safe to send a `CoherentAllocation` to another thread if `T`
> +// can be send to another thread.
> +unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
> +
>  /// Reads a field of an item from an allocated region of structs.
>  ///
>  /// # Examples
> -- 
> 2.49.0
> 


