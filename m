Return-Path: <linux-next+bounces-8993-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E4FC5DACF
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 15:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 8268622EE2
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C603031B11C;
	Fri, 14 Nov 2025 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVWIMPAs"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD24215F42;
	Fri, 14 Nov 2025 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131709; cv=none; b=rYN3kwgPlaJoC0S8d2bghiiWT0dv3adtcdULcihpbdA1906sO0Va0DMvSyTorJYrrZ4cM9L3sMBR2x2bJhLDkCiFuJukQHUS1lAkznseQ7oX9ZpCAIsPjgNx1ziN7ihJD+mC2m+dFyyeQS/M03KXrG6T7ILMV5bN5Nk6qHrSwVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131709; c=relaxed/simple;
	bh=pU+xc/bSgqQkmaSsmClRlFgjR/zNb9Qfzyof87UEzX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtqAUmpTKQhtGP+CF5r6UWFrW5y6anvnG19zMED7m9+Yne5vTG391AspXERO8xBeeXbk0CozAvanXRVUiGLwnObsL5zTKEx2WyaD0iEJtlMlX685U/xMeTlIPQ+3CQS2N9epDmrANSev+fyRwsgwSRoNeikoNZQm+uUt84jQ+xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVWIMPAs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C335DC113D0;
	Fri, 14 Nov 2025 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131709;
	bh=pU+xc/bSgqQkmaSsmClRlFgjR/zNb9Qfzyof87UEzX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVWIMPAs73x2LLWefEWLdeW16et5ZUKUksqHjBfnoubL6cdrJe3MaIId7F/ELmTyN
	 RtPXFRTZyM90vklRVGUffo9enWKwDxk61KLqettkxnbKrZvM+VdXVN3D6Nlu5E9Bta
	 gXX9CqWJnoWgj5BCsCFVJbbM/Mdk2IXK9n1Y8sGTo64gz/DBhwe34KYaJE6q6y2PNb
	 s2iP7Wmk0x1gRdQcLWQs5mDbUU6eQgPSdqE45GIdOMohIHYSu6uXJrw4eR2SPK0Z/r
	 Cnsefk+yTsJdQOidiS7eXuT7blhEZ3FdJj/5bReGL6jIJaefc5UVakgekC9olDm97H
	 Lzkb4mNXJTAFQ==
Date: Fri, 14 Nov 2025 08:52:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Gross <agross@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <354exsajyhyicn7xkdefigrpmh3sbnacz35bke5ufgybwdqotp@27544snjqozv>
References: <20251114170125.2a8f6f3c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114170125.2a8f6f3c@canb.auug.org.au>

On Fri, Nov 14, 2025 at 05:01:25PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   1a0eea58d21d ("Revert "arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature"")
> 
> is missing a Signed-off-by from its author and committer.
> 
> Reverts are commits as well.
> 

Thank you Stephen!

Regards,
Bjorn

> -- 
> Cheers,
> Stephen Rothwell



