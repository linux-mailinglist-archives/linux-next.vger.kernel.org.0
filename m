Return-Path: <linux-next+bounces-6817-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62803AB99AD
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 12:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F5A01B67584
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 10:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1758323099C;
	Fri, 16 May 2025 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4WkLPzi8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0xLzWZ/c"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D1381C4;
	Fri, 16 May 2025 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390015; cv=none; b=pCFwESPGsMT1YGOODLO+8lSEX2VZXfx5C2D2hGBnU/PNQky+cMocwDaaPNengawpysSK/4X7p7mX5+T4wjcIUemuKWZIF273NakkQDks39/3PA3O4XQ2/6/RlLyjdL7WBiW6ZsBfKj0UBNTyyZRmOFQj94Jh9U5ieYVNhiatRSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390015; c=relaxed/simple;
	bh=3SDUzvYiouQGNLytfN97dXHVloGjMKf2/khNAky3hzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGSvA0w+Bk1G5i2PIt45Fr5mZE1a9Y3QwKXB8qdSR1k1T2wVe6mn+ii+B+alz3rRPAZAgbih7h9Sa4u90qCVcTZBgta9LHG+VlHdu9uwqgm7zR6ekwuQJpJmR4IlBj8CxiV0vUnxmBdc0xKpa1BMxShRySXF+HzsYcaf/uNJ14E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4WkLPzi8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0xLzWZ/c; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 16 May 2025 12:06:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747390011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tjonFLoUd6TslWy/SNsvpKJdwUB6z9QztnuQbK4Wzx4=;
	b=4WkLPzi8c4NXeT8Ose1t/IVOHlIT2H13L/sgEmGaZK7ldhOrpZw7JEdKhqb7A3Nk5XjzgS
	+dQ7Fee5noG94BKY5WUjG1LhEtUpfDGQYpJJU2uahUdSDKA++qTLZtNGAzEiQP9i7KgpQz
	DHqBS6W+2vkRAvT/eIDCQAIcXGP3MHXUcfvt46k4l52X2+SwcJeDESRGq45wmgXyKV9ORv
	t96C/f6weyywG/QWzWzVwusShJIeOCH0WV6ES3EU9nKu5CwmAQcZgrMXkX89mkh8JVQXWh
	L4LNKymZoHIrOMgx04xrsYrJtDaXzDFsD9VvuwUfNu31ePPDX9woh+MECfDutw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747390011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tjonFLoUd6TslWy/SNsvpKJdwUB6z9QztnuQbK4Wzx4=;
	b=0xLzWZ/cqnptXZzNw2Zx9a9t12e7Jk+B+F0hGGfA30oK9EZAzNNlq84teuafMpBUh+bBkS
	/wgfVq4NVLx+RFBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20250516100650.DORnSyZx@linutronix.de>
References: <20250516200350.63be46cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516200350.63be46cd@canb.auug.org.au>

On 2025-05-16 20:03:50 [+1000], Stephen Rothwell wrote:
> Hi all,
> 
> [This is actually from a few days ago]

I have good news for your. We have a patch in the tip tree since a few
hours ago:
	https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=locking/futex&id=bd59f6170968314c82e2b65f8bbaec55896b7a5f

Sebastian

