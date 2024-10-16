Return-Path: <linux-next+bounces-4299-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 621679A0130
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 08:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 184A11F2199E
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 06:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7933818C92C;
	Wed, 16 Oct 2024 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRvScDKu"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1D660B8A;
	Wed, 16 Oct 2024 06:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729059264; cv=none; b=psQjOcfTH+Twi4ek+GXSlo+CahnVgZ4tyzu16OrzYX7wKW7qSFfUIHLCFGt+GqHBVh3kYDiYSDeycTEh9HHjpsAhBgDpEY2mwNEoE6eVZHdJN9tGDQQZTa1o+fm5g4Vdd7EKXKFdQMcbyQal1Tzxd+pUGOXebvEA1Zpd0eF8/J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729059264; c=relaxed/simple;
	bh=sgMzyRTcOEO1atzsyqx0fDwlPpsbPeC3GMb+FLaG+e0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUTUgzkwtwagrnBa0kmtI4oqAd8tKZcjaejZyte5pVvEoxKyMwxjAlAtML0UXiCobFvNISc9AyK6khybTis4kJ8lCE0LyapMk+azf6157s2MPIrf4L8AoQNgO3O278X8bH/FYBMUt4PnOYS7HZEof5A0EILDx3ibiWgzHa8xvKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRvScDKu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694EFC4CEC5;
	Wed, 16 Oct 2024 06:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729059263;
	bh=sgMzyRTcOEO1atzsyqx0fDwlPpsbPeC3GMb+FLaG+e0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SRvScDKujLsUAYKg/1cBtcDVabHjBsXjndfJd3yksIAjgnhVAskEXQGzr9s6PRvWY
	 jFoXwjX3vVXGF09CBeBKoVcrKdeIa5LimfuA7jQWv0BTVahEsP2bBkjj9WNI+qDYtO
	 xO9bcbqk5CM19/LNUID4wmzSSTb5HyrLMvogkmgw1dXkH8CxYN95x/FYb7ZyAMcnPz
	 wPYDQZ0hUgrjKlbkXpp5G/wTDuU/yPQTRXb1SejIiQjd1RJ+iKo4xkt4PGEcTeTdh6
	 eG4jEc7n7UlqPEuN0BwSCYk/yBindSrHobDF8uXvv/Q8+i6QzTagk3qHxsyslDTq8s
	 f2XNmrTInkRbg==
Date: Wed, 16 Oct 2024 08:14:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: linux-next: duplicate patch in the v4l-dvb tree
Message-ID: <20241016081419.1d65c93d@foz.lan>
In-Reply-To: <20241016114013.37522900@canb.auug.org.au>
References: <20241016114013.37522900@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 16 Oct 2024 11:40:13 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> The following commit is also in the mm tree as a different commit (but
> the same patch):
> 
>   c5120f3b20a1 ("MAINTAINERS: mailmap: update Alexey Klimov's email address")
> 
> This is commit
> 
>   d6f369d3d989 ("MAINTAINERS: mailmap: update Alexey Klimov's email address")
> 
> in the mm-unstable branch of the mm tree.
> 

Heh, Alexey sent it for both Andrew any me:

To: mchehab@kernel.org,  akpm@linux-foundation.org
Cc: linux-media@vger.kernel.org,  klimov.linux@gmail.com,  srinivas.kandagatla@linaro.org,  linux-kernel@vger.kernel.org,  alexey.klimov@linaro.org

making it being merged twice on different trees.

Thanks,
Mauro

