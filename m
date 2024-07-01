Return-Path: <linux-next+bounces-2749-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088791D97F
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E82691F2185B
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 07:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8BF768FD;
	Mon,  1 Jul 2024 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqQCyy3k"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648615464A;
	Mon,  1 Jul 2024 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719820547; cv=none; b=fkHoj1kDxqSbSbGMSTQGYnRWih2uG0QakSMpTgPsu80tLsInw1dng/ugeTRAQ27aM+qbOwoh1agIO1qPzjLG6/XA4pGoJh0jTQLnFNcyMJLu5Q4dVC3vNdnfvXDY1VwFMXRk611dyoPC1QZHti9Hs461b7Mk+35/+30tjJ/hSjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719820547; c=relaxed/simple;
	bh=yirbH9irgYt6/XRtTOl5orPC0EZz/gg3DENiJrtong0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXtl4xu9gAi56KX5bx0ODngTeaB8UtqgHsCwtuEFENEeCmBxod5THoLNV1/+1c2De3K+p/9Dv52vBdFp1ZfsETdD4Vj5V8E3KbzgenvtbWfl5U239wWkFl66E+QMQ5gEZEihjvuqpEAK4cnjCiV7KV7mTSYl0TM3iFd0Ztum3co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqQCyy3k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA34C116B1;
	Mon,  1 Jul 2024 07:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719820546;
	bh=yirbH9irgYt6/XRtTOl5orPC0EZz/gg3DENiJrtong0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqQCyy3kSZu502YcYQKCXZHUJI8Y2WIhqE1a3Wf42Sa0V7FrkptQic73ud3Fz46cO
	 DUl5pNiOXNVZfMxkJYiTPH28WEo8Pv9YHrG4dT9IJoV9/Lk1S5BkyAZrKr12+eIBG9
	 uFjWkJlLi/ofIVtId3vuNjGeAC8wZxAvVLEzP6ga7K3EXOjsWCX9Hp07FZJmWEY82A
	 qE0XIZrf5Q0l53G8qlIuzLTWl+fLEMhzg3sV9a/lC9ryanfVinb2Acv54QEVKJKnqh
	 EFuOSq808Zc+vzMridfquTfGjjui1muzU39ePHKUO1VfulbsyEQWrl/92Fxa8hCR5p
	 hVbWd3MXaSK+g==
Date: Mon, 1 Jul 2024 09:55:42 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <ZoJg_k2En6bqQzA4@ryzen.lan>
References: <20240701091320.64ea6091@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701091320.64ea6091@canb.auug.org.au>

On Mon, Jul 01, 2024 at 09:13:20AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   aaf840725904 ("PCI: dw-rockchip: Depend on PCI_ENDPOINT if building endpoint mode support")
> 
> Fixes tag
> 
>   Fixes: 9b2ba393b3a6 ("PCI: dw-rockchip: Add endpoint mode support")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 728538f5e806 ("PCI: dw-rockchip: Add endpoint mode support")


Hello Stephen,

yes, that is correct.
The branch was rebased so the SHA1 changed.

Perhaps the maintainers could update the Fixes tag.

(Personally, I would just squash the small fix with the commit that it fixes.)


Kind regards,
Niklas

