Return-Path: <linux-next+bounces-8936-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D50C51C37
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 11:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7B8E634994D
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 10:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E6E23ABAA;
	Wed, 12 Nov 2025 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b499y+nr"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A8D2DF136;
	Wed, 12 Nov 2025 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762944501; cv=none; b=k3+RtmIUHBTcfqGVV6NLFPE2/xeiaYFYnsajDBzTGVkd+9yH1HsyeEYzHSVWldUBMHqcniMd7dxd3Ujt+QimX4YUcVJgCBPNf9wB1VP7ZLMniX507pQlYZoULhavHmqOTvMV96hrApBk/ASmi0J+QVKj6aDK4O8YjFCpNQTg7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762944501; c=relaxed/simple;
	bh=/nJEc5enyYDL5G1PZdUrvW/VP7pB8ggQ7QGueGFnvcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eagzFA43TKQSBqFx5KEpqVQ9Vk72hdA/9cwsSu3CaVfYLnbFlSHRCbXmtTZ9a/jm5Aujc0DdnwiMNHGvYjGJinV4swoYHaCrp456KVWHHGCZ5yQc+6XBuUrrl63adHTlMC20PmlLe8XRNrmkhKcl4rOFBEdXCvq1A4DXJR68x1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b499y+nr; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/nJEc5enyYDL5G1PZdUrvW/VP7pB8ggQ7QGueGFnvcg=; b=b499y+nrmYxfausGoWb9D0ektT
	als3WJx4XxpYqMXvKbqi/yjpJwabsP6wtIV5FE6ee/s86bT3fCHHE1RI7RNOJfaCQJ859jKsr0JQO
	9UPjzELGiIxK2nzFjfV1FTrOCEUPZGPDzlxLybqc62AcA4QMd8x4byVMxAhD3xyTzxTK11Rb5h3dr
	bybcfnaqZ/ro9orpyVFqgOTxT/r6n5BLW84FUyM+NX7ZQB6wND6gfhYmv/U2BbuemlOEo3TgOcIUS
	b39LSwPoGJZs9EUkw8T4UyFHGuD4Ouxe6J+YisKVgF3U/2XYfC52D375Rfp3cJprco3f/repHROAf
	toutyuVw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8Oc-00000005lDD-3Rzf;
	Wed, 12 Nov 2025 10:48:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5D126300325; Wed, 12 Nov 2025 11:48:14 +0100 (CET)
Date: Wed, 12 Nov 2025 11:48:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251112104814.GB3245006@noisy.programming.kicks-ass.net>
References: <20251112154200.4d3671f9@canb.auug.org.au>
 <20251112093928.GD4067720@noisy.programming.kicks-ass.net>
 <20251112214515.41daf9cc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251112214515.41daf9cc@canb.auug.org.au>

On Wed, Nov 12, 2025 at 09:45:15PM +1100, Stephen Rothwell wrote:
> Hi Peter,
>=20
> On Wed, 12 Nov 2025 10:39:28 +0100 Peter Zijlstra <peterz@infradead.org> =
wrote:
> >=20
> > It appears you're way faster than the build robots :/
>=20
> I was hoping people would put their code through the robots (or some
> local unit testing) before publishing it in their linux-next included
> branches ... ;-)

I do, but sometimes they just take forever :/ And clearly I don't do
i386 builds myself.

