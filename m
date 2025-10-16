Return-Path: <linux-next+bounces-8605-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E835BE2590
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 11:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 49ECF4EA8E1
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 09:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29BF305053;
	Thu, 16 Oct 2025 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GI0EDuN9"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C5B325496;
	Thu, 16 Oct 2025 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760606612; cv=none; b=MNMER6JBZeY4Rfjyvvklkc503W8noiIgIoE0HibhMG7AzvpRhSOOEl0NUJTt1IhJDyj8vgsvUiHqADC5t4PxYl2OvR9FTDUGWweMSbPVct8ROTavqwX0VZ73QtXdaM57VeXp1hlNv5rFREoIGLNx3EU3wrsSalY8TEy09elpKv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760606612; c=relaxed/simple;
	bh=Bm2bb8b7vYEG3+RVnnzeALnMD/nL9qCAGIlgmRxYIsw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLglWQb2XJ2FB30nHd8hT8KSWF6LRzljHPC8ji4bEth6t8vEquzj0v+DTOh0sw0vVxivT8HTmPH+yviw92ydaQD8w+R8zciucKnlEKShlFvFV4at3crhKme+IXyOCWqKblb951Vq4vpF//JkCq+wIGzoMOdOWc3z/DRQlXbdG8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GI0EDuN9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E40C4CEF1;
	Thu, 16 Oct 2025 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760606612;
	bh=Bm2bb8b7vYEG3+RVnnzeALnMD/nL9qCAGIlgmRxYIsw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GI0EDuN9oqPairWSyl1uhs7uuICNXislXrtxaYcT+5NqmmwFfIt8bFn8QoMHUcIM2
	 W/6v5Nb0CFdz3ANAfoIwJKl2BS5JCljvJWzsj/81r6Xn4zgDAiXD/Z6uRrAdnv5NxG
	 l++CHMGJx0X+C3R4qC69fK4ocHqhqU+FCSG0xdyLrHzitO3ojiQBwoVIO/zby5Ra0i
	 swDHZwILLsylBqKk79u4d/ALRLojmdIHoJfD2nOwE26ibEgjqvyy8THtxcCv9T424K
	 8/efugv9sJ2updQExBBFcLu8jKswpKpn8Eu+REtJKH1705jUpDeZoqFB0wgWyeyo7l
	 9wbWUV0FJWs9w==
Date: Thu, 16 Oct 2025 06:23:22 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, linux-next@vger.kernel.org, broonie@kernel.org
Subject: Re: docs build problems
Message-ID: <20251016062322.2fcd6780@sal.lan>
In-Reply-To: <87jz0v7rxe.fsf@trenco.lwn.net>
References: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
	<87sefj7tom.fsf@trenco.lwn.net>
	<20251015184416.4340e8f2@sal.lan>
	<87jz0v7rxe.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 15 Oct 2025 15:53:33 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Just did a rebase. Those patches are missing:
> >
> > e2c3ba36aee2 tools/docs: sphinx-build-wrapper: -q is a boolean, not an integer
> > 0ce66e3f9c8b kernel-doc: output source file name at SEE ALSO
> > 9b34d25a58ae docs: Makefile: use PYTHONPYCACHEPREFIX
> > d5da902cc340 tools/docs: sphinx-build-wrapper: pdflatex is needed only for pdf
> > 1cad2682b785 docs: Makefile: avoid a warning when using without texlive
> > f0a4ad647aad tools/docs/sphinx-build-wrapper: allow skipping sphinx-build step
> > fb4771ad4ff4 docs: Makefile: fix rustdoc detection
> > ed7faec0095d tools/docs: sphinx-build-wrapper: fix compat with recent Tumbleweed
> > ab7dde2453af docs: conf.py: get rid of load_config.py
> > 8f421d0c327f scripts: remove sphinx-build-wrapper from scripts/
> > 9a20d16551af tools/docs: sphinx-build-wrapper: handle sphinx-build errors
> >
> > Want me to re-send them?  
> 
> *Sigh*
> 
> I forgot to pull the build-script branch back to the desktop machine
> once I got back home, so I was missing everything that I applied while
> on the road.  That has been rectified, and the needed patches are now in
> docs-next.
> 
> My apologies for the screwup.

Heh, that happens ;-)

All patches from my fixes series are there now. 

Looking at my docs pending stuff, the only thing missing is this
series:

	https://lore.kernel.org/linux-doc/cover.1759329363.git.mchehab+huawei@kernel.org/

I double-checked: it applies cleanly on the top of docs-next, as it is
unrelated to build wrapper.

Regards,
Mauro

