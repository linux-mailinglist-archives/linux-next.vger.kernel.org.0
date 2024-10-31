Return-Path: <linux-next+bounces-4551-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 473879B7540
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 08:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE9828114B
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 07:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61AE148318;
	Thu, 31 Oct 2024 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OOfWBcjg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v9dh1JPS"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9755DDC1;
	Thu, 31 Oct 2024 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730359310; cv=none; b=PKG43fy98/HCya04JxENdcb5qiCSDGKG8QMnkH2cJwqGS5Sq3LlPbhUKeIjc6V2CGbiTywn8VNI1oHIMNURID5Gtqob407U0vlF4iPm9oe95fsHlJfFhLcex/1fEeoUMzrt1ZoggfGhV7NhbVmwkNz+7WQuhyFcv4+U9Kt77hbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730359310; c=relaxed/simple;
	bh=cSVYM+QXqesL2FNORNULeT7pHSCIi86yVyz6SpCJ6OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOZ2kpXwiLZnn1cp198VaCgoUxkcQI7USHgP+atnjh5z3jdMcybngE9aofH8IcBNOmf9qUCEdivyt/qhugQuj9HiDf8qG9NRyTAYwyEqXtq8FHvsBW6gbXD02S7qHf3P4/IetcMo8dXPLU35nKs/FoDiSww/g8Pdw+oOwdIFPK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OOfWBcjg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v9dh1JPS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 31 Oct 2024 08:21:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730359301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4se6XKAoDumSaMJxQiVaipt/NAGA0v3RVpl95g5pxQ=;
	b=OOfWBcjgqOBzivKfuKxrrodpZQI+KMDZa0rHqnUNdFkAsHTGDfAxaMrK8L3EBVCHDvCqaP
	JA4KgwrcFHf0qEJZ59kQ2jLMphElSklE5g0ZwP6+mwAEiHOXQ4qHl698g4Z4hj/a1PPGFG
	9cXnRdbFijFSY9uMYpinwxZtnNdy5aFRQlP8VTJ1iWzZc5aj3UShwit/c8aD/6xTbo9wO6
	BP3j/zuSi+l/e8vPTKHkc8Xs2mS81C+Sj7qvIK26Ociie3LxEqQxuZyS6uDKEeC/v6vYY7
	bhKM7DrQ+j0Ngak1vrdSf6vft0dv6XfZmsxzuCMAcROdxPPd4f3gUzicW6JLvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730359301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4se6XKAoDumSaMJxQiVaipt/NAGA0v3RVpl95g5pxQ=;
	b=v9dh1JPSd26s+a+B+V9ZjacoyaI1kG/Wk8n0kyGPG6LKc/aV8bJnhFJjSQ0FsQ+qkiMX4f
	xE7hxNg1kTesrnDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Marco Elver <elver@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	sfr@canb.auug.org.au, longman@redhat.com, boqun.feng@gmail.com,
	cl@linux.com, penberg@kernel.org, rientjes@google.com,
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org
Subject: Re: [BUG] -next lockdep invalid wait context
Message-ID: <20241031072136.JxDEfP5V@linutronix.de>
References: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
 <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
 <ZyK0YPgtWExT4deh@elver.google.com>
 <66a745bb-d381-471c-aeee-3800a504f87d@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66a745bb-d381-471c-aeee-3800a504f87d@paulmck-laptop>

On 2024-10-30 16:10:58 [-0700], Paul E. McKenney wrote:
> 
> So I need to avoid calling kfree() within an smp_call_function() handler?

Yes. No kmalloc()/ kfree() in IRQ context.

> 							Thanx, Paul

Sebastian

