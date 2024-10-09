Return-Path: <linux-next+bounces-4175-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7175399616D
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 09:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 277C91F21599
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 07:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604AD183CD1;
	Wed,  9 Oct 2024 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNpT/imY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3689B17C7A3;
	Wed,  9 Oct 2024 07:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460339; cv=none; b=KfJ7KxeoyiEmH+aMTQtXQ+PtePD7xBMBURgDJv1ENm7gFrOq//q6gUdWJ592ZW2goN/rclWGGquJDUsXcQ43dAEldMlwCxUWJ4AlaNMlr6GIpg44yB+akkuadWTop2sQx3IJ22NwwFsVe81G6yZEoBaiC3forUytPB0L043aucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460339; c=relaxed/simple;
	bh=JA6rBMPyxQNoe4zKoQbofT+23r4z3tXhBEaBCamQqJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFklHY4PqlrZ7aVO8K9w1BdmEVX21UVvX8xL6EcXCXsDcqVldVATvU2dRMF7lvd87CucyHTSAMA52TokhenjFYn4dwJEjo9YFic6FBSuq8EbROsumOUF2tEE+sFO3ItYtlg1N26NdTTgEQibPmUQhvYgDgk8M4TBZzVyFs8mr7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNpT/imY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D92C4CEC5;
	Wed,  9 Oct 2024 07:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728460338;
	bh=JA6rBMPyxQNoe4zKoQbofT+23r4z3tXhBEaBCamQqJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hNpT/imY9NzpPaMdgQsSxexdQm3+P2Uyxoj0VWptJolF3PQOFLb8V5mzcU6+M0PIn
	 iMsmXcjDwUXKWKe5HCVxBRW59BG9HPgq+3bmlWCUpMefbsdjAHkdAD9rfORsKNhRe1
	 +iLB6L66OC29FswA5+vONQABzU4FUSs0EM7aMoN131OZdZJYdk4EzBNiJWzmoGTXf4
	 ffYaXQT1WbmluSE9a4ydYzLFNGSYbG/2+c5F4qb2ylD+XvxfU0awXycr71RO2G8UBC
	 3NNRXuHPLil31yvEAasuCE7qEQKtT36XYcYh0s6qhDcfBQxEubFeM2cBrRJGXcA5Ku
	 CxqpgneZUsSCg==
Message-ID: <c97da0be-6924-48de-9cf3-0ba9d5e6a73e@kernel.org>
Date: Wed, 9 Oct 2024 09:52:14 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the mediatek tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20241009071543.5230cf79@canb.auug.org.au>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <20241009071543.5230cf79@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/10/24 22:15, Stephen Rothwell ha scritto:
> Hi all,
> 
> Commits
> 
>    65b99309a9c1 ("arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns")
>    025869564bf8 ("arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns")
>    3d3bc7cb46e8 ("arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns")
>    5bbddfd0470f ("arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns")
> (The above also has an empty Reviewed-by tag)
>    ca80f75083f6 ("arm64: dts: mt8183: set DMIC one-wire mode on Damu")
> 
> are missing a Signed-off-by from their authors.
> 

The empty R-b happened because b4 didn't interpret "<email>2" correctly
and dropped the email entirely. We should probably report that to the authors.

Anyway, dropping these commits until Hsin-Te and Daolong clarify what to do here
with the S-o-b tags, I didn't notice that the author was different, there.

Sorry about that.

Regards,
Angelo

