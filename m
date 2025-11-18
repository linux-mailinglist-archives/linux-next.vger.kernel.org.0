Return-Path: <linux-next+bounces-9077-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D74C6B387
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 19:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 822D328EA3
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 18:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D981C2BD582;
	Tue, 18 Nov 2025 18:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogqS+mIR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FA31F463E;
	Tue, 18 Nov 2025 18:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490804; cv=none; b=ZM9NhnZzJFywRGfqih1Y/+Yv7ShLqNZRbc05WN6RwjZ0Yf+46yi+CrFZCWyhYoTPSIXq9L03AiF7OCWNbxsnnZKi6QppFhMPNDrmvSVxr5ml3ehKuS9oF2I++bf3qSVv9/MF6jHPW+UlhRGuHJd7QudFrgkv+7KgA+vY0DXzN3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490804; c=relaxed/simple;
	bh=lGl3kFFtNvrV8gDSOaDxrWRq4Ap3KlSloiPrcMPFnxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=es7we+2PgFdqKePc2C0WllXITv7DuN0um4IELdQu9sQK8DVQaLi3re3o+A8AL/kIRSBRPV6kj/JHpMxLBqoUaw53qQN226hx3NrtpJSgqaRPs9VvALc2EvwHzUHIjfxmQzTWd3Z9DDzdca9laMM7EKArqZa08y3kjh/Yg9nE98U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogqS+mIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CC7C116D0;
	Tue, 18 Nov 2025 18:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763490804;
	bh=lGl3kFFtNvrV8gDSOaDxrWRq4Ap3KlSloiPrcMPFnxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogqS+mIR5QOQ5NjPFVf+9Xzh7zmA1gJY+U494sOOaijMcjfv1YRZQwxviLuJxhbBF
	 hd3h5EnLQInFzFpQT4Ze6qxvSu/REgDwN4ZYm87npDlnxcFEFwF6Y8MXZIQds0zsQy
	 l3dfs6IbOM/ZldYkHtTInmd/ANzt4nVq+I0OmLFVAZNgQ4O2i3dil44g3RiUHzlREk
	 xkYfxcJAwg+jnctx6neE03KHXBcyFjnazD9iido9UdA7QGLVsbR/caAKo7OBSf3rDk
	 3neEcRmt5j3zyvAu/S9yxbNDdzYqPFdeythZh6R2fA7+gN/oCXTXOzIFnMnduJ52t+
	 UckTAMMjMTtSw==
Date: Tue, 18 Nov 2025 18:33:19 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mfd tree
Message-ID: <20251118183319.GR1949330@google.com>
References: <20251114144243.05facfce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114144243.05facfce@canb.auug.org.au>

On Fri, 14 Nov 2025, Stephen Rothwell wrote:

> Hi all,
> 
> The following commit is also in the pmdomain tree as a different commit
> (but the same patch):
> 
>   30ed024fb076 ("mfd: bcm2835-pm: Add support for BCM2712")
> 
> This is commit
> 
>   060d111e8a56 ("mfd: bcm2835-pm: Add support for BCM2712")
> 
> in the pmdolain tree.

Why is this in the pmdomain tree, Ulf?

-- 
Lee Jones [李琼斯]

