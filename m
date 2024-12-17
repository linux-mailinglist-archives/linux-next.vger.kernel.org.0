Return-Path: <linux-next+bounces-4980-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A76909F3F92
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 01:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6824218817ED
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 00:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E043171BB;
	Tue, 17 Dec 2024 00:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dccFHXnb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E434C9F;
	Tue, 17 Dec 2024 00:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396946; cv=none; b=nGpYqjjlVWoR9R8WT3T2g7kRx1CFZKg1SM1xLap9D2Vowbl3gCjzgwmUrprhMwUfxP6Id9CyuXdmmfHgHS6LCrBxpX2iZrpgGGQjXYlnNAfzwblq6QE9efyts4KdsoovZnBFMFubo9bTrRPo//ys7NDJ8F4YX8nEJAZnPunRRS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396946; c=relaxed/simple;
	bh=MtmGNy5LB198PxFFCIfqXg5DLC2emROXQc0Ck6Nto2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iov6aibr8p/Ze2lmakMMdSB+Mf4/DpbcFxbbLWqC8qmBmP8kT+IdfICSuuKXIRu2HxBbFp7L5+BOhqzolYck5GGGpJNliMKFfzceMk0jRISqbzsuguUDsYrjGLaswvohQuZUXIpvEOEhua/T2tvazG81LdnC181QYmAt2Q6yfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dccFHXnb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54FADC4CED0;
	Tue, 17 Dec 2024 00:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734396945;
	bh=MtmGNy5LB198PxFFCIfqXg5DLC2emROXQc0Ck6Nto2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dccFHXnbWc06AQdFtPaN8GEamCz4tCg5W2eeaVlRyXuIipmjcXtXhPmaNjpA8KUcY
	 1hqA6p+TkjdJP1OKs7hg8s4mzAc+F70yTOCU2zE9EIxYv5UZ+ZRiJfrPXuqTD2P+Tf
	 UGNs3/fWCfvQdkweMk/2zYKhT6zsQDBBlktdfcfizp3Jz5xNuG2DCoBHaU/ckbFaj0
	 oRggO1tS82bU3vOLrIdkWVtw1R+qThPHQW4gUCFScKiAzWvumpD5rYXDV5YYcE8cpx
	 ntvhHo/SWLKS/PtzdB1v/EDihirKaqsWJ6rWz75TCyYmHajsgKJ9ppzyBLdyULROXQ
	 LDB8IftFYwzIw==
Date: Mon, 16 Dec 2024 21:55:43 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ruffalo Lavoisier <ruffalolavoisier@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the perf tree
Message-ID: <Z2DMD3WXW5Wn8vhd@x1>
References: <20241216082725.2ef47ce1@canb.auug.org.au>
 <Z2DG41WOlZgQl9Ue@x1>
 <20241217113947.0ad90c47@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217113947.0ad90c47@canb.auug.org.au>

On Tue, Dec 17, 2024 at 11:39:47AM +1100, Stephen Rothwell wrote:
> Hi Arnaldo,
> 
> On Mon, 16 Dec 2024 21:33:39 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> >
> > I can force push after the original author provides the Signed-off-by,
> > but for such a simple patch can we just keep things as-is?
> > 
> > Is that that what you're saying?
> 
> Yeah, hardly worth a rebase/rewrite.

So thanks for the report, I'll try and improve my automation practices :-\

- Arnaldo

