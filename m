Return-Path: <linux-next+bounces-5480-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 452FCA39E5A
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 15:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 228893AA07D
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 14:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537E8269CE2;
	Tue, 18 Feb 2025 14:10:29 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3713E269B05;
	Tue, 18 Feb 2025 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739887829; cv=none; b=g+Y4Y85cF+AKtYmprU5cp7kBNDNNfQ2sYgUGwHDrwAQFzw5Q2afNs+EQZSPu6zMa/ZS8lfuSz1XftFiEDTIqXMTKEgAqqKhUcQK7I5Ovtskobma9ofTcn+1O4COUc6I11fyAoV8HuDbFk7+ojjCv/aej/vtisQ2noH9SZVlCnqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739887829; c=relaxed/simple;
	bh=sj/vBVH65NaJzCv7LRq0fKLXDDi6r4BjGZj0GIUVTjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaZ51LjQ+5wMOak2QVc7x0fv6dcuc+vNiS+uMtDNJYuDQjSsBwwxZZ2HGGMKj92As3es2svidFrtAvSZpwdo4KDlSMuR29eIln/7SqOspwD7eGfbLgwAn9Qr0UF2NRveIgZ5HIfKTafIwh5YMZ9JCQCW7Ut+gwgL5K1ocU3VDhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795F3C4CEE2;
	Tue, 18 Feb 2025 14:10:27 +0000 (UTC)
Date: Tue, 18 Feb 2025 14:10:25 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Beata Michalska <beata.michalska@arm.com>,
	Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <Z7SU0THZ6bSG9BKT@arm.com>
References: <20250218160742.49d6ab76@canb.auug.org.au>
 <Z7RiVtunqI9edfK4@arm.com>
 <20250219004934.46ace766@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219004934.46ace766@canb.auug.org.au>

Hi Stephen,

On Wed, Feb 19, 2025 at 12:49:34AM +1100, Stephen Rothwell wrote:
> On Tue, 18 Feb 2025 11:35:02 +0100 Beata Michalska <beata.michalska@arm.com> wrote:
> > I'm currently testing a proper fix for that one.
> > Should I just send it over as a diff to apply or rather a proper 'fixes' patch?
> 
> Maybe a proper 'fixes' patch, please, if easy - otherwise a diff is
> fine.

I just talked to Beata off-list. I think she'll try to use the current
for_each_cpu_wrap() API and avoid conflicts with the cpumask_next_wrap()
API change.

If that doesn't work, you either carry a patch in -next until both
branches end up upstream or I merge a stable bitmap branch from Yury
with a fix on top.

Thanks.

-- 
Catalin

