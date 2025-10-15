Return-Path: <linux-next+bounces-8598-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB1BE0C66
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 23:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1E123A94DF
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 21:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8FD1DFDAB;
	Wed, 15 Oct 2025 21:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M50JlXRg"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D8F189BB0;
	Wed, 15 Oct 2025 21:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760562941; cv=none; b=fegr6K0DUN7v+C07vXdxGw+F7txSobKOJjHiLViadlhFjCSPCWsFmyMNzujprshXfBBh4aVsYR07OJ+V8oNDJg08wvdoqWMhWt5R8AX3uid/NO4+3We94wPEvLeH/bsUG0p+nqmMLDfw0hcgTAMSNDA2/9FiofIj+n/oPJV6vxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760562941; c=relaxed/simple;
	bh=jw4cDwRkjNKtlpMGmqqyF9m3kHzUo+QIUbf8d3pDnXw=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RL8o9K7TwnW4KGCecK/vKd4UiDBOpxSfJh5/o8Y2NvGGBKDlxSiiOSDtCiXrcd0PWzACP2VVp6s9coWnYRngcocoiVCkQ6A+yNy5DaQ33tKM1LxgcqJUWv3ZAaJVc2gJ51/nYDAs+CdGrz5JbJNxWotn8tsrrYv250lLjICWAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M50JlXRg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5E24D40B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1760562938; bh=C3G08R5OrlNFIPsLcOefDKo+QazsDQjgsk9YpxVFijc=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=M50JlXRg5UJxrrjgFZ5Qra1E6lTXsjQImxGfvfqmjHjMW7MyChCDgCAvY5H14pJO5
	 /xY/sSWfacxJyQpjoCPy49aSBqNk9xdlc2G4RYC/GBKGVbu3xPLaKqQES8cwpwcRZA
	 ASi0yEFJr04JtVezqNPxS+zr0klh3i5an8s1HGQKSQjeBJaN16br8TjPgsTMyzfq3Z
	 wlMy7yo8wWh+sKtD+DOfDaICtGX+iW/9ZOmQ87XRkXykKmqC93hmvCUhoQv1HTOJ75
	 YtgJrEhso2MrQnbvAbbATPHAySKN3J+z1NC74CG3sPtAFJorvjbVTX+HFpXnStS9TI
	 GN/BctKWUMvzg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5E24D40B34;
	Wed, 15 Oct 2025 21:15:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, linux-next@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>, broonie@kernel.org
Subject: Re: docs build problems
In-Reply-To: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
References: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
Date: Wed, 15 Oct 2025 15:15:37 -0600
Message-ID: <87sefj7tom.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Randy Dunlap <rdunlap@infradead.org> writes:

> Hi,
>
> I am back to having one former error and one former pair of warnings
> on today's linux-next (20251015):
>
> ../Documentation/Makefile:71: warning: overriding recipe for target 'pdfdocs'
> ../Documentation/Makefile:62: warning: ignoring old recipe for target 'pdfdocs'
>   File "/usr/bin/sphinx-build", line 1
>     ELF..
> SyntaxError: source code cannot contain null bytes
>
>
> Did something happen to the docs/docs-next tree or was there some kind
> of mis-merge problem?

I pulled docs-next forward to -rc1 and merged a few things, but I
wouldn't expect any of that to create that kind of problem.  It seems we
lost the makefile fix somehow...?

jon

