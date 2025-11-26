Return-Path: <linux-next+bounces-9226-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F96C8A1C4
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 14:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90923AFB6A
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 13:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5D7326941;
	Wed, 26 Nov 2025 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="bMPR78wG"
X-Original-To: linux-next@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA6239E9D;
	Wed, 26 Nov 2025 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165352; cv=none; b=BxLVO/vw1mmQWgsC4bjG1CeAcmj8SWCf5lhbfGhuBP9wSY6Rx01Vm0+N5d+baUas5N9h9O2Mys+wT/ox24a+C3ueuy36lBOia6k7NAt4tIUvDk0TlPtBiGSRp9C5jz08mTChzT8M9w6jvuxMT4dxkRBa59LKBgi/a32j0bNdMdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165352; c=relaxed/simple;
	bh=wbrrEAe6F68LzIx8fhje954OsdiBTwwKyT6uYuNKnds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW2rU0Uvvl10WhLADPFQ1Gxtyqry5IdlG2JRMPK+M76JYSaZZtGYjat+KpM0kUqOvAGA1wS6wo3XANxSYVdkow6bCfkCWW4gSBggGA41Jpg5ngshBmmyrX5UoLPqf3bN6JVqDbqHrSry0u102rs0qqGaLpIki+ydHFA5m2Dmiqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=bMPR78wG; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xsBBnQOZndHDroaceNtepqKd9uBGO/3eNymwzriZrUU=; b=bMPR78wGO+SOe9J0/tTYb8C3PH
	ss3fcrOjSJuXUDpEY1v9eFYZ2dmOJDkkcA7rKVah+2MEbR51nPNtu2zvZ6mj2TyqmG6MgiptYLDWR
	ZLb8luLcvShxL562YgKeHhYGKlEqxObqojLZXBC10IB0jLl4YRf8rGNrIWQJHfl3lC2OwoNAuqrXf
	YLFXYC2S4OsAQ3Uw/N15pW1JWQW65CpdZe12pdOCeNii1blxsNClyvNQy1BNsnU/ZgO1vZtO8wV7o
	eiJ0VlVmo7K8dvXHl20L6/asTSG52gxY05kEk0++Fvc28rqObRQPspreykJhFExSO3WbetmXkq4nd
	zvKjClDA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vOFzg-004Fry-M5; Wed, 26 Nov 2025 13:55:40 +0000
Date: Wed, 26 Nov 2025 05:55:36 -0800
From: Breno Leitao <leitao@debian.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-nonmm-unstable
 tree
Message-ID: <ysfflxtpkjuv6j4evk3j3zr7ngigrcpjfvy4pqj7nuaqqsdenx@3znqkes5hrnf>
References: <20251126125556.1dbda9c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126125556.1dbda9c9@canb.auug.org.au>
X-Debian-User: leitao

On Wed, Nov 26, 2025 at 12:55:56PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-nonmm-unstable tree, today's linux-next build
> (htmldocs) produced this warning:
> 
> Documentation/driver-api/hw-recoverable-errors.rst: WARNING: document isn't included in any toctree [toc.not_included]
> 
> Introduced by commit
> 
>   c03fb5253a03 ("vmcoreinfo: track and log recoverable hardware errors")

Thanks for the report, this is my fault, and I am working on it.

Andrew,

Do you want an additional commit or should I respin the previous one?

Thanks,
--breno

