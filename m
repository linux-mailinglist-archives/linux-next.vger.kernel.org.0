Return-Path: <linux-next+bounces-4278-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65F99F5FB
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 20:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 378D61F2425A
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 18:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09D0203709;
	Tue, 15 Oct 2024 18:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKZFMhTO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C7E2036FD;
	Tue, 15 Oct 2024 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729017992; cv=none; b=P4oIWTNFRZZqSDN0JsaMC7/cj5hNHizjyIiOo4lBguT2PaOUxHuntn+q+jMPXKKzUk13yofGVuhTACywGUdOOiyNC+ki1bifui5PKYFk8AWljSmCrLQsPpQeMXMp+SfL0hurizCFEcuPmjZKOdXlivZQEaHJALGemgcd0qxXebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729017992; c=relaxed/simple;
	bh=IcQWXDVp99Vj0zsLUJ8llRCrF3fgWdLU9cqR2tSgiFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpQHOuYG1zjBE7X0JNvXz8cir5jnYMnq5aQRJF5gmoOAs2NT2Crd1ReMOKIPHzJis+MJ/FraVjQ/7UdkEAHaEuzDR/W7YHLc2JZlhb60mcw6P0excTEHv7uHCbHB+mOg2/Ju2FvYlYLGI6M7sPdJSCUliRbkIuN/UYfVNddza8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKZFMhTO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8CCC4CEC6;
	Tue, 15 Oct 2024 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729017991;
	bh=IcQWXDVp99Vj0zsLUJ8llRCrF3fgWdLU9cqR2tSgiFM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=RKZFMhTOtrlyB5ROH54YzCYKyHj6fxNs7Ga+NIcnbAGqJujrMW+GCDxzWUivUH+8l
	 ZvuPEr0ZPOjoxeNPe+pFqtkVVZ+iw9K0YCUGmhILF247HlTw08V/gS4idalvcgsgLG
	 i+HnVNQc7Z/bF+3UaVRXXkkBNR06cT5luzRpAY1W8tl4R7hq1wWxb4f4eFYpn7WZ96
	 xvZNxnR78QhWT2cppvCBID/GWvWdUW+NgolrufSZ/5mNSby1vOiPmWsxSThj+wNtsA
	 T7zrb/KxSPOv6z9X9qtFHYetyz7aulO3GEu8HgHN2/+pkrc1Vumq9lgZ1gk7RKNNJl
	 caccCFyzpN6Tw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DD497CE098E; Tue, 15 Oct 2024 11:46:30 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:46:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: bentiss@kernel.org, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, linux-toolchains@vger.kernel.org,
	jpoimboe@kernel.org
Subject: Re: [BUG] -next objtool build failure (bisected)
Message-ID: <3d0ae79c-ed26-414e-8594-c83c91040551@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fe8c909e-bf02-4466-b3eb-0a4747df32e3@paulmck-laptop>
 <Zw61Z8xBhe1oJ_-W@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw61Z8xBhe1oJ_-W@google.com>

On Tue, Oct 15, 2024 at 11:33:11AM -0700, Dmitry Torokhov wrote:
> Hi Paul,
> 
> On Tue, Oct 15, 2024 at 11:10:11AM -0700, Paul E. McKenney wrote:
> > Hello!
> > 
> > The next-20241011 release gets me build errors like the following:
> > 
> > 	vmlinux.o: warning: objtool: fetch_item() falls through to next function
> > 
> > Bisection leads me here:
> > 
> > 	61595012f280 ("HID: simplify code in fetch_item()")
> > 
> > This diff looks inoffensive to me, but I get this error on this commit
> > and not on its predecessor.
> > 
> > This build failure happens on quite a few different kernel configurations.
> > I bisected using this particular reproducer:
> > 
> > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --buildonly --configs SRCU-T
> > 
> > Thoughts?
> 
> I just added you to another thread where Nathan proposed a couple of
> solutions:
> 
> https://lore.kernel.org/r/20241010222451.GA3571761@thelio-3990X

Thank you, Dmitry!  Glad that it is not just me?  ;-)

							Thanx, Paul

