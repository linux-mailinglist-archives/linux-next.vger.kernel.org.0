Return-Path: <linux-next+bounces-3122-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A5F93AE3C
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 11:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF761F2287E
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 09:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C742554918;
	Wed, 24 Jul 2024 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKnfrur8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7561C6B4;
	Wed, 24 Jul 2024 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721811637; cv=none; b=adGXPMMvrsIvzdAroS9/Yvw4KFydrJk7HjhMhmHSQCTtT4KEgbUGJeNmLljKyv92X2BjdFuxTUDr1AKcbb2364uEtzauVkl6uPZHC4Vlh/XKDIAcfjDM1aAN9Iez5lGA+OJoXi68Tk3JatFVB0Cf/6RgZHyR31pLLU8i59kmeSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721811637; c=relaxed/simple;
	bh=F4O+Zf9qZR+mayJlSoPggC7LSwt3hxqj2dXIYA9zuVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxLtAWqEaOH0UhAAvKDPyp7nZ7DfjshOy0dGa9X4Eus1qUgd1VNSFLXlkosgz6FC2481ABuuTd7gWPeOMZV35fiwSRIdPoSss6NDGIO5PJYrC4YNLYsz1TxwlCP9N0/qT9zy8VGxXKrBmJX1H93PrDNgAuoAAVK3iRwPH+3N3Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKnfrur8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F14C4AF0B;
	Wed, 24 Jul 2024 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721811637;
	bh=F4O+Zf9qZR+mayJlSoPggC7LSwt3hxqj2dXIYA9zuVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKnfrur8MnE5bsGXbjkfjIw5Jki3VFsIGz52Camyw3RntcmwcRHGwuVTkrG32t9n8
	 blH0gTFWsF4KmbWmW8Ww82rQtonqKzwNHo21hb4yGkUt5dIa3qh5Y+qadCULVji958
	 umYtzu4dUPLGbBS94ikOQezyiU4gqb16X5wCy84OE3E24RcrxpX51qONqI94kQ3T/P
	 dcEZtVjy2inE5ZzO9V+fb/Qhlnybg7kV+kTddO9AvWZfIxxQ30Fis0CrznSWDmIxXd
	 fyK+ZTir1TFv5ZU443PjoQvCNHKTnJEDAnN1gtBPkcbJdvjHZRIbkqWYK34eK7eWLe
	 0gHiLj7AtBnzg==
Date: Wed, 24 Jul 2024 14:30:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the
 samsung-krzk tree
Message-ID: <ZqDCsdWy7Uq7m9Is@matsya>
References: <20240703141932.47e51748@canb.auug.org.au>
 <20240724091458.3052dc6f@canb.auug.org.au>
 <a1b7ce4bce1826e9c231677bb221aa44dc842e24.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1b7ce4bce1826e9c231677bb221aa44dc842e24.camel@linaro.org>

On 24-07-24, 09:57, André Draszik wrote:
> Hi Stephen,
> 
> On Wed, 2024-07-24 at 09:14 +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Wed, 3 Jul 2024 14:19:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > Today's linux-next merge of the phy-next tree got a conflict in:
> > > 
> > >   include/linux/soc/samsung/exynos-regs-pmu.h
> > > 
> > > between commit:
> > > 
> > >   85863cee8ce0 ("soc: samsung: exynos-pmu: add support for PMU_ALIVE non atomic registers")
> > > 
> > > from the samsung-krzk tree and commit:
> > > 
> > >   32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
> > > 
> > > from the phy-next tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > > 
> > > diff --cc include/linux/soc/samsung/exynos-regs-pmu.h
> > > index f411c176536d,6765160eaab2..000000000000
> > > --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> > > +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> > > @@@ -657,8 -657,8 +657,12 @@@
> > >   #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
> > >   #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
> > >   
> > >  +/* For Tensor GS101 */
> > >  +#define GS101_SYSIP_DAT0					(0x810)
> > >  +#define GS101_SYSTEM_CONFIGURATION				(0x3A00)
> > >  +
> > > + /* For GS101 */
> > > + #define GS101_PHY_CTRL_USB20					0x3eb0
> > > + #define GS101_PHY_CTRL_USBDP					0x3eb4
> > > + 
> > >   #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
> > 
> > This is now a conflict between he phy-next tree and Linus' tree.
> 
> What's the way to resolve this? Can I do something?

Not much to do, conflicts are expected and Linus will resolve it when he
pulls phy tree

BR
> 
> Cheers,
> Andre'

-- 
~Vinod

