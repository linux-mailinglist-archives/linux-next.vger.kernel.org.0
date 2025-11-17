Return-Path: <linux-next+bounces-9051-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5E9C64D85
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 16:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id CFC3828E7E
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 15:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7012337BB2;
	Mon, 17 Nov 2025 15:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eYxNLn8g"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9907B332EB3;
	Mon, 17 Nov 2025 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763392900; cv=none; b=uNOaV6sWFTx6k34FYr3gubIg5PHZVpkHo1HmXz8/p/9U7QwqtCUwcs1BKW/2co1S3EizaUZl3HTRATZdBs6SivnWWFG2+7btONVvZd2B/S2RA4kpkXRH3d6ov+fMmlAW+Oq/7VeCQz8frSeJbo9XrKTJRtVJlcYVKt3buSGYqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763392900; c=relaxed/simple;
	bh=xoyHovP/r5eJZDRrp42G8+DTKOKLGhd9D7QLvnC1MFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=otsF3tDbb3/wsNlAOFc6JRT4p589KfvhXodMAIOf6wsTucABv1rxRStG1GIzIoMJdn3XzT9GzuzQPtsFR0odABx/Ml6i9MVpWO5IRO53fBXnMVw7eUp/ZNSvxVokzgKGFRSSHIhnY38K7ax3SC5Mj7PVcLN5nvbFc8Qc8GeKsAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eYxNLn8g; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EA5FB406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763392892; bh=b/12dQ85Jh06VR3b8NOJbo/WDq09cj6KqvcYLQ+6ZKs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eYxNLn8ge+sX57Ivx8NJRFTtUKRznd/HcVO4yFnQm3r8PClKUB/rwwl6NeNHxhtGc
	 U2G4oskHa9jRmsVkwORyrQ2Ver/aOSXbHJNpXXMLB8e66ds8DeNAUotbwxjUAkGO/1
	 zDnZf0+jgrtZZGsshn72Hh0/dRzve3M6bzsWR87fIylflmBY1ZzgSStQEXVIZAhMPa
	 CzV/rT+hwFIBIgq6AEabMqUpuoTH70ZIJubs3jdDimJ24HmesX8XwKdRR75/C5WZWe
	 xQhX0Mta0KEFb0v2iZqBwYiJBqX3hf3tJRnuPLxZSBBoFSH1hlBTPVkERidEiy+CVd
	 9S1Eyh3T+/+zQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EA5FB406FB;
	Mon, 17 Nov 2025 15:21:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vhost tree with Linus' tree
In-Reply-To: <20251117165118.2163d5e7@canb.auug.org.au>
References: <20251117165118.2163d5e7@canb.auug.org.au>
Date: Mon, 17 Nov 2025 08:21:30 -0700
Message-ID: <87o6p0d6rp.fsf@trenco.lwn.net>
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
> Today's linux-next merge of the vhost tree got a conflict in:
>
>   scripts/lib/kdoc/kdoc_parser.py
>
> between commit:
>
>   77e3c875f0a8 ("docs: kdoc: split struct-member rewriting out of dump_struct()")
>
> from Linus' tree (and maybe some others) and commit:
>
>   67ae57499e77 ("virtio: clean up features qword/dword terms")
>
> from the vhost tree.

Sigh ... I would really rather not have random trees reaching into the
kerneldoc machinery, especially during a time when said machinery is
under heavy modification.

It looks like v4 takes that hunk out?  I would be glad to carry a
corresponding fix through docs.

Thanks,

jon

