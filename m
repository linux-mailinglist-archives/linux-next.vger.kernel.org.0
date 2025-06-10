Return-Path: <linux-next+bounces-7125-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B66AD32D5
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 11:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C0A3189554C
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 09:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8626228B7CC;
	Tue, 10 Jun 2025 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgKap9aI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B40B25F797;
	Tue, 10 Jun 2025 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549350; cv=none; b=kE8bnT3nki7z5cA/r+MJGap1KYFmB0KxIokZv8KUTxWf/HmZWv8rujZ4CdwPmUygZ2fptPboXOs4Fk8gZGVXl9ZoOHYsLgBu0F31moCDMk2Tn1Hd09AI7tL41oN81ru4D5uQphVEmHT5hEyDh6833eLXZzDGt/ZU9mwPedbeGvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549350; c=relaxed/simple;
	bh=GqfnxPzPcKC6JM544VAwehfJVCxORTUdatZW3VeOt3o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=K1IoMSozkOteyC3uuiN53FWwTmdySuvinV/pg2/Gf7IdumXVqFZZKWj4FhbxoBIiGalU4RXwaqaunM5a1j7cM3Rj0mZgm/EMNGlVAE5U8pG2EXkvsa1e9Sf0sRVENry3G3DOWKhQZ8UUCt535dPzg0TH60cpBlwD432Ub5ED8kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgKap9aI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EB3C4CEF2;
	Tue, 10 Jun 2025 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749549350;
	bh=GqfnxPzPcKC6JM544VAwehfJVCxORTUdatZW3VeOt3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgKap9aI2hGdFjN6WUUSKUHHZoUGyCh8mjzpcWGjuYvEhA6xPw68JB1V/3HaASgtH
	 ija2jwIScaIQRR/e4Nd3EQ4KpVRqMHHlJXCiiwUdgS13XtoOjUF9Tzhw+dIqNOxHuq
	 u6lFrweoCCa2k5ffAAISpD3BPjWw+lv+5zNmQEG29zpsithoCSn5bQeswUnBMa6uii
	 RpjgGato4S6ybVW4Jloxom4UQxf4QMVS/mys7pbUA+KUgVqS/LXCzLzgYPWQxWA+nz
	 wxItHQs6FoSbB5bhXvIV+xfmSaHpYRrZCM4wMIvdekf5jymzDl6atJm3GiinhA4zZy
	 8Dd+XBP26h2fw==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 11:55:47 +0200
Message-Id: <DAIRHEFW2G16.2FHXB1PRM2HXC@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-pin-init tree
X-Mailer: aerc 0.20.1
References: <20250610142230.001af1d3@canb.auug.org.au>
 <DAIP0NGMMM90.11JRFL5O1NAW9@kernel.org>
 <e0lTxW1xgQfnXlaJP9bBC75nSMvzZEdAEAmkh1G41H1yJHHyg94Op2pxoQnOYTKtpKYyVQIJMZvjay8xS9yuuQ==@protonmail.internalid> <DAIPCCIHRLHW.1TDNY93G6UZM0@kernel.org> <87msag2b8r.fsf@kernel.org>
In-Reply-To: <87msag2b8r.fsf@kernel.org>

On Tue Jun 10, 2025 at 11:32 AM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>
>> On Tue Jun 10, 2025 at 9:59 AM CEST, Benno Lossin wrote:
>>> On Tue Jun 10, 2025 at 6:22 AM CEST, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> After merging the rust-pin-init tree, today's linux-next build (x86_64
>>>> allmodconfig) failed like this:
>>>>
>>>> error[E0282]: type annotations needed
>>>>    --> rust/kernel/configfs.rs:154:26
>>>>     |
>>>> 154 |             subsystem <- pin_init::zeroed().chain(
>>>>     |                          ^^^^^^^^^^^^^^^^ cannot infer type of t=
he type parameter `T` declared on the function `zeroed`
>>>>     |
>>>> help: consider specifying the generic argument
>>>>     |
>>>> 154 |             subsystem <- pin_init::zeroed::<T>().chain(
>>>>     |                                          +++++
>>>>
>>>> error[E0282]: type annotations needed
>>>>    --> rust/kernel/configfs.rs:264:22
>>>>     |
>>>> 264 |             group <- pin_init::zeroed().chain(|v: &mut Opaque<bi=
ndings::config_group>| {
>>>>     |                      ^^^^^^^^^^^^^^^^ cannot infer type of the t=
ype parameter `T` declared on the function `zeroed`
>>>>     |
>>>> help: consider specifying the generic argument
>>>>     |
>>>> 264 |             group <- pin_init::zeroed::<T>().chain(|v: &mut Opaq=
ue<bindings::config_group>| {
>>>>     |                                      +++++
>>>>
>>>> error: aborting due to 2 previous errors
>>>>
>>>> For more information about this error, try `rustc --explain E0282`.
>>>>
>>>> Caused by commit
>>>>
>>>>   0bcaea04244b ("rust: pin-init: rename `zeroed` to `init_zeroed`")
>>>>
>>>> I have used the rust-pin-init tree from next-20250606 for today.
>>>
>>> Thanks for catching this! I didn't test with `CONFIG_CONFIGFS=3Dy`, so =
the
>>> code was cfg'd out... I'll add it to my tests.
>>>
>>> @Andreas I'll send a new version of the commit above with configfs
>>> changed.
>>
>> (sorry forgot to add your emails and also some new info)
>>
>> Actually, the correct change would be this in commit 0bcaea04244b
>> ("rust: pin-init: rename `zeroed` to `init_zeroed`"):
>>
>> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
>> index 34d0bea4f9a5..6d566a8bde74 100644
>> --- a/rust/kernel/configfs.rs
>> +++ b/rust/kernel/configfs.rs
>> @@ -151,7 +151,7 @@ pub fn new(
>>          data: impl PinInit<Data, Error>,
>>      ) -> impl PinInit<Self, Error> {
>>          try_pin_init!(Self {
>> -            subsystem <- pin_init::zeroed().chain(
>> +            subsystem <- pin_init::init_zeroed().chain(
>>                  |place: &mut Opaque<bindings::configfs_subsystem>| {
>>                      // SAFETY: We initialized the required fields of `p=
lace.group` above.
>>                      unsafe {
>> @@ -261,7 +261,7 @@ pub fn new(
>>          data: impl PinInit<Data, Error>,
>>      ) -> impl PinInit<Self, Error> {
>>          try_pin_init!(Self {
>> -            group <- pin_init::zeroed().chain(|v: &mut Opaque<bindings:=
:config_group>| {
>> +            group <- pin_init::init_zeroed().chain(|v: &mut Opaque<bind=
ings::config_group>| {
>>                  let place =3D v.get();
>>                  let name =3D name.as_bytes_with_nul().as_ptr();
>>                  // SAFETY: It is safe to initialize a group once it has=
 been zeroed.
>>
>> @Miguel, @Andreas, how should I go about this? Send the commit above
>> augmented with the diff, or send a patch with just the diff to the list?
>> Or apply the diff directly to the commit in the pin-init-next branch &
>> rebasing (potentially adding an Acked-by from Andreas)? Or some other
>> way?
>
> I think you should add this change directly in your tree. I think you
> should just fold it into the breaking commit so we avoid commits that do
> not build.
>
> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks and done!

---
Cheers,
Benno

