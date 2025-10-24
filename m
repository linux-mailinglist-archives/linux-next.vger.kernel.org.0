Return-Path: <linux-next+bounces-8705-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77745C067F2
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 15:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 893151C02EC7
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 13:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D57A313273;
	Fri, 24 Oct 2025 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="i08pqRE+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8423016FA;
	Fri, 24 Oct 2025 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761312501; cv=none; b=XPD6p+daU5x2D7uIlaPJ3jQBZzxedRerCtk0DHvBoR+FrgP7S0TrQlrcC/MRgOuAAJ5E5Xt1XK19JLUF/0Y7wH5Olwuq9QOnPOeU5g6+xEZLFEhh/tweUtbnPrK6Qx1xSVMPlKrElN5t/zeP91KIt34xVD4hz9JKp9ld/6lJrbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761312501; c=relaxed/simple;
	bh=bmMl5t9MvJrjhUHU8p73ndfEVmY4BnhjXfRozM2a0D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b92OgiCBkTM1nZmNIARSo9fFg2X3wB8jaIXjrV+Tg9Fj6A7jAeTyjIL7GwX58hjMHSetry2LGK2EVJAGt5Zti787IyZ2e0q0Np4rdJH+s+bjAx6yf0mh/oMpkLvIMPE0KC+PWKXU2o5XJuLDoPNTxyJvlAN5/PSdo1tigYr+KlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=i08pqRE+; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761312431;
	bh=hi+OfeFesh1i82R+udn2zKVtEgE9qG4Gjt03jPdi210=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=i08pqRE+K7UOwFO1wk3M6QieTjMJocfchDF+qEEE5H3dayfeIeiBS3iRFGKBOjzAj
	 LVL5/UmEb/83+zu9p+8ZgUk4/cPo8yRDxKVszc7dPyapq+T3wOeGW593mO1we96nlU
	 pKkZgNYsBXjJHGndAsnW0SMk6Mar26OofJlhJpsQ=
X-QQ-mid: zesmtpip4t1761312425t34634561
X-QQ-Originating-IP: 2XyLUKD3lwizowkVX2rGTnixHZxl6yQS36f0d/6WhVY=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Oct 2025 21:27:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5170765333464897697
EX-QQ-RecipientCnt: 7
Date: Fri, 24 Oct 2025 21:27:03 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jinmei Wei <weijinmei@linux.spacemit.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <D5657B8E8DB8995E+aPt-p1EXhoFLm9aW@troy-wujie14pro-arch>
References: <20251022141705.714b19b5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022141705.714b19b5@canb.auug.org.au>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ORqNQdnYjakCCkG2vnNYvTexdWaGCVqZQ4LyTav6hdbTqetR8aZtuUIU
	C7LlX38siHgObcJG2w25WJ9IpuzgvVXl3F09bnrKBlz5Ej0mQ+jgmJXqmVYxBgyKdp2jy6R
	H7x54eJYv1nYb6T7YAfX34ZNcf+hRbvv4AXSmWzhjHnzlCQV7GUgOSOaMu4Ym8Rx6kV9Ai0
	6WYKfqFodzZr5pbmvftYaUyoNmPe8W7PPF0e8zqIObt5dAZ96TplbwfxZVSCndhH6Pvqbgi
	65/W9PYAOJV6iv9apikWGz28ZnDC9jN9/AgORASD61oVKK0TJgWcDhzqAxEi6BB/l1PK2of
	SHYJYjoeoYDzaYZl0Q3phhsObD6fM2ZaV8IRRD0AZeYZAblBYFlz1hEO/Rup1OafawFLG2W
	eBKD/NX+omjIcoCa537u83RHqv7doa+EMKRFGx+lkdOnOfr+B2L+a8aqe6Cd9s/U47fyc86
	+XMz10Vp6XPJjhEqMQ6+Guf/zkNelsWtrNY4I6MK1oPPmfETPlAvVvYcDkS1xZ9Ujl3hcIa
	E64edY2o8LRuhyM3KXSQ4fjCA9En3e5i6yltUyyFSFeouc2iCQDdzfQl6lQxDr0jUUaouZv
	TdhtN+crcS2w3rErGgUZ+gP/JL2cpbzIIfkVWJsrobwu9971cEiUaRKjJbYxdcXSZnuJmRz
	ngw9OeT5HExORkH//NGsvnGs+rXQ7FKpSkIMrS+nkuU7DXBHm/rsb1SmBHD9l5hi+5+WKIE
	dGn/nDRytz4Lvifg+V/NyGlY6Sf4hZDy/EVdi2/sTV7uNet9Kb831F3FkmCBM5G2QYZShL4
	26/oClTcEqKQWW8QVbRSHuYSN6JTyEBoJEAmpOgDlIWDwb6VeK/db5Z8P7GBkZGjc9Jbgcs
	iv8iIadvpbImrBJbAVmtptxVZh6+pqNwWbZulMhjykRLF/SuDuSOe+L1OhxBj8Jl2cKxCdI
	aN5biZL2I4/zkss0FKY5SpDaL6AnApi0GDuEOpOeiJlSTGuCD23Z9EwWGVVknmHEmlF7Bfc
	vNQJSgK3oMga9jf9aLqx/ljWqVTfyswaaBv99OyuXzzZdUIu4PO4wJj9v4JSY=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On Wed, Oct 22, 2025 at 02:17:05PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (powercp
> allyesconfig) produced this warning:
> 
> WARNING: unmet direct dependencies detected for DMA_CMA
>   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
>   Selected by [y]:
>   - SND_SOC_K1_I2S [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (COMPILE_TEST [=y] || ARCH_SPACEMIT) && HAVE_CLK [=y]
> 
> Probably introduced by commit
> 
>   fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
Sorry, I didn't realize that this email ended up in my spam folder,
and I just saw it today.

I am considering directly selecting `HAVE_DMA_CONTIGUOUS`,
but another possibility is to make it depend on `DMA_CMA`.
Can anyone advise which approach would be better?
If there are no objections, I plan to send a patch on Monday:
select `HAVE_DMA_CONTIGUOUS`

                        - Troy
> 
> -- 
> Cheers,
> Stephen Rothwell



