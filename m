Return-Path: <linux-next+bounces-3676-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF8C9712F1
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 11:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 552C71F22BA4
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 09:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC061B29D2;
	Mon,  9 Sep 2024 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7adNKPR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923721B29BE;
	Mon,  9 Sep 2024 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725872854; cv=none; b=jzRVWK/xvwdzC38lCHH2A2FFxmLUQvAxLygfGDSks9yF6G0TswD7OBfxZWILj8WGDUlLhkBzleQdkIee80upJEE5e8zvD/OclixC4uguWKHLOt+afCj2HqqHtxi7yHC/g0smWb6veP1Zw8Fc6GdccfmL25DljMaRlch4Sp5n/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725872854; c=relaxed/simple;
	bh=RIz1hHIb3M7uW1zi2jVvhvBOY+I2eZOMGRZcpzM4ufQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUT0q7BVd/0o8KSqlbvBvAU6GgAUHC5stiDF1rpMmtd40L6PWjVC5wIHylqWqjPacFWjhl1dCJf8LOygq89l3C4t3Du0DsCncI8rH3SU6ogt++xviv+fq7sP+0gqNpbIDq2ZSwPjAgps7dx/KDAqhSmawFRaJ/mC5CCh9sqLlW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7adNKPR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A19C4CEC5;
	Mon,  9 Sep 2024 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725872854;
	bh=RIz1hHIb3M7uW1zi2jVvhvBOY+I2eZOMGRZcpzM4ufQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7adNKPRc058/NdWsfnLe4iMmIxVXjPMU0tPQhS0gv9IOQ1odoGcDe8GO1DcNG+vK
	 yAYgcOPPfkNWIC3aSvJksycWEFQA1q6KQWSu/YAoHuOv8jN8JPmHpm+aZRHI0Kvfv5
	 XWlx5IwKAMcXqM+RkEZkH3FKsmmKfQ3YKHN456wPB9KbRSl6xgAFyCRu5puFBAfFUE
	 MVVFyYRwwQGWLlDHH4mqDncAqnJhULduR1OBa6f5sByO6lPO+j430EVYJ7b4FW2UCv
	 pQ8Lc6I1LE9i2GtTgRYgkkPmbQkRbp7JxzpGoqXF5iMcA8308wGrBgHPOZmcw0ie4Y
	 8C9X1oC7ixWaA==
Date: Mon, 9 Sep 2024 10:07:29 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mfd tree
Message-ID: <20240909090729.GB6556@google.com>
References: <20240905164254.71e53f73@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905164254.71e53f73@canb.auug.org.au>

On Thu, 05 Sep 2024, Stephen Rothwell wrote:

> Hi all,
> 
> The following commit is also in the sound-asoc tree as a different commit
> (but the same patch):
> 
>   555fa39ba1fd ("dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC")
> 
> This is commit
> 
>   761cab667898 ("dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC")
> 
> in the sound-asoc tree.

Looks like Mark accidentally applied it here:

https://lore.kernel.org/all/172544860860.19172.7052813450885034844.b4-ty@kernel.org/

-- 
Lee Jones [李琼斯]

