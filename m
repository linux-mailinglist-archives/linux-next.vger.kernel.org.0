Return-Path: <linux-next+bounces-8781-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E818C278E0
	for <lists+linux-next@lfdr.de>; Sat, 01 Nov 2025 07:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F5BD403F87
	for <lists+linux-next@lfdr.de>; Sat,  1 Nov 2025 06:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024EE28751A;
	Sat,  1 Nov 2025 06:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNy/2qZD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B5228726E;
	Sat,  1 Nov 2025 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761979282; cv=none; b=KyJmHQPZGdySBffnt+exTmRC+k1ZKxxuN/30AzyRgtE5Hi67fmYEd2ziZJYIBQZmxGN3+Fr5o/NPKabhHb59PemaZNFvfMup2QU3EMcWXf5huaCoMA/l1EtfwdDTMVrKc+7NQR0xhRjMQw75MnDp68DBf1+sraCN142+iSs+whg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761979282; c=relaxed/simple;
	bh=UbDxu5FMOTRlsVK/fGGT2kWvJEohoNcEYsiYPtWszRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6BvXHfWrGOntPWbjOf9jadNazMX6fBhjO8TiNG9fcUExZ+B7WYliL/7FUf5zA2fdNVGxyZYwR/h6aBqmgdVt5c9fRCGqmf6SkYk8Nn/1xh0QzeViMUHpHOtVdv6OQ0MECy88KtiZYQRvV6AKbbfuFZX2Xz7d+deak+CvDKgGFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNy/2qZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC6AC4CEF1;
	Sat,  1 Nov 2025 06:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761979282;
	bh=UbDxu5FMOTRlsVK/fGGT2kWvJEohoNcEYsiYPtWszRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNy/2qZDkf6cTFisAqjZEPk0GeMWNf4shWg9SaX3+n1Pc4lTzmOAewtVG/DBK1x20
	 lzeu36PLyeyYwQymLnXZi5jtH30Zbbqbsbfb0S7TvZkhqbwL6QiJb0dWs/DG9Hy2Wp
	 HKSnrvnkF2hbvgIHtD6QBO/+tzbsueuMoSRXJBauOd99LWkebNyz5YIFaKbaf7CGpB
	 7PD1/r4Q0SlUWAGdX7nnDsz8uTnyzBql/egebSx8e8hoGB5BQzywfUnnn8aJhsgqKE
	 YS3A8juYO6jqOxWImiEAUHwQ45mgASBLX7eJNdqOJblYklv6PPBWbQM5mFIfxTPKRC
	 TXvPW05Lu3+0g==
Date: Sat, 1 Nov 2025 07:41:11 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <aQWrh1ewMJRBKlmQ@gmail.com>
References: <20251031120243.4394e6a8@canb.auug.org.au>
 <20251031092150.GS3245006@noisy.programming.kicks-ass.net>
 <20251031095658.GT4068168@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031095658.GT4068168@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Oct 31, 2025 at 10:21:50AM +0100, Peter Zijlstra wrote:
> > On Fri, Oct 31, 2025 at 12:02:43PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the tip tree, today's linux-next build (arm64 defconfig)
> > > failed like this:
> > 
> > arm64-defconfig builds just fine on tip/master, must be some conflict
> > with the arm64 tree or so. Let me go have a peek.
> 
> N/m, someone removed core/rseq already.. *sigh*

Had to exclude it to fix -next, but it's still all there, just do:

	git merge origin/core/rseq

... and it will merge cleanly.

Thanks,

	Ingo

