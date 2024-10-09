Return-Path: <linux-next+bounces-4191-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC9E9976FC
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 22:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F441B2134F
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 20:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E7A1E282B;
	Wed,  9 Oct 2024 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RGdLAoHq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DD41E261C;
	Wed,  9 Oct 2024 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728507215; cv=none; b=RSX/Ag+zUOX61Wv2+iLri5NvNiuH4E4SNJvzGIUQiOw9sVILBI70HFZ8fuj54kUMlWdvN+VnVE0CDRM+2nt2sutYhutw4Co8t36hbhgIzoFpIUN9NefJc8FO6G07vG8ZX/UwWmQ3LMjVuzhAG/y9o1V1trBz7RdsYmazYqoWJFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728507215; c=relaxed/simple;
	bh=FcJRErXKWZeyLJXsOZFTRdu9dQaNgwhiRsBx9Yx1msw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iozhX8U413859+ykRDnU6uaUZ3B9/IAAHn9cmj3KzNCuzITbrSHNwvA5cRI4CtL3r/oT9AyPrmKX1lnNDmZvAmlLQ3VLld4KzvtF1cZWpYfgYXaZ4H8M6vgJHJ90BUQeV+rG223fs2kfMlGVJ+VvdbgRIzkAErWVCnerhbtvuI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RGdLAoHq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CEFC4CEC3;
	Wed,  9 Oct 2024 20:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728507215;
	bh=FcJRErXKWZeyLJXsOZFTRdu9dQaNgwhiRsBx9Yx1msw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGdLAoHqDhMPhThS6WboV0n8T0pbrH2j5Ccj7HZxLCbGXgIaPwUxsjisE08oYVC+Y
	 qahBh2nuv8HxDP+HP3o/jKtufyEey8tPUCsfR2hnsR59JobBzNgA3k4s1gahzXrAce
	 JDWUme9qd72FY8x/f542eVq2Wmz/kfYrBCwL/lpA=
Date: Wed, 9 Oct 2024 16:53:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the mediatek tree
Message-ID: <20241009-prudent-pompous-sheep-40ed20@lemur>
References: <20241009071543.5230cf79@canb.auug.org.au>
 <c97da0be-6924-48de-9cf3-0ba9d5e6a73e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c97da0be-6924-48de-9cf3-0ba9d5e6a73e@kernel.org>

On Wed, Oct 09, 2024 at 09:52:14AM GMT, AngeloGioacchino Del Regno wrote:
> >    65b99309a9c1 ("arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns")
> >    025869564bf8 ("arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns")
> >    3d3bc7cb46e8 ("arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns")
> >    5bbddfd0470f ("arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns")
> > (The above also has an empty Reviewed-by tag)
> >    ca80f75083f6 ("arm64: dts: mt8183: set DMIC one-wire mode on Damu")
> > 
> > are missing a Signed-off-by from their authors.
> > 
> 
> The empty R-b happened because b4 didn't interpret "<email>2" correctly
> and dropped the email entirely. We should probably report that to the authors.

Consider it reported. :) However, I'm not sure I understand what the situation
is. When I pull that series with ``b4 -slH shazam``, all the trailers are
properly preserved as far as I can tell:

    arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns

    Add i2c2's i2c-scl-internal-delay-ns.

    Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
    Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
    Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
    Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
    Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
    Link: https://lore.kernel.org/r/20241009-i2c-delay-v1-4-6cf59721c1d1@chromium.org
    Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

-K

