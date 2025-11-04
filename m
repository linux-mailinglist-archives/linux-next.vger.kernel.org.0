Return-Path: <linux-next+bounces-8816-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787A0C3071D
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 11:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1959188C0AE
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 10:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8429929B796;
	Tue,  4 Nov 2025 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLndK42C"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA134D3B2;
	Tue,  4 Nov 2025 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251334; cv=none; b=mWyseJtHWaFa+iuxz5cD1+tw+6TKcXsRcGeyqXGWKS3UUTs9go82Zmt9eO2ATdbAV9VlOvAAo/X91G+CIyPSCX2aO91ugYwXE0pRkkysWdQy7ujKeDJ7Iudp/vo7Hvs4JcYgrQBsZZQ6KQMu4ZAJme8yBP05rVbEQIPZAdaloU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251334; c=relaxed/simple;
	bh=BRj8esTTDryhQeeEzSsbv7Pz8jeCQ845F+Owhbq2SYQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=enNKPTSg03u48YKC77+A4hNQm+P2iASxeFivyBol8ca95xnjqa9HvnB3GMBcLfUSzFHk9pmb9s3a8r0lYcpV9eIbbi6UUIkf0sa+ABx4ST3SbxkHJqlndGLWlKQyjOCN5FpbHe6tlf9Pif5cShtO6Viw5q2XtKpt8nO4sQRBDEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLndK42C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12583C4CEF7;
	Tue,  4 Nov 2025 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762251334;
	bh=BRj8esTTDryhQeeEzSsbv7Pz8jeCQ845F+Owhbq2SYQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SLndK42CLJ8T1Mr54f3uVDUBEvBVUaXG7Tqg2x0E8xyk22Y8oNx25p5LEM5QqeDUy
	 XbxSGZadCMMaXQobMLy5XwuA+l7P414RCHgV78CbW5Mz4eYQaHfF56d9EMDYCe+GuB
	 zJrseGc9Ng8oUYO4P3HCScHoW91IEsfd4cHy1Fn7K9rpghDgXZLTrkAym0gJrg3eBV
	 PbHRISjCsy9uc0kYc0st4xo7ryPvIjouwubE6dvdLEoe6hc/VFTX1FaGjpdDTS4qBY
	 oUgjhLghyUkIt+JT1kzZ/S8cVtj4izwwLjuGHt8QFfi6F+IgEZHWjc8R/zmETc/M5y
	 9noJHkGjNEUBw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Luis Chamberlain
 <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel
 Gomez <da.gomez@samsung.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Daniel Gomez <da.gomez@kernel.org>,
 Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing
 List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
In-Reply-To: <20251104154500.5acb5340@canb.auug.org.au>
References: <mb_jUGmjgayTheAB5ZLGso-I856wAQhMkb6zPGnzUyAoUjhzm-QIzkGPLTe-sPI29ax91vO1D3aVy6J7rdTtgg==@protonmail.internalid>
 <20251104154500.5acb5340@canb.auug.org.au>
Date: Tue, 04 Nov 2025 11:15:21 +0100
Message-ID: <87jz0685om.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

"Stephen Rothwell" <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the modules tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> error[E0308]: mismatched types
>   --> rust/kernel/module_param.rs:75:47
>    |
> 75 |         let new_value = T::try_from_param_arg(arg)?;
>    |                         --------------------- ^^^ expected `&BStr`, found `&CStr`
>    |                         |
>    |                         arguments to this function are incorrect
>    |
>    = note: expected reference `&BStr`
>               found reference `&ffi::CStr`
> note: associated function defined here
>   --> rust/kernel/module_param.rs:32:8
>    |
> 32 |     fn try_from_param_arg(arg: &BStr) -> Result<Self>;
>    |        ^^^^^^^^^^^^^^^^^^
>
> error: aborting due to 1 previous error
>
> For more information about this error, try `rustc --explain E0308`.
>
> Caused by commit
>
>   0b08fc292842 ("rust: introduce module_param module")
>
> This is some interaction with something later in linux-next - presumably
> commit
>
>   3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")
>
> from the rust tree.
>
> Hopefully someone can provide a resolution for me tomorrow.
>
> I have used the modules tree from next-20251103 for today.

Please use the following resolution:

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index e7d5c930a467d..6a8a7a875643a 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -70,6 +70,7 @@ pub trait ModuleParam: Sized + Copy {
     // SAFETY: By function safety requirement, val is non-null, null-terminated
     // and valid for reads for the duration of this function.
     let arg = unsafe { CStr::from_char_ptr(val) };
+    let arg: &BStr = arg.as_ref();
 
     crate::error::from_result(|| {
         let new_value = T::try_from_param_arg(arg)?;
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index d62e9c1e2a898..decb0849f3d33 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -133,10 +133,10 @@ fn emit_params(&mut self, info: &ModuleInfo) {
                         ::kernel::module_param::KernelParam::new(
                             ::kernel::bindings::kernel_param {{
                                 name: if ::core::cfg!(MODULE) {{
-                                    ::kernel::c_str!(\"{param_name}\").as_bytes_with_nul()
+                                    ::kernel::c_str!(\"{param_name}\").to_bytes_with_nul()
                                 }} else {{
                                     ::kernel::c_str!(\"{module_name}.{param_name}\")
-                                        .as_bytes_with_nul()
+                                        .to_bytes_with_nul()
                                 }}.as_ptr(),
                                 // SAFETY: `__this_module` is constructed by the kernel at load
                                 // time and will not be freed until the module is unloaded.



Best regards,
Andreas Hindborg



