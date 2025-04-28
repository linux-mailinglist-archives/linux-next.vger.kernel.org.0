Return-Path: <linux-next+bounces-6420-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 742C5A9F097
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 14:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2BF71A820D1
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 12:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7758225DAED;
	Mon, 28 Apr 2025 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brZ+CQJa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8ED79E1;
	Mon, 28 Apr 2025 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843158; cv=none; b=tUCyWWU7fRg/yL5O4AOjOX/D1uNrw4ZnRAcIwI5PXpQoszRuXFTJlFYWDdyyugR5dMRdvZ+GCh0YswwNHJ3cfYUidPjbCNv+n0sFhdGoPSMeI4wDG2j2RWmIBFYGqPC/UFCSQE7I7d4z5/T+LQWo3sMOYeeA/8HILyb3CvE66V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843158; c=relaxed/simple;
	bh=4SyPEzwLfrVjrE2hqOgojSUL20yIcVzgFT5Wf4Xlqw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NC1uPCiZWamaobeXyZi9Y+orXAqUTGIca5TukC8lluc+ONaL8Q7xNnXycLG8le0P0pbYBH/PWxddCND+e5xYBhf4N0lHIxd/1PT9XGl8pY3M4v315bdzTwITC8wk5JKPOr9oSMOUQOL5Us+f+Z2KV6EzEdpt7DZxuVnPfe5Zs1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brZ+CQJa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303D6C4CEED;
	Mon, 28 Apr 2025 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745843157;
	bh=4SyPEzwLfrVjrE2hqOgojSUL20yIcVzgFT5Wf4Xlqw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=brZ+CQJa32Fja2x3ZTeZoPfifFFv6BRWEh90w8vDPetpdzpXwWzeGziUrgc+mksl8
	 /N7RuP714pf9n3T44nVxJULg0SqeC+2eLnmb6eozh86AZfr+NldjJxb3J4UdGe45Vl
	 7dcA1F6y5I6Cxa98o8ObKkB8M6LhqaOwqMjaQgBoyBMVGGMbyg8XrSYprd2TBe5+m2
	 SsavB7l+TP3zImkPRruJB5/OQM/HpwmpDbBpa+dh+wJsvvJ33iXhPrrZREasasvAOP
	 9s0n2EjVEarnEdIlJ4sSGnDFebieF+mUoaBCg6Q1ApzuaVHBFXBycsFvXCxzCaQHqS
	 VwTvxuKkOt/eQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Linux Next Mailing List" <linux-next@vger.kernel.org>,
	"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
In-Reply-To: <20250428203943.51dd39d5@canb.auug.org.au> (Stephen Rothwell's
	message of "Mon, 28 Apr 2025 20:39:43 +1000")
References: <tAJ0jyptJ0jLaRp9siDw8y2iw3S7GeuC05Uncum-qihlIKfCfEVhQbGNuTengQ0kWpnNp7OoTITxbEdf6nDTCw==@protonmail.internalid>
	<20250428203943.51dd39d5@canb.auug.org.au>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 28 Apr 2025 14:25:50 +0200
Message-ID: <877c344gmp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Stephen,

"Stephen Rothwell" <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the rust-xarray tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
>
> I don't know what caused this, but it is presumably an interaction
> between this tree and the mm-unstable and drm-nova trees.
>
> I have dropped the rust-xarray tree for today.

The diff below should solve the conflict.

Best regards,
Andreas Hindborg


diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 5c072960dee0..bc94850ef322 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -73,7 +73,9 @@ extern "C" fn probe_callback(
                 // Let the `struct auxiliary_device` own a reference of the driver's private data.
                 // SAFETY: By the type invariant `adev.as_raw` returns a valid pointer to a
                 // `struct auxiliary_device`.
-                unsafe { bindings::auxiliary_set_drvdata(adev.as_raw(), data.into_foreign()) };
+                unsafe {
+                    bindings::auxiliary_set_drvdata(adev.as_raw(), data.into_foreign().cast())
+                };
             }
             Err(err) => return Error::to_errno(err),
         }
@@ -89,7 +91,7 @@ extern "C" fn remove_callback(adev: *mut bindings::auxiliary_device) {
         // SAFETY: `remove_callback` is only ever called after a successful call to
         // `probe_callback`, hence it's guaranteed that `ptr` points to a valid and initialized
         // `KBox<T>` pointer created through `KBox::into_foreign`.
-        drop(unsafe { KBox::<T>::from_foreign(ptr) });
+        drop(unsafe { KBox::<T>::from_foreign(ptr.cast()) });
     }
 }
 
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index a4bc6016f037..f33c13c3ff97 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -253,7 +253,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         // SAFETY: This is a Rust Miscdevice, so we call `into_foreign` in `open` and
         // `from_foreign` in `release`, and `fops_mmap` is guaranteed to be called between those
         // two operations.
-        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private.cast()) };
         // SAFETY: The caller provides a vma that is undergoing initial VMA setup.
         let area = unsafe { VmaNew::from_raw(vma) };
         // SAFETY:



