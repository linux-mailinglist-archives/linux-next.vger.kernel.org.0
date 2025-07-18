Return-Path: <linux-next+bounces-7636-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC0B0A53C
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 15:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98D21168B26
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 13:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D013595C;
	Fri, 18 Jul 2025 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OU/ZTkF5"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD812F5A5;
	Fri, 18 Jul 2025 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752845590; cv=none; b=VTfg2RyE38lDi7knEPUDXq+PB8Uv53jHSy8YPDrEJmvywB3Ilivl5UQNE8LebK59ckZWuWYVem0cWoalzHtPogseS/+q7wL/RRVgQ/Ct4y2owWmsgWaHomFWgqOtpqf/mbcB+j2Q1GokNRws205CSnzH9bINaRhGEDlIAnqgG9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752845590; c=relaxed/simple;
	bh=4PfbEl1f3DHeAQCOZycNOuEWv+wGNquM1Kj2Mmlmhc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MhierV0Do/UzIAVt3QzzCl0sOAb4Ilc/5/2w4/l8D3QrI+W+jhxHHwhaVQzhrYZGySWyA1UpjMQ2keFBTsWJu70twmX2NtqjUaaISZ+fRv378NlD3Ez9CXhMu6J3+sYafDw+xumUucrspe87GL3XdbROGw9RnoEDCaH3JxxnBIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OU/ZTkF5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0872240AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1752845586; bh=G4lk4FsJ2qcAuacIqlErV7VdOaRptwqRW0ss5ksjS7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OU/ZTkF5ycQK173ADZPIZ28+TfFI7Hmfk4gGEKjBHw1YpcCAs9je4qrcDmthCMQfU
	 zfOGX8jIuTMLhsTNh+mdxw+NewpZJG7/fNB38THdHD1pcdJyIZHTephEQo8xXqAPv/
	 9O90tS6AUaotTPoB4dv7TAUjGUmS71y6Ixe2/mhGxKFZlWEbx6sKtS7n+pqGeQUbme
	 6a1QFeH7JMZZmRiOYsfWh47Rzf5q9qpNHSTD7lil++9di2mgQvJO2/lF8cXpmyAW8U
	 m9fu4/T/GfVrioLuY3aVvCjL1LWx9/H8OpPtbdgZ5dtiyUxkd6Ir8/KVs7GbNRACJs
	 4ergiRourtU4A==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0872240AD0;
	Fri, 18 Jul 2025 13:33:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki"
 <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the pm tree
In-Reply-To: <20250718132702.3d15eb51@canb.auug.org.au>
References: <20250718132702.3d15eb51@canb.auug.org.au>
Date: Fri, 18 Jul 2025 07:33:05 -0600
Message-ID: <87tt398vzi.fsf@trenco.lwn.net>
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
> The following commit is also in the jc_docs tree as a different commit
> (but the same patch):
>
>   efbc5b4ac98e ("Documentation: amd-pstate:fix minimum performance state label error")
>
> This is commit
>
>   4613bf5fd045 ("Documentation: amd-pstate:fix minimum performance state label error")
>
> in the jc_docs tree.

Ah, I hadn't realized it had been picked up there, I can drop my copy.

Thanks,

jon

