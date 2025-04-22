Return-Path: <linux-next+bounces-6333-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D602A973F2
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 19:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B660179DA7
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 17:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE31C20E6F9;
	Tue, 22 Apr 2025 17:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="N4LoknXG"
X-Original-To: linux-next@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D3214C5B0;
	Tue, 22 Apr 2025 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344272; cv=none; b=r4kishyyIuartXZhJAgX0F8sSGAE5X6Dsk2tzVFyHmyJ8LSdQFFXvXoRMfHkdYolSH9wHmiaYeBkKvedzJYq+WROTER4+8azZI7WQRDZo/7whSRKbEhFitrOsaMeXKoiRc34g37xXQFpg8J2DJvl71SbfK6zCzygZ6746t70McU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344272; c=relaxed/simple;
	bh=OPgTo+VkFCWQTcvdQpiN+9sAAvjBxnv4cRR+/D6jy1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnvjtuPB25PcPikIoSAIxEainppYG1hf1DK/h+IuodZ4teTpk+RyIYFuHIpdXWugt10+IGNpksiVzFXCLVSySsvx0ladDReEtlO+ESdFU9++5v2efGoMkQswcuGkwMQRMAWqXAoUAB6NYf1zGJhVPdAnewZpS7oFhMcLHGvaPSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=N4LoknXG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745344258;
	bh=OPgTo+VkFCWQTcvdQpiN+9sAAvjBxnv4cRR+/D6jy1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4LoknXGwvlUfmFwnqOUvUx/ug+SJ0yfmBXkHJ5YuzIr8XFRNUPj08z641UmXSuFB
	 nMam/jKhq47lKTFnfijlZs/8pma9s0Ci/nCTl4v1CoajbLeBUR8cuYau4Ca7s9O8yX
	 Vc9ZUwDANxsd2TSArJvnB9kMSJn52vBrdh6Z4vcI=
Date: Tue, 22 Apr 2025 19:50:58 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of Linus' tree
Message-ID: <54c5930c-4006-4af9-8870-5d887bae7ac1@t-8ch.de>
References: <20250422204718.0b4e3f81@canb.auug.org.au>
 <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>

On 2025-04-22 08:59:00-0700, Linus Torvalds wrote:
> On Tue, 22 Apr 2025 at 03:47, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > These builds were done with a gcc 11.1.0 cross compiler.
> 
> That sounds like there might be some issue with the cross-compiler
> logic somewhere, because the Makefile logic is using the standard
> 
>     KBUILD_CFLAGS += $(call cc-option, xyzzy)
> 
> pattern.  We literally have seven other occurrences of that same logic
> just in that same Makefile above it (and many more in other
> makefiles).

I think -Wno-foo is special here. By default GCC does not emit
a warning if it does not recognize a disabled warning.
This breaks the logic inside $(cc-option).
-Wfoo in contrast does emit a warning.

The original report said:
"cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics"

Note the "earlier diagnostics" wording. And indeed the real reported
issue is "warning: #warning syscall clone3 not implemented [-Wcpp]"

To disable warnings there is a dedicated macro.

$(call cc-disable-warning, unterminated-string-initialization)


Thomas

> IOW, it's *supposed* to only actually use the flag if the compiler
> supports it, so having the compiler then say "I don't recognize that
> option" is kind of odd. We've explicitly tested that the compiler
> supports it.
> 
> Does the warning happen for all files that get built, or just some
> specific ones? I wonder if we have some issue where we end up using
> two different compilers (I'd assume native and cross-built), and we
> use KBUILD_CFLAGS for the wrong compiler (or we use cc-option with the
> wrong compiler, but I'd expect that to affect *everything* - that
> 'cc-option' thing is not some kind of unusual pattern).
> 
> It may be that the other options we check for have been around for so
> long that they just don't show the issue (ie the 'cc-option' for the
> other cases may also be using the wrong compiler, but then it's hidden
> by the fact that both compiler versions just happen to support all the
> other options anyway).

