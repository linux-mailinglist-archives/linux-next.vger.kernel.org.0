Return-Path: <linux-next+bounces-7124-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6DAD3219
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 11:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 481917A82C4
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 09:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8B528B7CC;
	Tue, 10 Jun 2025 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAZNH/Nk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D2280CCF;
	Tue, 10 Jun 2025 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547931; cv=none; b=aoidCJArpbIDt7i19jE6KVkYiFRM4xfsvcD+g0zIovLFUO6t8MA0tQ0nQWewuaDMU8FbsnKSrdToFaU/Hal/IBNYoUAn+xJrEvGVuiQKywBJJYPwZLl6hO1ILhqW3sQxAQtwlal1I+V7zd/wAgLU6m3CiaFKxaB3APe/oNUaETg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547931; c=relaxed/simple;
	bh=eKiRb6L6Ozc73XkfGbKGoMTgpuDK6lUHSqXXX/O1PDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KPtYBnErpq1m0GwYY7EfqC2zbbBpbNAM4iGxbDr96kh/U0KMvMlZaWA+08LcL631jNLbz3qt69U037f4MyIgkMW17G3TOpU/ZP4mg73Q6zNEL8fPTB5tKiSmT+qM5ZJ88Xg2eDpD5SOG4c93g4gpVsPPA0NL9B+98GxTEH6vqqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAZNH/Nk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD3EC4CEEF;
	Tue, 10 Jun 2025 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547930;
	bh=eKiRb6L6Ozc73XkfGbKGoMTgpuDK6lUHSqXXX/O1PDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VAZNH/NkZPzdBmeAQDQTeOPtAAuyDnJ8WnuLrFAY5M3oM3ig/xvBtOs/Zrp2ljSYg
	 NfYEV/WyCldnbyhEFIVBipcucNzXH0GBny75X5JxMdeqP+HmRME8XEXN16Gfi3U2MQ
	 aO+QZaKKzZV1PO+2alO6LAkAu0LQUqKjGwf5HEyiFvy2GPE/jRnZw4diMHLQ9ji5bq
	 xwlq9oB1bj9Bi5oNL5V0ckM8WZKNGHeGuptkZVg7hRVFc4BQRK2zf6UURv3/abV9kW
	 nmLZOrAhxnNbLSXAucdKtmer0uscHr6a7lcxkrXyjx4U+Eg/ZeiXl0Hz9bbuT97Dpt
	 BcLKhBDAdVLZg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>,  "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-pin-init tree
In-Reply-To: <DAIPCCIHRLHW.1TDNY93G6UZM0@kernel.org> (Benno Lossin's message
	of "Tue, 10 Jun 2025 10:15:08 +0200")
References: <20250610142230.001af1d3@canb.auug.org.au>
	<DAIP0NGMMM90.11JRFL5O1NAW9@kernel.org>
	<e0lTxW1xgQfnXlaJP9bBC75nSMvzZEdAEAmkh1G41H1yJHHyg94Op2pxoQnOYTKtpKYyVQIJMZvjay8xS9yuuQ==@protonmail.internalid>
	<DAIPCCIHRLHW.1TDNY93G6UZM0@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 10 Jun 2025 11:32:04 +0200
Message-ID: <87msag2b8r.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Tue Jun 10, 2025 at 9:59 AM CEST, Benno Lossin wrote:
>> On Tue Jun 10, 2025 at 6:22 AM CEST, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the rust-pin-init tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>>
>>> error[E0282]: type annotations needed
>>>    --> rust/kernel/configfs.rs:154:26
>>>     |
>>> 154 |             subsystem <- pin_init::zeroed().chain(
>>>     |                          ^^^^^^^^^^^^^^^^ cannot infer type of the type parameter `T` declared on the function `zeroed`
>>>     |
>>> help: consider specifying the generic argument
>>>     |
>>> 154 |             subsystem <- pin_init::zeroed::<T>().chain(
>>>     |                                          +++++
>>>
>>> error[E0282]: type annotations needed
>>>    --> rust/kernel/configfs.rs:264:22
>>>     |
>>> 264 |             group <- pin_init::zeroed().chain(|v: &mut Opaque<bindings::config_group>| {
>>>     |                      ^^^^^^^^^^^^^^^^ cannot infer type of the type parameter `T` declared on the function `zeroed`
>>>     |
>>> help: consider specifying the generic argument
>>>     |
>>> 264 |             group <- pin_init::zeroed::<T>().chain(|v: &mut Opaque<bindings::config_group>| {
>>>     |                                      +++++
>>>
>>> error: aborting due to 2 previous errors
>>>
>>> For more information about this error, try `rustc --explain E0282`.
>>>
>>> Caused by commit
>>>
>>>   0bcaea04244b ("rust: pin-init: rename `zeroed` to `init_zeroed`")
>>>
>>> I have used the rust-pin-init tree from next-20250606 for today.
>>
>> Thanks for catching this! I didn't test with `CONFIG_CONFIGFS=y`, so the
>> code was cfg'd out... I'll add it to my tests.
>>
>> @Andreas I'll send a new version of the commit above with configfs
>> changed.
>
> (sorry forgot to add your emails and also some new info)
>
> Actually, the correct change would be this in commit 0bcaea04244b
> ("rust: pin-init: rename `zeroed` to `init_zeroed`"):
>
> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
> index 34d0bea4f9a5..6d566a8bde74 100644
> --- a/rust/kernel/configfs.rs
> +++ b/rust/kernel/configfs.rs
> @@ -151,7 +151,7 @@ pub fn new(
>          data: impl PinInit<Data, Error>,
>      ) -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
> -            subsystem <- pin_init::zeroed().chain(
> +            subsystem <- pin_init::init_zeroed().chain(
>                  |place: &mut Opaque<bindings::configfs_subsystem>| {
>                      // SAFETY: We initialized the required fields of `place.group` above.
>                      unsafe {
> @@ -261,7 +261,7 @@ pub fn new(
>          data: impl PinInit<Data, Error>,
>      ) -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
> -            group <- pin_init::zeroed().chain(|v: &mut Opaque<bindings::config_group>| {
> +            group <- pin_init::init_zeroed().chain(|v: &mut Opaque<bindings::config_group>| {
>                  let place = v.get();
>                  let name = name.as_bytes_with_nul().as_ptr();
>                  // SAFETY: It is safe to initialize a group once it has been zeroed.
>
> @Miguel, @Andreas, how should I go about this? Send the commit above
> augmented with the diff, or send a patch with just the diff to the list?
> Or apply the diff directly to the commit in the pin-init-next branch &
> rebasing (potentially adding an Acked-by from Andreas)? Or some other
> way?

I think you should add this change directly in your tree. I think you
should just fold it into the breaking commit so we avoid commits that do
not build.

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg




