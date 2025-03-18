Return-Path: <linux-next+bounces-5847-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B32A66828
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 05:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B99543BA4D9
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 04:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B3F3FC3;
	Tue, 18 Mar 2025 04:19:35 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003FA60DCF
	for <linux-next@vger.kernel.org>; Tue, 18 Mar 2025 04:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742271575; cv=none; b=biABDvm/sHrewI9LxFGMmgBLeJzePWR12pmPYCOFb0xbuHFYA+6K35aU6EIaW9I+nphEjKabXqq/+Nl1JxZSnUR+9/j5DLoYBuJxKj9EqgEJBf73GbRX/Zkp07hL2DfnjqrNDmXjkWWT95Tfk0VHs+oQ4YHdu7zgN8qpwxrF1Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742271575; c=relaxed/simple;
	bh=pII1N7bc9duBPXP5BmZ6emkSB47E/v26S7V9abX9bDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fp/jXRIRQhXvIEStEio8bCm+Lt/K0SEb7wlgjXqx/QyWvz4dzbAnr4TWLx4c1QQZCG8eFMT2H+OtgbmcJTFpeAm1rkou7yAaKib/39Nz0twpZPJedM39s2nT/GZeQiRU2F0imD3Zi57UaJFgiZMxcDrL1p/huSvk5e75j2q+GTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-111-34.bstnma.fios.verizon.net [173.48.111.34])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 52I4JJfk020785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 00:19:21 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 69AA22E010B; Tue, 18 Mar 2025 00:19:19 -0400 (EDT)
Date: Tue, 18 Mar 2025 00:19:19 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the ext4 tree
Message-ID: <20250318041919.GD787758@mit.edu>
References: <20250318000658.29a791b4@canb.auug.org.au>
 <20250318080951.71772135@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318080951.71772135@canb.auug.org.au>

On Tue, Mar 18, 2025 at 08:09:51AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 18 Mar 2025 00:06:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Commits
> > 
> >   400bb71a00da ("ext4: fix out-of-bound read in ext4_xattr_inode_dec_ref_all()")
> >   4d6eb75d2364 ("ext4: introduce ITAIL helper")
> > 
> > are missing a Signed-off-by from their committer.
> 
> These are now commits
> 
>   850d8d9ff97a ("ext4: fix out-of-bound read in ext4_xattr_inode_dec_ref_all()")
>   8bffe40e9e9c ("ext4: introduce ITAIL helper")

Thanks for pointing that out.  Fixed now.

       	     	 	       	     	 - Ted

