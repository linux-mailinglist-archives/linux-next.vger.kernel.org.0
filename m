Return-Path: <linux-next+bounces-6489-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D66AA5D1D
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 12:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 704E57B6FEA
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 10:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAE1222563;
	Thu,  1 May 2025 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcgfi0Ve"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968572222DF;
	Thu,  1 May 2025 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094539; cv=none; b=AWch2dCpehsm3Yp2wFrri/WbfeT1ELdUvX5GvpmzPPl9uUe6y6U0fVcpeb+AFmCXA6HyH5ISUp8GVcDmuc5+Bt/DUc5Af6igMa2ewNCoYCHL+kWtaKJUMDPrNZX9IXrhF5y1MrJWr3v746lkVUSp45L/HAxS1jSQ73JZskW1UPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094539; c=relaxed/simple;
	bh=KDn7J4jCkykLeP9srQNw+3W3dnYTMLQTXyTSlG4TVHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gKrjQ/SJEfEvP/odJoLk72trMditoOmFHBzzESUBc2qdLRBctGznPC7Px/UgoGnyhqkbibRY9q/1ByJ6oZ5spREctzFoW1XISb62erdxdAAlkBzZe+ODDqpJZxnYi6LZH3rZVyMZ+sRjJonk3161HL5x6Ugax2XWSh4S/a1HCkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcgfi0Ve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E39C4CEE3;
	Thu,  1 May 2025 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746094539;
	bh=KDn7J4jCkykLeP9srQNw+3W3dnYTMLQTXyTSlG4TVHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tcgfi0Ve9mjWoDymUdQS3wiH9gdtOud2TOwvXUl5TSDkUGXEXYIWUtSzq6eJaBrTO
	 cS4dn0KR17ro93AFwEWB2hQIIP4Lt7k2vWGWqE6ZXXowaX/NPIIqfVYbhSpn6N5SZT
	 ppnhH97T/Yl/dE0xflUbsYH8wWTLE8tMX44jxs4NdlS99bDJNfL9AJP8cyIqBrZcbG
	 FtLLQlUXOkb04HTskhCqzrSUYz0kerHBkAQHSKvye0xyD9qokXyS89w4QMuAUdCtXX
	 rXC4ZjqwsOJoPXHb9VcRp7s7ZHnFaEVmN9UXQBJG9tq7WNGJJ7bQSTiOCfomzfZYcI
	 ECbBWtjllLBoQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Viresh Kumar" <viresh.kumar@linaro.org>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,  "Tamir Duberstein"
 <tamird@gmail.com>,  "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>,  "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
In-Reply-To: <20250430104234.dmwnn5ih232kfk4z@vireshk-i7> (Viresh Kumar's
	message of "Wed, 30 Apr 2025 16:12:34 +0530")
References: <20250430202315.62bb1c1b@canb.auug.org.au>
	<2xUHqc3nyQdHW2SNbAQvQwy1mR4qz-vdR0UF8fVwFvm-rDtaJmhOUqJJvNWkneTh1XD58UlvoBT3umKbMjNlYw==@protonmail.internalid>
	<20250430104234.dmwnn5ih232kfk4z@vireshk-i7>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 01 May 2025 11:41:30 +0200
Message-ID: <87selo1xdh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Viresh Kumar" <viresh.kumar@linaro.org> writes:

> On 30-04-25, 20:23, Stephen Rothwell wrote:
>> Caused by commit
>>
>>   a68f46e83747 ("rust: types: add `ForeignOwnable::PointedTo`")
>>
>> interacting with commit
>>
>>   254df142ab42 ("rust: cpufreq: Add initial abstractions for cpufreq framework")
>>
>> from the cpufreq-arm tree.
>>
>> I don't know how to fix this up, so I have dropped the rust-xarray tree
>> for today.
>
> Probably this:
>
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index 49246e50f67e..82d20b999e6c 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -630,7 +630,7 @@ pub fn data<T: ForeignOwnable>(&mut self) -> Option<<T>::Borrowed<'_>> {
>              None
>          } else {
>              // SAFETY: The data is earlier set from [`set_data`].
> -            Some(unsafe { T::borrow(self.as_ref().driver_data) })
> +            Some(unsafe { T::borrow(self.as_ref().driver_data.cast()) })
>          }
>      }
>
> @@ -657,7 +657,7 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
>              let data = Some(
>                  // SAFETY: The data is earlier set by us from [`set_data`]. It is safe to take
>                  // back the ownership of the data from the foreign interface.
> -                unsafe { <T as ForeignOwnable>::from_foreign(self.as_ref().driver_data) },
> +                unsafe { <T as ForeignOwnable>::from_foreign(self.as_ref().driver_data.cast()) },
>              );
>              self.as_mut_ref().driver_data = ptr::null_mut();
>              data
>
>
> Andreas, is your xarray-next branch immmutable ? I can rebase over the
> change then.

I might add tags. But I guess now that Stephen carries the merge
resolution, we should be fine? Not sure what the preferred approach is
for this situation.


Best regards,
Andreas Hindborg



