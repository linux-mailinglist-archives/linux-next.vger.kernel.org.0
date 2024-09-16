Return-Path: <linux-next+bounces-3874-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 851AA979D33
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 10:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C69D283955
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 08:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED421411EE;
	Mon, 16 Sep 2024 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/csfTIP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575132C8E;
	Mon, 16 Sep 2024 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726476550; cv=none; b=WPYqAGlzT5aN+hjUN4qFQU8WS9GAOykYNHVVocDLnV3tOwmCjqOkA7oPtBieHqAfW3ohopjqb6Av0ffsOaqQjzmvCzdDTkvwRAYg4R9vEyR6elEzuaekgGFyrZHxW+da7fUtXxNTercLRvMfuBVJZqKDiZyAFEEf5/sqH4K/IGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726476550; c=relaxed/simple;
	bh=Zx2KXEVwkItAZ58IJIKEXcr9eXgI9Irev5Fq97Q1XXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjBafrVqOXeov8u8jjxyzj4YpM/Xe4PuOZNiBJMCX8yG6F5xdYGM/CPrNKoj3xIa1t00bEVi8ECoDAzlfQBNSEyPJk5iWCmXts1R3y39FPxshX6Dj8zqnIYlojjA4RxjFTy9/3RVxmp0c5E8U7SOhYgP1Rd12HdpGyuKN2lqI0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/csfTIP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28447C4CEC4;
	Mon, 16 Sep 2024 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726476550;
	bh=Zx2KXEVwkItAZ58IJIKEXcr9eXgI9Irev5Fq97Q1XXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/csfTIPWNsozSMUTe07PcSjj4urBUkVIqf8y+3SSUB4hA9AyNMcSVHdMV7BUOWpp
	 YRup/Vbkk4CggIVzlMsHWTOVLgUaq1MmewlBGRccdEimT3K3DLl8Rn+v5YP9aZa6db
	 On1u41W3PRLQFtISt0wRkYmVMbfLFeY9k93acWqGSMf/9SOJ8qeWFjT57zxiYce9gd
	 H0AJWgZjz0qJm1rbVMZTnh5cCwkWtJHbDok2TWrr5USD2X55V/E8iFpbpPOrH+idTE
	 U4QzNOIdvDLDUyTjWUY9BKuhFUnGod/+4Nfc42P1RzmkTz2GJ1rp2JCklpmPKlCP5h
	 UttrXMemWPPmQ==
Date: Mon, 16 Sep 2024 10:49:06 +0200
From: Keith Busch <kbusch@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the block tree
Message-ID: <ZufxAqj-wMtBKY2i@kbusch-mbp>
References: <20240916183622.105641d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916183622.105641d8@canb.auug.org.au>

On Mon, Sep 16, 2024 at 06:36:22PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> block/blk-integrity.c:69: warning: Function parameter or struct member 'rq' not described in 'blk_rq_map_integrity_sg'
> block/blk-integrity.c:69: warning: Excess function parameter 'q' description in 'blk_rq_map_integrity_sg'
> block/blk-integrity.c:69: warning: Excess function parameter 'bio' description in 'blk_rq_map_integrity_sg'

Oh, it's the kernel doc that it's complaining about. I thought kernel
bot did something wrong because the code had dropped those parameters.
Sorry, will get it fixed up asap.

