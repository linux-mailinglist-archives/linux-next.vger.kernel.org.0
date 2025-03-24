Return-Path: <linux-next+bounces-5981-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EA7A6E18D
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB0DE1887D34
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E972673A8;
	Mon, 24 Mar 2025 17:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KixwhbXM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7E8264A99;
	Mon, 24 Mar 2025 17:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742838078; cv=none; b=ip0/4HhpR5rcY8i6FZdO+lIS9ksatd4S7Kyf3J4IrrSdjTzOihFdDP7JTp1/cMxk97DbTXCqglR8vR8RSc2ExIIgMdDvAzs6PDHovxiw/G4Vn2vrqzDVCbPZZmcdDRcHXb2r6V3bcwhf8CFWQOP9Vt2M6du9W3Ka+RvvXvdczuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742838078; c=relaxed/simple;
	bh=HzBXGrZLSDgaec8pChiUkj0L8bGBR9B8luoy1xzPxD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SAL6pJGkhhXpn90+QuhR9wjVDnOQGEFwGgXhBDv7i6jYKr/FSad/9bt6qS8+DVOHCZNLLdhVFEujSY5b8+CFQ1jI57PcXACQ+HjAz/p0kINlX6SfraQOa1KmhA0QZiTIvHwJKFh18dt6VJQCfTiUhooFG8xhWHHFwG7lcP3RPmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KixwhbXM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D2DC4CEDD;
	Mon, 24 Mar 2025 17:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742838076;
	bh=HzBXGrZLSDgaec8pChiUkj0L8bGBR9B8luoy1xzPxD0=;
	h=From:To:Cc:Subject:Date:From;
	b=KixwhbXMABcBmbtGZv9AN2vWZx4JzAP3Xh7EQ0/7RtwEuuw31tBrH3aiYUJoruQ5q
	 RTlqSXjcb1bao+OUw3PTg8f5UIshnXZDNHCJnKAX1slTx541T4dmcHUID+yyI0+u6d
	 M7Me8r/bM0jEbVhMASBxNSr6F52m54c6y+Rf1R3ecMhf2Bbg4LBTGH3LIiew9T0n1x
	 c0pnhK94iTLygux+UgjZifuCPKAv83gIH8kTwwkTg7Zzd3ePHfSSt8fFL0DZz1AOhD
	 pocElBDbvsvg7qFFQQxq1hNOwb8XixEI6zqjpIj29Bb6eyH00zLNVDy16ZkukARotm
	 QpcqNics0p0eQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH] rust: dma: add `Send` implementation for `CoherentAllocation`
Date: Mon, 24 Mar 2025 18:40:48 +0100
Message-ID: <20250324174048.1075597-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Danilo Krummrich <dakr@kernel.org>

Stephen found a future build failure in linux-next [1]:

    error[E0277]: `*mut MyStruct` cannot be sent between threads safely
      --> samples/rust/rust_dma.rs:47:22
       |
    47 | impl pci::Driver for DmaSampleDriver {
       |                      ^^^^^^^^^^^^^^^ `*mut MyStruct` cannot be sent between threads safely

It is caused by the interaction between commit 935e1d90bf6f ("rust: pci:
require Send for Driver trait implementers") from the driver-core tree,
which fixes a missing concurrency requirement, and commit 9901addae63b
("samples: rust: add Rust dma test sample driver") which adds a sample
that does not satisfy that requirement.

Add a `Send` implementation to `CoherentAllocation`, which allows the
sample (and other future users) to satisfy it.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250324215702.1515ba92@canb.auug.org.au/
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/dma.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 9d00f9c49f47..18de693c4924 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -301,6 +301,10 @@ fn drop(&mut self) {
     }
 }
 
+// SAFETY: It is safe to send a `CoherentAllocation` to another thread if `T`
+// can be send to another thread.
+unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
+
 /// Reads a field of an item from an allocated region of structs.
 ///
 /// # Examples
-- 
2.49.0


