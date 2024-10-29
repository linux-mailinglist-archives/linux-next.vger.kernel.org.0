Return-Path: <linux-next+bounces-4513-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 029409B4283
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 07:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB7D528395F
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 06:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB76B201253;
	Tue, 29 Oct 2024 06:43:50 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D024320124E
	for <linux-next@vger.kernel.org>; Tue, 29 Oct 2024 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184230; cv=none; b=l6O2onjV/1CWFQ+KieVibDt9Z8sF5mqe4nSUJ9slMxw0GIj0136J0Zji2xQkwVqNlAUubS7R3pGu19nsl386+SG6INwiyGB0ACv4vXgMDEpHRlv3VZi+xgKhxbno9SKboODeGcmyBWlt55JiLYfzSeyLRAYa4moDn13x1645hJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184230; c=relaxed/simple;
	bh=p6ZYZ9OWhXmmYKnTAhTfRO3HXLVN4aZzxE3EOAuJU4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBPmrz1riM4k4ipu9E5kVtIi2z4u2p2f/mSjkPV4YOlFVMo4VoELeFCbI/nMy+Plj0YJ+lrQnDeTXo0ZxLpGpe1Ibspd9fOjq9+7UxdnQuoaRSLIG+WBBbh5W7Po/0lA894uRdtOdvK96LVDTrovbfjUZSc1PEJ7iN/vfemtz6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Tue, 29 Oct 2024 14:43:44 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jesse Taube <mr.bossman075@gmail.com>, soc@kernel.org
Subject: Re: Include in next: spacemit/linux
Message-ID: <20241029064344-GYB97300@gentoo>
References: <20241029045326-GYA331364@gentoo>
 <20241029173322.4d879601@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029173322.4d879601@canb.auug.org.au>

Hi Stephen:

On 17:33 Tue 29 Oct     , Stephen Rothwell wrote:
> Hi,
> 
> On Tue, 29 Oct 2024 12:53:26 +0800 Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Please kindly include spacemit/linux tree into the linux-next:
> > 
> > https://github.com/spacemit-com/linux
> > 
> > branch for master: for-next
> > 
> > branch for pending-fixes: fixes
> > 
> > Repo will be use for collecting patches for SpacemiT's SoC
> > which recently I took over:
> > 
> > https://lore.kernel.org/r/20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org
> > 
> > The patches in the tree will be sent to Arnd Bergmann and soc@kernel.org.
> 
> Added from tomorrow.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 
Yes, I understand and thanks for all the info..

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

