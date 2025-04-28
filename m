Return-Path: <linux-next+bounces-6408-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BCEA9EAD2
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 10:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8FD57AA255
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 08:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9449253F02;
	Mon, 28 Apr 2025 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="iB9v5JmB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KFYMvU5B"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9001DF252;
	Mon, 28 Apr 2025 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829157; cv=none; b=YowLUTktMX82dwWV8OZBJffZZP7oJJ1J891uSp12wBwcvU//PG7NpkJOROngl/ravwIJ/FU24CvMxwEjh3697ACETGVu1TTwX50OrkzvCaHb0wxFXlcOtRNf/g/gqr5SSUM0NSYNAEpXwXUqwn2a4aL0cTrvG45cXasghj1hKls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829157; c=relaxed/simple;
	bh=g1+7tlPvYWN7Tx631CXGRRZ9msbxpuAQZp0IUW9yAXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpqLLYdJpEQYpSaUl9ZCJUCaTa0VI6l+7du+PjRKqAT7lCbQ68cBZCaO+epWKWn2/S/21NzSzng6/wKK1/Lv/2rYlJZDFgEic14ABFXvzhRhyuNp7NPA4ALfBiwUHYnYqpcgF6nRWKHlIj+SHdNdxjeIkBQAKPtDKVY9LWC2o7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=iB9v5JmB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KFYMvU5B; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0A64E114013B;
	Mon, 28 Apr 2025 04:32:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 28 Apr 2025 04:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1745829153; x=1745915553; bh=kHwt8FJQAx
	ssA8h+brFjrLhfWTfeC57mzi4Q8fgCGig=; b=iB9v5JmBq4h83Dh+MuvNP3ZG6t
	5La6sUAZ1KogjBVNWbC7zdXmRh9867fYKNHv9vX4f1SBBBUoRG00GStB3EDrjXwo
	5yD92FJCarkWLuGjkNU5oWisv/1ojwsX8DoTjm8R+xK/QWfrYDuetaEeigADVrQX
	6vPbZtkEqAZjr3zdbiEaPm8L1JXKMyx2+l27s+j+3vjQSjxs/TMlWXD8D+ts/q98
	b0A96T5/mk+5slyLiw2i077DL9kTn1xBSs2sLJrBHKlia80TReBT31AVy7ecdoK1
	nenpWChWIUgtuVtce3ODLt55vjq5hkA6d3UpPPi5LDp+Nj0SrmNqHs7aUFFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1745829153; x=1745915553; bh=kHwt8FJQAxssA8h+brFjrLhfWTfeC57mzi4
	Q8fgCGig=; b=KFYMvU5BHyFOY2hQqthsPGeVgdlraqHnPW3xaavALmsKWpmoQCQ
	Ahybd/DKsUUQRbnw2P7uXrpB1h2V5FlE6U2fycXswTkLbvOrOqwsn6C/BeQlicDY
	ieoxc/Zr1liHiX53NkKjEpl3FfRZ46KqMD3MnXYbEP4X86QUmOfE/wvkHHdmydis
	P3eqoKCMIpK7pQiULV3fIP7ih5O/Gy4j1dibgOzMl7WLVqG9rfk8dOaKdNDOFqRd
	NKRl7xBFadDH1MGgp6LhoKyWK0QXeVeXuWlXEiUIq56NAjMlX2MazUJwmVjjazcN
	x6C5ntpsD7z/N7WRhwMRweTLK/CXe3tgGng==
X-ME-Sender: <xms:ID0PaLmuyzcLLLmXYWkvYHa7DTWuRxQtCt0WbY_oUq-zTpqpsICVaQ>
    <xme:ID0PaO22NYn9FbIfhAb0EF1WgSzjScSLtsXSQp01gRgh1d2HNMT22GNQFAou_8DKu
    YlwK6glHXRFPQ>
X-ME-Received: <xmr:ID0PaBopFM66K5s_alPgaycYtn22v4gsDu0P9H5-4_Mltr0KVWUtRM4Gbw8n6epaNCyO2aaAshon3t1RAX8sRHhejbT2yzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedtgeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepmhgrthhhihgrshdrnhihmhgrnheslhhinhhugidrihhnthgvlhdr
    tghomhdprhgtphhtthhopehquhhitggpfigthhgvnhhgsehquhhitghinhgtrdgtohhm
X-ME-Proxy: <xmx:ID0PaDlIXpBOnAk49NskSGdgFebawJhyOYUKrZPRjyLISEe3H8MCiw>
    <xmx:ID0PaJ2612uf9v1mz8KFZUKMN8dSfzBRK2mAr4MTNmeQ1n3cIbtZdg>
    <xmx:ID0PaCsfJmwSwNjkhlFAPs5ofgz6b-3HdukLYuOdAFQJbFxOGKWS1Q>
    <xmx:ID0PaNV4fcTvgYnsRV01GwdLFanSGPl9T_2uzMve-rXF0gNDWfwgwA>
    <xmx:IT0PaE3Yx_PSUKW5cxvm2LfCvQuOg1fMvWAwsqoQ8RLhV5Nm5o8SzTg6>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Apr 2025 04:32:31 -0400 (EDT)
Date: Mon, 28 Apr 2025 10:32:30 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2025042823-manliness-drove-33af@gregkh>
References: <20250414142740.550af271@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414142740.550af271@canb.auug.org.au>

On Mon, Apr 14, 2025 at 02:27:40PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/host/xhci.h
> 
> between commit:
> 
>   bea5892d0ed2 ("xhci: Limit time spent with xHC interrupts disabled during bus resume")
> 
> from the usb.current tree and commit:
> 
>   5beb4a53a1dd ("usb: host: xhci-mem: Cleanup pending secondary event ring events")
> 
> from the usb tree.
> 
> I fixed it up (they both added the same function, and the former added
> another function, so I used that) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is now resolved in my tree, thanks.

greg k-h

