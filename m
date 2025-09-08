Return-Path: <linux-next+bounces-8230-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE89B487A7
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 10:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58A0C17ADCF
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 08:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B1F2ECE95;
	Mon,  8 Sep 2025 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="b0iJ5o6U";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FQWa/vI9"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9214AD2D;
	Mon,  8 Sep 2025 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757321862; cv=none; b=fAbKPV+bstiZBVPuycnxPSQIJ/7OIKfE8M1bvGQ+MC+AOzMbpAK56k62WbzKdb8F8dPhJehNNX761NrH22AA0JXrPdExdKUE8XkQdLepZjS14CF4iSpUPq60WjrFDK1tpCWbl2Yvb2QzpcgZ2n+vr+9RuEF58Jh1rGg8WArDhVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757321862; c=relaxed/simple;
	bh=QGK/v4PygQlvVPP43NMCFMqvaQ0ghml0R3VgGlsv858=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXOUZfHcKoAwSnqK2IiCVKzOxQqaJQY/rs8PbiIp8wMBca/syCUplZGDV4LvOz0WxrX3Bh3L6iMAleE/vxcczrrQcm2Qyw/NiAm2zLki3GP5KNhyHw2Rx87CM+qvDMPhSQYqEPz0uV/v1YPxTOvdsSzUAdxsphs00pV9GfAM3wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=b0iJ5o6U; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FQWa/vI9; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2C52F1400049;
	Mon,  8 Sep 2025 04:57:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 08 Sep 2025 04:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1757321859; x=1757408259; bh=sCzLJmfkZO
	esGcka2xCQVxJFYw2n743DJ47lQKuu0sk=; b=b0iJ5o6Ul0n0NQS1BZmMfO0hVD
	2uxFNnjADLPxqM+4Rrt7fdAQG6h69V9PAUNGHQPQbXgWjUX+tB8ABmWrh2TxQxVk
	nzePXryn9tRyB83evypckyViyVsZCcF8Sry48eoO9cSzW67rirkvkjVOYb2nYkQ0
	cyduOjAwLybnO3QGkJt3Yzyb0n2qM9vAV80f0o0G42hMgLPEGOB7XPflWUh26y2m
	RbLdqbILpjWtU4PqmLAqgI6TKGOPzPXpShE4drojoQWZiW2aPPAwjp747ZeGl1qX
	4kzNhlNMiqDtzbPmreF8wug9ARp5V6J0j4ok+OPDZ9waxcfQTQeZkj7QA9Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757321859; x=1757408259; bh=sCzLJmfkZOesGcka2xCQVxJFYw2n743DJ47
	lQKuu0sk=; b=FQWa/vI9r13Sql1I6G8aUJpxsQism1ikKaTLLgX3QJsbrH1ImNW
	MnlKE0HdrBfMx67+CdTmoGU3ZIltsmMs4Nr6v5Bp4rv1LxLjrE6ha7cWFOJWRIQy
	e2Fbzq25pdqmmdhSe/gGeQQ7NsY5JE5GKy2XSTpDXTwlOTCcQHip1RUYyGEgnFUN
	7oei1NN5uWcLo7mDZ3BCxcf1ZToZbUCajxhwHl89fyoisS8Sb8umQWWw+yDxhuKw
	dtmOhafnk8AJ8cWzkYIGX4GUmaf8a9qGiIdwg+5S2QBzuXqItURlzvH2h0tZqdWT
	38ZsHV8QLtk+mWYY3rX8ZnAj435Buk1XSBQ==
X-ME-Sender: <xms:gpq-aKYzZzhvLyEtWEhg1mTepULkt5HgaGrC4bjayA4QOawLo7atAg>
    <xme:gpq-aC-BEwFNe6R_5rXShGIRtVBuH3r33LnFAXEKDvvsHDvlnXC579HNGaw0PoUmq
    gr_kso5mOxiIg>
X-ME-Received: <xmr:gpq-aOjCA-nhnBJ55sUVfE-9BHUE740RwZ1oSdXOiOeelNHQJit4lwqWuLnYuO7bFa5S-FbIiX18OxC816OCdADCYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegrrhhnugesrg
    hrnhgusgdruggvpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
    pdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtoh
    hmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gpq-aNiqHFVbDMQrbIA1fXeNfYk44rjKDedHU4cTBlYSRjAp9C7HhQ>
    <xmx:gpq-aM7pzkN4GYZ2LzoJ3-QtSWY4wRc3Vqso3lbKLqGIgAhLqYzB5w>
    <xmx:gpq-aHTsdsRdUURPoPNQspkOQnzy61Khh3t-DE0Qk6yjsiYtYUpXNA>
    <xmx:gpq-aD8jAuJG29FSSWZlILwPed75O7j9wSCe0hTxJdCX3Y0-AVOIyA>
    <xmx:g5q-aNjcnAUNw4Gyu-FGfJfkFt5yEtvgo7XStoH6RrQR-S29nRMVVQ8F>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Sep 2025 04:57:37 -0400 (EDT)
Date: Mon, 8 Sep 2025 10:57:35 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 driver-core tree
Message-ID: <2025090828-sushi-eternal-e09a@gregkh>
References: <20250908162550.1a250f96@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908162550.1a250f96@canb.auug.org.au>

On Mon, Sep 08, 2025 at 04:25:50PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   rust/kernel/lib.rs
> 
> between commit:
> 
>   1f54d5e5cd2a ("rust: irq: add irq module")
> 
> from the driver-core tree and commit:
> 
>   06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURCE")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc rust/kernel/lib.rs
> index 5300318a5309,99dbb7b2812e..000000000000
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@@ -93,7 -92,7 +93,8 @@@ pub mod fs
>   pub mod init;
>   pub mod io;
>   pub mod ioctl;
> + pub mod iov;
>  +pub mod irq;
>   pub mod jump_label;
>   #[cfg(CONFIG_KUNIT)]
>   pub mod kunit;

Looks good, thanks!

greg k-h

