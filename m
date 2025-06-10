Return-Path: <linux-next+bounces-7122-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DAAAD2FAB
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 10:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB30C163B43
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 08:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1DA21ABD5;
	Tue, 10 Jun 2025 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEGIj4mq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849641DD9D3;
	Tue, 10 Jun 2025 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543312; cv=none; b=HfN+KJ0/5hkcGYQnAMFbNnzkSLFInMdGAzofP+rQI7VW+pgyC4lAG/rH2fSaE7VY1eTLJsDlPOpOyp/wTeA3rSkmnIKixOwOldC2W6Iwogcq2i/oRgeX53VZIrL/hLOaPSyHxTboiz8LOM/ueW4akMJmqYfUL6DOUePBcJzW/AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543312; c=relaxed/simple;
	bh=bTz2jD+cGt2XQ/Ega0J5lq5VYe60lHLquMDkJ3TPTh4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dMX2fD1Fr7NsZl5aWQs4jsnkNgmuOS1nMVb356xBI62MrtkvAgJLf34qz13BNIwLcL4IfcPoKgbfWfYMhA4cxFRF0JAHfbQjizyH/D/865SV6KjVOnPgvBNdckzbJB8CqJsWULj+VSN2DO3XhSBVdoDueAofUoMgx6KVPAEMWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEGIj4mq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD998C4CEEF;
	Tue, 10 Jun 2025 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749543312;
	bh=bTz2jD+cGt2XQ/Ega0J5lq5VYe60lHLquMDkJ3TPTh4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=CEGIj4mq4tW1ToEzIVnsp8ZXU9S6QjDqYF2TM1c6YODY18mvNlszIZT8kNyWWwE1m
	 wGLi/BlPKKYLqwP3hOHFZJOK68YZ+5G1ngd43RRKIKVrLEyKcPU92XUN6Tp2Hslz0d
	 oYPPbjMzi1ivbh3FU96wxiFScZtGPCdk/YWvuZfpoDbyWgI9I14CAlpyklDiLQ7zSO
	 epJvffFsRIZrl5cAtJ1Pwmebh/GubJK6ZAvqGL25lT+xuJjCTO9N30eHceAiOK/RKZ
	 I7KAivRHbpt8wfKJ5uN8eaCsGdiYFSYrdNRrnd1YXxa8KV5VGJJpXlxi/vmPOa3uMx
	 Om5JYKfu0osrw==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 10:15:08 +0200
Message-Id: <DAIPCCIHRLHW.1TDNY93G6UZM0@kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-pin-init tree
From: "Benno Lossin" <lossin@kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250610142230.001af1d3@canb.auug.org.au>
 <DAIP0NGMMM90.11JRFL5O1NAW9@kernel.org>
In-Reply-To: <DAIP0NGMMM90.11JRFL5O1NAW9@kernel.org>

On Tue Jun 10, 2025 at 9:59 AM CEST, Benno Lossin wrote:
> On Tue Jun 10, 2025 at 6:22 AM CEST, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the rust-pin-init tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> error[E0282]: type annotations needed
>>    --> rust/kernel/configfs.rs:154:26
>>     |
>> 154 |             subsystem <- pin_init::zeroed().chain(
>>     |                          ^^^^^^^^^^^^^^^^ cannot infer type of the=
 type parameter `T` declared on the function `zeroed`
>>     |
>> help: consider specifying the generic argument
>>     |
>> 154 |             subsystem <- pin_init::zeroed::<T>().chain(
>>     |                                          +++++
>>
>> error[E0282]: type annotations needed
>>    --> rust/kernel/configfs.rs:264:22
>>     |
>> 264 |             group <- pin_init::zeroed().chain(|v: &mut Opaque<bind=
ings::config_group>| {
>>     |                      ^^^^^^^^^^^^^^^^ cannot infer type of the typ=
e parameter `T` declared on the function `zeroed`
>>     |
>> help: consider specifying the generic argument
>>     |
>> 264 |             group <- pin_init::zeroed::<T>().chain(|v: &mut Opaque=
<bindings::config_group>| {
>>     |                                      +++++
>>
>> error: aborting due to 2 previous errors
>>
>> For more information about this error, try `rustc --explain E0282`.
>>
>> Caused by commit
>>
>>   0bcaea04244b ("rust: pin-init: rename `zeroed` to `init_zeroed`")
>>
>> I have used the rust-pin-init tree from next-20250606 for today.
>
> Thanks for catching this! I didn't test with `CONFIG_CONFIGFS=3Dy`, so th=
e
> code was cfg'd out... I'll add it to my tests.
>
> @Andreas I'll send a new version of the commit above with configfs
> changed.

(sorry forgot to add your emails and also some new info)

Actually, the correct change would be this in commit 0bcaea04244b
("rust: pin-init: rename `zeroed` to `init_zeroed`"):

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 34d0bea4f9a5..6d566a8bde74 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -151,7 +151,7 @@ pub fn new(
         data: impl PinInit<Data, Error>,
     ) -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
-            subsystem <- pin_init::zeroed().chain(
+            subsystem <- pin_init::init_zeroed().chain(
                 |place: &mut Opaque<bindings::configfs_subsystem>| {
                     // SAFETY: We initialized the required fields of `plac=
e.group` above.
                     unsafe {
@@ -261,7 +261,7 @@ pub fn new(
         data: impl PinInit<Data, Error>,
     ) -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
-            group <- pin_init::zeroed().chain(|v: &mut Opaque<bindings::co=
nfig_group>| {
+            group <- pin_init::init_zeroed().chain(|v: &mut Opaque<binding=
s::config_group>| {
                 let place =3D v.get();
                 let name =3D name.as_bytes_with_nul().as_ptr();
                 // SAFETY: It is safe to initialize a group once it has be=
en zeroed.

@Miguel, @Andreas, how should I go about this? Send the commit above
augmented with the diff, or send a patch with just the diff to the list?
Or apply the diff directly to the commit in the pin-init-next branch &
rebasing (potentially adding an Acked-by from Andreas)? Or some other
way?

---
Cheers,
Benno

