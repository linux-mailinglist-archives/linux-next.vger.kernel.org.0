Return-Path: <linux-next+bounces-4715-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E87E9C273E
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 22:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 404841F21994
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 21:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741311E0E0C;
	Fri,  8 Nov 2024 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHrwgeWg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB151F26D7;
	Fri,  8 Nov 2024 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731102699; cv=none; b=ajcC/0fAD1u7bux1h2HOPhLm7kSMNt8dsmyv3NEfeDTGdouymbRu1Kzx00DHeaNvajlI2H/FLeBPpb9r5O0c3Kt3Vq6RhUtU5tdRDEXEKFTcb3kF8dU3mIkTfU58gStOLJOAfGqnqMLHc4Bppbvr8vbjzKzAASKCrF6lrGlbruw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731102699; c=relaxed/simple;
	bh=GJ6OMCNdBUV+NNO8nN3bK8dKyElJu2aj9aL34bm5n5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WjVlfA0J6OnM9zvfkpVFXu+6UPDtZ+YVtnpA/0Aj3Ic8HatggPvVu7dph/CqrKBjIjOR+HNBiPH72McmXTnINt7QeoI6VgEkHg0BFdkTGXQybXRVYLdF9Jep/EL9alnNNKYuCKKRBETqwyHaqjR0uhbrj6kn109gWjUUsSzPSEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHrwgeWg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193FEC4CECD;
	Fri,  8 Nov 2024 21:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731102698;
	bh=GJ6OMCNdBUV+NNO8nN3bK8dKyElJu2aj9aL34bm5n5Q=;
	h=From:To:Cc:Subject:Date:From;
	b=DHrwgeWgDpX2VcmIQMIr0DSQqaqobfi7UnlJoB6xCHZuZcFNAqxIaNWaKP/M4c7K3
	 xxwYYPoAe8wWYH5gSMFEQ8ywyJwzRDmlg8wZZ6ha8TEExavRagEgOaJboiZHL/gmPA
	 FRQyqMlD+QMw536uLoeQN+2i2WOHGy1BAES+PlkDMVJKhwIWm7drMLRPTvSkI3E+f0
	 nstt2riJuVImJ9REQCNZcEBQugeNyVVrohzByEtIg7imPhaT5Bsl/Jpr6Uir/o+lHd
	 PPhET1lVXvwiYO2KQYwXzqoxLJ59GASic+a8roni98dHYz3xW6n2av98LZJYOwfx2y
	 yaikL4QuRlpyg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] samples: rust: fix `rust_print` build making it a combined module
Date: Fri,  8 Nov 2024 22:51:15 +0100
Message-ID: <20241108215115.1398033-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `rust_print` module, when built as a module, fails to build with:

    ERROR: modpost: missing MODULE_LICENSE() in samples/rust/rust_print_events.o
    ERROR: modpost: "__tracepoint_rust_sample_loaded" [samples/rust/rust_print.ko] undefined!
    ERROR: modpost: "rust_do_trace_rust_sample_loaded" [samples/rust/rust_print.ko] undefined!

Fix it by building it as a combined one.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20241108152149.28459a72@canb.auug.org.au/
Fixes: 91d39024e1b0 ("rust: samples: add tracepoint to Rust sample")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Steven: please feel free to rebase the original if that is better for
you, but in case you prefer a formal patch on top, here it is. Thanks!

 samples/rust/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index f29280ec4820..17017115657d 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,6 +2,8 @@
 ccflags-y += -I$(src)				# needed for trace events

 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
-obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o rust_print_events.o
+obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust-print.o
+
+rust-print-y := rust_print.o rust_print_events.o

 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs

base-commit: 91d39024e1b02914cc5e2dbc137908e29b269ce4
--
2.47.0

