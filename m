Return-Path: <linux-next+bounces-7877-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE338B1EC3D
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 17:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA36F1893D72
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 15:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF6B283129;
	Fri,  8 Aug 2025 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mUC9qPhl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3HfHauUy"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C861280CC9;
	Fri,  8 Aug 2025 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754667550; cv=none; b=cynSkA0gp/2fgrrPXHm6Uj21kHqI66Jx/JrCiM8oKmo56AFRptB/IkDTi0BY7xJdy6SPlzPF19S0Mv5vfQ8R8XoXMWxV1EwqcM7lVkklEJzzcpQ5FJ7g/YRixt+rmNVpQUPTBE4rhLuaTjdVz6s0NJqZWq8S2djrDH/NjPtBew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754667550; c=relaxed/simple;
	bh=bIfL0e33u6RYdNWrpITQqISLujvJoxHnREtwk8aHqbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3V3ag96ouP57GafwU99sWkyjroHBh6B9mginNy31LkDPX9RSIA20VmyEpowNIwX3lY1KnQWLphp6gHLEZSSuWDwoFBMO1EH3+kP7lkzlZ125nXOvyzRrNNjG3U140AXFR98EQOFhbkzAj2vZv9j7wEH4e3B8H4Yv3Izc+MXs7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mUC9qPhl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3HfHauUy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 8 Aug 2025 17:39:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754667547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MO9f4MyIZ7JsV7rRadUC7f84AZf503KjnGQDkkRi5fs=;
	b=mUC9qPhlKkHv37BV5ZUzYipclNAHAHwTaT1NIGd4pfk83RA+NPmCNYimyBPMS69apGm0Wd
	zQD8VXT1CfAvrgzfsBwzqxDLoL5KDDz89xoB/9cc1ycEnmzUQoIuzud2vdsM2pIoQv9EP/
	4eQYRzX570oeiIgkGXdUPBKRuHkc0yLOEBllg1reqshSE4kwyGEP1rBuYuTE62mB80tfj0
	NtfsEimSxvLhV8PUN0VSn0PmlToPCAgN+I4nCm1dh/Ug2BrdLoILQzU/S7biB3Xjum2yhQ
	sqnSGSzj8P4lLnphDJz+B9yLtHykQQQUH6/qSDxva0h9rZNXF2ozY6JdRhWFIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754667547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MO9f4MyIZ7JsV7rRadUC7f84AZf503KjnGQDkkRi5fs=;
	b=3HfHauUyUbb7KnMQ8vxfyNJmQCSsdY7tI2DB4qaHpysLRl7ZYA6cJyY95rz6LYFn8HTwhq
	BAsN13+5h5d8EKBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Subject: Re: linux-next: Tree for Jul 29 (net/ipv4/netfilter/arp_tables.o)
Message-ID: <20250808153906.ykBfYLLA@linutronix.de>
References: <20250729153510.3781ac91@canb.auug.org.au>
 <a54d3f69-fb7d-48b0-9dea-4ff9a3fb70d1@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a54d3f69-fb7d-48b0-9dea-4ff9a3fb70d1@infradead.org>

On 2025-07-29 17:26:02 [-0700], Randy Dunlap wrote:
> 
> 
> On 7/28/25 10:35 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20250728:
> > 
> 
> on i386, when
> CONFIG_NETFILTER_XTABLES=m
> CONFIG_IP_NF_ARPTABLES=y
> 
> ld: net/ipv4/netfilter/arp_tables.o: in function `xt_write_recseq_begin':

 25a8b88f000c3 ("netfilter: add back NETFILTER_XTABLES dependencies")
 https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git/commit/?h=for-netdev-nf-25-08-07&id=25a8b88f000c33a1d580c317e93e40b953dc2fa5

Sebastian

