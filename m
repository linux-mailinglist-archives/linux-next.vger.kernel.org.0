Return-Path: <linux-next+bounces-2156-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC348BA774
	for <lists+linux-next@lfdr.de>; Fri,  3 May 2024 09:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDF74280EB6
	for <lists+linux-next@lfdr.de>; Fri,  3 May 2024 07:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7081465B9;
	Fri,  3 May 2024 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSX52PbF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A275812B89;
	Fri,  3 May 2024 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714720425; cv=none; b=aTnCMGIVtkpAOGlUdEVCHXcDgmf34zkbq5rZSZ2novlHleNpz/LPQ8pLAWCekywDF3IYDNUiPHOnzXF+X8NWc484N355TxitSWt5Ht4sADCZNDr31LGXyvMCEA2YMn1zWcFsy0lNA/PGqmUnoTvV0jmiGrfzQwWCAuv8mb7DS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714720425; c=relaxed/simple;
	bh=Ag7+4LcV9iIaBjjMUKa2lQBWWGPrJqJbo+Ayi78c3Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sraXKodqmlK1kPO/Xmds1+kfu8b/Eu59C0Yc9bZpWJZec34hFfakoHXWJNAAN4dzYL1aH3T/cVE4di2zrI2MjXq+TjqECeu7JYWQZzjrNPBDyvJlNyecZa5s1ifIdG+Snzz1qDoAy0BAgn8DxQcfXqjfgtua5GzPOY9PkUH+ZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSX52PbF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7097EC116B1;
	Fri,  3 May 2024 07:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714720425;
	bh=Ag7+4LcV9iIaBjjMUKa2lQBWWGPrJqJbo+Ayi78c3Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSX52PbFUtMy568+zE01FaGCpDTaDJN5ChvoS7wtLJsKA1DGNSNmRb5430TCePefC
	 rmS9kgXYEAKZtCwwGSJtvFKE2X6tL81wXSZGDl0/Kofjvg1rwC795naZQwhcJ8DAz7
	 YwbmLnegPH50614JRn99s9l5pHqSQWotLy6MT4cRH+BKRXKl/HSjzOo4nyQ2z3tNDl
	 MPFc2LadnIj/RoTw/HrRQDLQYb/WPAUyObTgM5zimgqrINb27VUqNwNl+hBbcoDjQj
	 1y16Zw+scwFG/FmL6NVv1za+XGqgYWTABDoN23NTDpo7kXE9/GTHTfFWxGOwXS33Lq
	 rzDTgbEg6zoBQ==
Date: Fri, 3 May 2024 08:13:41 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the devicetree tree
Message-ID: <20240503071341.GC1227636@google.com>
References: <20240503141548.68c2b106@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503141548.68c2b106@canb.auug.org.au>

On Fri, 03 May 2024, Stephen Rothwell wrote:

> Hi all,
> 
> The following commit is also in the mfd tree as a different commit
> (but the same patch):
> 
>   828215066d88 ("dt-bindings: mfd: aspeed: Drop 'oneOf' for pinctrl node")

Rob, please remove this from your OF tree, thanks.

> This is commit
> 
>   8f553c27697b ("dt-bindings: mfd: aspeed: Drop 'oneOf' for pinctrl node")

-- 
Lee Jones [李琼斯]

