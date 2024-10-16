Return-Path: <linux-next+bounces-4298-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FA9A0112
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 08:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9DD7286449
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 06:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147BE18C03E;
	Wed, 16 Oct 2024 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjNh1G9q"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E460B8A;
	Wed, 16 Oct 2024 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729058832; cv=none; b=ipnm5ArP/We0ZxqeEJ6TTTAho0mWGsu5/nYYbIgfyaaYqvpoxsu1/JsXoSO3OAh37uiv7d9hGCL2vQG8HCvgy8DJyKuBhpILoQ/Ew247DMOB1a2TRtqYVWHPyoisBLM3kbEI+BQA2UOGfdDRj6gNbw/Cd9g3u4vOfEQxGoyGlz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729058832; c=relaxed/simple;
	bh=4PgNDxBZkVMRBn1KB7TIIEla3FS3ARilWCvrHEntbcY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMthceChOC4Lez+wasMy7co7FptT2yP4az/JXZnOvzPzuPkW5LhxOxkTm90iEL6t3xcNKU+ZR7yZGxOz0dmoc9xHxhtov3PDn1lOYIXLijOtkflMrGG4mHp9rAgdHa8HI1boxQdUeIhivXPjedervpiRSAJLQSGccU53sl30TTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjNh1G9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A90FC4CECE;
	Wed, 16 Oct 2024 06:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729058831;
	bh=4PgNDxBZkVMRBn1KB7TIIEla3FS3ARilWCvrHEntbcY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DjNh1G9qhaV/8sXAtMVDqMes+5fNnNykXHkdNwJmttG9BkYKQuL0lXnhDviVRcxkD
	 GoRR7sIkqNRaFAa5VV6FicnDUkEPGXju/wVrDgT6fE1n3KI3/fbed60Qeb5T6sUYbN
	 p0uYewzIVftMCsmJPXAu9o2k5h+CXAt0nZtE/B97XbXsDElIoj9WNsMwtuXQHxsgr0
	 FsV1WWSyU9oMZfhswji+FOnGLVl0RbzOlGe/lI0AUI2+NeEJWEU36L6cHxhQtZH1sl
	 2HpQsFIicggrPHd4qHMgUBW6zRnOFvpHR1ILK2f/iWYcQkJqNXiycmDhV2TvJfbqMX
	 PmyrjvotfhESA==
Date: Wed, 16 Oct 2024 08:07:07 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the v4l-dvb tree
Message-ID: <20241016080707.06de0204@foz.lan>
In-Reply-To: <20241016113641.646f55fa@canb.auug.org.au>
References: <20241016113641.646f55fa@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 16 Oct 2024 11:36:41 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> The following commit is also in the v4l-dvb-fixes tree as a different
> commit (but the same patch):
> 
>   bfe703ac0c9f ("media: dvb-core: add missing buffer index check")
> 
> This is commit
> 
>   fa88dc7db176 ("media: dvb-core: add missing buffer index check")
> 
> in the dvb-v4l-fixes tree.
> 

Originally I was planning to send this for next, but after sleeping
over it for a few days, it sounded better to sent it as a fixes.

Thus, I ended cherry-picking it to the fixes branch.

Thanks,
Mauro

