Return-Path: <linux-next+bounces-7626-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6DFB09E45
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 232B81C20B37
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 08:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E2B21CC4E;
	Fri, 18 Jul 2025 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ax7dGiDj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE0D21B9F1;
	Fri, 18 Jul 2025 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828352; cv=none; b=nKW0nUcEznJ20AVK2wHIHhCm78FgAPmFjfklO6qj8SPZpdHZmc9+YcNBZAZYd0acGWcfqs4OQ3hZ32GAmD8pt8obR2AHdkaR061f4J1k0WANoeIL/dIOW0GLgqYMnYeWmg7Djvb8rRro4BUVsaT3Lqw6zcUCcbOZLjuE7uNvobk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828352; c=relaxed/simple;
	bh=xxoKlqY7tpdbQYl1k1rMlb6plPhcFbQU8qEgcZttzs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPOnO8zxmeJf+sP/5DVaHHBio0sP5hDKWy6C6XwgdAqtRdEljS/Dkw7lSJ2n9t/i5La2ADlvw7GkDZXxHi1qgNG+60qXKNJyjWdIRr4wCkz7S85nfne/zBSyGv+m6oZQ6GTe+d4ua7Z3HCi1csNmKRzGT2ksGR94ZfE9Ew+a/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ax7dGiDj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A99AC4CEF0;
	Fri, 18 Jul 2025 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752828352;
	bh=xxoKlqY7tpdbQYl1k1rMlb6plPhcFbQU8qEgcZttzs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ax7dGiDjKS5HW9aNTnNXer1BNadRAFGX6pOR1cnRHD/A4L5jKRPEss5Vnj/4bdhyZ
	 XhDfENNt5GXwqxU7zbuV73NFm0Mn7/zceHGNiL8Ef7Mw9smbOW+HVp3MJeKBbcyDDn
	 ne/FPQli3qVA8Okx30aHdkanstJcoZ98Lh2H1NleBZU7VITbnPnssv+dSnYUhJf1WB
	 Wua+viDXoKP6UTkH5Z9GS+cLp1tkDyZAy1QqXQQye8f7FtHBA6p1S1VUyFNBeMesSn
	 u34UpEV1aJe2/5hjDoS140vFP+v+nqJtzVJ6FdOLtdP/leSI+Bd+jSJy9/awgAuN9X
	 xLnNhDG8XCJEQ==
Date: Fri, 18 Jul 2025 10:45:47 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the xfs tree
Message-ID: <biqcjscrlgfmznvysigpkqqyr3xvy7dbtmdwwxf4bkirbri5l5@rgkuif4novc6>
References: <jZld0KWAlgFM0KGNf6_lm-4ZXRf4uFdfuPXGopJi8jUD3StPMObAqCIaJUvNZvyoyxrWEJus6A_a0yxRt7X0Eg==@protonmail.internalid>
 <20250718100836.06da20b3@canb.auug.org.au>
 <hmc6flnzhy3fvryk5c4bjgo7qehhnfpecm2w6wfyz7q7wly3a4@nvo6ow5j3ffl>
 <lIRl0Kr0swAUaCb-rM9B3N7ey2F4OYOGLhUTy5UcChhvBMVYona6pjJ0VbWLdzwNImVQPYgYDvYLqWEawwOXGg==@protonmail.internalid>
 <aHoGzku_ey2ClrzD@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHoGzku_ey2ClrzD@infradead.org>

On Fri, Jul 18, 2025 at 01:33:18AM -0700, Christoph Hellwig wrote:
> On Fri, Jul 18, 2025 at 10:30:56AM +0200, Carlos Maiolino wrote:
> > Thanks for the heads up Stephen. I didn't catch those errors while build
> > testing here. Could you please share with me the build options you usually
> > use so I can tweak my system to catch those errors before pushing them to
> > linux-next?
> 
> You'll need CONFIG_MEMORY_FAILURE and CONFIG_FS_DAX to trigger this.
> All my test setups seem to lack the former.
> 

Heh, same. I'll default my build tests to use allmodconfig.

Thanks hch.

