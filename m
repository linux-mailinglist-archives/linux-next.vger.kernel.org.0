Return-Path: <linux-next+bounces-7240-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35876AE6F1B
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 21:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E29BA3ACF24
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 19:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580832EA752;
	Tue, 24 Jun 2025 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czUL/aLc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24B2EA737;
	Tue, 24 Jun 2025 19:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791819; cv=none; b=Gohq7MROypy1br/9/NiAJqZ94Jt9kszZNm5D1VJmH464Wseo+O3g/RFvIrJD2hzBg5/di5R48dZwZ0uRw4QrKRkQ+XfEMKEbKFGdP8SIfqsk9SswU2kx/dc0oDFcg8UjhM5OarbcqOvYXg13WHN8pKpXY7P2e3qMbFFVh2b0XVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791819; c=relaxed/simple;
	bh=42UBip56JkHtQyZ7Mn+WJgAjQpe7ojrVE/RNiCSL3JU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jwg2nRghqKah+Go8v7PfJ01hmiF6TLuC5tpbTltutOWy8Yct8TqhxVzktwc70RV80B4n2s8dFSQXdWvfX9kOkbJYO2PxM6TW8IsLfFb6cSGzs21AynkGXgbGdctseHDSNJQe1i0Lv0h5/Fuy/HGZ9+Zlpg+GZDyJo6T3MqPR9Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czUL/aLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A22C4CEF2;
	Tue, 24 Jun 2025 19:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750791817;
	bh=42UBip56JkHtQyZ7Mn+WJgAjQpe7ojrVE/RNiCSL3JU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=czUL/aLcIXVCIA4rlx6qXGK5dX3y3VmjE0BvsObvfeDJGmDapv2moNKt4LYCrRwNd
	 wZOVu5HpOdnoyKnsVvj1PGOAF0HLaNHyS1nY7O1cUL8U9v8KQ0buAUheHDkCXbeVN7
	 w2pXHQfdMxk8/1jL44wee8dQiofJxAcVf0PvWhICLbJhb9QmjvTDvh+3Zxm0xirmwI
	 Q72CIJdHEw4LT5/6CAfesNmpw9QyuqjVo5eR1x20ExWJt3F6v6whtws1ks+mYuqlHb
	 GWZ2NnyNlNIdWcEZ3xL8D/rARdnDIuKSAgYzWjegPc6/SAX2OTRbLXHbC4wvH5uEXm
	 vYPawRTt5L5OA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,  "Stephen Rothwell"
 <sfr@canb.auug.org.au>,  "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
  "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,  "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 drm-nova tree
In-Reply-To: <aFqXKKAxQp0yxUvL@pollux> (Danilo Krummrich's message of "Tue, 24
	Jun 2025 14:16:40 +0200")
References: <iuo4BpdTglZkpW9Xyy1ehjFspmj3ay0q7iejyeOShBG0HLZmIrhzIpi0eG_wBv71ZPPCgh2lcn2BOsrFHOegfg==@protonmail.internalid>
	<20250624195142.1050e147@canb.auug.org.au> <87ecv94ay9.fsf@kernel.org>
	<DAUQZ1TY9VT3.UJEFQ96157DJ@nvidia.com>
	<CeKXJWcbSngalEPTkHeRti8od7cPavN5gh1Opt1oNESUBUh8W4Kt7xnuHkD7l7dr1178GDTfqrabr9Pye6SWpw==@protonmail.internalid>
	<aFqXKKAxQp0yxUvL@pollux>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 24 Jun 2025 21:02:43 +0200
Message-ID: <87ikkl2ca4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> On Tue, Jun 24, 2025 at 09:03:48PM +0900, Alexandre Courbot wrote:
>> On Tue Jun 24, 2025 at 8:48 PM JST, Andreas Hindborg wrote:
>> > For the Nova people: You might consider if it makes sense to take a
>> > `kernel::time::Delta<C>` for the timeout.
>>
>> It probably does now that it is available. I'm willing to do it this
>> cycle if we can find a way to not break the build. Should we have a tag
>> to merge into nova-next or something?
>
> I'm not sure about the generic in Delta mentioned by Andreas above, but the
> Detla type did land in the last merge window, so it's available in the nova
> tree already.

Sorry, that is my mistake. `Delta` does not take any generics, I was
thinking of `Instant`, it takes the clock.

Anyway, I dropped the patch renaming `as_*` [1], so now the resolution would
be:

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 5cafe0797cd6..01a920085438 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -3,7 +3,7 @@
 use core::time::Duration;
 
 use kernel::prelude::*;
-use kernel::time::Instant;
+use kernel::time::{Instant, Monotonic};
 
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
     let src = s.as_bytes();
@@ -35,7 +35,7 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
 /// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
-    let start_time = Instant::now();
+    let start_time = Instant::<Monotonic>::now();
 
     loop {
         if let Some(ret) = cond() {


Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/all/87wm912sjg.fsf@kernel.org


