Return-Path: <linux-next+bounces-3856-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6021C978D15
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 05:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9083E1C248A4
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 03:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BED11B964;
	Sat, 14 Sep 2024 03:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeE8KWbU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAFB1AAD7;
	Sat, 14 Sep 2024 03:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726283822; cv=none; b=hkl4YXYTN1MZB04rYW1ysD5eClan1fEps5WhSxHdBGsY26qBUs83P8+nOHUkNz0H+6pHG9JoULSX+W567GNUBiBkA/w1m5nGgVZnD7/Qw5CUftmUowRkb8kOhq+PIDY0AXvZcC1e1mpeMHytTF9uGRA67nJW9PLwId99DGxpoxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726283822; c=relaxed/simple;
	bh=Gffs7E+w0YaUF775WZiM4kfYw2JL46REVe0T5O7hsDw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jdw421AvTVDOEfy+ogOKJ64NwdZGBHrN6Gb4IV0hMAl8p0C3WuUrk8m8gKSnsYme6W97ObCeoNmTL/Nztz+cwhr0v5Td8r3GZIv6UC/b8K2x+hmToP+ncaLPVX+JeSF5FC1Be9aESCvkrTjQaTLnkSyGG6QWq5dsVyTdnr4ss9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeE8KWbU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36223C4CEC0;
	Sat, 14 Sep 2024 03:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726283821;
	bh=Gffs7E+w0YaUF775WZiM4kfYw2JL46REVe0T5O7hsDw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CeE8KWbUsErIEv9POLRn5OrYtnAA+yxGiaCgN0iQzyK6851hca/o2FAYYIt3qrJT+
	 fraclGxus91DJWNZrzfM1C44nQ50cm/WLZGDFtybdnHwFJ5S9QDVsmLWMt2QW+Wbgd
	 7bI4GFRjuGjNky7Q1YWNz4S206boxM9XCQSZ0jftFL2AVb3qy76yrerxWbOiLOeRBL
	 bld457NZdfQZpNcZsUbpbXteOgip7OWGvXiT/2LiDQfguoLZ5KyDK638FZbozrllKE
	 92GLCrDAh00e83keI0Hz8M8Ryh7vIo4LFdf1uKqGve6TZMUOPkDj/7ghgTajT65xDs
	 7sswukRlTdNew==
Date: Fri, 13 Sep 2024 20:17:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matthew
 Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <20240913201700.34249129@kernel.org>
In-Reply-To: <87jzffq9ge.fsf@mail.lhotse>
References: <20240913213351.3537411-1-almasrymina@google.com>
	<87jzffq9ge.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Sep 2024 12:02:09 +1000 Michael Ellerman wrote:
> Can you try the patch below, it fixes the build error for me.

Excellent, fixes it for me too!
-- 
pw-bot: nap

