Return-Path: <linux-next+bounces-3367-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3000C95881C
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 15:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0195B2248F
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 13:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBF518FC80;
	Tue, 20 Aug 2024 13:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXFQBR0L"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C9010F4;
	Tue, 20 Aug 2024 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724161391; cv=none; b=djwnzeBEoKY/byWr76+IZRw/2L/dgLsUqPi390b9N958FGaHP43s/A3z7km2V+4XFTORNw+puPDFop1FeK5kWKwwulzE/qrAI0lDrw2sQvKlyERzqn7m/65RuIftpopxFYqsdFUy84o+jUr+Ew2xjQkD7jWdGIuA930cvVpLUpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724161391; c=relaxed/simple;
	bh=ytPYeTOi8Qs9TffoHZ88fpx3beDsLeOqx8eqjOdQafE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgBj/1zwyzxhGORNiOPC+bvImhQaMwYJhSbhMsxqh0JcW4+26YUzSbO/uEISuEC68hcqPcx9G/XJgB+WLNwdn3ayz+LDMle8vUpt9FddIurzdr+gWKBkzoyZWoTxaInJVvQPpqLg6q9bUnFPEhMBwv844trS6wWxjzfD17i+ri4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXFQBR0L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71598C4AF0B;
	Tue, 20 Aug 2024 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724161390;
	bh=ytPYeTOi8Qs9TffoHZ88fpx3beDsLeOqx8eqjOdQafE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sXFQBR0LyKScBJZX2jw8WCQ+KKbQpJkjSNLgUjIh8g4yEB6bckKWPoxhCpUFopsL9
	 afv+Al0PHYticQQF9FEKeYDQgyuv4rveRR2D4R5FJvbDRVCOc7dkh5dCGib/S0N2VL
	 BE1N+XnT+PPvPt9AHnrdC740M3gYrkq2HfX0Cq7rVoxf06yQQbcRq8Qdh7o9bXXQ8Z
	 aPVl5F6Zgm+z0moCB93sflceo9ZBaNoNQmuzEB+yw+kdjLoWrJm1lPtzC54n/bYI5U
	 PLMg85xTtF0VbdDsZ7dPkESGkwAQlElutnBnmsFS/XLNxNTLp3t1QtZxGs5VIAUseS
	 H6rAKyWQzBP/Q==
Date: Tue, 20 Aug 2024 14:43:05 +0100
From: Will Deacon <will@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the arm64 tree
Message-ID: <20240820134305.GB28338@willie-the-truck>
References: <20240819080620.2b149e2c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819080620.2b149e2c@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Aug 19, 2024 at 08:06:20AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   8bb0376fe082 ("ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE")
> 
> This is commit
> 
>   a21dcf0ea856 ("arm64: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE")
>
> in Linus' tree.

Thanks. The change in $subject defeated me; I'll drop the duplicate.

Will

