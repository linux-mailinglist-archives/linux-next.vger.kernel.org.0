Return-Path: <linux-next+bounces-5983-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F0BA6E1F5
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 19:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D13B0169A0E
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634EF264621;
	Mon, 24 Mar 2025 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkbXWx7v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2790154BE4;
	Mon, 24 Mar 2025 18:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742839248; cv=none; b=CSpomSm+IkZJTkxOQQsQoNNDzbaxmWqvA4/NEsxHTvglB1kQjEhv/qlLxqh2jDM696QU1y24uXpx5rw2JJM0at2bUo3TpvsNiLeYW9c6Y/SV0w9FndBsmpuCQTZDsPxFEgwTeEBpmNYfxAIYxpy1U6Dj4oZhLgBCwDw91GAGE9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742839248; c=relaxed/simple;
	bh=2u1pQswtfbbtYrllsPjiOGGlvhCAk1KcYcAx9KdocPI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9sAw1Bu4R6EKQlq5yMTFvWGdlJJdRFo1EvnATFHdUnrmSxbEv3l3q3jAmvKugjgFemJvrICwkOK0CJhCFxaJ/6AUfwGUc8Ka1zDzqGotGx14JpcV9DPZxm5GCkm4+hWR6IAj1HPmys9jTpdwHeukLcAFMPc2Lklpbn28t+asHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkbXWx7v; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so51266546d6.0;
        Mon, 24 Mar 2025 11:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742839245; x=1743444045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxegvS/gmdX5MahtcjlhaOV/WbLLvOW/4APvLi3D66M=;
        b=mkbXWx7vsBdiF80XUm3yv+Qdhm4KXUj9A+8xFXir1q26H7Ai2o1GW60lzws3DTn3yx
         8T0ijOv5pgenTgq+OnRskU1QoMHnM5SFOuh0/po6C70i6uf8agEuEsP30LzsdOQS2BWi
         ULZWQk4ZKHxrvuR500bE2WF2/hSrmYUmuSBNcL431d1P3P/Vwls4ueQMxiaFjXVumn9w
         pEQkaeKdq3n4fKfM7KxntoiAWky7lHGRN/8VFBIYprvNhoocColtqeTYFNd1R2vjGK7V
         dx5Fp1jOdGX2hgEQNGBwiWO60gVguahkLmEzECWY3JVsjRx+ck/alsWPowB6Fo8onRQk
         AUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742839245; x=1743444045;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxegvS/gmdX5MahtcjlhaOV/WbLLvOW/4APvLi3D66M=;
        b=PvECdB8Z+maiT7fa6adSLUtrvwCYRS+yZCH6gc63jKjwBZ5GRLkNrGwfzQaahlAHIi
         M9aTJSwjIjUxofGE/6zNAfH6BfGiJFDTEhrQqEL3ywHzUktuy3UnFgIaR2Qtu58gVK6Q
         UyMavkfpAlPzVGFqNItAJ8a854up80qJ+kDiPXK2RSFxCAddHZ9Jcski2wpzx9CGbNB9
         KMhEPjYwWWvUdVJDpcXq+8cyaTPHzLS7lX3sUHUuPpnVW2+nMz2h4FXDOGs9XB5gckdv
         gygXynn5U2n4epLvsV2I1nqrMUxRCyJwVMRmd80cutLHSjJFxNqd45ng1t3/UBw6T+xU
         xT+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdHEXX8Gqq2gYcKf+tE3q7ZnGscbT9VqKLrx42YQFQ0K2oFCUdsJqo5QDaZXZTaQKfKXLClzv23NCLluX80FI=@vger.kernel.org, AJvYcCVqejzaOSTciUUeR16A28TttNVz9YIKxCcKlspoHMlwUFbJxZeqdp8o1qX+4Jzer+O0gjfjeuFbNrznnA==@vger.kernel.org, AJvYcCXSoP/9OlthCFZp83wmBOOs10Rktt2El8sVqMB6FErQi2016hRXPmaCiQsdSOsbc9zS2lMvTYclcgoOgmw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf51T9wGvOwdayqxZZzlyfTR1UUpFu6l4iIAioJBg3PU2lTtVA
	k3ysLEjmE3seIc9yVBn4+w8NcvOsJFB2DNKYH12fz5vsSku8nXaD
X-Gm-Gg: ASbGncsSmITDEOtMsybTAzNm5qu2j5jrUdepfyOszdPZCXj7sg8ESnPZgJ+UIPEx7lw
	PW8IgNXxZmgc5MtZE4KOqpmsMHBYOBFEEpiRjxq8M5+DXZ4ZtH6obM4hmTzvNJVpjsxsRvb4tQg
	meTEJtM3wXe94Z8sVKyqEzpXFpAYV2FiwFCfJ7yxzBVzUvlfTFoUDCESNSpH1rwEAIKnGAy4mqw
	uqMVgwQbmpNotNtQJD/maMF/fB4kSxLyDrffuDMPvcnZdNIvvls6NekRbDotSfygoKWKOqw24ct
	sTMZ3mip9yiYnQ+OofAc8i+zCOr0AsRJOpkaBzzY6nRmyeg4qp8cQaj9SVevIrUVuhHiWXRmAxZ
	49E5ad0+ZtMs1FSyXcWTrMkvPKZ4q4KhEr3g=
X-Google-Smtp-Source: AGHT+IHsd+IFmnbdrEWTTxfoPrgW0qHvvuQf3D0PGaby/SHA+37i0fcg8c4VJfrr2wYgvG7daVMjpw==
X-Received: by 2002:ad4:5d43:0:b0:6e8:f120:80ce with SMTP id 6a1803df08f44-6eb34a4ae02mr302241246d6.22.1742839243600;
        Mon, 24 Mar 2025 11:00:43 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef1f51esm47519356d6.26.2025.03.24.11.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 11:00:43 -0700 (PDT)
Message-ID: <67e19dcb.050a0220.bdc26.35e5@mx.google.com>
X-Google-Original-Message-ID: <Z-GdyCoaf1o01ban@winterfell.>
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8ED061200043;
	Mon, 24 Mar 2025 14:00:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 24 Mar 2025 14:00:42 -0400
X-ME-Sender: <xms:yp3hZ18y2n9NObdE9hXwsoFVpnf4mKUriGoaOsKGnsawQywgzhWmJw>
    <xme:yp3hZ5vospLPMVwQOYCqCzM42W2XR-_H79JB0clLGALOfmKsJpYtT9F9eF3gAIPtY
    0IYqdvt1XNo5AdYtw>
X-ME-Received: <xmr:yp3hZzCkbANHQai2uAeDoJ5T5KR8PiskAkbvMbrVKqgTQMvNpVkGWSdyAhI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedv
    teehuddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggsughivghlrdhj
    rghnuhhlghhuvgesghhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprh
    gtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegu
    rghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhope
    hrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomhdprhgtphhtthhopegrrdhhihhnuggs
    ohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yp3hZ5d06FEPwd4NwSmV5AC_xr_9qI5OBEl_aJ9dQKOEwxrDoGisPg>
    <xmx:yp3hZ6MSMWL0opM9rOvWXo7PLKTErZ9EM-4trzalErYkVxPP0gB13g>
    <xmx:yp3hZ7n9ze5sWivLXoiWQHl2MfmwE6o2F9kLlTmvWGYirYDUVbyl3A>
    <xmx:yp3hZ0vP0oaAGDRlB0zwyiMM2gCn44bX9mwyweu5hwnF80_u7bpFcg>
    <xmx:yp3hZ8tx1Pm_NPLBt6zhCbfVqIkydDZpgB_1jqYeWtVl_xFP_emmpMAb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 14:00:41 -0400 (EDT)
Date: Mon, 24 Mar 2025 11:00:40 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: dma: add `Send` implementation for
 `CoherentAllocation`
References: <20250324174048.1075597-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324174048.1075597-1-ojeda@kernel.org>

On Mon, Mar 24, 2025 at 06:40:48PM +0100, Miguel Ojeda wrote:
> From: Danilo Krummrich <dakr@kernel.org>
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
> Closes: https://lore.kernel.org/linux-next/20250324215702.1515ba92@canb.auug.org.au/
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

s/can be send/can be sent

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> +unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
> +
>  /// Reads a field of an item from an allocated region of structs.
>  ///
>  /// # Examples
> -- 
> 2.49.0
> 

