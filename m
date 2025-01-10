Return-Path: <linux-next+bounces-5142-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1C5A08DA6
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 11:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6033A150C
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 10:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B05A20ADF1;
	Fri, 10 Jan 2025 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rlh+ymfD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE120ADD2
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504110; cv=none; b=VTnTCDweUpjXWDSsbQAEvDwqXWWNOd1zjQn2HcAAi3Xxuis+eDaYr/m/pyhcbnCjHvr114qm82RyNO6hPIl5io2y5reKW8QX1qBYQcr1ztDqdI39DHssll59h5IjMzDVmx/mZABPA+kcaZbl/Rl0A1bBCM5pK/AmHhKS+9Qj7Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504110; c=relaxed/simple;
	bh=v2uGGWnwNVbh6HvC+v1A4yGHkPeq/u+ecQcTELLSMbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SHltThglGnPc+xrr0LnWn2sAcvoJgLu4BkinWGm9UKw5uKrtcn8jvJvYdJYPRhpYgnCZSrk6Zq7ZwlHLsRIOrpDyKFTp+8y8KpkYUE7qOnDXE+3Uev+/7LmSpM3NoTp8hvVODkQ25PH0UxGaxVNqMfUYlKU/zX2L8PuN7CDzhAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rlh+ymfD; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38a873178f2so901130f8f.1
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736504106; x=1737108906; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKXXcjVsySmSwBZFNOXpVSu7xpFSDtgmuCXnoEAJWNU=;
        b=rlh+ymfDYS9MNBAftDyX3/0+qegXVonw1FVsBm95s0ATyD/64HUTjl5M8TYaXguj3k
         t/3Ulilmflz6+4IDFrDYJ9HLPvTbe+IITetkCMB0heroo6s0qOyVo3Om3a5dtvnrfSBc
         HCs/kBpRhkHLQZU/YHbEc1lhI2Az9GTueVsm+MM2+ahQLyetn1WH9D28qDme++n6kNUv
         /9hOi1NnHfYeVzBJaBXT2F+7apXgp2+IZR+lcscpcDu6VndB4u6bCtQeG3//kdG/OmK+
         UPQRXBJm/b4wmosj2nRuJRnWNfKzKdHosYl753l7unHzbTGgUMehjuKA0C7tUsflLFcs
         1q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504106; x=1737108906;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKXXcjVsySmSwBZFNOXpVSu7xpFSDtgmuCXnoEAJWNU=;
        b=bgqs68MX2ivZB120bvTHhBdBMiL3hhhisHsthJLzzjlWfifNRs+y2X5GQ5G/rzN6sw
         z+Zd355TQo9GaQS+lNy8I8UVVNujuEQo0/rVtci9abPYNyVj7JGTg7Ha5HiunNPNxi/h
         pghlQ8vi+4x1bTkDjVNecGWfAQb2AgUBxHwSPhnvykLw+BmEKJNBvHM1zwT1FxT9t1HI
         A6yZV2mPAWW1bmgB9FLmzVoI0JBiuO/t+ZafWbfTXjLWj4ifFAnbKOxqwwtQYNqsuUqm
         vrbKthTh4oLuZoOfUc6YPVMYI+AM1kEkmy0ugPJX7ERLM/NqTWLC+FA33UNLvKHMLgoA
         TtAg==
X-Forwarded-Encrypted: i=1; AJvYcCXFuASp0L7/x0mMJ4R7KgxfG83RvewetuRfoN1fe9P6KCRBloEJ70GLWK6W2dp1OVAua/zS5CwE5/tk@vger.kernel.org
X-Gm-Message-State: AOJu0YzZB3chpewSO5ixWfGynirOovKAzK5sqNsYfyV4MoxV0TpJmbBI
	R7eCGq6hAN3pCOaqA1bshQwGBwOY+Rru/DtwMQ9Y6WH+igKeMd6/69WssyJbcdJFtWtNUzli39W
	eFSSa1m4g85NbpQ==
X-Google-Smtp-Source: AGHT+IF4AwwkYTddWWPSIhHIqUFGn+Yvv9xWznLdWDlvehJ72Ig1kT53h3Z5FpbvMJv85LfxUW1pGkbe7YoLf94=
X-Received: from wmqa22.prod.google.com ([2002:a05:600c:3496:b0:434:9da4:2fa5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e6:0:b0:385:f56c:d90a with SMTP id ffacd0b85a97d-38a87357c05mr8500962f8f.55.1736504106489;
 Fri, 10 Jan 2025 02:15:06 -0800 (PST)
Date: Fri, 10 Jan 2025 10:14:59 +0000
In-Reply-To: <CAH5fLgjgEeGbd5NUhG1tEKKoj5+cKkuiq25BdeApjtx7SvnkEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAH5fLgjgEeGbd5NUhG1tEKKoj5+cKkuiq25BdeApjtx7SvnkEQ@mail.gmail.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=aliceryhl@google.com;
 h=from:subject; bh=v2uGGWnwNVbh6HvC+v1A4yGHkPeq/u+ecQcTELLSMbQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBngPLpuhImUTi/UR5pMIy4LZ+DKPDI/tsa5OMe7
 kg9Ao4U56KJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4Dy6QAKCRAEWL7uWMY5
 RnBqD/9XSpINBcImCwzmwokGHY0pVarFu2U5spXqQ7a5tfUXIG8n6YiQISDrk8mChmZ8x+gXCTh
 JUiIolN7mAQndWA1wRHlKIGpPI9hYBoI1CkcjtBwhiB5yvMQVoy+9ed4YEhPRVDX9CytchdrFlU
 ArRuIpD4QUGIc654KeKdtcfIFoV9gdbOlvM/xpvhsRUxKT33ni2Y/POpCJ9M83A4Mv//62MtX/t
 o1qSyG+kBXxQwXI7R5Fxx/DYKTEk9nc25ZA1rziE2wmJLrh6Z1kBadTh7r9lCAsjYkkF7CnfHhP
 vL1K7nyrfsZA052pVEII3wu8fa818hZQPVP9gdnUNBWz5PmA8WkXW3A+lCToPe/qRNm85rdYpDR
 E1OA3BCYb1HvprWpQ3FhrJHMH3Mf/2T1017Y1FID8xEhrcbTmQMauCJaLyjB3NkIpxM5DZhpRLM
 05WcWrwt6wyCMugybZQEdKnM7OodEOjKQuFtuH0YSAo/WjWh40PqzEqZbI1NQTJFziKDVX3/z6k
 Q9RXfgMRtJiKUfLHzsKILePyjSXdYMw15ZvX/L2FwyzCd9XosH4H4P55uadKzVuepaLjH5SxrZ9
 NeGtTxgWN+mJarEREiMUEMgSp9J+jr9GDNJNvsAcQMGcTh1+wFiZBGb1JJlLNN1nzx5hMtqBBBu 6exOVO0PWnJd22A==
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250110101459.536726-1-aliceryhl@google.com>
Subject: [PATCH] miscdevice: rust: use build_error! macro instead of function
From: Alice Ryhl <aliceryhl@google.com>
To: gregkh@linuxfoundation.org
Cc: aliceryhl@google.com, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, ojeda@kernel.org, sfr@canb.auug.org.au
Content-Type: text/plain; charset="UTF-8"

The function called build_error is an implementation detail of the macro
of the same name. Thus, update miscdevice to use the macro rather than
the function. See [1] for more information on this.

This use the macro with the kernel:: prefix as it has not yet been added
to the prelude.

Link: https://lore.kernel.org/all/20241123222849.350287-2-ojeda@kernel.org/ [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index ebc82e7dfc80..dfb363630c70 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -134,7 +134,7 @@ fn ioctl(
         _cmd: u32,
         _arg: usize,
     ) -> Result<isize> {
-        kernel::build_error(VTABLE_DEFAULT_ERROR)
+        kernel::build_error!(VTABLE_DEFAULT_ERROR)
     }
 
     /// Handler for ioctls.
@@ -151,7 +151,7 @@ fn compat_ioctl(
         _cmd: u32,
         _arg: usize,
     ) -> Result<isize> {
-        kernel::build_error(VTABLE_DEFAULT_ERROR)
+        kernel::build_error!(VTABLE_DEFAULT_ERROR)
     }
 
     /// Show info for this fd.
@@ -160,7 +160,7 @@ fn show_fdinfo(
         _m: &SeqFile,
         _file: &File,
     ) {
-        kernel::build_error(VTABLE_DEFAULT_ERROR)
+        kernel::build_error!(VTABLE_DEFAULT_ERROR)
     }
 }
 

base-commit: 7687c66c18c66d4ccd9949c6f641c0e7b5773483
-- 
2.47.1.613.gc27f4b7a9f-goog


