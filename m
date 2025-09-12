Return-Path: <linux-next+bounces-8284-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ACAB54450
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 09:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 574237AA988
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 07:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846832D3A93;
	Fri, 12 Sep 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBNUa1Fp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D62D3A88;
	Fri, 12 Sep 2025 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663909; cv=none; b=E5IJReNbKVh5AG5wHfdm4jcaLfzXSDSBlNK649oKkcL39W6cMrJQNvB4+NC5UZCfS/tDym9peQ6W61dBEABPighlIVnh8dllPTkWE98kbR2/lRhU97Rvc0ixt35TuYATvbSKhCoZh3pM4Cn7FcAT1XlPPYCxazy7mhHGOeuTN+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663909; c=relaxed/simple;
	bh=QuIcxhDpDSfHkqsu9kDb6KR5apK5plLChZq+YBBJO44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPbGfHVhe5apgo7cWieVTcrvW8UtQwV78FgSlVdcupxlD+czYkzJ/KI7gEK1K9nOwpsstd0+7d0EytLLml6oZOTwwZw3R5HS77FhtsabZoTb8ljtwutcSHLbElqNndqKEd8mvyJjFBQjhmFyP9lOGXFGVkr+dQjsqX5hHGfuNVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBNUa1Fp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3840C4CEF5;
	Fri, 12 Sep 2025 07:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757663908;
	bh=QuIcxhDpDSfHkqsu9kDb6KR5apK5plLChZq+YBBJO44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SBNUa1FpgCpEMvKGMqg1+kDNKNf09EXuM5UtUWWTAU7TuxQpLM6q7yW2D+kP/GBGI
	 4QDHSyE0OL28ZEWBAUI5k5TXsnoWlbhdjer85I8hvCs+uoyVLxkZiq6fyFFpKEmgO9
	 x32nQaRjtze7ad9miNb/97DXOmCSWwV1D04NbhymZHAm6SeTUFUzUBXRfDU3sEgjvT
	 /fLj6L9pqK94u5lWc2huEJzX4pIeg/naZ3yLmxPXNjDYR6EFihYDPDlA4PraTkTo7f
	 7AkdlzNmmPkNwHiUjBSbztAt9ySlHqx2SpujUsdtFLdn/7UL9z/dnABm7sVMN2awH3
	 DUnOCdeOvVUBQ==
Message-ID: <f22491ca-d133-4d61-8ad4-cf7ae3ac9338@kernel.org>
Date: Fri, 12 Sep 2025 09:58:26 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the rust-pin-init tree with Linus'
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benno Lossin <lossin@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250912135146.0c3ea18f@canb.auug.org.au>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250912135146.0c3ea18f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/12/25 5:51 AM, Stephen Rothwell wrote:
> diff --cc rust/kernel/devres.rs
> index 132545962218,91dbf3f4b166..000000000000
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@@ -135,21 -134,11 +135,19 @@@ impl<T: Send> Devres<T> 
>           T: 'a,
>           Error: From<E>,
>       {
> -         let callback = Self::devres_callback;
> - 
>           try_pin_init!(&this in Self {
>               dev: dev.into(),
> -             callback,
> +             callback: Self::devres_callback,
>               // INVARIANT: `inner` is properly initialized.
>  -            inner <- {
>  +            inner <- Opaque::pin_init(try_pin_init!(Inner {
>  +                    devm <- Completion::new(),
>  +                    revoke <- Completion::new(),
>  +                    data <- Revocable::new(data),
>  +            })),
>  +            // TODO: Replace with "initializer code blocks" [1] once available.
>  +            //
>  +            // [1] https://github.com/Rust-for-Linux/pin-init/pull/69
>  +            _add_action: {
>                   // SAFETY: `this` is a valid pointer to uninitialized memory.
>                   let inner = unsafe { &raw mut (*this.as_ptr()).inner };
>   
> @@@ -160,14 -149,14 +158,14 @@@
>                   //    properly initialized, because we require `dev` (i.e. the *bound* device) to
>                   //    live at least as long as the returned `impl PinInit<Self, Error>`.
>                   to_result(unsafe {
> -                     bindings::devm_add_action(dev.as_raw(), Some(callback), inner.cast())
> +                     bindings::devm_add_action(dev.as_raw(), Some(*callback), inner.cast())
>  -                })?;
>  +                }).inspect_err(|_| {
>  +                    let inner = Opaque::cast_into(inner);
>   
>  -                Opaque::pin_init(try_pin_init!(Inner {
>  -                    devm <- Completion::new(),
>  -                    revoke <- Completion::new(),
>  -                    data <- Revocable::new(data),
>  -                }))
>  +                    // SAFETY: `inner` is a valid pointer to an `Inner<T>` and valid for both reads
>  +                    // and writes.
>  +                    unsafe { core::ptr::drop_in_place(inner) };
>  +                })?;
>               },
>           })
>       }

Looks good, thanks!

