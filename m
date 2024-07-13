Return-Path: <linux-next+bounces-2983-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7031930426
	for <lists+linux-next@lfdr.de>; Sat, 13 Jul 2024 08:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECEDE1C21076
	for <lists+linux-next@lfdr.de>; Sat, 13 Jul 2024 06:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CB01BDCF;
	Sat, 13 Jul 2024 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfj3khxG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4181AAD7;
	Sat, 13 Jul 2024 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720853812; cv=none; b=ZyaJQ4a6QFJQNhhwSI+twB68jSdtWgs+ntj+Tx25uSOblj0kXYYk/sM2sdp6mfMZuIwhdd6DCcxfqXVC13/oRspb+BZpySL3stdsRm/zfYgIKep6RdsPUnfqBc0hqO5yGnz9E8Ag1pfdhH1lge1iDi4fjn8KjKCgKWu3U/uw2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720853812; c=relaxed/simple;
	bh=AO2zhQ6NY+7j4iOWmqDHqHMD3UBdDyrD45oR3qQTSy4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bk8QZPLqkyGtg/UB2ZLQUWHTf7wX4pVUCu3pFxkTlDQ8ai45koIxUak0AQqyFncKaO8spYWLTVyasw/gScJOXcmdrVEV7roZq62kGZijblFa/j17M29IFFtKQ2u3Db8twMqGBI1O0bWk5Fj5CnGbsikmhs4aHe10AsuzzIVZajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfj3khxG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3524C32781;
	Sat, 13 Jul 2024 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720853812;
	bh=AO2zhQ6NY+7j4iOWmqDHqHMD3UBdDyrD45oR3qQTSy4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=hfj3khxGFoGoVUta3Ao5Wfonh2XSFrOLKldhTDNITdNTrW66JSTo8HtyL9Alhb1//
	 ue38vI206xMK7mtjZJr/Ol7P4XobGoltqOF0h/Q1mGr242PG1zSHg3+8rJCpn5Sgk/
	 ucos8MDaAWQRZfO5eKossFLbGZ/Rh4bF0qHFrHKsg6SROBAHlTgr1CNiE18wwecHDj
	 hmHvAcxrZvansguJinwtwGMf6IPEzlZ2iUxUhSZu5mzsUX67NidnFEqn3Razawyzrw
	 mNB0O13FOmfL16/TJMeI2rueXDFuJ2kgaovr7hAPXaCZMHP8+zu2zlEx4pVEI+ggdy
	 dec3bYJzueI8A==
Date: Sat, 13 Jul 2024 08:56:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the i2c-host tree
Message-ID: <yogbvwx3rqxpqv33sm7irvrdjvebi4hgcwn2w45s6hodyko3qb@my7kojqeydcr>
References: <20240712165527.75e4ddc9@canb.auug.org.au>
 <ZpDVAG2p_v5DsZgY@shikoro>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpDVAG2p_v5DsZgY@shikoro>

On Fri, Jul 12, 2024 at 09:02:24AM GMT, Wolfram Sang wrote:
> > include/linux/i2c.h:583: warning: Function parameter or struct member 'xfer' not described in 'i2c_algorithm'
> > include/linux/i2c.h:583: warning: Function parameter or struct member 'xfer_atomic' not described in 'i2c_algorithm'
> > include/linux/i2c.h:583: warning: Function parameter or struct member 'reg_target' not described in 'i2c_algorithm'
> > include/linux/i2c.h:583: warning: Function parameter or struct member 'unreg_target' not described in 'i2c_algorithm'
> 
> Ouch, yes. I will fix this! Thanks. Seems like regular buildbot builds
> do not build docs when they were changed?

apparently not, because I received only build success messages.

I will add the docs building in my test flow.

Thanks Stephen,
Andi

