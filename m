Return-Path: <linux-next+bounces-7171-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD925ADE8B5
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 12:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAD9718871B0
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 10:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966742874FD;
	Wed, 18 Jun 2025 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="q9DBmO5R"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76D28A704
	for <linux-next@vger.kernel.org>; Wed, 18 Jun 2025 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242023; cv=none; b=NpVkFWGig6wr+vKVhmpUtjWcD0SBqE9kkZFQT5aH/oF2q6XwDBxh0eNhaAdPQbTyW/ZIIAAdg9ZefFeQkGmGJCjWag/LaB5dKDPBIIEyuU6fS4srP0ifZeSBxejHVZtcD9PXSluIdv9A87GtxXk4ynJg73gRj9MqR3l9Xd30028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242023; c=relaxed/simple;
	bh=WCVF2Ik6cQiyZrN1eJ2hI7RX/6WB/o9Hq3Z0S/EjNpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCaHkhPkeum18w1PjzQmMvK9MwST1zeJKUJgyA0gZpuqK+byTLMw++jbZawYKsU68SIzsAWWbdhh+4n+AfJPSlHM7EqqeREliA8wt9MqQfCBHkE60R0D/MgoOL4OBpJ3ew81lEp/eGUpio4qVRew9FyYG80ivscyqCQmAtsv0bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=q9DBmO5R; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMfQp2GrJzBS3;
	Wed, 18 Jun 2025 12:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1750240898;
	bh=nEHEmzkiwXFLv1SbStj09UkDIZNvmgynLKahQDMXZD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9DBmO5RWzllCwu7QyGb1MOtgsgdYaS4jYucZFI6GTA0YQZw2BJlEMPctfsJsAcis
	 FjScahc+tG58mpgXAHUKeksKJUTsqD/WOBR1rc0Y2K9UY8O9A9MS86g5QxPtiS0Qhi
	 tjoYtTaw/gxsRqTpyfa1/jbuqDqhCGkEJnKYXJSQ=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMfQn5gtrzHCJ;
	Wed, 18 Jun 2025 12:01:36 +0200 (CEST)
Date: Wed, 18 Jun 2025 12:01:36 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the landlock tree
Message-ID: <20250618.ohsahpoo4It4@digikod.net>
References: <20250618075128.2a8e9fcd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618075128.2a8e9fcd@canb.auug.org.au>
X-Infomaniak-Routing: alpha

On Wed, Jun 18, 2025 at 07:51:28AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   4213018f5f77 ("selftests/landlock: Fix readlink check")
> 
> is missing a Signed-off-by from its author and committer.

Thanks, fixed.

> 
> -- 
> Cheers,
> Stephen Rothwell



