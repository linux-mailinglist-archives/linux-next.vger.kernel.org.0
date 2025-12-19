Return-Path: <linux-next+bounces-9481-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C35ACCF7E9
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 11:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91BE73016997
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 10:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD10A21B196;
	Fri, 19 Dec 2025 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxEsnN0f"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49D818CC13;
	Fri, 19 Dec 2025 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766141640; cv=none; b=fP4toxVlRUdm2nUnUdQd7/Irc3d7+SY14hQPsrWEWi/ciM9LGpyFrQtuGlGikYvmDBcuj5vv3cg22sHL1+WCb1dViWWNbr2m2XLtiLxImyEu5UZ9WIUhQTOhHI3qK7jYpTVA0907SIEZJkQs5uvfTsFPk92z0+opM7NkwIbWPjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766141640; c=relaxed/simple;
	bh=YTEQwo+ZX/Nw8UGivL0Yf4MRTj6c8XaEpASlQ9EPvNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNl3GnonR3m5bIs08/Si5ejI4IbNlg8HXOgp6wRl65jUGGhIP2rKAtkaxueHzajeie9XbWsHsXbZlAtOLmdXGFS08/0D0DoDHWUUyErHMPOsxZ3L+BimNm1hKz6o/qVXVVpTeElDbUpYTMZLYFKzt2jNn9EO+x95Tv9HTAciCMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxEsnN0f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF480C116B1;
	Fri, 19 Dec 2025 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766141640;
	bh=YTEQwo+ZX/Nw8UGivL0Yf4MRTj6c8XaEpASlQ9EPvNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxEsnN0fSV+k4+TaPq2z8+23BSmuqT5mZ4gpljTcja9DpLbgWnX5Zix4Oa+Bb2yUy
	 ohIxDYCu+FaGC8C1fYpjzR0I0iV6LRF2hbUrFr4Osxb4NeiWn+tPe2qCmlzUB+XWoF
	 j5i90+y5hLFl0CB6NCbGPFh3H3P2z5nZwHWm89UaP+TiE8Xb7wwzrlGsBkffyGfLnX
	 B8BszX/xSitizil23WbLp1Mv32+C4gmz29NHcBNKE2IdtVWW90AUWK0UikZ9cWsIkD
	 /br7J2OSnW75kD3mgLxe5KXdJf8CnGFoXnG3LExg5ZAPhqK67rrbGa3FsX1kEXdcmi
	 ebLDqTcguc+BA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: linux-next: changing maintainership
Date: Fri, 19 Dec 2025 11:53:54 +0100
Message-ID: <20251219105354.101616-1-ojeda@kernel.org>
In-Reply-To: <20251218180721.20eb878e@canb.auug.org.au>
References: <20251218180721.20eb878e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 18 Dec 2025 18:07:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> It has been a long but mostly interesting task and I hope it has been
> helpful to others.

Thanks Stephen for all these years and, personally, thanks for allowing
me to have the Rust branch there for more than a year before it got
initially merged. I think that helped a lot to convince people we were
not breaking things :)

Cheers,
Miguel

