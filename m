Return-Path: <linux-next+bounces-2334-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CF18C705F
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 04:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0913C1F21C19
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 02:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81D723D7;
	Thu, 16 May 2024 02:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="IoYrDqUy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8901877;
	Thu, 16 May 2024 02:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715827333; cv=none; b=JGRLwqVLTHVawKCCfCRBpvZHUWGmcW3T6EEvJc0U4HEIuW27Zls6RSJbUX5fnLWJ9p7W5lzbw8pdvCxRfJUGDRCf9kch940kGA3EMVwVYqXNjRdQtrg+rJovdpKKWtB4TEO/ugJjiH/j/UHYyJnTTDUXMaG6ImN9Wej50KgWsSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715827333; c=relaxed/simple;
	bh=iVSKuxqhWqP0pGI+v769ZkjrMQDRcsRIXy/mVC+Gwzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WEJ9nbBuMG7GViuUOISkHbp9xdeixqNp3z7J40Nlo5Y+vuaNEpLbW/DKGgN72szGkN0eLqgZ5MuWuKPSleCQsl9/JHscEyz1K1QAlH3AyBpxRBTc3ybqHhk13TH9QVyrjUdHVdFNGE7x/7CiFSCGNyiO1WhiGkWNfvdttINUtTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=IoYrDqUy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715827326;
	bh=iVSKuxqhWqP0pGI+v769ZkjrMQDRcsRIXy/mVC+Gwzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IoYrDqUyv9fqD7HsO/MKcHPWSmQsZJQtViDC5HpvjTv20kA5uhx4yRBYvSXIVRTrz
	 WgeNhlK5sXMYfIaZowrZ/OuXLBAZjfLO1synJV+yIMeUOMgVVULLmUgQxe8WfAa6Cp
	 so0+e/9TsQ9BN46+PqDNTHXlqryEdtrmdRDoI/j4ytqFAtRfoSWa7VUQGRbohz8szo
	 wxC6Be38msSgwRqgYvNgxyIv5aJz2dFpmSi+857dD8QsWtf2xgZT9iINtKxNqH7tF1
	 J8vDeAt1rU3+ZBoC/LDlVlxEMMJK4+IyXLde+um/HSsHZ9muBnLPVpRHVO+Hnx2OgC
	 rmLT/kRUvwJkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfvWK6ZJhz4wcR;
	Thu, 16 May 2024 12:42:05 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
In-Reply-To: <20240515163708.3380c4d1@canb.auug.org.au>
References: <20240515163708.3380c4d1@canb.auug.org.au>
Date: Thu, 16 May 2024 12:42:01 +1000
Message-ID: <87cypmwk92.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> After merging the powerpc tree, today's (it may have been yesterday's)
> linux-next build (powerpc allyesconfig) produced this warning:
>
> WARNING: modpost: vmlinux: section mismatch in reference: fadump_setup_param_area+0x200 (section: .text.fadump_setup_param_area) -> memblock_phys_alloc_range (section: .init.text)

I don't see the warning, but clearly it is possible if the compiler
decides not to inline fadump_setup_param_area().

What compiler version are you using?

cheers

