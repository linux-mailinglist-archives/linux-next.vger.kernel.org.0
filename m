Return-Path: <linux-next+bounces-4935-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0D19EB73D
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 17:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59105284FAC
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 16:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69ED1BD9CB;
	Tue, 10 Dec 2024 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+C7OCfU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0001A726B;
	Tue, 10 Dec 2024 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849909; cv=none; b=NcXK4p8l8QURJQwM/hGQImEak5nY84Ox811eyDztpf5A21nP5o4QU9YZt01oel4Aesmk6JTnccBLJG0BnkGBR++nJvzZc50dqzBsYsTcP0KePO59yZty+dZ2GbD1lZ/eTitbRy69DRQ8gvDXA+22n6q1ad74UZUkF/TMQz3Nfx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849909; c=relaxed/simple;
	bh=IH6nxTo0dSlu+DCh6FbNH7CPXaJy626QG94fPt1JanQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njS0+SpHUErdOsPZTHWbsKt3y82u17sF/AbUJimTNWFkH5dU64dbi6+UrFxO8tbbZRF8XJvNwyRFsWo3EhvBNB88LOXOOioZaqFZAMlz8To8Ck7v/X7FCnLLxixi8W6rgWgi5ZQmfldumOztws+BNFYyASF+Vzy0l+k7Rsyanjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+C7OCfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1A6C4CED6;
	Tue, 10 Dec 2024 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733849909;
	bh=IH6nxTo0dSlu+DCh6FbNH7CPXaJy626QG94fPt1JanQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+C7OCfU8szXuO9ID4jwF5opi+z2xyKyukPmYLXBVMv4/V98bPAMA0U+22RwAURzo
	 dkW1L2Bubo6fFKeIawzr25D26KH9QgMNA2zHw3HipJ37W+3BrCZ9H5L1VmUKfnclJx
	 V+t+CzQCANUj52tr/+h0LApYSpqxKpj1U9AH2z8aEl6MKNRuJB7RnpP4aLZpa68p87
	 H5VTpcabaVZMaczOJc2W0VdBZIH2qw8Vz+oNrXI3Xq42ettDSeQbSewhzvaIk0bP1p
	 urp7mMarApZ/fEBfW/O6PFYULo2EUKp0KXaS/p4t5OCtAxVRdaAieEJHMX1JpT1bNP
	 TL1duNFJzPhQQ==
Date: Tue, 10 Dec 2024 22:28:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the dmaengine
 tree
Message-ID: <Z1hzMRuORVOQvKLW@vaman>
References: <20241209075036.055e0729@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209075036.055e0729@canb.auug.org.au>

On 09-12-24, 07:50, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   1ad2ebf3be83 ("dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA")
> 
> is missing a Signed-off-by from its author.
> 
> Scripting confused by the comma in the origin SoB line?

Yes I guess so, checked again yes b4 seems to eat it up

> 
> Also, please keep all the commit message tags together at the end of
> the commit message.

Again scripting is going bonkers here

I have fixed it up now

-- 
~Vinod

