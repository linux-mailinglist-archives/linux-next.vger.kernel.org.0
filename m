Return-Path: <linux-next+bounces-7600-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D78FB0847D
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 08:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D04173752
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 06:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CF3202C50;
	Thu, 17 Jul 2025 06:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="u7voJ3zf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C/JN0Kx6"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AF41FDE14;
	Thu, 17 Jul 2025 06:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752732119; cv=none; b=W2H7plwxGX9Yf0riMB1/saTDuyWNQASXhfGg4qWaTv2PY0z8nUwYEA0VM2UMYL4ToqUiDG6R6jm8EuphkqH3fgJoBYiqDl2gyT/ScUBokQnVeV6IcCboFuEu7jStBb8zZT+MLCC2Zfjgev55dmlhAhKcE2FaAmTLwRaiDBqB/w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752732119; c=relaxed/simple;
	bh=hiKqdNhzradkP52nrGlYRecK56pLQRiEhXbC6euFxL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUCn2nPFWnfgeeQyDnHjlGME73luQmEd/vAADZps1GAxRa1Ke8a0XQvvFACLz4PzC0saA4DCWtHCpjlhzq/qqjSYCLRP4MH8jcg0UrQ+9QVRs/q1VygBuUNWjZ1TCzChjasyEB3eaxv6YfdeWlWEzSrDiN7hPz2v00NO4e0NT6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=u7voJ3zf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C/JN0Kx6; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DD6B914001AD;
	Thu, 17 Jul 2025 02:01:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 17 Jul 2025 02:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1752732114; x=1752818514; bh=m6WGDKphqk
	4B2aRGrC1ritjNx2cJzmGzjAp73J/PTRc=; b=u7voJ3zfB/N7Ul6dj5Sk3ErQxy
	D6I6gIoPHzXlxa3fKV8jwOLteXJ8uUtyq2rcK1QS+7udXUVKC6Tp27FJSVK+0BaK
	r1CNaoy7bUUJbIDUgZKhDPCU5MvTby7uugOhVx+vV41zxDGNLc5ZJyMu2smyDVZw
	C3WKkagnL17OG99WfTlVeWokTQpZDDHKNzMqw7d36Nj1/BrA2Nak5vNeBK6Wrg+t
	R8aAl9C+etFpg19qNs+sj/64lLwvIYbFhMEKoJrfhUI2ZrDGzilqu6e86RDf5r5/
	WYoD1965X3wsJPfT1PG/M+Uo6qlI0Z3lzogNps9o0dVACGz8ZpZR/uPNa9IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752732114; x=1752818514; bh=m6WGDKphqk4B2aRGrC1ritjNx2cJzmGzjAp
	73J/PTRc=; b=C/JN0Kx6u40M26WbfRask9QZDwXy8xwmndAEJew+zipFIAe3VG+
	xyXt+UiicMVkIueNrORBJKmW8iWgArb2nurRZ2jAAtk4aiEMrjPugcWRhr3MGZC3
	KjKA6gos5KaDDFybezIbKf2+8DDmss2I8wpWMctoVQAl6sW/RqIGnFJr7DlP4q0T
	dHc3xROpe8FYki5Bjhq4/XeB90NyUgYYBGh4LIQydzLf3h+GJhb4TqJhCfIdcvq0
	CoZml+YGdmXrd42zc0GEaKqRjHnnBfQ4MRyDEyngGGeW8g5Z5/oe/TLTbUgpV2/s
	v8igCyV6Q1ugAy6hiHLpO+D7PWx29VkKKLQ==
X-ME-Sender: <xms:0ZF4aDjBtZAhfN4vBCd_BaP6eAKohhZWtsgRRaB-enjFmraj79sc-w>
    <xme:0ZF4aBgxfVvMWBTuGQ3QstjCJu0ob3XVt70EW38Hhsd2nnBeEUwDYilnt0WPMUlwq
    Oq7MFD2o-KDCA>
X-ME-Received: <xmr:0ZF4aAtQL6M0fjVK5fRdc1CoBZY_IM88hJjj30iwJPL1dSci7V70PZk8f355rdYukVyEeuRtjf6nNO7o5oSvJm7EHgb8zCo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehleekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegrrhhnugesrg
    hrnhgusgdruggvpdhrtghpthhtohepmhgrugguhieslhhinhhugidrihgsmhdrtghomhdp
    rhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehlih
    hnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0ZF4aHup8l3nc2cmZIbVBZmo1MnzztzCR5vFtE5yqfJgXqJi5EPswQ>
    <xmx:0ZF4aBNHI4lmoQ-IVCADxmLTLkatBAWDH0Bvkf9Ak31_QiahqYph6Q>
    <xmx:0ZF4aJd0A2AXrvb0eeKOU60xcm5TrBK7eBvvmMKm3l3NGsU-kmlydw>
    <xmx:0ZF4aInlhssR8HLVgQ2Hx4ax5QrhXP4gXsG5xrBfws-lcsXN_FH52g>
    <xmx:0pF4aDzSXa6NFfb4aM3P3QEe0lg653xxwQNNf-7UkxTdkRilSMJ6SmQy>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jul 2025 02:01:53 -0400 (EDT)
Date: Thu, 17 Jul 2025 08:01:51 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the char-misc tree
Message-ID: <2025071740-bubbly-blinker-1d90@gregkh>
References: <20250717153733.068c3fc3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717153733.068c3fc3@canb.auug.org.au>

On Thu, Jul 17, 2025 at 03:37:33PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the powerpc tree as a different commit
> (but the same patch):
> 
>   01c6d1df98cb ("misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs show functions")
> 
> This is commit
> 
>   e82fff08327e ("misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs show functions")
> 
> in the powerpc tree.

Thanks for the notice, this should be fine.

greg k-h

