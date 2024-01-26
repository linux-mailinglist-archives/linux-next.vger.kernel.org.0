Return-Path: <linux-next+bounces-875-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C49BC83DB8B
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 15:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56C5BB24EAA
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 14:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540B31BF20;
	Fri, 26 Jan 2024 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKyqRKhD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED6312B7C
	for <linux-next@vger.kernel.org>; Fri, 26 Jan 2024 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706278354; cv=none; b=pOsdoVQD3hz2Es4AR9rmPeG0gBTP+MWmhimKZETOGgNh2S76nES86dHFGFPcE6fG+bycjZnMz1D4538JioesyFaDlUZRx1z3puoLw1o7CoX17k/PDelSbTNhJ4deKZmYzbOKtDuGHSKws6J08vktKCP+ZptBpV7KVeWeT+p2h1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706278354; c=relaxed/simple;
	bh=WSxGtBveFbf40oYTKC5+cebAuRla4BBna239IOFCcxY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6gNB9CKWuQelKJx2mKrJiH+OSCo9pKFDc+vyRQxMneRunlApnCkqlXmE40wFkWbnf7XJ0UmJNWj6deFoZQtPtyHLWFr+EGD2WEFPkXFAPC4ythUHxur9OQgQT4cKcNFaIZCMwRMAjsj6ft1Z0pKg0/Ft5k9EFByk1SyiPCMHHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKyqRKhD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B36C43390;
	Fri, 26 Jan 2024 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706278354;
	bh=WSxGtBveFbf40oYTKC5+cebAuRla4BBna239IOFCcxY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=LKyqRKhDwjAV/nqJ/4pE6+/rOPrgcVfiFeDgyYDskESrrD/KDFQ82SQ+THAV2RbWe
	 42JJzLkRNSgTIGp09HJGK5ao5ypBefg1vfJ/JYfaSu2eAM2ObsLqY2A6upfUibcE2U
	 dwx9NOd/P024JSw9RRQHMDWHyh+Da4sz7boZacLyo+qY75yXZL/E6ir0KuBeFu9aRd
	 zLqQiNP0DcUcuX92GzhpyuszX9FhbVmRx+G4MXdaSlxfQ8vlNOO06ZaY+R79JE2gbE
	 tMjPGjwLhKbDqAqkH5oDeNfcUOb+cAlTJAXz8aXUoHrzlLtEJ/NIwItePj7gWX3j1w
	 tYdw+qdv+QifA==
Date: Fri, 26 Jan 2024 15:12:27 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <36yn57j5ffokfvrrp3hq7puaubvad3eemsw44exejmaywiskwx@saqhiqozhu3l>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240126115011.55da6838@canb.auug.org.au>
 <zgjyz7kdovuesyu4s6lfshrsktfozid6hho7xn5ckc4ux54bxj@lkhx4qbdpcki>
 <qztustevwvwnfjrcour5hpxvik7ryhbyhxn5nzyosdvjdpdife@2a5orr4yo5db>
 <ZbO0nuqboURn-hy0@ninjato>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbO0nuqboURn-hy0@ninjato>

Hi Wolfram,

> > whichever you prefer. There you will see the two branches. I am
> > trying to copy Wolfram's way of doing things.
> 
> If you copy my style, then only for-next goes to linux-next.
> 
> I have branches for-mergewindow and for-current which I let Linus pull.
> I merge both branches into for-next for Stephen.

OK... makes sense I can do it this way, as well.

Then let's just have for-next to be integrated in Stephen's
branch, then.

Thanks,
Andi

