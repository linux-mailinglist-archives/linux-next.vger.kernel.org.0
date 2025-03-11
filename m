Return-Path: <linux-next+bounces-5729-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42375A5BC6F
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 10:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE633B281A
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 09:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB99B22AE7F;
	Tue, 11 Mar 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcAzJZM6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B3C1684AC;
	Tue, 11 Mar 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741685943; cv=none; b=iMZ8WTxDFYJhsqFqQb3t2zl21ZnrKUP4JJzQp6VIV+9zbWrTYKobyTm/twSkB1jDknuE6Iiq7m6Yy1MEMMAj+lhHQMcJhhHw/XPV0s+4KQNZxXQNy6sGGrmIWH8gvfZoBBwA/m7cMlEsix7ZHizKYnvIxKZjgewrVoK74nIsJks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741685943; c=relaxed/simple;
	bh=gRg/q8twr+YTzW4cUcFF5SHIADqji6e2NwvbHE9FGlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqTcolmzPOdEBI2lsUYr7LY8MlFQLama2xE4X0bUmwkn+g5Oh7huMqabcocSgEQRhrD/OSSoI8xh8al3rVC8JSCCVuxN0PzjUHmgFB2C2SxQQUEfhONCYWOPw2o4EosptKqwuvwYnRDJd3juTbh2wDJwnnHNtPZ2MPdkaMic2Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcAzJZM6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EC0C4CEEB;
	Tue, 11 Mar 2025 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741685943;
	bh=gRg/q8twr+YTzW4cUcFF5SHIADqji6e2NwvbHE9FGlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcAzJZM6aOsnUyIZ5c4HCXWZIjfLMqv20qbfNM/zp4tW6quk+v3Al10YqW/5MkVXH
	 HkafMEQ7Twu86uDAkvs50YSQdvE8FDO4Px01EsdPD8BKWjVirU0708s337gDIAWwb3
	 9G1ef2DJRTz0+1Imymb83DVDWPNKuPpKcgo2x5S3V/jqpLJ42+Q6S4Tjuqd7r4Cn6U
	 QY1HRQ5BejSs91Sdl41PsonAwC6VYA7OBP7ajgYbpc58nTKj7VbCnEcniyo27F7YFX
	 0FK3wAJso8t4KBRp7k4lqkQNnJ4vklb/tG3a4qUoKNpDMAPUWmdK7De+UmpWwkK4HC
	 KibIqj/Pxlpdw==
Date: Tue, 11 Mar 2025 11:38:59 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <Z9AEs_VgFBrl9WS9@kernel.org>
References: <20250311081120.499c3326@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311081120.499c3326@canb.auug.org.au>

On Tue, Mar 11, 2025 at 08:11:20AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   e2a88fcd249c ("tpm: Lazily flush auth session when getting random data")
> 
> is missing a Signed-off-by from its committer.

Oops, sorry. I fixed it up.

> 
> -- 
> Cheers,
> Stephen Rothwell

BR, Jarkko

