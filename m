Return-Path: <linux-next+bounces-7773-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33019B160E9
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 15:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72508566CFB
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 13:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFE11B0420;
	Wed, 30 Jul 2025 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lA595RJB"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835FE17C220;
	Wed, 30 Jul 2025 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880485; cv=none; b=T+Nh84+hihMS93dmIzPysSy2LPSYN5jtvyWrztcINakRKBW4ac0bIiSP59iU7Wd3w9WzHA5409C23s/d1ue0zMmr9l6Jvda/cJfIgctuaWFnHfVn+SO487aQwEPGNNSMSpcYlyhg7aX/uioP2aKR8C8+P1ZfiBRKOkqh4Q5dDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880485; c=relaxed/simple;
	bh=20+yCl0UgV7MQtrmNVtfYxhv9J8TWXYL2c/YM07XBi0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DOg5H23E6mtuWoMynkrcfAMgKMbZxOdSSdra45BAyifcMhmrK61BjvvG5P3M7SVwQqKoIXPIY5f40OLemkuJaXlj8mw+GkNUFl2UjIVfP8VflBkW3Sxvirsc3nZilSwe/NHGxctqENLMJFbYhotvleCDn1mj0efEjbCgLjYiWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lA595RJB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 77DE340AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1753880482; bh=FxcW5AfQBhvjZrDjimNxBz0i81/wjNEByJW8vvVde5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lA595RJBybnULCZpOmXQwqCuUmLbELW+ZzKl4dROmbltJ0rWJ6gs7712S6NfboGIp
	 btbdYE0JD+x1r2Gfy8vV0lDhqoAWNqMtFVDbpeStCcujRnqQdGny/B3/+fUj1stQoA
	 GoN42GixCjGr5V1qnHDYuZDRh8F9H1c7b2mtbobrIOvF2Y4y68OHZjoKXnhTwc/q9d
	 SU/kejmxrbQsBN8fQjK5UyO7ipfV5k5tmb7hYMnj7GkFK61JLxdWvnBJws1UUbXXVQ
	 TnfFM5A3ssSTffP0ZlrHZ5ux/9G+eIqbVz+ok7NhP7aO2L7tqYMSwhHHbMKvOd8Nep
	 O8RqO3iJ8GE5w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 77DE340AB3;
	Wed, 30 Jul 2025 13:01:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Vishal Parmar
 <vishistriker@gmail.com>, Brigham Campbell <me@brighamcampbell.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the jc_docs tree
In-Reply-To: <20250730102931.6334022c@canb.auug.org.au>
References: <20250730102931.6334022c@canb.auug.org.au>
Date: Wed, 30 Jul 2025 07:01:21 -0600
Message-ID: <87cy9hx272.fsf@trenco.lwn.net>
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
> After merging the jc_docs tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/arch/powerpc/index.rst:7: WARNING: duplicated entry found in toctree: arch/powerpc/htm
>
> Introduced by commit
>
>   c361f76da696 ("docs: powerpc: Add htm.rst to table of contents")
>
> interacting with commit
>
>   19122a7c28ed ("docs: powerpc: add htm.rst to toctree")
>
> from the powerpc tree.

Did that just get added there?  I've had that fix since early June...I'd
rather not drop it (and have to redo my 6.17 pull request) now if
possible...

Thanks,

jon

