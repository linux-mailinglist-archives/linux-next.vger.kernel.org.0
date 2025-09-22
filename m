Return-Path: <linux-next+bounces-8430-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAADB910A0
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 14:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FCB63BE0D6
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 12:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FC62ECEB4;
	Mon, 22 Sep 2025 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="i/EHUWxa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eYYEKW2F"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FA63208;
	Mon, 22 Sep 2025 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542659; cv=none; b=DRwsttbb6ey9RdpzO4KNX0GDOy6IkuKKO7XpOqf11UYvlF/53q5kWUeyAcGpr42NAyCfV5g/ljaS1FER7IlFcjMy0KDl0HKFgAk+jPspqnkH1BydXGX0kfxCA3AeomQRb9f820vgKZEwxetD8hdcyV9WiCXvdVEBaSJ8YHy3890=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542659; c=relaxed/simple;
	bh=356Ubrh/VVgfRi9Y8ozJ96qXeeh0jZW6PsklOPpzHL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4Npu3i9n4UjBOdspZMkYK7FXV+NyWRxMAXt2TW74/5Got04uKsxE3kgp4yQMBe1ir/vTMT7VT05mcZ7IrsbZl5iZ5OZkzOrZwTX0KiWyh7COX1mMbVRCS5bywRMgUL9zAbfY4qX272N9UbTvIVYNIAJQRykDr2lEaFC/dOe2Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=i/EHUWxa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eYYEKW2F; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1EBB414000D0;
	Mon, 22 Sep 2025 08:04:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 22 Sep 2025 08:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1758542656; x=1758629056; bh=rF6YnrhP5w
	jjD8ia/Q5Xe70WqAKMHe1hQGmBFVyxo8Q=; b=i/EHUWxa/1zvQ/edgIjTdyKB4H
	oBDsSBuV/BFvkHBJRLWnaAp9+9oGFQDOUGOXCjw1cB8HYn6JGrFQy1fxQgcqCZ+k
	MJvmmJIgNuYp85apFkj+BTJupt35O5w/i3o1nSnzFY7ncje49rZaWygQx5SU3Oa/
	aTOCwM35NtBEBg90dQ7jVOnSUUEusWMYsg0NdeED4BNhjmQnMBs0BgmvUQfrkyWd
	LVeq7ZNjxlvgh/AXD7thpxsKyN3rzeiFixauRV3zxuoQKHtr5cNf2RGq8A/DAeJ5
	UymKCSHTBH4fxwZgcqQwTkB/EmoT/bbYQQWW4WsOQAayj0z8e/dkFDvmCZZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758542656; x=1758629056; bh=rF6YnrhP5wjjD8ia/Q5Xe70WqAKMHe1hQGm
	BFVyxo8Q=; b=eYYEKW2FrtR/eOkFDOqetOtFMYtkRZ3KjsER/k82VUn7fuyky4B
	kICJYbFPuElOBow6tAURRK6ZKLo5iyTvP7/8BN5aJnQED3lfzNSBwAJVSzJdOQwU
	wCg6w6obm14yTmpuaj5XZCnkT7KyyIWX4O8VEbrgbunPtVIMxSFU6iAhzkzv8fws
	vtOElYsXwQqM/NW6vvbonxg1vY6++TUTIfAJVw1CwP8Z2CfadtrBYt7y5nIFgM3U
	lFPwHaPUjDPu9xpafXvmXJxbigqCInPaECE/whdAx2OT40q1CWqIbvjCEf64RYH4
	fe4DF2HqoiJZXlMXBxY5HXs16iPUljXqlBg==
X-ME-Sender: <xms:PzvRaGH8FXEVuD1Y9zDQxjs8wd-aOA_wYO_mE48JGY7wqvODMquIjQ>
    <xme:PzvRaIsyohBxWI50CnldTJe0mBBX_Ds_7v9FQWzoSowJ_yud2K1QkO4YBQF1xoKsK
    kZFyv-fEAnwfQ>
X-ME-Received: <xmr:PzvRaJYmU4wIX25JAepnzZMct6ugqEwo1hnp-BuVRDVZNj15VOZ9Z1pmStVL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehjeekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnh
    gusgdruggvpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmh
    grthhtghhilhgsrhhiuggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehpvghtvghr
    iiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifvggushhonhgrfhesghhmrg
    hilhdrtghomh
X-ME-Proxy: <xmx:PzvRaIXoUB5Hii7KFFEa6Navwh3GhYyJzeoF-ce_nCdByB1xQLvbdg>
    <xmx:PzvRaDKInF82ct48Sp-WYSVVv7X192l_gTw0pKNcD0C36_j_SuWYaQ>
    <xmx:PzvRaOFG_lbUtsv5xk2TqvEg4EoG9aUWISLHJBBkQ6rZjeptw8mGdw>
    <xmx:PzvRaAymTaWdYPfW484lb91qg05PBGkLC07eNlEfNsZPrb0cYGSXbw>
    <xmx:QDvRaCLxgpw05G5qdbrVTtUGKsFvfRRONA-549vSK2r-312rliNwXTHs>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Sep 2025 08:04:14 -0400 (EDT)
Date: Mon, 22 Sep 2025 14:04:11 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the tip tree
Message-ID: <2025092203-swung-hastily-16b5@gregkh>
References: <aNEdWOS8s6U0c5pz@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNEdWOS8s6U0c5pz@finisterre.sirena.org.uk>

On Mon, Sep 22, 2025 at 10:56:40AM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   rust/helpers/helpers.c
> 
> between commit:
> 
>   d9ea5a41cef80 ("rust: sync: Add memory barriers")
> 
> from the tip tree and commit:
> 
>   eafedbc7c050c ("rust_binder: add Rust Binder driver")
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
> diff --cc rust/helpers/helpers.c
> index 1c6096f53a6fe,8e8277bdddcae..0000000000000
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@@ -7,9 -7,8 +7,10 @@@
>    * Sorted alphabetically.
>    */
>   
>  +#include "atomic.c"
>   #include "auxiliary.c"
>  +#include "barrier.c"
> + #include "binder.c"
>   #include "blk.c"
>   #include "bug.c"
>   #include "build_assert.c"

Looks good to me, thanks!

greg k-h

