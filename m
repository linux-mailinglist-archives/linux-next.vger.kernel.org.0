Return-Path: <linux-next+bounces-6988-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB6AC899E
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 10:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E042E7A245B
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 08:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217871EA7DD;
	Fri, 30 May 2025 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="RpVg/SAz"
X-Original-To: linux-next@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0209C1D61AA;
	Fri, 30 May 2025 08:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748592231; cv=none; b=IRx+EmAkGcjnRY4i8ZkZNgqIiwfm9tCAuJSUuNncmLbbN3GgJhBefpZkJJIddc4EZovNtAZgVL9GZfMZziC73tPxyLAmC2i5vqVuHf6HymtviaORuThykDvUrjf8DZ5of/Bp6BZ5+vWftL8LNV+zqApggTl8HjHOGUD03HCHmXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748592231; c=relaxed/simple;
	bh=MOZRfILlxYLTD5YPIe1ukUVdwB74Lc8RJ5ifhuojFsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U1y83/La4Ii256wFYkfo69uiuIln5Vt7JoXQGHRrRmS2vayOMFff8iDSY3gtx/wEZGt9pCbI6XdMqO4cT+rJvVDjhpJNpySZloMxLYWBAPwVWUH3rnEX6HPFuDC5RU/PUJCe5TZp2JceKtqChlUnBcDy4TaBRkGmRi7hg+WtTzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=RpVg/SAz; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=+FQ7mAJWoOpdEQTP2UWDOkXe0sgkjazV/6cKTyxk9EY=; t=1748592229;
	x=1749024229; b=RpVg/SAzeTHW9iVd0qAEDdquy03idZeON58JPD6gIbu2l3qxoD06zD31NS9I1
	cOzzlm+tQXbD3e+A0EFN5hTvZiqMstEHL1rVcFB73lPBSM2vFbuSJNueLYfpETCJ/oYqJ7qi+5+0J
	wZRGxwvD5ktppJzf5OwDmvXuWX5UMKMYWAo3NrlE8l++bCnt/V5rVT3hVpXDaG/DPnHlnU3iyFwqP
	ARI3V2yyLiyCBgD5u4X0VBrXSQVHmzDXfV3fehr5czXxQNgbdoi1rSgR/5jqcw5fbRBR3riRhAp+x
	nCIe+jR66WfqSgG9/gmRGNO2chPs//aPOFsZKEL0MyECdZpdvA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1uKuRp-006ZdF-2k;
	Fri, 30 May 2025 09:46:37 +0200
Message-ID: <699ec35a-5453-4900-b535-a9a9863bb9bf@leemhuis.info>
Date: Fri, 30 May 2025 09:46:35 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: armv7 build mismatched types
To: Rudraksha Gupta <guptarud@gmail.com>, linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Tamir Duberstein <tamird@gmail.com>
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1748592229;a15d77b2;
X-HE-SMSGID: 1uKuRp-006ZdF-2k

CCing linux-next and Tamir Duberstein, who authored the culprit.

On 30.05.25 08:23, Rudraksha Gupta wrote:
> Logs: https://gitlab.postmarketos.org/LogicalErzor/pmaports/-/jobs/1368490
> 
> Archive: https://web.archive.org/web/20250530060232/https://
> gitlab.postmarketos.org/LogicalErzor/pmaports/-/jobs/1368490/raw

I ran into the same error on aarch64 and x86_64 when building -next for
Fedora today using the rawhide config:

https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-rawhide-x86_64/09103515-next-next-all/builder-live.log.gz
https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-rawhide-aarch64/09103515-next-next-all/builder-live.log.gz

Reverting b20fbbc08a363f ("rust: check type of `$ptr` in
`container_of!`") fixed things. That's the patch Rudraksha suspected to
be the root of the problem (see the quote below).

Ciao, Thorsten

> Snip:
> 
> ||
> 
> |EXPORTS rust/exports_core_generated.h|
> |
> ||
> RUSTC L rust/compiler_builtins.o
> ||
> RUSTC L rust/ffi.o
> ||
> RUSTC L rust/build_error.o
> ||
> RUSTC L rust/pin_init.o
> ||
> RUSTC L rust/bindings.o
> ||
> RUSTC L rust/uapi.o
> ||
> EXPORTS rust/exports_bindings_generated.h
> ||
> RUSTC L rust/kernel.o
> ||
> error[E0308]: mismatched types
> ||
> --> rust/kernel/lib.rs:234:45
> ||
> |
> ||
> 234 | $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).
> $($fields)*).cast_mut());
> ||
> | ------------------------ ---------
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*const
> drm_device`, found `*mut Opaque<drm_device>`
> ||
> | | |
> ||
> | | expected all arguments to be this `*const drm_device` type because
> they need to match the type of this parameter
> ||
> | arguments to this function are incorrect
> ||
> |
> ||
> ::: rust/kernel/drm/device.rs:140:18
> ||
> |
> ||
> 140 | unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
> ||
> | ------------------------------------ in this macro invocation
> ||
> |
> ||
> = note: expected raw pointer `*const drm_device`
> ||
> found raw pointer `*mut Opaque<drm_device>`
> ||
> note: function defined here
> ||
> --> rust/kernel/lib.rs:241:8
> ||
> |
> ||
> 241 | pub fn assert_same_type<T>(_: T, _: T) {}
> ||
> | ^^^^^^^^^^^^^^^^ - ---- ---- this parameter needs to match the `*const
> drm_device` type of parameter #1
> ||
> | | |
> ||
> | | parameter #2 needs to match the `*const drm_device` type of this
> parameter
> ||
> | parameter #1 and parameter #2 both reference this parameter `T`
> ||
> = note: this error originates in the macro `crate::container_of` (in
> Nightly builds, run with -Z macro-backtrace for more info)
> ||
> error[E0308]: mismatched types
> ||
> --> rust/kernel/lib.rs:234:45
> ||
> |
> ||
> 234 | $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).
> $($fields)*).cast_mut());
> ||
> | ------------------------ ---------
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut
> drm_gem_object`, found `*mut Opaque<drm_gem_object>`
> ||
> | | |
> ||
> | | expected all arguments to be this `*mut drm_gem_object` type because
> they need to match the type of this parameter
> ||
> | arguments to this function are incorrect
> ||
> |
> ||
> ::: rust/kernel/drm/gem/mod.rs:130:20
> ||
> |
> ||
> 130 | unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
> ||
> | ---------------------------------------------- in this macro invocation
> ||
> |
> ||
> = note: expected raw pointer `*mut drm_gem_object`
> ||
> found raw pointer `*mut Opaque<drm_gem_object>`
> ||
> note: function defined here
> ||
> --> rust/kernel/lib.rs:241:8
> ||
> |
> ||
> 241 | pub fn assert_same_type<T>(_: T, _: T) {}
> ||
> | ^^^^^^^^^^^^^^^^ - ---- ---- this parameter needs to match the `*mut
> drm_gem_object` type of parameter #1
> ||
> | | |
> ||
> | | parameter #2 needs to match the `*mut drm_gem_object` type of this
> parameter
> ||
> | parameter #1 and parameter #2 both reference this parameter `T`
> ||
> = note: this error originates in the macro `crate::container_of` (in
> Nightly builds, run with -Z macro-backtrace for more info)
> ||
> error[E0308]: mismatched types
> ||
> --> rust/kernel/lib.rs:234:45
> ||
> |
> ||
> 234 | $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).
> $($fields)*).cast_mut());
> ||
> | ------------------------ ---------
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut
> drm_gem_object`, found `*mut Opaque<drm_gem_object>`
> ||
> | | |
> ||
> | | expected all arguments to be this `*mut drm_gem_object` type because
> they need to match the type of this parameter
> ||
> | arguments to this function are incorrect
> ||
> |
> ||
> ::: rust/kernel/drm/gem/mod.rs:273:29
> ||
> |
> ||
> 273 | let this = unsafe { crate::container_of!(obj, Self, obj) };
> ||
> | ------------------------------------ in this macro invocation
> ||
> |
> ||
> = note: expected raw pointer `*mut drm_gem_object`
> ||
> found raw pointer `*mut Opaque<drm_gem_object>`
> ||
> note: function defined here
> ||
> --> rust/kernel/lib.rs:241:8
> ||
> |
> ||
> 241 | pub fn assert_same_type<T>(_: T, _: T) {}
> ||
> | ^^^^^^^^^^^^^^^^ - ---- ---- this parameter needs to match the `*mut
> drm_gem_object` type of parameter #1
> ||
> | | |
> ||
> | | parameter #2 needs to match the `*mut drm_gem_object` type of this
> parameter
> ||
> | parameter #1 and parameter #2 both reference this parameter `T`
> ||
> = note: this error originates in the macro `crate::container_of` (in
> Nightly builds, run with -Z macro-backtrace for more info)
> ||
> error: aborting due to 3 previous errors
> ||
> For more information about this error, try `rustc --explain E0308`.
> ||
> make[2]: *** [rust/Makefile:538: rust/kernel.o] Error 1
> ||
> make[1]: *** [/home/pmos/build/src/linux-next-next-20250530/
> Makefile:1285: prepare] Error 2
> ||make: *** [Makefile:248: __sub-make] Error 2|
> 
> 
> Bad: next-20250530
> 
> Good: next-20250528
> 
> 
> Likely introduced with: https://lore.kernel.org/all/
> CANiq72mFiCrzawVUVOU2giJtBVsRdAO3sGtDsZptPuFvmid3EQ@mail.gmail.com/
> 
> 
> Repo: https://gitlab.postmarketos.org/LogicalErzor/pmaports/-/tree/rust/
> device/testing/linux-next
> 
> How it's built (Alpine-like build system):
> 
> - https://archive.ph/vxEmk
> 
> Config fragments (in addition to qcom_defconfig):
> 
> - https://archive.ph/q4hfc
> 
> - https://archive.ph/RKgFf
> 
> 
> 


