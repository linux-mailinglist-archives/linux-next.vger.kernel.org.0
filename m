Return-Path: <linux-next+bounces-4746-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1C9C48CD
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 23:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ACFC1F22A1A
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 22:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1E41BC9F9;
	Mon, 11 Nov 2024 22:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQjDgDO2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560471BC9E2;
	Mon, 11 Nov 2024 22:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731362897; cv=none; b=LrI9bKfN6iNIUbOsynp+h6MoUCbsNehXP5WgmZGN0e0Yxy+CDH8jB7RtymQZ63fOwz7HBZsvChv/soaWVxKToBEU2VdIJRUlggA4PQkjWf70O/KIAKW14Q2dTFKKKHkrIkV9GHeKTltYt7eJa4Ibcgu2CvXR149upD3QcLpfZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731362897; c=relaxed/simple;
	bh=IzWYI+IYnI0IBX47UP23OrbRespa5zMschuKkcxwO5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJe2KwsRkjR1QkPwi3vwXEGG7KGYCvDmKigFbkRybx3SloqWXiaE0QO2R+UANooTb+sxn5eSU/LQsXdSwEIsWx7kLhcddgRXnS7HH1jk3k4HHpTKyKwtPfTUWG3H2DJXfOHeEPFqw35WmGYti3JsTdLPIUuQCdjYOpTl64LZK34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQjDgDO2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF06C4CECF;
	Mon, 11 Nov 2024 22:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731362896;
	bh=IzWYI+IYnI0IBX47UP23OrbRespa5zMschuKkcxwO5I=;
	h=From:To:Cc:Subject:Date:From;
	b=CQjDgDO2C4+qsKgBOb8WwvjFr8dHIJbWfbrAu9L4E7lGDD+PM0g0UOUGHo25WeCvG
	 HssWPsQlpiGQXwaLWSmulQFZAbymdL0Hx1qzkmQd8mMx04EYx/SimX0yhiJZl+2zpz
	 cYjoDUc48tBa9tK+LA7lfYwaRVDulRQsLCy1GQR7H/oqVUbaBhUz2btdvtX7W55HKa
	 d0SDkuY9xSJEyZkPYjOGEmvOnwH78VzQAhlntllsrxh7Xi3Am/ihrqmzHqeh0YhB1r
	 PaYm24Liumj/U9gVV3Kjv/kqBQOT3t4eNE/ciIZ/mm0Etk31HHG97x/C8HeXniPFn4
	 jACpLlZcGTW9g==
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
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	"Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: [PATCH v2] samples: rust: fix `rust_print` build making it a combined module
Date: Mon, 11 Nov 2024 23:08:05 +0100
Message-ID: <20241111220805.708889-1-ojeda@kernel.org>
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
v2:
  - Instead of renaming the module name, rename the main source file.
    This avoids changing other places (e.g. Kconfig) and, most
    importantly, minimizes the impact to developers/users (e.g. CIs
    out there).

v1: https://lore.kernel.org/rust-for-linux/20241109165520.1461400-1-ojeda@kernel.org/

 samples/rust/Makefile                              | 4 +++-
 samples/rust/{rust_print.rs => rust_print_main.rs} | 0
 2 files changed, 3 insertions(+), 1 deletion(-)
 rename samples/rust/{rust_print.rs => rust_print_main.rs} (100%)

diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index f29280ec4820..c1a5c1655395 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,6 +2,8 @@
 ccflags-y += -I$(src)				# needed for trace events

 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
-obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o rust_print_events.o
+obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+
+rust_print-y := rust_print_main.o rust_print_events.o

 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/rust_print.rs b/samples/rust/rust_print_main.rs
similarity index 100%
rename from samples/rust/rust_print.rs
rename to samples/rust/rust_print_main.rs

base-commit: 91d39024e1b02914cc5e2dbc137908e29b269ce4
--
2.47.0

