Return-Path: <linux-next+bounces-4309-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D239A1054
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 19:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8482B1C218AB
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 17:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D895920FAAA;
	Wed, 16 Oct 2024 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz5VV2f3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC435205E23;
	Wed, 16 Oct 2024 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729098526; cv=none; b=hQrM4gIZIgyjYqdY77WQf+DBYneDlDjjZ8B8PbE1tCLVHcmxlBBlMU7QUXuCS/MsRe3O/jA7d4Pq/tPHk+pARVfKhPo+yuobUW8QKOl5tdzp0fRn9IO0lkRhjjYYKREwF47zZELUKTmaCFOgMj7eCrf2LWUZsOM9RQhXeQ5ZQvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729098526; c=relaxed/simple;
	bh=xPKTHC6TAd6WhauoRzwJwU5j5gcUbdI/FpSG6faFCIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO7JxMgnM1hZiqqu+s6jbR6NYsHdGIVfFcCL0ZDMW5+KLgLMR5fha+XKskEbl25K2EEqmUbXcGhcsPk194+iUDq3ttkPEeJWv95p7PSC/ACglBQUICHmTAUtmz9hTb4EeRRcRZfibyT9b1vTHhqtvre5RHPJ9v6wkpme7Xh3uU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gz5VV2f3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2145EC4CEC5;
	Wed, 16 Oct 2024 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729098526;
	bh=xPKTHC6TAd6WhauoRzwJwU5j5gcUbdI/FpSG6faFCIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gz5VV2f3aIIgTnJKVfld3Vn6NM4eybTs5bck1xwPO2lR9y2t45j8/p/XpJ7V3QCcN
	 qVqzY3bzRyn09NZhvUTGMc4NqAHu5H/0dE4Nc3uzkC6bmeHgabB7+/Fs7cs1+v1oy7
	 O5Iae1g96rYk8w3pL/efYXdUYHfnKy8PTRzPahTWqpb2CqF0DcbNUR9ySFTCGqXX8F
	 JRifEGOMby8eElTk4hvM6MWYwYFvM1w2+haRkTZbmTCcxS70Ex/kFQKfWtHaWM4bkq
	 KhI9zi/UUzCylTpWqb0JbqOCB55PJD/lc9U1UxgBcrvPgFy8HUrXzvrMZaAtqW8xkx
	 skdJ92+1LiKTg==
Date: Wed, 16 Oct 2024 18:08:42 +0100
From: Simon Horman <horms@kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	NetFilter <netfilter-devel@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the ipvs-next tree
Message-ID: <20241016170842.GA214065@kernel.org>
References: <20241016115741.785992f1@canb.auug.org.au>
 <Zw9p7_31EESN64RQ@calendula>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw9p7_31EESN64RQ@calendula>

On Wed, Oct 16, 2024 at 09:23:27AM +0200, Pablo Neira Ayuso wrote:
> On Wed, Oct 16, 2024 at 11:57:41AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commits are also in the netfilter-next tree as different
> > commits (but the same patches):
> > 
> >   3478b99fc515 ("netfilter: nf_tables: prefer nft_trans_elem_alloc helper")
> >   73e467915aab ("netfilter: nf_tables: replace deprecated strncpy with strscpy_pad")
> >   0398cffb7459 ("netfilter: nf_tables: Fix percpu address space issues in nf_tables_api.c")
> >   cb3d289366b0 ("netfilter: Make legacy configs user selectable")
> > 
> > These are commits
> > 
> >   08e52cccae11 ("netfilter: nf_tables: prefer nft_trans_elem_alloc helper")
> >   544dded8cb63 ("netfilter: nf_tables: replace deprecated strncpy with strscpy_pad")
> >   0741f5559354 ("netfilter: nf_tables: Fix percpu address space issues in nf_tables_api.c")
> >   6c959fd5e173 ("netfilter: Make legacy configs user selectable")
> > 
> > in the netfilter-next tree.
> > 
> > These have already caused an unnecessary conflict due to further commits
> > in the ipvs-next tree.  Maybe you could share a stable branch?
> 
> That was the result of a rebase, moving forward I will keep PR in a
> separated branch until they are merged upstream to avoid this
> situation.

Hi,

I have force-pushed ipvs-next so it now matches netfilter-next.
I expect that should resolve this problem.

Thanks!

