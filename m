Return-Path: <linux-next+bounces-4742-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A609C4144
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 15:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56EBBB20A82
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900B319DFB5;
	Mon, 11 Nov 2024 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="OQi6q1Kt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LdIl/Z1Z"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FF1E481;
	Mon, 11 Nov 2024 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731336862; cv=none; b=WSPiCUuTmC7iTQGfNaEP5hSUFjm1fG4M349BZrkth/83B3NYUfQ8b00RNpx7TZOJCdjcB9M/tugH74MMxYRTzZ4elGN+Cfqyy3GEQzqoroF255m+CP7jVMTy6QvnAXoV8+xOYtu24XBVbsiNCJk1kUfc6mUe999pw/wYSO3z3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731336862; c=relaxed/simple;
	bh=Ap+4hf6VsRoYFyoCEQOrKL/R/na4+/6WF+/F7CZ8H/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2JOSdVPZ8gPLptDphctX1FJgEbD85g5COICEwER9e9fm7MM/qI1fKRzCYPghUNsAFN3TyFPhq3lVyrygZ9nhhR5JNGdtvePyAfWlyzUS1zpU9Tjp8m5CXSiLNX0rNBQaFUYBLFGfwwiL3ijUZFGm31TL+tTBzlB4J5HRvsg+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=OQi6q1Kt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LdIl/Z1Z; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 4253511401D3;
	Mon, 11 Nov 2024 09:54:18 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 11 Nov 2024 09:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1731336858; x=1731423258; bh=Gb1MC1LUYU
	mcyqEnMezL4wQNDKx6ZVAYCnYNqlhDCC8=; b=OQi6q1KtnfZecpwRaABqR7Pm3X
	MGS7Ug+KF49mZnJzCuXlK3I6iIGh7ne4UxLKPzc/r03o8F0Qwpvox/An1QtdJ0MG
	2LaQtL5cqYNJih11nIDWyGDAEGhGvKx/TtLlcOh9krSrOWK04Cedro5MuGVaDhoZ
	6Z8LIIZyE6qfvpK/D0SKeOO98KIdjcSvlX1+wSJgFe3jUtBImGdZOMKGG3HcMQbX
	xx7La2tm1LJ/Q9H14EGDPzhoSwEtbAm2Wja4NmknNxeYwBAvYVSJk50Ql4UyxjSt
	hb86Qp4el1KroEy3dxJ/bV4KeTFnHMMe/r78KZgRFJORiN7cqyscTSks0fPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1731336858; x=1731423258; bh=Gb1MC1LUYUmcyqEnMezL4wQNDKx6ZVAYCnY
	NqlhDCC8=; b=LdIl/Z1ZprWLmHPKCfkqJGcyVrNi23p91Ua3Oxgdl91q2n+89Fn
	4az+MUUurLxhwHElYBssYlD/5Cgjbz7pS4eo3sff+wztUwzLlo2MCFZGt/cOk2Da
	YZh08YBaoZNVdqi2jmcnzKqZoTaKRf3lTZIUej9TBuOePzOSDL9N5nQ8wm83DaIL
	MihtitGwvlCK2pYoJMJXYUN6D0ZPS8UQORIPepgakedFaJrxRRKuUT0ucsQviOtV
	26WPx5ggbVjXidUbhfxHxNHpSbLq/nKc6EGI5pktFbzgJxTaj4pzVRYOHgBs9y7e
	9mAwV/+UB+/gIGLBQB9uWBablp1AllD9/eA==
X-ME-Sender: <xms:mRoyZ3R_YAF3Qwce9LeRCJDx50irfo0n0lWoACElsIvE7qfzXJ8TQA>
    <xme:mRoyZ4yYfqf1HWlDMtV-YGeVdw1gytHHl5KZ3XJOIJqsk-wezJiz22jbbTMO1UOom
    xuzsDh7ANyLng>
X-ME-Received: <xmr:mRoyZ80TZQ6piRQPnEqRtBoByVSc-BEQBSOMBQdC5f-Lo3qccW8TboJVf5d5qiA4XYerhranMwmbpbp28oTLFmkgLkDtXq7mAofZ2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddvgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecu
    hfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffg
    heekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepudeipdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprh
    gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnuges
    rghrnhgusgdruggvpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifrghlmhgvihgu
    rgesmhhitghrohhsohhfthdrtghomh
X-ME-Proxy: <xmx:mRoyZ3AIszxAzmuAStndRzeln51VqTShUEWECA2essOYNEbVcmGOLg>
    <xmx:mRoyZwj8UtUDJam2R7ZZj0URmlql298KSlinG9UXg9FwFuGkatnNWg>
    <xmx:mRoyZ7obCyvmHPhCD72PUZhkbT6BtxX9BU-6520mHRrYZ01-wMgCkw>
    <xmx:mRoyZ7h7uZwYinAxTGRoI_l6qCtpNTyrhB3RvfIoCqjgQT1UrfCMYA>
    <xmx:mhoyZ3SxmA8DNnWAo05O88lMUY7cWTDtaMVzrqj4VQJqj48RoYEy_3FX>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Nov 2024 09:54:17 -0500 (EST)
Date: Mon, 11 Nov 2024 15:54:10 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: linux-next: manual merge of the rust tree with the char-misc tree
Message-ID: <2024111102-baffling-budding-1d7d@gregkh>
References: <20241111173459.2646d4af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111173459.2646d4af@canb.auug.org.au>

On Mon, Nov 11, 2024 at 05:34:59PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rust tree got a conflict in:
> 
>   rust/macros/module.rs
> 
> between commit:
> 
>   7f15c46a57c3 ("rust: introduce `InPlaceModule`")
> 
> from the char-misc tree and commit:
> 
>   d072acda4862 ("rust: use custom FFI integer types")
> 
> from the rust tree.
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
> diff --cc rust/macros/module.rs
> index a03266a78cfb,e7a087b7e884..000000000000
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@@ -332,15 -330,21 +332,15 @@@ pub(crate) fn module(ts: TokenStream) -
>                       /// # Safety
>                       ///
>                       /// This function must only be called once.
> -                     unsafe fn __init() -> core::ffi::c_int {{
> +                     unsafe fn __init() -> kernel::ffi::c_int {{
>  -                        match <{type_} as kernel::Module>::init(&super::super::THIS_MODULE) {{
>  -                            Ok(m) => {{
>  -                                // SAFETY: No data race, since `__MOD` can only be accessed by this
>  -                                // module and there only `__init` and `__exit` access it. These
>  -                                // functions are only called once and `__exit` cannot be called
>  -                                // before or during `__init`.
>  -                                unsafe {{
>  -                                    __MOD = Some(m);
>  -                                }}
>  -                                return 0;
>  -                            }}
>  -                            Err(e) => {{
>  -                                return e.to_errno();
>  -                            }}
>  +                        let initer =
>  +                            <{type_} as kernel::InPlaceModule>::init(&super::super::THIS_MODULE);
>  +                        // SAFETY: No data race, since `__MOD` can only be accessed by this module
>  +                        // and there only `__init` and `__exit` access it. These functions are only
>  +                        // called once and `__exit` cannot be called before or during `__init`.
>  +                        match unsafe {{ initer.__pinned_init(__MOD.as_mut_ptr()) }} {{
>  +                            Ok(m) => 0,
>  +                            Err(e) => e.to_errno(),
>                           }}
>                       }}
>   

Looks good to me, thanks!

greg k-h


