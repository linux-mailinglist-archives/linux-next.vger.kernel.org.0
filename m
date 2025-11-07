Return-Path: <linux-next+bounces-8895-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9ADC3F12C
	for <lists+linux-next@lfdr.de>; Fri, 07 Nov 2025 10:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3965B3AFBFC
	for <lists+linux-next@lfdr.de>; Fri,  7 Nov 2025 09:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44123164CB;
	Fri,  7 Nov 2025 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfwlKXuR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C662BE652;
	Fri,  7 Nov 2025 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762506352; cv=none; b=pt9a7Om29CMgmGgxk7uUgIzMBEQQhuCx052jWdNJCjf99u8iTq1ujgfvVPmm9Y+ypyTsIvLzkTnIQUHm6uK7hIkdZ7tfgWBKrBPk9hAV3pf5DSRrNwIoe15QCGorF2+Of1bv5vinAptIm/8d8PcRKHUhZlUTeXlE15UpS3nKMaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762506352; c=relaxed/simple;
	bh=N/665B8VlvETNquX78tPOPja9VU+e0PQDUnUu+PW928=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=UYrhaa+ThqBoZnQcS46rzS318Yd5ke4/8DEFzNhOco7OYlejm9ZpPvj2i9AW0KzHAve1oDUJzGhM/iGChQ1kMj+pPONzeUkPIQ04R6GeuxoxFxgbnabQv6IuwYHp08JinXEzqgAjMsc57OCGnAt0LUBC4wL+tX+1bM4X6QAdU50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfwlKXuR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7426BC116B1;
	Fri,  7 Nov 2025 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762506352;
	bh=N/665B8VlvETNquX78tPOPja9VU+e0PQDUnUu+PW928=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=QfwlKXuRsPdaJlkHyUsTrvfRqPPM/blsrDySd+SHwYcGYVzo46tHPSt4k/iJbl4jh
	 3RRHpdxjfE4sHHms+5e7d+pJOoS39Nk6seq8WrgOHa9mDsobMK6pz8GbFNevEUTl3J
	 P0ATXVuNZx3AhnbU2k11CqPRTO6p8IUBwXauCsN4xXZ04ibvBlgC8gWL3S03PpzYI2
	 jbPhftzBpTyK+5LGaoVh8T9DW4gkmaX09bqE9UGXkbBVrYpFUdZzv3WlgmmGgeyUGb
	 xT7wSc9HbYnATBBypFVOh6mmCxMC/PaasjzwCQuBsdRfvy2BnliobAu7GRo+xd1JHK
	 dwiVTYYre2AwQ==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 10:05:48 +0100
Message-Id: <DE2CCUSZV2AF.161T2XNFY72VI@kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Cc: "Greg KH" <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Peter Zijlstra" <peterz@infradead.org>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
References: <20251107134144.117905bd@canb.auug.org.au>
In-Reply-To: <20251107134144.117905bd@canb.auug.org.au>

On Fri Nov 7, 2025 at 3:41 AM CET, Stephen Rothwell wrote:
> Caused by commit
>
>   a9fca8a7b2c5 ("rust: debugfs: support blobs from smart pointers")
>
> (maybe interacting with some other change).

This is a conflict with commit da123f0ee40f ("rust: lock: guard: Add T: Unp=
in
bound to DerefMut") from the tip tree.

The following diff [1] should fix the problem; I will also add a patch in t=
he
driver-core tree for this, since this also works without the above commit.

diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index 6bd21ff0ed90..7266c39188ba 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -257,7 +257,7 @@ fn read_from_slice(
 }

 // Delegate for `Mutex<T>`: Support a `T` with an outer `Mutex`.
-impl<T: BinaryReaderMut> BinaryReader for Mutex<T> {
+impl<T: BinaryReaderMut + Unpin> BinaryReader for Mutex<T> {
     fn read_from_slice(
         &self,
         reader: &mut UserSliceReader,


