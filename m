Return-Path: <linux-next+bounces-8400-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1939B8DCCA
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 16:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D1F57A16DA
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 14:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB902D6E52;
	Sun, 21 Sep 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lanomZds"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323951C68F;
	Sun, 21 Sep 2025 14:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758463417; cv=none; b=LiM6v5V/+LJbr3tICdHoiabNykygIfRWu9xJrGYvfbMuGm1owzybUglcd8OO3xYXps4nBNzqyHaWd8TjFi3LXHn9YG2lhctAHsqJbqesJLP1MCvfeZLIvANRnH8WnuLfv1wAODu1r6RdLeCfTR0wM3hKP06WpMJEpX0pZz9lJnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758463417; c=relaxed/simple;
	bh=/ryM44dSDWZAbOYmTiCvJFqpYdHDseT8yHVKoA9VGgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MqEJ4ghWgLXOvgFIY2wJyhOns3ZfFvxzNG5UrcG+MgcjhRXyZK6UEXgYRQ6NZ2X0qxnPEpTD2YlUAlWMehG58CP4AWtoGmVDbBXeahY7NVrvClPuvEcRUb0yuL7Nj45+mBm3zWriWjyA+BODNt1lnUFguKySDKnQbfWFo99t6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lanomZds; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B4AFA406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758463406; bh=tFnIFRKzhn1Gdeyl0+OHlzn0K6d55yD5DNCw+J5LtJo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lanomZdsqjVjj3UN0DVcTBWCS0rkLr4HHV1o7lAO7UrjavQ8hOMKrWVha0Xp19Imk
	 AkjIuXz/yTi0g85gr7T9Uz0gD0scgZCnW3jesc3RVMZsQ8dS1lsp8gL4Mi3LvZKwlr
	 vqWIEz37/fsXhIplja7k6iqHEh+eIUYOTETsKPqzKxv8X2WMg/+nRneYI0MAGT7Tmi
	 y0V07CMLk6KuvOmcqpEn2SiCSRrcP05Zup1y8jar8XhPHjINj4+v1LZxaDElQaCuty
	 zNtotvNlm/NsRCj3sXEqNP3weUCCl34tzplC9GgYIIvivszmv6XDPv/6gx6MI1Oiog
	 loDgtCXxJtz+A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B4AFA406FA;
	Sun, 21 Sep 2025 14:03:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
In-Reply-To: <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
 <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
Date: Sun, 21 Sep 2025 08:03:25 -0600
Message-ID: <87ldm7c382.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro, have you seen this ... any ideas ... ?  Randy, what can you say
about the environment you're running when you hit this problem?

(It doesn't reproduce here).

jon

Randy Dunlap <rdunlap@infradead.org> writes:

> Hi,
>
> On 9/19/25 8:05 AM, Mark Brown wrote:
>
> With today's linux-next, when I do 'make O=DOC1 htmldocs', I get:
>
> make[1]: Entering directory '/home/rdunlap/lnx/repo/linux-next/DOC1'
> ../Documentation/Makefile:71: warning: overriding recipe for target 'pdfdocs'
> ../Documentation/Makefile:62: warning: ignoring old recipe for target 'pdfdocs'
>   File "/usr/bin/sphinx-build", line 1
>     ELF
> SyntaxError: source code cannot contain null bytes
> make[1]: Leaving directory '/home/rdunlap/lnx/repo/linux-next/DOC1'
>
> where the "ELF" line contains some binary bytes that are not shown
> via copy/paste. Here they are in hex in case that might help:
>
> 7f 45 4c 46 02 01 01 0a              .ELF....
>
>
> I don't see what is causing this, so I am using the previous day's
> linux-next for Documentation testing etc...
>
> Any ideas/suggestions appreciated.
>
> -- 
> ~Randy

