Return-Path: <linux-next+bounces-8432-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7D5B91192
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 14:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 889557AAFE5
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 12:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64612FC024;
	Mon, 22 Sep 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kTqeHugz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FA14A1E;
	Mon, 22 Sep 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758543626; cv=none; b=rd7Pz7GVrGgt20nn7THMVxbRHYemLKvFDETEuO9yGXRcPMPoaROsUlNMfCsMIboKJh26smRz/8GGc44buZJBxhQHBSamuz+2C+XYCUTqwt1bLyTqfQ5xozpmFlkK0BxgFWH0INWPMWMjSm2k6J2f6oSNI7voDVsY1jLC07nSgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758543626; c=relaxed/simple;
	bh=Ht4SpjduhYWDMQgeyqgqPargYxCQjSBfYkdB0lip+5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2/MssW5Ol2JuYn/Q+pysGkmJPBCvBIHpDlmPT2yubTzvLuO+7lpHwZTmnQ/fvPo0KiU4NvFa/5hTIn2NRNmpp+Iya1c1NaJdL9HaKr+Bf6S6eRRI2mm+YFtIJ+lTeRUjLgtDIVE5LVwTfV/LwEntzB2ccnIOig0LX7xqW3qGqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kTqeHugz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4BCC4CEF0;
	Mon, 22 Sep 2025 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758543625;
	bh=Ht4SpjduhYWDMQgeyqgqPargYxCQjSBfYkdB0lip+5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTqeHugzEz6aSJZiWyG+NuYcXSH0k2GlfKogMWP+/XZUz3tpB1xq0KlPFyCFFU2yL
	 vMuZ0z+rqPOEwxMhliXXG0Myl0Rq1ZHcg9TbmO2sWlo27PPM0kYjzi+YY/Q67WtuEv
	 C+fhBaG0X/ZJv56vgisuzLBJ4u34kCgQwTd5uhyc=
Date: Mon, 22 Sep 2025 14:20:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun.feng@gmail.com>, Burak Emir <bqe@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: Re: linux-next: manual merge of the bitmap tree with the char-misc,
 drm trees
Message-ID: <2025092212-baggie-paragraph-ba42@gregkh>
References: <aNEhcEFTsdPXmtVi@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNEhcEFTsdPXmtVi@finisterre.sirena.org.uk>

On Mon, Sep 22, 2025 at 12:14:08PM +0200, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the bitmap tree got a conflict in:
> 
>   rust/helpers/helpers.c
> 
> between commits:
> 
>   eafedbc7c050c ("rust_binder: add Rust Binder driver")
>   d9ea5a41cef80 ("rust: sync: Add memory barriers")
> 
> from the char-misc, drm trees and commits:
> 
>   78d9de4ca3474 ("rust: add bindings for bitmap.h")
>   ae384a4623fc3 ("rust: add bindings for bitops.h")
> 
> from the bitmap tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc rust/helpers/helpers.c
> index 3d7d0b40c9f13,abff1ef14d813..0000000000000
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@@ -7,10 -7,9 +7,12 @@@
>    * Sorted alphabetically.
>    */
>   
>  +#include "atomic.c"
>   #include "auxiliary.c"
>  +#include "barrier.c"
>  +#include "binder.c"
> + #include "bitmap.c"
> + #include "bitops.c"
>   #include "blk.c"
>   #include "bug.c"
>   #include "build_assert.c"

Looks correct to me, thanks

greg k-h

