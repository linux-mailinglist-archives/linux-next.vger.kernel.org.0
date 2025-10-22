Return-Path: <linux-next+bounces-8683-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D1BFB192
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 11:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FD5E5E1DF3
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 09:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9174F313272;
	Wed, 22 Oct 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJNmji4J"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632D6311C22;
	Wed, 22 Oct 2025 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124210; cv=none; b=THyffi1ISoAunnnccHlq49HR19PPUPgmRF9IE3kQMDBH3xnXcOftncIttOk3H9sbq+0wo7cx1/DWG3wA7yUOgd6OIrMXnDaBU/FJZmMe4Gjz/eqZM/TO+BlbVMslKgHPS3jhnVCrXB7+wL5R6AhvDZnd5sCVE5bTLg46B6BoIeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124210; c=relaxed/simple;
	bh=XBwcSKAt7pmMIAlH4P9UOJg9seAvmBafg4+HNgtE9uA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cAcTP/bduSSxuc+ZmOeLiBUO6YgSljVMp00rsc0qiTuce66D4rOFiB7EBOqVCEP2gSWsSCS8EM6Lrkp9UgQclevzs9sUGaGnGSXv1bg48A8dNO7LDBS9Q+s1aHU7uhbE2rSYGLQb67joPInKWIPJUCm962LvSsWCvEy9UQcSQ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJNmji4J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7B0C4CEE7;
	Wed, 22 Oct 2025 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761124207;
	bh=XBwcSKAt7pmMIAlH4P9UOJg9seAvmBafg4+HNgtE9uA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=tJNmji4J3S+RsYSsWOyEd44dMG2opN4PZ6QTDS9iGf412Ikx4VoOdlQurU1FUDAla
	 oObwS5j8v51ltDfCZvv/jL7xqCte/Nqfirbd4qy9Pq5kOHd3epBvjxemzr+3QnpBWl
	 te9XFfCxVnhEQynEi0Cm5sbcS9qCXXvB8S7cvoAoyJbbCE8ze84XPU7NtBRZuuVqmr
	 A4BPIEzzCs4jMA5H5br2hzjYyBIHcLMc5zA0ehjOcFVk09pyp6Yzr/R4ika9b48lec
	 nce7YuPUIW5+Zwz267GNLK3dndCsemwbTyyFy7ViVgq+egqXzhn/Itwhfy+pW6MBOd
	 eNWFNYDAbniVQ==
Message-ID: <e2c6bc90-9fa4-4880-adf4-212890cf0b51@kernel.org>
Date: Wed, 22 Oct 2025 11:10:02 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: debugfs: Implement Reader for Mutex<T> only when T
 is Unpin
From: Danilo Krummrich <dakr@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Maurer <mmaurer@google.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, lossin@kernel.org,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <aPhGo5WjbPM1Yu95@tardis-2.local>
 <20251022034237.70431-1-boqun.feng@gmail.com>
 <4b556c24-cd4c-4c1a-a757-5df3a6782e11@kernel.org>
Content-Language: en-US
In-Reply-To: <4b556c24-cd4c-4c1a-a757-5df3a6782e11@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/25 11:07 AM, Danilo Krummrich wrote:
> On 10/22/25 5:42 AM, Boqun Feng wrote:
>> Since we are going to make `Mutex<T>` structurally pin the data (i.e.
>> `T`), therefore `.lock()` function only returns a `Guard` that can
>> dereference a mutable reference to `T` if only `T` is `Unpin`, therefore
>> restrict the impl `Reader` block of `Mutex<T>` to that.
>>
>> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> I assume this can go through the driver-core tree, since it's only about a
> conflict in linux-next?

Sorry, I confused this, obviously your tree is broken without this change,
please feel free to take it.

Acked-by: Danilo Krummrich <dakr@kernel.org>

