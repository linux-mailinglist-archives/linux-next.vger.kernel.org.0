Return-Path: <linux-next+bounces-4212-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 186A0998203
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 11:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F6BE2820D5
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 09:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AB51B3725;
	Thu, 10 Oct 2024 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZOwPCur"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D0191F8A;
	Thu, 10 Oct 2024 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728552068; cv=none; b=Eib7ZMU6X3XqSyQ842VhRkz//W53SR+OTsllO+P90VQIsq+8+K6tBn0HZsjG+44esOEfTAvyVqS/Rc484bGApzS4IfP/FZyWAqADw7hN26ORI/Chqe/vvfY3cStIt2FcHfb1w79QaVTN68cd7LXS6xgU4x9B+MGMcTQXzQbJT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728552068; c=relaxed/simple;
	bh=DVtkKdBl4gGNd14b0H36kxwMP6Sl7kkjAhWjqX+n3+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f35ahk3JA9en8W7MmPmVwjV6gIiiRNPpmUWxHutKWGaIu+g5QPR0DzrawpxrbMXHdWZtafaYI2mZ2S7CZoJwlKOqKBnGeVdgFVkc7IxETaXqxUBjSqZby/j4q4nY+SMXqOlUC6u94f1MGFUX+Q0bKP4dFHZ5ACcl+FSng8l8IEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZOwPCur; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29556C4CECE;
	Thu, 10 Oct 2024 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728552068;
	bh=DVtkKdBl4gGNd14b0H36kxwMP6Sl7kkjAhWjqX+n3+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dZOwPCurqQKWy9tFi+MBOT02NkPfyw2TFnKlFE89f9dWgUUYYJZbd8K2PzlgA6C/5
	 fbhWVhAjdQ9yIxfA33Th+mDVzISGOHOayjpcTmXGSuGkrEIvFXlLOzwZH8ZoVygUum
	 tWrH4Mxn2JvCr99FHFTacMc7rz65UVNKrzpyfEVm4BOAhAtTSOwALnHrR6uAkUClLs
	 2uhd1qsbq9IyeuPqQeUP9ZLunTmYfR0RjH2hl85lnw4S2Z04S9/xqf3Gb8esolN/3A
	 RcO5M6STZIiNFwsSkRoNHWwfG1inwu28MOgdFTG4dLL0yAZH9ALKc2pVIk99e73UPf
	 Oj9K0bROt6Anw==
Message-ID: <3507990b-bcb7-4412-8fb6-aeb9407acde7@kernel.org>
Date: Thu, 10 Oct 2024 11:21:03 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the mediatek tree
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20241009071543.5230cf79@canb.auug.org.au>
 <c97da0be-6924-48de-9cf3-0ba9d5e6a73e@kernel.org>
 <20241009-prudent-pompous-sheep-40ed20@lemur>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <20241009-prudent-pompous-sheep-40ed20@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/10/24 22:53, Konstantin Ryabitsev ha scritto:
> On Wed, Oct 09, 2024 at 09:52:14AM GMT, AngeloGioacchino Del Regno wrote:
>>>     65b99309a9c1 ("arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns")
>>>     025869564bf8 ("arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns")
>>>     3d3bc7cb46e8 ("arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns")
>>>     5bbddfd0470f ("arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns")
>>> (The above also has an empty Reviewed-by tag)
>>>     ca80f75083f6 ("arm64: dts: mt8183: set DMIC one-wire mode on Damu")
>>>
>>> are missing a Signed-off-by from their authors.
>>>
>>
>> The empty R-b happened because b4 didn't interpret "<email>2" correctly
>> and dropped the email entirely. We should probably report that to the authors.
> 
> Consider it reported. :) However, I'm not sure I understand what the situation
> is. When I pull that series with ``b4 -slH shazam``, all the trailers are
> properly preserved as far as I can tell:
> 
>      arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns
> 
>      Add i2c2's i2c-scl-internal-delay-ns.
> 
>      Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
>      Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>      Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>      Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
>      Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
>      Link: https://lore.kernel.org/r/20241009-i2c-delay-v1-4-6cf59721c1d1@chromium.org
>      Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> 
> -K

Uhm, maybe I'm using an older version of b4 - I admit I haven't updated it in the
last (more than) 6 months.

I'll recheck as soon as I can after updating.



