Return-Path: <linux-next+bounces-8682-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5CFBFB153
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 11:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 124463AFA1E
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 09:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2613115A6;
	Wed, 22 Oct 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSxibAxx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC5C3112C2;
	Wed, 22 Oct 2025 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124079; cv=none; b=TjRoDk5PZd1iU5TgpQY0L7JyQppL0hySgwGnEjWKPrxXoRBUhhcCl18m2bqWZgpziWseDdMN5lrZb93QySoR3rpmQVOERixSY8Lbs/3gwiBvCklLHCHsTBm7WAKYgC68I5++boyb3C6aEdCcP6WseX3TcakApEoyS/qf3zCcy2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124079; c=relaxed/simple;
	bh=Sg+8YSm3mgraXdctLln1jDD9O/XHb8ICQQTmWrXOUws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjokqSa2IdANNvG1bDuNABcfPchgmIkwjptL40WvAcXAQrwm4SzfD+j20Y0YIZvLjvmULFy2Jcqnhv1F4ML+9g8iH/gL5eRVe7B0RaWTMKIRA4NajvVei0YTZm/yHad0eX2Vz7wBg1OHzPKO0yfN8u78VH37+AdAyR38TE4wvFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSxibAxx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42783C4CEF5;
	Wed, 22 Oct 2025 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761124078;
	bh=Sg+8YSm3mgraXdctLln1jDD9O/XHb8ICQQTmWrXOUws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aSxibAxxl1dFJ4WWqdnjtp/ca6ZwjmHGoBvhtsm9xfSI0kvBylldP2SDG1w0AiMcV
	 yQ+EJbO0G47m2wTCieL2rJu8f2+Innvrq3s2b01JeWxM6UGKT9gZ7j7bAHkzKPu6+u
	 RscTOIC16limfg11X5UdlXoI98lLnIkNcVeOdAhUbgj8DCpYL6lGLCO+e5YLjNy2Xa
	 VrUx1rk3T3UQX8P2FnAD90P6s49YVm9pvLQm7wT6yLVcnAQ2UORYh4oP3Gq+RBrGJP
	 jmF+H1LVs1Zdt3rvX6zLpsM7mepV2sL1f3wCVYLS/HOnqWL62/RWQQFfGpluaIvGH6
	 CVycDHDJ0deHg==
Message-ID: <4b556c24-cd4c-4c1a-a757-5df3a6782e11@kernel.org>
Date: Wed, 22 Oct 2025 11:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: debugfs: Implement Reader for Mutex<T> only when T
 is Unpin
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
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251022034237.70431-1-boqun.feng@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/25 5:42 AM, Boqun Feng wrote:
> Since we are going to make `Mutex<T>` structurally pin the data (i.e.
> `T`), therefore `.lock()` function only returns a `Guard` that can
> dereference a mutable reference to `T` if only `T` is `Unpin`, therefore
> restrict the impl `Reader` block of `Mutex<T>` to that.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

I assume this can go through the driver-core tree, since it's only about a
conflict in linux-next?


