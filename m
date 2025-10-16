Return-Path: <linux-next+bounces-8609-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD1BE57E9
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 23:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 140954EA4B1
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 21:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EA01B3937;
	Thu, 16 Oct 2025 21:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Zosk7k08"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D662F2040B6;
	Thu, 16 Oct 2025 21:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760648473; cv=none; b=WcxuWdhSYbhc49nNR/W6gGW+nq67axvfLB6HsHjvEVuTcQkLpoVyQbDBTdVFebCWmC35n+EYDD2DSHz1I56fU/IKgyYc62swOca7wodbmlHEi+ha7H8T2qm8+K2LlCvfCpzUhLJdoS3fP+8T73vu81lMq3L+IgG3xMeeNP7EvHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760648473; c=relaxed/simple;
	bh=sVjVLQ3a89J74npqQaPOPQryeVSgngCuzAlyZR5W6v4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UPC3pAheclTjo0smantSjMQ/dplqwh/FGUImx/caHVi/+I2MNBgvbpveYyq7aYwcxB0XGU+8ruUlEN49SAH/o8DvhPlVO88/y9JT81h9T3+h2Tb39waTQ1jQhENegBAUMmICM9a+rKDQrtaDqa5EcmSPN+f6+WRy3szBLvozUvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Zosk7k08; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1BEE840B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1760648465; bh=Q4zir5CoitC9lENc1vI2llXery0GkfKP1Zay9iuNSY8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Zosk7k08VdGtFTvURxaL6UQfC9S894ZdS5Ei5ZYnQGvCw9lsngIG7qd7hoW97zPda
	 0zvlPR6+POJi1F1KSNZUmaIC0sBSkbz3gfZyXnRw54+qPSjvG64h+BY7ko2SvgnZ9u
	 NigaGDO0BNHTzrii3ZZVVpmCmdlqO26HvHKn3OdYpavnTQEx6SmexDR0BVaSeqLRer
	 W6iB1Q6N4X6ye+SCIBrusucYRfr2MiIULeDtwdaqWqx6gLtD3UcmofMqdKCrevPCnn
	 AxGvjClgdMQGUMuMAs/z54+t0ow4UKt8fp1skhhCnd0UbUgYDZi9/wtCLxvN1fDNjJ
	 n1F8i8WP4HOXA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1BEE840B1B;
	Thu, 16 Oct 2025 21:01:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, linux-next@vger.kernel.org,
 broonie@kernel.org
Subject: Re: docs build problems
In-Reply-To: <20251016062322.2fcd6780@sal.lan>
References: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
 <87sefj7tom.fsf@trenco.lwn.net> <20251015184416.4340e8f2@sal.lan>
 <87jz0v7rxe.fsf@trenco.lwn.net> <20251016062322.2fcd6780@sal.lan>
Date: Thu, 16 Oct 2025 15:01:04 -0600
Message-ID: <87bjm64l4f.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Looking at my docs pending stuff, the only thing missing is this
> series:
>
> 	https://lore.kernel.org/linux-doc/cover.1759329363.git.mchehab+huawei@kernel.org/
>
> I double-checked: it applies cleanly on the top of docs-next, as it is
> unrelated to build wrapper.

In that posting, you said you weren't sure how you wanted it merged, so
I have it just sitting in a folder.  I take it you think I should pick
it up?

jon

