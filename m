Return-Path: <linux-next+bounces-7583-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C756B076A7
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 15:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06CC61890912
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 13:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31222F3C2C;
	Wed, 16 Jul 2025 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtnDQKrW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFB415E5BB;
	Wed, 16 Jul 2025 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752671609; cv=none; b=CwXX12Z7fjywVLoY+RF2l3u14VZraFDi3lN0jw/01Zxi2sfc4pnzshXQYiXFwxZBFYQCWezqVmf2u8f1GlKiM+37IsGsGJP0uOYjY3mPHAk5f8EibVD0b7yXV5P9FzDOoRUKWxC/ezfKXvytMh10Lkd1y5USyDgTEYzXCWJ+7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752671609; c=relaxed/simple;
	bh=K6oqX+67eUnHLer7AQlFRevA8MZfB7EPbXq8ipVYL70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGBtUBWTjauYn5KnrSYKD98su/jECBXV5PlQ94Pm0IZbkXyeOFqQ5t0j2ougDZgXddqigjI/TTRIyNdtuYOlRbD6WoKCHzwoZvo6iPA6y6t/EkpBL11v0sYU5eFRdZYUwkMYP2AiqCuM7moYdZuIAXHSNCIP5LZr+crzdU4uva0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtnDQKrW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F097DC4CEF0;
	Wed, 16 Jul 2025 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752671609;
	bh=K6oqX+67eUnHLer7AQlFRevA8MZfB7EPbXq8ipVYL70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rtnDQKrWuoJqH4F6fVlF8SWBx9nPHSRzcP6jbEoXeV2vPHB6T4wHLXBJaa0R1K8dW
	 mYM3PT/Bc940rf2VbK7jC0GztMxfbR7QJpHatRJffUGoXasgQoJAKeMxfNSQajroZV
	 qJlAmQm9CL1EVPcG4Wj19cv0l1u3Tu63qk88pwcIkFrUaho/nESnf8k8H8yhv4kqaV
	 Zw/vVJ24oQ4NQr/6ZJQv6rwjTC1ndkUlYw6rZYRlJxLb8c+0uubUm66swIEvG4v9Ds
	 baX57ISeWDwSDSM5Z1eMZIUjX8xYAZIOZg3vExvWief3oivRmNuCf7ZZRpEFT64A4F
	 DH/GR7Usi3/FQ==
Message-ID: <db9fbce3-20a2-417a-9264-7f98c2376b0d@kernel.org>
Date: Wed, 16 Jul 2025 15:13:25 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250716204815.33e16b6a@canb.auug.org.au>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <20250716204815.33e16b6a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/07/25 12:48, Stephen Rothwell ha scritto:
> Hi all,
> 
> The following commit is also in the mediatek tree as a different commit
> (but the same patch):
> 
>    791a2ba9e668 ("dt-bindings: timer: mediatek: add MT6572")
> 
> This is commit
> 
>    7827b0ff3bb3 ("dt-bindings: timer: mediatek: add MT6572")
> 
> in the mediatek tree.
> 

Sorry, I have unintentionally pushed it to the mediatek tree's for-next.
Will remove asap.

Thanks,
Angelo

