Return-Path: <linux-next+bounces-4397-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B09AD836
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 01:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86ACD1F222CA
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 23:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B471F9A98;
	Wed, 23 Oct 2024 23:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUO/GL2e"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226571990C4;
	Wed, 23 Oct 2024 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729724793; cv=none; b=q9NnNANoiWE3j6CmanmTntRJDxQZGAsQbA9lTksm7HBEcWHPSAKDwux2qj2EXtaPqh+eeoiRb3X342fBuHtBROYJuaqMFqpPRIsBcCqmz+IAychHuLcJXCFoQNWvDNMnkiW3SRZrz2vfoa87cYahXoh0Kgb/kmCjf83HAeng9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729724793; c=relaxed/simple;
	bh=2l/ds5Bmv+D3lyjFYDV6EA8hVsC1rWEx9qxy5boJYJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pM+AMHkZgQkjDqEPYOidGEMfQor7t2T1N3rOxfrvYYVIh6vIZOIi4omZ6OCUtIGkiisSZDM1tvcPiW3eLJVd0O0BdivQ+ZaNCN2Rypxw27CzPm8bENXa93sLCR+3WZqzwb8EKMufgNlFHpwze8YKQxO2t00b3iIByf+9Dzzm7o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUO/GL2e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B63C4CEC6;
	Wed, 23 Oct 2024 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729724792;
	bh=2l/ds5Bmv+D3lyjFYDV6EA8hVsC1rWEx9qxy5boJYJ8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=bUO/GL2eNM8X2YFhLJl524BJI/JdNhpsPkro5mYw/RyScggmmi6dftssLOQNlTCWP
	 o/KUWLVGN7P6SBfot0frYdqkyH84+e0yjST08EZrTT3KSvxqJW+g0btkWpwkgL532Y
	 i93c46AksfkLNssyLf9AtqmsHzNbWOUZR/pRWTmNwhO58OCH3gIg+cZSsbfbZHL4/1
	 B+lhbUr3pLFzgOYRJVQJZsGicE7X/Fib5XxY0dU1u1DokRZDG4zC0SLMOd1vaI6Y+m
	 rSiGd/5vFTRV2DnnGz5sxGnVETyD+dwtq3Sh8u40Eh7k9oL7M6OiZqH9MyJgw1jDIy
	 lArIVHnY9DX/A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 46261CE10F5; Wed, 23 Oct 2024 16:06:32 -0700 (PDT)
Date: Wed, 23 Oct 2024 16:06:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Nathan Chancellor <nathan@kernel.org>, kobak@nvidia.com,
	mochs@nvidia.com, rui.zhang@intel.com, rafael.j.wysocki@intel.com,
	sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [BUG] Argument-alignment build error with clang
Message-ID: <2fc36fd9-6c7a-492a-b5f8-65cfd52aadf2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <38508cf1-7d44-4656-8060-973e820b2957@paulmck-laptop>
 <CAMj1kXFA2_LNpZcrGh0GJyE0_9BaRC_ypnP3eigVG=Vf4B+gqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFA2_LNpZcrGh0GJyE0_9BaRC_ypnP3eigVG=Vf4B+gqg@mail.gmail.com>

On Thu, Oct 24, 2024 at 12:37:50AM +0200, Ard Biesheuvel wrote:
> (cc Dan, Nathan)
> 
> On Thu, 24 Oct 2024 at 00:26, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > Hello!
> >
> > Running rcutorture on next-20241023 got me lots of these:
> >
> > drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned argument to 4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
> >           156 |                         (void *)efi_pa_va_lookup(&th->guid, handler_info->handler_address);
> >
> > This is built with CC=clang.  I don't see this diagnostic with GCC.
> > But we are supposed to be able to build with clang, so...
> >
> > The first argument is the address of one of these:
> >
> > typedef struct {
> >         __u8 b[UUID_SIZE];
> > } guid_t;
> >
> > Where UUID_SIZE is as follows:
> >
> > #define UUID_SIZE 16
> >
> > But this guid_t is a member of one of these:
> >
> > struct prm_handler_info {
> >         guid_t guid;
> >         efi_status_t (__efiapi *handler_addr)(u64, void *);
> >         u64 static_data_buffer_addr;
> >         u64 acpi_param_buffer_addr;
> >
> >         struct list_head handler_list;
> > };
> >
> > One can argue that this structure must be 16-bit aligned on a
> > 64-bit build.  So maybe this is a bug in clang's diagnostics, hence
> > linux-toolchains on CC.
> >
> > Thoughts?
> >
> 
> Also discussed here:
> https://lore.kernel.org/all/CAMj1kXFXimHaGdeDBH3fOzuBiVcATA+JNpGqDs+m5h=8M_g+yA@mail.gmail.com/T/#u
> 
> I agree that this looks like a spurious warning. Even if the alignment
> of the type is only 1 byte, the fact that it appears at the start of a
> 8-byte aligned non-packed struct guarantees sufficient alignment for
> this particular use of the type.

Thank you!  I tried your s/guid_t/efi_guid_t/ change, and it works
fine here (see below in case I messed it up and got lucky).  So:

Tested-by: Paul E. McKenney <paulmck@kernel.org>

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/drivers/acpi/prmt.c b/drivers/acpi/prmt.c
index d59307a76ca31..747f83f7114d2 100644
--- a/drivers/acpi/prmt.c
+++ b/drivers/acpi/prmt.c
@@ -52,7 +52,7 @@ struct prm_context_buffer {
 static LIST_HEAD(prm_module_list);
 
 struct prm_handler_info {
-	guid_t guid;
+	efi_guid_t guid;
 	efi_status_t (__efiapi *handler_addr)(u64, void *);
 	u64 static_data_buffer_addr;
 	u64 acpi_param_buffer_addr;

