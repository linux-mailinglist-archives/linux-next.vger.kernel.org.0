Return-Path: <linux-next+bounces-7574-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B81B0736F
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 12:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A49145076C3
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 10:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C520322E3F0;
	Wed, 16 Jul 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLbEUQoc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D53B20C00B;
	Wed, 16 Jul 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661868; cv=none; b=PsTkNVZX4LIIT/vkexQE6CFEzEWIBzmxEA8ZLLc64u5HTOWhB11ej2sebxnXBOs1t+mKppB3OoiuyDHoNWroyYzxdMBt+4M5sKQKwlrxIALbB8UFeBtiE5kXvsvx+eJG0pnZzurZYz95Jr8pVXZXZMnx99rHxUQA2DhW8ZsC8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661868; c=relaxed/simple;
	bh=8xjOaqal/L40o2WPaOpIYLp/RLO1gYdLXInOd8YQJwM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=gOBLagt0Gnw1VCAdSo8kulSAE2mAQK8PAqqjN7hYdwVy5g+/n3N+v8Gsl+Y8cAasyuvTgy2fjEZWpIR9vYe7Vpnic+HRvvP44MXv2vmY6sDGt3Q/5PKApZ6hJZEGxaAkdvArOTOAlna+MAM4Up8ahcUd2YsZbfaf+B9Ot+EsN5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLbEUQoc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7204BC4CEF0;
	Wed, 16 Jul 2025 10:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752661868;
	bh=8xjOaqal/L40o2WPaOpIYLp/RLO1gYdLXInOd8YQJwM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=PLbEUQoc8KGHbXmHGmyzzVcEje6nMuw1StUisbQClc9HnKjFSQZWYO1R56JucNMyu
	 l4pVv5SBYHDgEJdiHTXTGLHEVe71F4sdowdeBcemJwALwrJgm4H2bvw9ViM4xRrOod
	 0rePRKbBaiil7H+aiTCgAqSDX2BVMs7HVgyANvXFzXoanceEjA6OLdyUAwgMA7/mGC
	 MWh8GROg1BfUibjwnsEPQ4grh7xlfTsmvlTAsW7piwxd/OQuK8/aJtrsmL9yBp8Lsz
	 j+Ivtm+IFXZb8DXL5qYyYkhfXZKI9F55jeKr8OHG2WjmtwjAm3XImMAmCm2naJxiqa
	 T2h64+xJCxeiw==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 12:31:04 +0200
Message-Id: <DBDES17FT4ZZ.GVIUKUE5R9SE@kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the drm-misc
 tree
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>, "Intel
 Graphics" <intel-gfx@lists.freedesktop.org>, "DRI"
 <dri-devel@lists.freedesktop.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250716201656.4f0ea8d7@canb.auug.org.au>
In-Reply-To: <20250716201656.4f0ea8d7@canb.auug.org.au>

On Wed Jul 16, 2025 at 12:16 PM CEST, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/drm/gem/mod.rs
>
> between commit:
>
>   917b10d90990 ("drm: rust: rename as_ref() to from_raw() for drm constru=
ctors")
>
> from the drm-misc tree and commit:
>
>   8802e1684378 ("rust: types: add Opaque::cast_from")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks!

