Return-Path: <linux-next+bounces-7227-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C6AE63D5
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 13:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 278891924EAB
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 11:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D7F24BD02;
	Tue, 24 Jun 2025 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJZY7C4f"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBBF1EBA09;
	Tue, 24 Jun 2025 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765720; cv=none; b=Rw9atV8uvnle/tY3RfWGSc0xnTsAAGD4NWIDUb7zXaftl73DrFFn4VA8sU9YN770UUBmN+Vv+HeE2dUsoC7q0Hb4hq6JRIsANPKyd2xjHqCOU7j3Gj95287uWrrWK0IK9FNyTqt6poDv+6xYdv5v5boLcos2eUHuuLXst+oj1Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765720; c=relaxed/simple;
	bh=t98U/v6kOm3A23+hwV+vgWZIzYEBlhLrnRJchELQH3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n5vfcUUFoWi9bsAnuX9kVjdfFP5jqIi+LZTVIlDWAPoKJYc+AdO3z6WF6nBlnsOp9i0oGlGFBvoa3uW1KO/Lbri1G9+AuKzkvSpTiIXpswA2hsYNdm1IikenYL5K9gjWO2bhA8jeYHIrDDFhtrwfKO0mZtFzQh3HehzE2DbyyLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJZY7C4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB722C4CEE3;
	Tue, 24 Jun 2025 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750765720;
	bh=t98U/v6kOm3A23+hwV+vgWZIzYEBlhLrnRJchELQH3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EJZY7C4fn6Iq0L8HhKdGfgD5uT4mwmwIIVJCavUT7+A4ajLAoBsgi5nE4AKMohY+D
	 SVI932sVDMDm6tyXJN4oM30YN3jZAf1WIGUVWI9gMVFZFcu38Ie8w/Z0L/NyZxwiwk
	 z6iFXA7rLNb/4G78+QGL/ALVpP5N4EMidQ1qcMYxJz15duR9iYQBB7/m2M6nb/1kM0
	 iOiE4ILdgvmeZdiQcQicNJ21PzI+KxXLLJWHEjVYVrJBONqhS/tkIPFfblV8io7TET
	 keUBx7WzE8KXZpyGMI3haHVHBHCzWeQo+FX7W9Hdz2yZDP7KnBLYqWAVvq9zzMrmrf
	 doWOqvZmXYLGg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Alexandre Courbot"
 <acourbot@nvidia.com>,  "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
  "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,  "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 drm-nova tree
In-Reply-To: <20250624195142.1050e147@canb.auug.org.au> (Stephen Rothwell's
	message of "Tue, 24 Jun 2025 19:51:42 +1000")
References: <iuo4BpdTglZkpW9Xyy1ehjFspmj3ay0q7iejyeOShBG0HLZmIrhzIpi0eG_wBv71ZPPCgh2lcn2BOsrFHOegfg==@protonmail.internalid>
	<20250624195142.1050e147@canb.auug.org.au>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 24 Jun 2025 13:48:30 +0200
Message-ID: <87ecv94ay9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Stephen Rothwell" <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the rust-timekeeping tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
>
> error[E0599]: no method named `as_nanos` found for struct `Delta` in the current scope
>   --> drivers/gpu/nova-core/util.rs:45:33
>    |
> 45 |         if start_time.elapsed().as_nanos() > timeout.as_nanos() as i64 {
>    |                                 ^^^^^^^^ method not found in `Delta`
>
> error: aborting due to 1 previous error
>
> For more information about this error, try `rustc --explain E0599`.
>
> Caused by commits
>
>   2ed94606a0fe ("rust: time: Rename Delta's methods from as_* to into_*")
>   768dfbfc98e2 ("rust: time: Make Instant generic over ClockSource")
>
> interacting with commit
>
>   a03c9bd953c2 ("gpu: nova-core: add helper function to wait on condition")
>
> from the drm-nova tree.
>
> I tried to fix it up, but this lead down a rabbit hole and my rust
> skills are poor, so I just dropped the rust-timekeeping tree for today.
> A merge resolution would be appreciated.

I would suggest the following:

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 5cafe0797cd6..24cbf3f4cc39 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -3,7 +3,7 @@
 use core::time::Duration;
 
 use kernel::prelude::*;
-use kernel::time::Instant;
+use kernel::time::{Instant, Monotonic};
 
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
     let src = s.as_bytes();
@@ -35,14 +35,14 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
 /// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
-    let start_time = Instant::now();
+    let start_time = Instant::<Monotonic>::now();
 
     loop {
         if let Some(ret) = cond() {
             return Ok(ret);
         }
 
-        if start_time.elapsed().as_nanos() > timeout.as_nanos() as i64 {
+        if start_time.elapsed().into_nanos() > timeout.as_nanos() as i64 {
             return Err(ETIMEDOUT);
         }
     }

For the Nova people: You might consider if it makes sense to take a
`kernel::time::Delta<C>` for the timeout.

Best regards,
Andreas Hindborg



