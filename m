Return-Path: <linux-next+bounces-5261-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DCDA1681A
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 09:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2728D16B063
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 08:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A314A192B8F;
	Mon, 20 Jan 2025 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EZabyL2Z"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665901925AF;
	Mon, 20 Jan 2025 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361136; cv=none; b=GjT3XZyMfqWT+0zrPmKjI8/u7PMQ5qgS8BB+HnyCQnUDDIfVTsuOaSh41BLaSdTsoYlw3Gz7VY2bSePSLx65Wpm5dz+px7CK1QKZ3mZxvgWvj9cxeF+30zm/YzbNFnkXW4prrnJa2/EX3Pp2ZZUGZay+hrHfmE0VzeOYXX41/pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361136; c=relaxed/simple;
	bh=nlgEj6l1Vj54ty74/zQVPdFXjDfnVmi3tUsV9m6x8v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4WuVKRSiL1Sy6Leo/xldRRVtroQym4P/rXI3sRP0hvPGmcQbPbqhR05IcNbJPL2Om4VgTm7ORCm4klcBtNYCCTEGQwWdbBlHxEBxEk0sf3mU76V12rixL0HSVFusM7F1OGX9/wDgJ001/5/AxaCkBLqgn2da55GBE4xGfrS+hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EZabyL2Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A587C4CEDD;
	Mon, 20 Jan 2025 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737361135;
	bh=nlgEj6l1Vj54ty74/zQVPdFXjDfnVmi3tUsV9m6x8v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZabyL2ZgIAyvn2qqSlxJBvm/c/p/fSnZapGdvMETv+3IYmL6r+bNIVJ+I6/D/alD
	 kt2jIl/N7bsCIabXy9TtuSmnR3XDtt8PmXgCSZKGxRZ+pRQP5sXFgiZiGgRoecKxmC
	 9+fCrCydeVZZugKC7x9wT7/HzHJlRhdHovK4BrUg=
Date: Mon, 20 Jan 2025 09:18:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <2025012033-shopping-seclusion-5efc@gregkh>
References: <20250120182219.30dcb3c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120182219.30dcb3c6@canb.auug.org.au>

On Mon, Jan 20, 2025 at 06:22:19PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the usb tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> drivers/usb/dwc3/core.h:804: warning: Function parameter or struct member 'nostream_work' not described in 'dwc3_ep'
> 
> Introduced by commit
> 
>   dcfe437492e2 ("usb: dwc3: gadget: Reinitiate stream for all host NoStream behavior")

Thinh, can you send a patch to fix this up?

thanks,

greg k-h

