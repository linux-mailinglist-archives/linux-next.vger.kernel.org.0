Return-Path: <linux-next+bounces-7080-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E8ACF951
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 23:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BCAA3AFED0
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 21:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E572185A0;
	Thu,  5 Jun 2025 21:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVynhRYP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82A928E17;
	Thu,  5 Jun 2025 21:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749160645; cv=none; b=Y9UXP8wY2Azh+Rf3rsRniFPHTCY6tiD0ihntJRszif+uOp6JCYTdZPr9/OAANIB1is0KuXQIX2SlagvnLjAAyR8DeOTy6lx0On3muB98A1YWKIeCn0bOj2sS9UzGuMZ5BxsaI9LMtYXHgwnhzvtBD2pGPY2SyaKII7P51gUrxkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749160645; c=relaxed/simple;
	bh=yyEdna/iDpLVKx8H6h4Fs4v1G/hCL4k6rMerKYcURrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFq14lczzOsoNRTXuGFZwqcSZy9BBxI9YrCACdcxsDjaP9JaYHCXtLl9ZQXNu9Cc4x5WHdPBA8oQO7tOVcHWIH04oY3Lb5z3nA7hzIc5u786EQ2ofihooJe7XmLqFaFoplqv8wrd/tU+STv216pn5UJrWLCVBaoOzCWGE9TzugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVynhRYP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C35C4CEE7;
	Thu,  5 Jun 2025 21:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749160645;
	bh=yyEdna/iDpLVKx8H6h4Fs4v1G/hCL4k6rMerKYcURrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVynhRYPNUKye2k3h5Pcpb8j+xXJVHXcThhJEL3ZqhKFjsM1MEZgRdkVgHNeyypBS
	 Nyybk/OTKoN+rHloexJHqpDc9goWob6C1QrDZ4Q8o33lGoqImECZfsTyk0XLurQz9V
	 q523Z4S+g4d5anMvNLGJvsG5YlU3kazA1KWaJrlh6FlcZbmoKlhbxauNAGTQ2NZ7wC
	 YrSTSICw8W9k6yKwe8rtF7Pz17fbOYQFxf6+ltxQ4Fy+Sd8b4cUm4UIyXBk8qRgOek
	 7X8+FyLBbosN2hulZcbNOPVu4vKoNeuBdFB7JGyr2snSpJ5yK84neHctGXy82z6WYs
	 pdwLpKlkOD/Xw==
Date: Thu, 5 Jun 2025 15:57:22 -0600
From: Keith Busch <kbusch@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <aEISwo8LR8hG0zyV@kbusch-mbp>
References: <20250606075230.6a13c53d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606075230.6a13c53d@canb.auug.org.au>

On Fri, Jun 06, 2025 at 07:52:30AM +1000, Stephen Rothwell wrote:
> Commit
> 
>   10f4a7cd724e ("nvme: fix command limits status code")
> 
> is missing a Signed-off-by from its author.

FWIW, my Signed-off-by is in the original posting, so it must have
accidently been chopped off somewhere on the way.

  https://lore.kernel.org/linux-nvme/20250520202037.2751433-1-kbusch@meta.com/

