Return-Path: <linux-next+bounces-8406-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4828CB8E6BE
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 23:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11B2B16BBCA
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 21:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B545523E334;
	Sun, 21 Sep 2025 21:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWPTKmnc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8733349620;
	Sun, 21 Sep 2025 21:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490986; cv=none; b=ZqkcdT1hqtRQz2yqHJiDrjHv+2bXg/S6+sqTff58wU/bR4Bn3/uVFrgwEgSJXdToVGfCICk8e/ZcYadWPnmUfMbAxt5F702NuP+naQfycTwLB3Mu64ghibuIVZXWKq5kjPIkEkBdv9vxouHbHoscU9FBgMwSSAqO/HOUhnFm0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490986; c=relaxed/simple;
	bh=E/HIis5fubx7YapJGbm46WoKn2NX/OhncN4csSGOH/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kAJG0zBYTh2XdeGyLLK6At7fXYs/AnA+hMpjPRgHldHrHgzTReKml41Ct5xaaRn3J1LxwlVhaYJC496P/+ujvXbGVpBTM5rqZUk3EuWLyi5HoEG+Il2vJgvf31c03HXrJKkkSzAP5pfM+cCakQ35pfHSYoXjpDWwZtt74y8WGm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWPTKmnc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7441EC4CEE7;
	Sun, 21 Sep 2025 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758490986;
	bh=E/HIis5fubx7YapJGbm46WoKn2NX/OhncN4csSGOH/Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RWPTKmncgovz56eNcA8hau/VTPRsHI7wd5GMtJb0UjxZaxhaw9ulG5eohIqIu59Ww
	 49KPDnXckr4GGARrOLuoYq7c2DAOCb2ewDQWK46X6+PEDTyGPzvLnhl/3fg5p2sEng
	 0huiRDulYo+NYayIz5ULRTGdx6fWY5Vas0Py72MXft852c6ofm43KtXg/8yJstIPf3
	 5PQcDVpmnnLFZn7KydChr0N1AujenkI4S6O08g8ey4beaDjGO6t7CVHD4qAjQTwpWi
	 UDJ/kekvSBX2kR7X0HTkUOltGZ9VZ71IlCpZ3U1ZaCeAuHR4dasWS4nLMorFR+oo9s
	 Xn+uuH59XuOSA==
Date: Sun, 21 Sep 2025 23:43:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
Message-ID: <20250921234301.0110130d@foz.lan>
In-Reply-To: <87qzvza62n.fsf@trenco.lwn.net>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
	<883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
	<87ldm7c382.fsf@trenco.lwn.net>
	<e2112be7-ba68-43d1-92ba-98adfb869a95@infradead.org>
	<87cy7jbo7f.fsf@trenco.lwn.net>
	<20250921223250.7af92f98@foz.lan>
	<87qzvza62n.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 21 Sep 2025 14:44:48 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > do you know what is this "alts" file? Is it a custom script or
> > binary?  
> 
> It's the alternatives mechanism that openSUSE uses. 

See my RFC patch. It fixes the issue when PYTHON3 is not explicitly set.

> I have no idea why
> they felt the need to employ it for Sphinx, but they did, so we need to
> work with that kind of configuration.  Meaning, really, I think we have
> to just invoke sphinx-build directly rather than trying to control which
> version of Python it may ultimately get.

True, but if we ignore PYTHON3 env completely, this will break on
other setups where sphinx is installed with a different python version
(with includes OpenSUSE non-thumbleweed).

Thanks,
Mauro

