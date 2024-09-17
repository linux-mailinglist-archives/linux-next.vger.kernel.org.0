Return-Path: <linux-next+bounces-3892-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 217EF97AFF3
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 14:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DECAE28661E
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 12:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01711487C8;
	Tue, 17 Sep 2024 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iguana.be header.i=@iguana.be header.b="u7AdgetM"
X-Original-To: linux-next@vger.kernel.org
Received: from infomag.iguana.be (infomag.iguana.be [185.87.124.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312A5219ED;
	Tue, 17 Sep 2024 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.124.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726574835; cv=none; b=aMi+vq00pkprOyQ6sSTByJxBeUJ/HxUnqP5DpIFZuhCZao+tCNVuQmTlAzqTJDGd5RbEKRMS9TVr96GNRvgdmCO5GUbVLAxudeQu0aDL67b66TG/AuiYIQkMtx4y2NSs503aU+9DtnecgdWBmoxV2n0QiHGLCZrRZBh3uBmO8XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726574835; c=relaxed/simple;
	bh=jlDZU3JVNnoQT42sJrsjrjqJtbpXIXaL+fwBe4hD65I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cehVqjlATtI+kAvASWLHnp7Qlgg2YbZ0dTtMb5FLJC8cddHq+MSKpNJLGqbu/yd9NyEaMWKBHS6Nzq36q5j8NGLNjbFr8vFXUM1KLl+ihbg3+7xdmXG8myNED1T7ciXQAzxIObEQgYma2dhOOKXC4y2YaJsVitlgMUrz5wXpbMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iguana.be; spf=none smtp.mailfrom=iguana.be; dkim=pass (1024-bit key) header.d=iguana.be header.i=@iguana.be header.b=u7AdgetM; arc=none smtp.client-ip=185.87.124.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iguana.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iguana.be
Received: by infomag.iguana.be (Postfix, from userid 1001)
	id 25D91603CACE; Tue, 17 Sep 2024 14:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 infomag.iguana.be 25D91603CACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iguana.be;
	s=infomag-20180602; t=1726574829;
	bh=jlDZU3JVNnoQT42sJrsjrjqJtbpXIXaL+fwBe4hD65I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7AdgetMBhcYxxdVwzjo/tbr8XfIiz+syPQ8DMF6tkGIYGRE/jl2alg3oIuBgu8Of
	 um6ApQNPSXVvuVDl1zukLbdxoOR5I2aseR85xf4i7WoL9y2YrP/AP5AMUQ+i0XD4Ku
	 s/LHyT9snsk7BIBK4QvWt3IOfvP3IdW5/RS6Q8Zk=
Date: Tue, 17 Sep 2024 14:07:09 +0200
From: Wim Van Sebroeck <wim@iguana.be>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the watchdog tree
Message-ID: <20240917120709.GB3555@infomag.iguana.be>
References: <20240917130325.0460eebf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917130325.0460eebf@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)

Hi Stephen,

> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>   f0764bb2a7b6 ("wdt: ts72xx: add DT support for ts72xx")
> 
> This is commit
> 
>   177c20d761c5 ("wdt: ts72xx: add DT support for ts72xx")
> 
> in the arm-soc tree.

Removed from the linux-watchdog-next tree.

Kind regards,
Wim.


