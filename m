Return-Path: <linux-next+bounces-6330-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B79A8A971A4
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 17:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 298907AF030
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 15:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5983D290BBD;
	Tue, 22 Apr 2025 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMLYfyBY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D4228FFCC;
	Tue, 22 Apr 2025 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337069; cv=none; b=YfacJmjpuLnyESNH7A7oo9MAzFYFKPc7ZCri2bXy89qILqWixf19rYTSv3ZjgG4izjm90K3mcL2xLiB+lb0sK74OipXfHW18j/ukyPk0wuWTFyIJg4WjD6p22aRXnL+Y+WgbDBJtWwiQie7ciNeJX/XXtevNmCPKvXTbGoXyg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337069; c=relaxed/simple;
	bh=HicLGLkGJ2EafiaLgEOXGmlAFfue+wEk3EKWg/3r67Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGvQhKRsdBMpVGJPykivHS9kJcqbO7oqiApyWJL3uha8wDZ1A6/iP7/jJhxnPmUDp4niCBlZ+xnDUZjuaQg1kYDe98R1EbYNLLBHaCfpdaUFKRa5RtkLAE1TGq8QDxq27NlJoiyf+bsKm8oAV/2W1DWg23fV1sP/wFL3HZWIpAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMLYfyBY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A558CC4CEE9;
	Tue, 22 Apr 2025 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745337068;
	bh=HicLGLkGJ2EafiaLgEOXGmlAFfue+wEk3EKWg/3r67Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMLYfyBYA+3lmcESkGUsaHzvE2brN3C2y9Qw/cXqpOAwkwCaMAoNl7Ct58XbiEpOY
	 z/CrLxgcZsj5XuNwXTO4QK57c5iaPG3bEciN46EzAkr7HZd/xtXfdqcNc2FC/erS00
	 Vxn1hN3M6I85r33kH3OSrjJkGPblP5vlmdTLPFUOt4E7QQlSA2tWtE7Mwg0sqtg56q
	 gpvll+meO6g5+liEAsORseviTB7+VH0vioLzrSaDGrEGlOkv8f/oaIEHr9guaQ1tM7
	 ZoQsj+aBqkgC0PYKkfQ2wpv0ZYy8JIedFbKDpW2MbLycC04+pbnpfEqXOhWcMJOLSx
	 yWAbzz/fQsAyQ==
Date: Tue, 22 Apr 2025 08:51:05 -0700
From: Kees Cook <kees@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kspp tree
Message-ID: <202504220850.F5647C68@keescook>
References: <20250422194458.074ed355@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422194458.074ed355@canb.auug.org.au>

On Tue, Apr 22, 2025 at 07:44:58PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the char-misc tree as a different commit
> (but the same patch):
> 
>   e166ec7e7164 ("misc: bcm-vk: avoid -Wflex-array-member-not-at-end warning")
> 
> This is commit
> 
>   e1ee28b12675 ("misc: bcm-vk: avoid -Wflex-array-member-not-at-end warning")
> 
> in the char-misc tree.

Thanks! I will drop the one in my tree.

-- 
Kees Cook

