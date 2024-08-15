Return-Path: <linux-next+bounces-3333-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7659537DA
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 18:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1081C20366
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 16:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EFD1AC8B8;
	Thu, 15 Aug 2024 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttttKMZC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FACF39FCF;
	Thu, 15 Aug 2024 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723737764; cv=none; b=ajndih41VxINC+6/kwzjzffWY2qlE2mI44ghgKfGryCutAN7iYrIFCylmJ8OkrMaSkTrFgkmZWtHVsDv92b4KYADjaZiUHEbH3I3tpywJ3h+mgxzndCpiTbEmvlIZKK8Z/u5GmKNfSVCsO1LjqHIbpwoOWdyXOd36PuQVDEiUSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723737764; c=relaxed/simple;
	bh=FaVK60QYB3c+PjMXSV/vP6gQYWByUoguy4q5/66JKBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHakQwycRL8UAz+KNt2Jh65lRjTIREbE/QeNOzBeKThcn4yczk4s9CLFGAB0k5GL8qQ4lXJPTT6NEzYyN9zaS9QpeCAfzx2ZOTwHwozZB0VE2qUj+kjx0xV9Izr9VaOytM+vWpOxQA/ZUBV4ICSm4XDrW3q+DXGS3cppQDImgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttttKMZC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349F7C32786;
	Thu, 15 Aug 2024 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723737764;
	bh=FaVK60QYB3c+PjMXSV/vP6gQYWByUoguy4q5/66JKBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttttKMZCu/kVGflPn+fLnFLJO+9cmfXLkKlv0eep8CVuLtFipoZj57FdqZ95k+RGC
	 RW/Vs+1KJLivkYSH4fz3Z/GI9rc5OhNdz+WPUPPkDSiDycenqZ+Hze6uvfs+imX1/J
	 knGEwIsuzAafj0C2AIPPi3RNZxlN5grTwLivPYFJlmyZgUQs6/xvEBE/lMpFgDdFzh
	 sZBONAzd3Z+pp+RsQvaKRci4a8pcObvablzgdPVKn/M/DNqfMJGo48YdW9/YZ1zpoM
	 /aOy0bLlmY57erJiJgJEMAiKxAK7V2ht4k7r8E1X6Uau9Ujif0n2LhEV0z/lZ4qg94
	 ksPrQHK/0e8Mw==
Date: Thu, 15 Aug 2024 09:02:43 -0700
From: Kees Cook <kees@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the execve tree
Message-ID: <202408150901.8EC3CC4@keescook>
References: <20240814155421.61d49566@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814155421.61d49566@canb.auug.org.au>

On Wed, Aug 14, 2024 at 03:54:21PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   d5651e09b232 ("binfmt_flat: Fix corruption when not offsetting data start")
> 
> This is commit
> 
>   3eb3cd5992f7 ("binfmt_flat: Fix corruption when not offsetting data start")
> 
> in Linus' tree.

This should be resolved in the execve tree now. Thanks!

-- 
Kees Cook

