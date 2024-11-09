Return-Path: <linux-next+bounces-4720-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F2E9C2E97
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 17:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9DBBB21956
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 16:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4342B19CC1F;
	Sat,  9 Nov 2024 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnXRXcnT"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48613AD26;
	Sat,  9 Nov 2024 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731171333; cv=none; b=aHi8znXGjwprSVsmpPzkbIjrM/lQ4UC9e3McrT6XzW4tCpxuUuSvgKLFYjPriExjx9F5azmh7ILQUmpHRv0NSbt9wKKGr0DYFxs65nWWlxYrHBUbXrimZB2f2ud/Cl2G+QAEee1riqYxJUA/Diu5fya0JqdkVwcmiTc63SWRNUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731171333; c=relaxed/simple;
	bh=GJ6OMCNdBUV+NNO8nN3bK8dKyElJu2aj9aL34bm5n5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISEgkV5Q5WWM+7+TVm8STVJxkTeweNU873DWA3qZ4qcEv33QEVWzKAndm3EI3mCZtTE/JxzQGJGSyeKfqpTuaMX1SkxA0WmqXAmdZTnytWKO6sql4RgqOBeX06QeoLvOFiBcWy7qrmcBKJ/0yB3klvnkDyw6EqasB7pULOdlSVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnXRXcnT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA70C4CECE;
	Sat,  9 Nov 2024 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731171332;
	bh=GJ6OMCNdBUV+NNO8nN3bK8dKyElJu2aj9aL34bm5n5Q=;
	h=From:To:Cc:Subject:Date:From;
	b=XnXRXcnT0HT8LGGtWLEqGxacbrdkqj6/FodCWnCn8c2gdMX55kLKYdw63fUXPFqpC
	 CuVg2VUnkp/ehniV9g7Tul8EzJL6W4GuwPPGqeNNWJkcEtHV8j5UEJBveH1iN79a6N
	 O1gcjJ59NAYPfFhHLGUdfkgYAXuehlssL48j3Nu3iheQJUjvNDJha7nq2SSd1iNEtM
	 Wr05cM70nH227a/KWCYtr0GDwRv4NeUrQBK4FGKZXxoXQKIRVy1SQpPwZFk+RXDiqc
	 bV8oDEapr1diWFzwpFMP3ptowke8n3Uwsx8TKIFmRb2TL28ri6DolGHZ7RSCjyPAFL
	 sjzrnOK9t/Oag==
From: Miguel Ojeda <ojeda@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	patches@lists.linux.dev,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH RESEND] samples: rust: fix `rust_print` build making it a combined module
Date: Sat,  9 Nov 2024 17:55:20 +0100
Message-ID: <20241109165520.1461400-1-ojeda@kernel.org>
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

