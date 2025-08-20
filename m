Return-Path: <linux-next+bounces-8047-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C941B2E88A
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 01:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132791CC01A2
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 23:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561562DCBE2;
	Wed, 20 Aug 2025 23:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Pki6dp4U"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CAC2DC35F;
	Wed, 20 Aug 2025 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755731814; cv=none; b=CafASLwgyvhGsI1b00KOWBK0MjoIl82X4P3HaA6qKOHZjlwHFAtbjHiaEG2TqRCCU2qhLj693IY+0ZeS5liDO96iNltQ1Qp4diC8pk2/Fs8gGwZh1B6maEB+AVyITJKdwA0Ilqep65aJPv0D83JlMW+tYUmJiBN0XimXcXVs7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755731814; c=relaxed/simple;
	bh=BXxLM/b3kQW0MEGWFUc1G1yH3XebNGc9PNlmEFksIVQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IOtjP2J2Zj8fauYvvhoxmAL8z8yfGB57BP0DsLp9voK9uycwO2ImJgEmWa1ltYyIWyb9/0LJFsHzWbR3MbtqKAdHox/Ixgk/BbqrXzqYHcGTCwL3GjCVoOp2fctT8VHOwrlVLuCn+z/13aBuYnwalQmOpVluccJsXzAJhNJ6IBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Pki6dp4U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522E8C4CEE7;
	Wed, 20 Aug 2025 23:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755731813;
	bh=BXxLM/b3kQW0MEGWFUc1G1yH3XebNGc9PNlmEFksIVQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pki6dp4UhuNMDJWTeZ/70JjWMWhx9Cjd+ydGX1i9pHJRXhovc3b7NHgx7g5MPkSHB
	 q4nxSqS/Y3KZy2m44faN3xGZzfrytuz6A3Dxs21ZthxOGlvR669JAlpY8/zHeyN9xv
	 lzmwFxifxgIre/mbh5tN1EEvMr56gpFMq0EapHYs=
Date: Wed, 20 Aug 2025 16:16:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Pankaj Raghav
 <p.raghav@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-Id: <20250820161652.ab1675e53ec0718e733b4a77@linux-foundation.org>
In-Reply-To: <20250821085441.437cafbf@canb.auug.org.au>
References: <20250818090559.3643eabd@canb.auug.org.au>
	<20250820094239.30dea649@canb.auug.org.au>
	<20250821085441.437cafbf@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 Aug 2025 08:54:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Christian,
> > >       |                                    ^~~~~~~~~~~~~~~~~~
> > >       |                                    is_zero_folio
> > > 
> > > Caused by commit
> > > 
> > >   5589673e8d8d ("iomap: use largest_zero_folio() in iomap_dio_zero()")
> > > 
> > > I have used the vfs-brauner tree from next-20250815 for today.  
> > 
> > I am still getting this failure.
> 
> The above commit is still in your tree which makes it unbuildable since
> the interface it uses does not exist in your tree (are you testing it?).
> 

How about we keep life simple and just carry the patch in both trees. 
Christian, I'll send a copy of the mm.git patch at you.

