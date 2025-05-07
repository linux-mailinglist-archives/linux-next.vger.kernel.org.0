Return-Path: <linux-next+bounces-6567-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00045AAD688
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 08:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E920D7ACE27
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 06:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B655A2144AD;
	Wed,  7 May 2025 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ebueA8Uy"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB76A211704;
	Wed,  7 May 2025 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600724; cv=none; b=bR/CVlNfV0UHqHW8CFi0eOVYJCTrG4zSt+ivXTJ0ACB5WI1FcbbxtF6sIn/pavNR/RhkrqArhZhY3M+KFJEamSp33QLr85mO3luSY3Tc/+oT4Z68Xgfjb46K9oKMRq5bYTV1smtcRCqyztyZgM7YLVf51tA/vH6p0leTu+GIvds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600724; c=relaxed/simple;
	bh=sAy+y3AZkIMDT5b/NnZgOmqXq0/LlciPRfUcFCB13O4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QzdchmwZH8vi6fAi7Zu8SZl4GvTb78silV46aGyolD0giXzvEWe97lN84NlHShXrX7ZrqG9QLhGXklKs9jGP1PjTVboKVrzD4FesHglpQHDlKg96YC59QGozAWrsJP2Agi7hAmgTe1fqq54vGs0yEoXXuGHEVnXy5ZvNZH+EPfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ebueA8Uy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 88CFF41086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746600721; bh=Hosa0bzBf8nm3VLP5rpRIktgvVcUf1ib4g98bjlDpJU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ebueA8UyRiOTwAsisqFDLcOvUHpVBWL1CWp5eJlUGnLFcwIIgzFW3FrdbIq8bZ9UV
	 VZ6MgN5s4iFMKjs5Z70f+IAbOHIv3c8+MzaBuPeSO06EDu6APmTT/IzQE7UdIKz7Ee
	 luNYtTusagvnUwlHLgIul0wutObxOTmFCRjHn9s37bE4q9IMtKAKS0Z32HuUvTFYPO
	 Do/9crejd8s6q0A0Vqh/5kv8VV368vIqCX6MPqx35+8yEf3THvJ1bqTrK80u6jP6tj
	 ZKjoUg/9IcNaSqYZsYYWjmTkXwV3fH/EJCz3t4NCBp8jMh0FmGz0HsB01a/K9P9Xx1
	 kjNPuxQ46kojQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 88CFF41086;
	Wed,  7 May 2025 06:52:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the jc_docs tree
In-Reply-To: <20250507111956.69847ed6@canb.auug.org.au>
References: <20250507111956.69847ed6@canb.auug.org.au>
Date: Wed, 07 May 2025 00:51:56 -0600
Message-ID: <87bjs4vroz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> The following commit is also in the mm-unstable tree as a different commit
> (but the same patch):
>
>   98d2ea56614b ("docs/mm/damon/design: Fix spelling mistake")
>
> This is commit
>
>   7368fcda3f61 ("docs/mm/damon/design: fix spelling mistake")
>
> in the mm-unstable tree.

Yup, I'll soon drop mine.

Thanks,

jon

