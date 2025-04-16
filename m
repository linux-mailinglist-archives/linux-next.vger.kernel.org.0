Return-Path: <linux-next+bounces-6263-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA185A8AFD9
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 07:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6A0817FA0C
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 05:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE00E227EA4;
	Wed, 16 Apr 2025 05:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="epm+x4zr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YZgRfbp1"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE8B2036FE;
	Wed, 16 Apr 2025 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744782698; cv=none; b=o4dCa0ksoD4+jaka1/4NvsNcy2JmKm3UXwUfOl9u/aAeg2MHfRNO45LGpTG8j7HAJmf6yw/vgxikhWr6YSrseFeOI0D2zd28k2EcWhr0V8CMNjwjdX57nXgBGEj6gwn/4rTYoQYhaBBcuNpdPSoxtsKqCpxasxyrusasJG8raQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744782698; c=relaxed/simple;
	bh=a3jxz39fD3wy1lu3uy7vIwo3YPqJ47vLZqKHe5UkmoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9Ki2XLfYksaL+/Af/tNT+AUEB5pf7yIP0kKrDxMIj4oICMw/kr6W6cq1tWwmfVVCSLVN0zRcBVinvzGAtRWDI5iI6ALoxP60FyerEjshRvFq8YM+8c6hKVLxehobhW4jBp8OMCSawXPzeeIg4BVVFMapIBs1oaxA95D4g6mYwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=epm+x4zr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YZgRfbp1; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id D02EE13801E3;
	Wed, 16 Apr 2025 01:51:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 16 Apr 2025 01:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744782694; x=1744869094; bh=AEDh6MCvsE
	A1PfXpd2mpHSjULH8yOr5QYDym5AMx5Ms=; b=epm+x4zrTWmqhPlC169IGWcmUA
	VjfGVMoH48DQXiS9xd8yk8Uvib+MPEI2Vy2NspjDVnfYLdrBS4zBQLfR/n7GHqu6
	PQiUeuBwBCSZnF9Xw3a7W6NtbSM72mY2A00clJ7dKwrHkn33rpkl2TdhTYt4TUWh
	q1vpaCxW69DNP+SCkAHk5EtgpMFcbGV8GGAhtZLfb+60XzCdU27T0lL8JxmIhRP7
	VJXlukYFFo2NIpjFabw9skDRNH6OALGpHbsbjMi9berQtNPLAlVo6TpdFkLgsRO8
	pIzA/BAZkZfZj+c3snT651AwLOwd1DA7VLDNJqUWRUFtvBB2el42AHX805pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744782694; x=1744869094; bh=AEDh6MCvsEA1PfXpd2mpHSjULH8yOr5QYDy
	m5AMx5Ms=; b=YZgRfbp14tSI6zR1xnryrVF+UG4BGwthawZ3VUNBD7aCcITzt2j
	CY2Delw5OWHpwJs6CN/Av4Io1wcN1tWZZNoVDIQovE2QJKoQ3osca8K0xWu+IbaA
	FnMTsYxNkg5gw9aVGMmEvAjtgY2NNfAjct4Z/A+1s976bA3mDIrVHOT/hn/5epVe
	kS/B5EYInKmU3fMlXs5r1P2JZSySH2o9R9qnMm2UZyIbf1J2oFGLfaoW7ojQx3UA
	lhH81T+XhjgGTvta4PsPGtOY38J/Sm86eT5iSvSKJ7hcQmSvQsk8qlVX3oO6ycvq
	zZyDLG4pCsy39NBMQ6/loPpSmBOdfBT4Xyg==
X-ME-Sender: <xms:ZkX_Z3huxd9cz4nGim2-PulB6VQ3LSf_3ekqkyj-jlhKeba7A2mL3Q>
    <xme:ZkX_Z0D15dbm5jKEdg7lHoQTdKQ_CwlTeD3RThpPeKkxkZarHC5ZSHbGxKsqlsD9v
    Jpn63iTd06FYA>
X-ME-Received: <xmr:ZkX_Z3FEoaiFekP1CkX8NLNpTP5g9P_ZwFpJsSMLe0GUuU7HAO-0U3gkaRLLf-vA6IpA75kOvqnY6fE-jZ2RpJdF_9GsTZM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruh
    dprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZkX_Z0QWNwvCboq9vYUnBYQRhnFS1QfkQQijKTKR4RMVyk9VhyMN1w>
    <xmx:ZkX_Z0xXaf-kQrYzvEKmJq0eSinXr2l_5EizxSU9hSx1_b3MxodVnQ>
    <xmx:ZkX_Z64PP0f6N1fkPOUa31qCTUHd2kNkgi9QwXnUJj-GR6WpMlgQmg>
    <xmx:ZkX_Z5yS9chEGRE9EA-9bBtb9bbRrpY6BWFVI29Qpd-HHkayGJ_IWA>
    <xmx:ZkX_Z4r3Pw4Ujmau0MwX1HQ9DXA5N92ykMDWQ1Smrgfo14EYoKwociay>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Apr 2025 01:51:33 -0400 (EDT)
Date: Wed, 16 Apr 2025 07:49:58 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the driver-core.current tree
Message-ID: <2025041646-resubmit-erasable-4386@gregkh>
References: <20250416094455.55506561@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416094455.55506561@canb.auug.org.au>

On Wed, Apr 16, 2025 at 09:44:55AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the mm-hotfixes tree as a different commit
> (but the same patch):
> 
>   b9792abb76ae ("drivers/base/memory: Avoid overhead from for_each_present_section_nr()")
> 
> This is commit
> 
>   ab81406e527d ("drivers/base/memory: avoid overhead from for_each_present_section_nr()")
> 
> in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

Looks like Andrew dropped this from his tree now, thanks!

greg k-h

