Return-Path: <linux-next+bounces-9050-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EED44C64BA4
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 15:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9BF3B4E9277
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 14:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE57D21A459;
	Mon, 17 Nov 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BbRaZq+W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F993321CF
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391069; cv=none; b=eIhHuAIPLKsKn5sFGXJGSQSd5gAdjkksz1dO4EDp+ESbhIjlLYBH2e0aSKFbUWFF2GW2v/OM25YiRrhuYREWuiOCQaX7WoEHyVK62/9CLJwVL6H2IOYiGYVhHu3uTLBhg9ZPMa5AoTrPNwXORyjbUn4r70wbCAWzihUDHcxxOvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391069; c=relaxed/simple;
	bh=psdMh6EYWnMir8ERiVlQihJgGNCGkvJH4pda4wNzRBM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PT5NAhiIEITiTPgH04Q0s5CVC7XCnEb0J5omKC/FrPnNi8MsNHlaalTaoQ+PQlFARfVCh56SuWNQtxx0ueta2U/gC9iIsa7woqMb76eHCQPCn624q0/ughTcFMNbhokfV91h2PO+OSBgJ3Zs8XXPCSivY23Gsxz2BrXzbzrnwKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BbRaZq+W; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4776b0ada3dso30030775e9.0
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 06:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763391066; x=1763995866; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3QXPYRW4wMrKGZ7lxw0MmBjzCUwcjGt2+lPgkibxbc=;
        b=BbRaZq+WVGqyYcVvr0mhMOYzlZX71E4ugzgsWNpyIYJ1iPCmwvLVFVlWByR3NR2cbD
         0Y5kg2s/fwJRve1wGTq/YfzRHOFEk0eA6kRpq+d4HSlih/kTZEwG/hrBeKMZZgeRmcU+
         Bwn+SYANuX3MmFKZ0SRbwM8Io2L3mJ+fFqL0fXIA8cAJOdk1Ruvt4SGEj0SxwqInmNTm
         WJPcqiCJLOZv/8gvBOVwm4FJOWC/wwsBaqN5N19nlDLbe7mTxPG/0SFIAa/k9stHqagp
         7O+CMil9ut3l/EG22h4WybsSDAea4uH9ZhrS8h91LtMgPXiezlypBi4JesQurdJvkuq6
         1SGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391066; x=1763995866;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3QXPYRW4wMrKGZ7lxw0MmBjzCUwcjGt2+lPgkibxbc=;
        b=ObHgfnQn236rWXXH3IPDYEM6j18xCA7TYqAHi3xk8ubwU2/EKuUXOMHVnLGtkoU+6U
         odKjnlVywzUAYTbPbdSzAGmKCUWmQriO7n989md1+QGA1GSSTxKDICar5/4J5r7XY6fX
         hgY8M38Bmdzly9GcZVPJvwzxSwYObNYbtckttuLX4HfnzGm7M0zEQcVFwHwF50KWalM5
         Ss/js/KUPM5DSRy8acidGNCyj4fepaXBl+Fo/Cn+jT+4shuACWX5KQHOJB3gimx4E3TR
         3lnlTuGys4rvfZmn5Chhh2Qcu1zBKPn2ttATVR7PtNrV0Mqs8y81Fbx2GAJlWjI1qu5x
         BSjA==
X-Forwarded-Encrypted: i=1; AJvYcCV8nkH/NxrxyAidmyc4q32/CW5WebDLhvKLtdxY/ow1xHdy298xAIqUsTMqSosSwvYp1iMkFSoHHv/E@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+GcXotgdfKG8iCnGXC8OJrF+ibiJXB4MRSpobk2Y/KVK1BYp1
	fP6wAxKRcVSngMg+1pQwXgX0wJ4xrK4k9uv1BjNGDIsyjkLNJaP/dD5tjY/4gPfTVkczvFNEh91
	VQlg4edWI8laQQjkVrA==
X-Google-Smtp-Source: AGHT+IEdLuB0X0tV1vpWmOFi6bpOFPiyXUcO3qmcqnsFh0MFWQw+xczzGEq/Zq8g03OHYcsaVV0GSH+sJFwNbyU=
X-Received: from wmcn18-n2.prod.google.com ([2002:a05:600c:c0d2:20b0:475:dca0:4de3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8d:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4778fdb38c9mr39270645e9.11.1763391066064;
 Mon, 17 Nov 2025 06:51:06 -0800 (PST)
Date: Mon, 17 Nov 2025 14:51:04 +0000
In-Reply-To: <20251117190417.44f20ddd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251117190417.44f20ddd@canb.auug.org.au>
Message-ID: <aRs2WATn4sdUePUb@google.com>
Subject: Re: linux-next: build failure after merge of the rust tree
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Tamir Duberstein <tamird@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 17, 2025 at 07:04:17PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rust tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> error[E0277]: `Chipset` doesn't implement `core::fmt::Display`
>    --> drivers/gpu/nova-core/gpu.rs:233:13
>     |
> 233 |             self.chipset,
>     |             ^^^^^^^^^^^^ `Chipset` cannot be formatted with the default formatter
>     |
>     = help: the trait `core::fmt::Display` is not implemented for `Chipset`
>     = note: in format strings you may be able to use `{:?}` (or {:#?} for pretty-print) instead
>     = note: this error originates in the macro `$crate::format_args` which comes from the expansion of the macro `write` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> error[E0277]: `Revision` doesn't implement `core::fmt::Display`
>    --> drivers/gpu/nova-core/gpu.rs:235:13
>     |
> 235 |             self.revision
>     |             ^^^^^^^^^^^^^ `Revision` cannot be formatted with the default formatter
>     |
>     = help: the trait `core::fmt::Display` is not implemented for `Revision`
>     = note: in format strings you may be able to use `{:?}` (or {:#?} for pretty-print) instead
>     = note: this error originates in the macro `$crate::format_args` which comes from the expansion of the macro `write` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> error[E0277]: the trait bound `MsgFunction: kernel::fmt::Display` is not satisfied
>    --> drivers/gpu/nova-core/gsp/cmdq.rs:532:9
>     |
> 532 | /         dev_dbg!(
> 533 | |             &self.dev,
> 534 | |             "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
>     | |                                               -- required by a bound introduced by this call
> 535 | |             self.seq,
> 536 | |             M::FUNCTION,
> 537 | |             dst.header.length(),
> 538 | |         );
>     | |_________^ the trait `kernel::fmt::Display` is not implemented for `MsgFunction`
>     |
>     = help: the following other types implement trait `kernel::fmt::Display`:
>               &T
>               Arc<T>
>               Arguments<'_>
>               BStr
>               Box<T, A>
>               CStr
>               Chipset
>               Class
>             and 22 others
>     = note: required for `kernel::fmt::Adapter<&MsgFunction>` to implement `core::fmt::Display`
> note: required by a bound in `core::fmt::rt::Argument::<'_>::new_display`
>    --> /usr/lib/rustlib/src/rust/library/core/src/fmt/rt.rs:113:27
>     |
> 113 |     pub fn new_display<T: Display>(x: &T) -> Argument<'_> {
>     |                           ^^^^^^^ required by this bound in `Argument::<'_>::new_display`
>     = note: this error originates in the macro `::core::format_args` which comes from the expansion of the macro `dev_dbg` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> error: aborting due to 3 previous errors
> 
> For more information about this error, try `rustc --explain E0277`.
> 
> Caused by commit
> 
>   c5cf01ba8dfe ("rust: support formatting of foreign types")
> 
> (I think) interacting with commits
> 
>   38b7cc448a5b ("gpu: nova-core: implement Display for Spec")
>   75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
> 
> from the drm-rust tree.

I applied a patch to drm-rust-next that makes this error go away.

Alice

