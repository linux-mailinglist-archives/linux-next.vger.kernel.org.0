Return-Path: <linux-next+bounces-6962-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 528ABAC6471
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 10:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58153ABE54
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 08:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C82C2580EC;
	Wed, 28 May 2025 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="K3IkmPC+"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA64E24678C;
	Wed, 28 May 2025 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420863; cv=none; b=ECqP4oCrxw4iIqHeR/5OXamJz2Rr0aaesOHrUUWGHXCMHy7ukNH7qO/zujym4BvIXwSGo91dDB95T50un4NSnnuIMNXGw/m3SvaQ++ibQvxxUETfmCNkaAjAnWtU9Ln2vnNODcauaUII+AeFMRFZLgQVnWYknYaBrzHzKUomLE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420863; c=relaxed/simple;
	bh=qLnZjR5wE3DyZBiN4fnzAvQnOiDhhA+pPzkjxW5NRyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3hSMGhxgC/3flI+NXuyzLxRtXH7C//DiefYhpzDTrDkCoBk97dURn/6MHv6kC81d9GJ5SOxtZUlV/wiFhk1VVjsmu0y3DDXDZT9yULuhnB7AfhoNcSiCxJO5Cagts5bE1rcso6hqcVRWPThXLESpuQYffq5xPEot38XA8ltv98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=K3IkmPC+; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=p4GyEZl+mDR1sWV2pSIz0EJuWrr/vpkKFxzXESdLPaQ=; b=K3IkmPC+zp6tbdNaTD+hv7BgP7
	sd/kwRnbL+FP54irW/4WRt0zocJHvy9mLWHqWRNLsJlQ5kbRj2sCnYX5tPTFt1nisi7z2OUoyQoS4
	EfhsWFL+ofX8EnldVfikRNLiWIFe7nEErqt3+EG/Z64H+zglwyRTbQDGt8W/lNxvgcN3Ke/Ef5xyD
	a8s6Utls3q+ituZ5oJV01DoKVevRzJoQkzlcReWKaTAK4esuIoebCRv4x4jkkn3ydP9GUdG3/BY5V
	eJMygR9ak1i9+vVusehns8htyZwzh+Rs2vn0wtHO/STN3GkwseZC+8XRCuhlK+2cGCISrB70gy/+O
	DgqX4KCA==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uKC88-0005bl-T8; Wed, 28 May 2025 10:27:20 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Wed, 28 May 2025 10:27:19 +0200
Message-ID: <9453742.CDJkKcVGEf@diego>
In-Reply-To: <64499337-fc61-42b0-8c50-7749b2036c54@rock-chips.com>
References:
 <20250528134245.13dc84aa@canb.auug.org.au>
 <64499337-fc61-42b0-8c50-7749b2036c54@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Mittwoch, 28. Mai 2025, 09:17:13 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> On 2025/5/28 11:42, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the drm-misc tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function 'analog=
ix_dp_probe':
> > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: labe=
l 'err_disable_clk' used but not defined
> >   1589 |                 goto err_disable_clk;
> >        |                 ^~~~
> >=20
> > Caused by commit
> >=20
> >    6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls=
 to clk_disable_unprepare() during probing")
> >=20
> > I have used the drm-misc tree from next-20250527 for today.
> >=20
>=20
> Oh, I have found the same compile error after rebasing.
>=20
> I have removed the 'err_disable_clk' flag and made it return=20
> ERR_PTR(ret) in:
> https://lore.kernel.org/all/20250310104114.2608063-7-damon.ding@rock-chip=
s.com/
>=20
> Likely a small merge conflict bug. Will patch it later. ;-)

I have sent in a patch for that issue yesterday, in

https://lore.kernel.org/dri-devel/20250527225120.3361663-1-heiko@sntech.de/


Heiko



