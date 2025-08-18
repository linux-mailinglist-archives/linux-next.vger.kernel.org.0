Return-Path: <linux-next+bounces-7979-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A701AB2A136
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 14:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A16417D9AD
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 12:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C4130F532;
	Mon, 18 Aug 2025 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2i//Nwr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169DE31AF15;
	Mon, 18 Aug 2025 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518591; cv=none; b=p5+y5QSk3FmOP5pj1qJYHoCw5RMM80X9Nu1WTTpqxTNgvMxd+IJfNuLza0I9WtiheZjkGB6pQfVTtYjWYRJCmbVFPEmNzxdFNh6GeebaaEOxoHAjpujtPkgnNa2HdKSCw0bMJcl+eJ/CPDBZSG1DjdNgzrQsjn3h6NbPNvUagVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518591; c=relaxed/simple;
	bh=XUJOys1V5JSAwLbQ+pbzrv6OniPyIsaE6/aIrkHotsU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=iSfRWXocozKfvtlvtx16KFnCmPTMHr7H/u8nW/VjsjUFl7J+0ZU6asIJAnwYoRfg49ANPXobPoufleDMf7UL/mmPzOWunQnm9tkzxVRi1/vCvi3E3FFNqu80XxsZTkYAIKuS4lp6ofgwJN2Mgk2vuWgJuxh4gQObMOGarqC9+10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2i//Nwr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA215C4CEEB;
	Mon, 18 Aug 2025 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755518590;
	bh=XUJOys1V5JSAwLbQ+pbzrv6OniPyIsaE6/aIrkHotsU=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=M2i//Nwr0MQypaY5HSo8V6GCctpILdUsuP/NbH+3/aqLxFUmRxb5jOsv4eop/2Wbf
	 KwoJGggrOTbFUZijWl5XBZZqpWFPj1e840X6wwU5U6ZMFpHgqtAuMMiSJ4Ygpl7KfN
	 P98bE3LNU8eYH5Ax3jzHaPMIuQwIVWqw4Ln5V3QMQttbg6TYyrzr77yEpXyBWn0poc
	 aMzeR5V4h2ZWERmWlENyaQRtrvdINMCLONyjPISCI4aPqMu7sqcIVh/aJdT9GxFdWq
	 YT2GqLFh4u4+w04QaYp9jFbzE6EvddDvWlSuZfW7IBN855HGRuGqwAR3+B0u0DJu1g
	 mp6UUhpmx33Cg==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 14:03:05 +0200
Message-Id: <DC5JEGJSBBCP.38DNGTBOVH9OB@kernel.org>
To: "Thorsten Leemhuis" <linux@leemhuis.info>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 0/2] Take ARCH_KMALLOC_MINALIGN into account for
 build-time XArray check
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>, "Tamir Duberstein"
 <tamird@gmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <linux-mm@kvack.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Stephen
 Rothwell" <sfr@canb.auug.org.au>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>
References: <20250811-align-min-allocator-v2-0-3386cc94f4fc@google.com>
 <DC38NDRET9NB.31UDI8FHB7WAY@kernel.org>
 <8aa05f08-ef6e-4dfe-9453-beaab7b3cb98@leemhuis.info>
In-Reply-To: <8aa05f08-ef6e-4dfe-9453-beaab7b3cb98@leemhuis.info>

On Mon Aug 18, 2025 at 1:09 PM CEST, Thorsten Leemhuis wrote:
> error[E0428]: the name `ARCH_KMALLOC_MINALIGN` is defined multiple times
>       --> /builddir/build/BUILD/kernel-6.17.0-build/kernel-next-20250818/=
linux-6.17.0-0.0.next.20250818.423.vanilla.fc44.aarch64/rust/bindings/bindi=
ngs_generated.rs:134545:1
>        |
> 9622   | pub const ARCH_KMALLOC_MINALIGN: u32 =3D 8;
>        | ----------------------------------------- previous definition of=
 the value `ARCH_KMALLOC_MINALIGN` here
> ...
> 134545 | pub const ARCH_KMALLOC_MINALIGN: usize =3D 8;
>        | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `ARCH_KMALLOC_MINALI=
GN` redefined here
>        |
>        =3D note: `ARCH_KMALLOC_MINALIGN` must be defined only once in the=
 value namespace of this module
>
> error: aborting due to 1 previous error

Thanks for reporting, the diff below should fix it, I'll send a patch soon.

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 0f96af8b9a7f..02b371b98b39 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -34,3 +34,4 @@
 # We use const helpers to aid bindgen, to avoid conflicts when constants a=
re
 # recognized, block generation of the non-helper constants.
 --blocklist-item ARCH_SLAB_MINALIGN
+--blocklist-item ARCH_KMALLOC_MINALIGN

