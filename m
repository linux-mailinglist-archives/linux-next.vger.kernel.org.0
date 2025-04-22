Return-Path: <linux-next+bounces-6329-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4CA96EF7
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 16:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C611443AA8
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 14:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427772857F8;
	Tue, 22 Apr 2025 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RC4uyzCu"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4E55FB95;
	Tue, 22 Apr 2025 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332310; cv=none; b=VxTBmbEGjWDjcSDWje7RIlX5NXe0PIl8QCiwt7Fc18qE9+KV57d21qe13VvbnYb7RlE5uqFJqa11kFYqjJibOi3kllyAdHgc7yfids0jE3iwT8dqJytlHfAk08d4AoMxYA1OFlFkWFAihbc/GLsJ0GRl1IX979rEn5mc92ur/Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332310; c=relaxed/simple;
	bh=/ONe7k84QQs3Jfl6KyExISyHeaYbQCPgqi6g8xPg/b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSbLzf02PbGzR0/xZTif1hDrZDK/aLAkNp5Ew2Aog8Br0D5/thLMEK2v1vTmUaWxSoosLBY1WE5/BbzxqDpcm8JNBGa9yDmapHgMCw4hjk3idj5/28xeVYodkK7IQh5UnUn46dtqzfFUMYhuhVfj04UJHl64GRMneX3q9iVJHlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RC4uyzCu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8B5C4CEE9;
	Tue, 22 Apr 2025 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745332309;
	bh=/ONe7k84QQs3Jfl6KyExISyHeaYbQCPgqi6g8xPg/b0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=RC4uyzCu9CbgI3t4BsB1lmtsqYVFk233JogzmcNrGLVQF6Esd4+VNqEJ8Q3xXTs/m
	 Jc7tieWy3DC5DuUwuX8J0pdM2aVRBYplGGRQiYM+ovl4M8WlX9Zcr56ZaRYnhByy52
	 ZLZxB+xzrlaO5MKe4y3dXuIaqhQH3lqCp1GtiJsKAcYDZfSt86LW0AjA4/vuQfoQBd
	 nB8BXR0QzjxQRywV86vKo43cGmn2UWPLt3i5Ko3wie25SCqSceCJLnJbSLr0pvV3Rz
	 UMP62K+8SHpbNZBRfaFJVHP7L8RibQMLDEy6qGa/oSSmttPPvdCUar8vxA4SwdTvrx
	 /sUlYWftuA/Ng==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3AF63CE0875; Tue, 22 Apr 2025 07:31:49 -0700 (PDT)
Date: Tue, 22 Apr 2025 07:31:49 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the paulmck tree
Message-ID: <1eae5a76-9855-469b-969a-22eceb923795@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250422093834.57e9e9d0@canb.auug.org.au>
 <ef907eca-3a04-461a-9c75-404d65dbaf2b@paulmck-laptop>
 <aAdJ18rRHdi9y3S9@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAdJ18rRHdi9y3S9@pathway.suse.cz>

On Tue, Apr 22, 2025 at 09:48:39AM +0200, Petr Mladek wrote:
> On Mon 2025-04-21 17:00:57, Paul E. McKenney wrote:
> > On Tue, Apr 22, 2025 at 09:38:34AM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Commit
> > > 
> > >   9e13e90127fb ("ratelimit: Reduce ___ratelimit() false-positive rate limiting")
> > > 
> > > is missing a Signed-off-by from its author.
> > 
> > Ah, good catch!  I need to chase down that author!
> > 
> > Petr, you good with this one?
> 
> Yes, it looks good. I have just approved it...

Thank you very much, and I will apply it on my next rebase.

							Thanx, Paul

