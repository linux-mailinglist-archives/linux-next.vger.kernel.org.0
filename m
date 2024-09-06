Return-Path: <linux-next+bounces-3653-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F0796FD89
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 23:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1504B20D4A
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 21:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5835F15854D;
	Fri,  6 Sep 2024 21:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEtnz78F"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA71B85DC;
	Fri,  6 Sep 2024 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725659260; cv=none; b=UEq7i21+PZ3f7NUaNNtCNUrE0g+8wY8blYAjX4Soz0LKyHK5b2ggoFOeR3QLZv/OtrN9FcYzXh/OYq2XD3dtk3fCrz1807lp8t93jGdtiBXwrYXCE5TFL/hphTOAY9DpbZn5PEnsGqe+aczBJe0hh8Vk42JHEuTt2uSbzuYSt08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725659260; c=relaxed/simple;
	bh=VpnExuu/oCtrLPrN79vCifxfCZG70C6vxmuSYa4e+Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyoCHqcy6DmL12UcdY+nZspr2TLl1ffNwxiC6IyHfXVPjGsR2674rDJEE+EIq5fV6aT+MDIn1kkM5flXOJCn0YhxMPTQ7S4kgl8NRTs6jcl7/UOo2tvIS3M0UOX3hL73lrOiVmqZI+NFdqUFjr3BM/xG2fmqBFArbRfAkaPHKvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEtnz78F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B1EC4CEC4;
	Fri,  6 Sep 2024 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725659259;
	bh=VpnExuu/oCtrLPrN79vCifxfCZG70C6vxmuSYa4e+Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEtnz78FAP6STg+CnIRUr8/KhWsG+2ZUSr8HbMYg2nb+NbrZyerroWnYzq3mA71O1
	 hZcAnu4ByJ7uUp3dkLlhz1MEVJjX802vFz9CXlnFW1P6guagGV9IPk65U7XS57aGzz
	 UDvRdrX+KXhWLFh8UrUMHlYhSa9aOzI2tpy6eVsZabmiqSaN5MfFRmqsLCUnBzF3//
	 dVdrPPrmzrpRd5p8x9ixunanSZFP8DivFPb3cb0N8kp4XlZoyN7DW939WPJMuN4NJf
	 NpuTFJJrXVjP22BNVVLO0Z111XZWJD8zZ3mHQGdRYIHg/8EOxC9L/9U92bY/Ti1B6o
	 sp7AxL04p10Ow==
Date: Fri, 6 Sep 2024 23:47:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, 
	Thierry Reding <treding@nvidia.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the i2c-host tree
Message-ID: <fsb6a3aqoeyeqg6djzdcqyo4lykbtt4vmwpdb3gsduv6xucimx@xfamxmpsoxom>
References: <20240829100504.091160a4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829100504.091160a4@canb.auug.org.au>

Hi Stephen,

Thanks a lot for your report.

On Thu, Aug 29, 2024 at 10:05:04AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the tegra tree as different commits
> (but the same patches):
> 
>   6302d41b3f7a ("dt-bindings: i2c: nvidia,tegra20-i2c: define power-domains top-level")
>   20b9b216daf8 ("dt-bindings: i2c: nvidia,tegra20-i2c: restrict also clocks in if:then:")
>   cd07e699cea9 ("dt-bindings: i2c: nvidia,tegra20-i2c: combine same if:then: clauses")
> 
> These are commits
> 
>   fd16970c9d67 ("dt-bindings: i2c: nvidia,tegra20-i2c: Define power-domains top-level")
>   e0c7b7fcaf77 ("dt-bindings: i2c: nvidia,tegra20-i2c: Restrict also clocks in if:then:")
>   69a87db435a7 ("dt-bindings: i2c: nvidia,tegra20-i2c: Combine same if:then: clauses")

I think these patches should go through the i2c branch.
devicetree/bindings/i2c/ is maintained by the i2c community.

Thanks,
Andi

