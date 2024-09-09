Return-Path: <linux-next+bounces-3707-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEA1971A81
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 15:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F523B25255
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 13:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21291B9B39;
	Mon,  9 Sep 2024 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ulaXtf1F"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA31B86E1;
	Mon,  9 Sep 2024 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887498; cv=none; b=XmeqPl6vobbZX0JJCj0kh/PVFFh0MSPGljM/MgpbpbCBbtMqD7qI/aTdhDq28b9kAEMRicIm/TWJuyUzu55jM7s8ftlkPZwyXsQ9BP+3xVT25/nBqSjyB6vUcW3lf5wD2C09egiW3P5vXVlHfByAYDtocvLWceE63oIxaZXAF9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887498; c=relaxed/simple;
	bh=PSTM3SwhH/n1iDskZX05rWDPHAZfEWomQUKwWkACvq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqMmjv+WzQ7YrVv1A7Kq+WVgmc7CAT4ItYSsnQ5xpCvv9RZ/5LTzwWe+u1UbWs+7aGzIHoAhRAx8jGc3fRhKwG8+IIFMEibSYi2us+nHCgifaF8KltlNa05oLBnZaFYu7R1865tfNIxDoFNxz9w9fU4UByULxJr7PXeTIxrHJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ulaXtf1F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103F0C4CEC5;
	Mon,  9 Sep 2024 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725887498;
	bh=PSTM3SwhH/n1iDskZX05rWDPHAZfEWomQUKwWkACvq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulaXtf1FjtY/KYz2lFfN/MFJLuC+2XSwdZQJvxT5jjTKHyKDj6e0ZaP7IDeBZqGGW
	 k+2OybT5eU1/FropdZHuuD8OB1vriRX3xGIR9hom0TpMa9Y8dKBh4xzPOBdC9s5dHh
	 s1DvJikeK4v8N1BtaoyGUoOrwxh2GiOkLEmzfoz0=
Date: Mon, 9 Sep 2024 09:11:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909-nice-important-mink-2fac60@lemur>
References: <20240909171220.32e862e3@canb.auug.org.au>
 <af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
 <20240909-organismus-sattbekommen-06332e10fcd1@brauner>
 <5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>

On Mon, Sep 09, 2024 at 11:40:25AM GMT, Vlastimil Babka wrote:
> > Hm, that's very odd that the IDs changed. The only thing that I did was
> > b4 trailers -u on the branch to quickly check whether I missed an RvBs
> > or Acks. But there were none so I assumed that the commit ids wouldn't
> 
> I guess b4 could be smarter and not perform/rollback the history rewrite if
> there's nothing to change.

That should be already the case. If there were no updates to commits, then it
should have been a no-op, so I'm pretty sure something else must have
happened.

-K

