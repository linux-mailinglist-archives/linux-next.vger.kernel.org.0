Return-Path: <linux-next+bounces-5904-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D38A8A6A266
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 10:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E450188A73A
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 09:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CFB2139C9;
	Thu, 20 Mar 2025 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7Ld2mfP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0791F09B7;
	Thu, 20 Mar 2025 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742462276; cv=none; b=Dqo0Y62HWOM41oDQmcdJLZCvwYccLHez5d84qgM9kNPs5P8kWeMgaiFl9MOpoMdXoHRuwdHFDQyTrWW39TjbY9A8JyNkApADEzrlp9Sfv751W7uIRfwYoAajtLt9RQn61Zt9ViyujvvJGDchtpl6ShqGYYZLw4HzpPM0Jhpou+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742462276; c=relaxed/simple;
	bh=Xyyzo6Gh+WL9fAi6N9VIMoxuKZ3LoEgaFXhaVGBrGiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdGLgaDSD0dtxw1ZsdE1ix8RXb+foVttTha6XBVq7soQpRyPpKrHdbicZhc/341CDwZ9D8tId7/1REa4lZ+EMuLVp39ZPo2v+ChGt+cn9CmdX6uuSQMEtbpUqJziC5t82w3Zo53UBrUWF3RnnoTBpiX3pPAsaG5JPTM57vbvSlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7Ld2mfP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60584C4CEDD;
	Thu, 20 Mar 2025 09:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742462276;
	bh=Xyyzo6Gh+WL9fAi6N9VIMoxuKZ3LoEgaFXhaVGBrGiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7Ld2mfPq2TcfkZ8HvmvRBw807rLtv69ZuFCKYqF4xI9BwCUNSGXRSspx1lb7GreD
	 A+kgBB+EIf0rFa4uVJAyk93Rxn3XIRuykhXzS6OuY1tgimInFtDdOewPsnOe+ncxOL
	 iOaw1Bm6Ma2dDxB6q/4BarmcWpsCYAAlWeTv8mR+QidzvIlc1+JN7+UYuZE/TlI7Wn
	 E9WBCsgDaEEdag+PHhDHwN0rripWdZEGKid5LN2cZumNnmDBdWjyXiKtHUIiELo5Ig
	 3pLyc4GBcz1p72XCq+h+L/9yT500RLt1YkwIRa5gDqEQXU3dWUnv7MrtvvzPm8Fheu
	 YwgrV8s/ItTeQ==
Date: Thu, 20 Mar 2025 11:17:51 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <Z9vdP7vgv-Z4RahU@kernel.org>
References: <20250318081743.32c72c1c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318081743.32c72c1c@canb.auug.org.au>

On Tue, Mar 18, 2025 at 08:17:43AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   04c72b01f618 ("Documentation: tpm: Add documentation for the CRB FF-A interface")
>   cebcb37cc882 ("tpm_crb: Add support for the ARM FF-A start method")
>   1cfb6e10a755 ("ACPICA: Add start method for ARM FF-A")
>   abf6e84648dd ("tpm_crb: ffa_tpm: Implement driver compliant to CRB over FF-A")
> 
> are missing a Signed-off-by from their committers.

Sorry, something must have gone wrong when I rebased and updated the
commit messages. 

I think they should be good now.

> 
> -- 
> Cheers,
> Stephen Rothwell

BR, Jarkko

