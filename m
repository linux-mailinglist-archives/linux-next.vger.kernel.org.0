Return-Path: <linux-next+bounces-7476-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA86B013DB
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 08:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6C793BC5D2
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 06:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA21A1D618E;
	Fri, 11 Jul 2025 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="E8UFCHTF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TffFvQGI"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1652110E;
	Fri, 11 Jul 2025 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752216506; cv=none; b=Ri5KV1Z+mM4EyfDOsfXZ7+DOHwQxWXebNRHwTCYt6E4mQuURCsWDvlDNHL+VoVhim09L/pi6jPqONvuypSLS663l/V8H8RNb28tpZWmMRExGtkurPqRULhGmIY5ljz/+RwGOMIrM6Z7ItZPEftPzDSJds4zOvtVwK4Zgc3IlWtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752216506; c=relaxed/simple;
	bh=+T1qgXU8Lpqp3Sq0RDij+V21PVLm2PU9091SOQs8nxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqykuPgCcp2g/xHGywTFEyoFyO1WAA3kAvT9t7v25+QT0uYcMcKXRUeKlAOY0F5K7elaB+1o0CdCnt9CuIw8JRK2qlyDQbBkLWexH/Ll27kl7VRfYFcG0YtDoiNdvsfO0wz+vCWx9ki7uZAYlboSIh15+wSwmcn6MNvXDg8ixZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=E8UFCHTF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TffFvQGI; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 25C80EC028E;
	Fri, 11 Jul 2025 02:48:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 11 Jul 2025 02:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1752216503; x=1752302903; bh=9tmvMKfs2+
	3P9yH1HQ57n/mvCAkJiWreb0ZaeXNaMWg=; b=E8UFCHTFY29s2zySfXrJ/AVgoD
	LqtRW/pSQSbSbsVdDrQUKfucJcKg8QiLk4HbO62ddzYkPj1m8auUVsWvg5EfPIf7
	sN60NRq7/EmqDmfGMIKfdiJJfEy01nSo8zcUOe1wnigm65Id1U46GRNdQXLn1GmS
	hMfjhR73bJBY6gYn4RNHfyrbZWirbf7XaEiwuePRCDmeaTqiXHPvvp96cNH6rRAd
	VT4yS8J1V9feTKCDFfZow1xhkoCW5491npu/JOb4P9BycD8lBp65X5ldSj9RF7Hy
	hQLq+976UTMJX0xLAxtL8zE+QNn5wkaHXQZnH63Y+GCZYjQ20oMt3ZPqkTuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752216503; x=1752302903; bh=9tmvMKfs2+3P9yH1HQ57n/mvCAkJiWreb0Z
	aeXNaMWg=; b=TffFvQGIO4LO6axuzxPk0wEaTqtiDSHlVHGHoRDDapPZ3B0mDHA
	byfBC3Z80EueynXCUIcMMMUR6c0/UzW/v6xqqXNai6QXz+mtl2R49R3UJuYwbQ3j
	7OPvNVLQz9lwFxFqkfsKcKlGfZ5w7Tu5D4P1HYemSSzVZpxtOGygV+Tz8c+YMGhJ
	cFlOsBVBmSc+IyPDZ8fBdoTOCD1aX+s3W36qUZ7QPaCRyr5ez/k/7yl0lEVPlh87
	wPjIXCAVT/7R2vZK/KWAmg3+R0kbH6Mo9TNnGFLqNOkRn7crAJjvOV8YBpM0ql2j
	W/DQId6uq76tnjsrHZl9LKGBrZNqVgOcsjA==
X-ME-Sender: <xms:trNwaHA7dHHmrwJMMiVvYzSzJQhjHHsf55z2e9Acq5bpporVMqK-0Q>
    <xme:trNwaK7GQQNxRVcONIGcBysofj09gxH4gdZHFPaCVRPtLNU5D68WbjZeEvQ-FQ0-W
    1L1T4phtglgsQ>
X-ME-Received: <xmr:trNwaJ5j7GBjax5kRI5cCHJSvDdueJagZer7BlqfyIX_z1Z3GiXYDRQNfDARuYZ0eEq6vbT9Qrg7A_96mFCqYijWlu9KtWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    shhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepsghrohhonhhivg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:trNwaETHjhNdWMCx6EI1-Yw-iZuPUbMKZXGROwwEYSPyr9EPy9eeHA>
    <xmx:trNwaJ8A9AcEOYX7RGvlgAQutH_tIS-oV_o4PVtdeWod05aYXDppXA>
    <xmx:trNwaNbfgZlXMiUrpuLztvCggJDdtURjElHMbfHdeM1A-M87a602Jw>
    <xmx:trNwaCoYJ1vHYdJawmOle9q5rLjz6DKirsdPNgd8T_WXC1HHQE27lA>
    <xmx:t7NwaHl6LvzZ4ZZuAm0yvTOr6zl307fWlWUgh12bAYwN4ccHLbcbyCLz>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 02:48:22 -0400 (EDT)
Date: Fri, 11 Jul 2025 08:48:20 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the driver-core tree
Message-ID: <2025071106-mustang-encrypt-d307@gregkh>
References: <20250711162945.078138dc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711162945.078138dc@canb.auug.org.au>

On Fri, Jul 11, 2025 at 04:29:45PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the regmap tree as a different commit
> (but the same patch):
> 
>   8009fb751d2c ("regmap: get rid of redundant debugfs_file_{get,put}()")
> 
> This is commit
> 
>   9f711c9321cf ("regmap: get rid of redundant debugfs_file_{get,put}()")
> 
> in the regmap tree.

Ah, sorry about that, I took the whole series.  All should be fine when
they are merged together.

greg k-h

