Return-Path: <linux-next+bounces-6252-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C09E7A89D10
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 14:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6868C3B68A4
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 12:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1662629290A;
	Tue, 15 Apr 2025 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="mKlPxeQd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bRMkr7ic"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792328F52A;
	Tue, 15 Apr 2025 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718563; cv=none; b=RLyz1KLOAv44PPLQWYfJnXVnuBcBesR5C2VfSDtYxG2lyAGk4lLKFgkFwaVss6CdeBM7WR/+hUbSc8Bffk5f72iYPPnBAzXyxjUHjvnJInM+x79OQ41OhZoTioH1lgJQhgvaumZXo+fJkZeHeQRGC0B+pw+yzhCUTALPoGroZ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718563; c=relaxed/simple;
	bh=VRNC10liWj8Zc7n/X/zWgNjaNhHvb08EBRoMJJB9j+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nscOoZ+V9TzHn6oWoMrn3IOAz3n8ICQO7w6Ok1hrT0BigRJbqFvGVMrZj1wwXw1yplwsNlPvEA+UZwIiGvfSzQKYeD8cdsLVOoSSLecBFOXASkdCZLErVVONG83emir36xjtE9M/NrdzIYiYPiJmVpXFL0LNd+DtixDIDFLLVPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=mKlPxeQd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bRMkr7ic; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id BD0161140217;
	Tue, 15 Apr 2025 08:02:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 15 Apr 2025 08:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744718558; x=1744804958; bh=QnStKcfaJM
	jmfDBxBcSnwlZXaFcarITxcXSIfdql/F0=; b=mKlPxeQd60J3ktVlGrJv840tzp
	Vagx1d8HM29DFyu5po1kkW7Z+1AtWHnU7FqX6MikjjT11mGBtCO3FCT206e0bnbM
	kpWt6tOaNd51mjJjiuCTIUwEmpm9hwz7r05Zqiusgjaxxur/tTHOPwIz63CO81P2
	xazJy0AcghwZz3ZaZ8o3brgB2vZrwg82iuYLt73MkGsQkiijY3zYGApdpMEMjt12
	eGJmGDEPyiMtLscko9nQOxzqK5Ipp3KQRlMlLLnW6L/UHXJKrV/LJCzGApUSAvz6
	pjHgtkeVg/N8Ln1PRNRVgTnZ3dJsccFerqjRT9W9+MCzxE5gxthty51WnemQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744718558; x=1744804958; bh=QnStKcfaJMjmfDBxBcSnwlZXaFcarITxcXS
	Ifdql/F0=; b=bRMkr7icaqgt+Co3HR6xFelMqAkJAo2+141Z9cWufbzQFzfXAF6
	fgBOv2eEMAla77vSumXgLEVnLbp7DuBwW6NHzu07C1+4DTH48VqYMr2XdLpe3Ym8
	kgcxarACY9us1cNlW9ckjwXVxOKJGnGP60UIN0myTzMWDkuD/Q3JFU9UwbFc7lS3
	qRUOUjJyWBX7JV4aG1kx5W53E0VkYQiEZNMGVylYEWAIZhMtjv1G+UZ5KY7UBGdT
	sQMQvse6Gufg3usqXshv3/UznupMAi6TFv949DHMsJsZS/A7gqwBETM5VypvYZ3d
	WXliFSkoxoxBi1+uwE/2Pj3LOBgMh88Ucvw==
X-ME-Sender: <xms:3Ur-Z1gtJRvvFzfRNvqLjPRgPC1YLuUGL1wKYC6QKIm-uKp7OfEOYA>
    <xme:3Ur-Z6B6p1rz_Sv_GQFYO_ZK14zgoYidHfkBsXqZzaXbix3kUb37CDslC0Wp3e_12
    mAsobqdMIHWpA>
X-ME-Received: <xmr:3Ur-Z1FOW9TZ4E8dHFg4ntm4RM2xeyg3OMuIxU5Rk7dfLEFC4g9mnFyQWBe7dX2jTxgbl_pfNHpGUtfzT9_OebKnYqssUHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefgeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:3kr-Z6SKzChpWLMDoIAdou6aJp8NGRkPQiCrmQFgf3sqMpX9ztWB6w>
    <xmx:3kr-ZywkGmc1oLCMtfHr96b_QXC8vT8OpfWCehH7ybV7BR74z0gTZg>
    <xmx:3kr-Zw6LF2T6mueluVQ-m-chn4wdm7EifX0GOw7KKDHtumUeMU4ZXg>
    <xmx:3kr-Z3xaeoz7RGSeduvywelHpflZJf34P--98IyJSEcynBGIGj9y6w>
    <xmx:3kr-ZxTHtXcrQkDfKKa24-xM9P-O_HihhLcHhFeF6EEgHf6Hyk0Tv8zr>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 08:02:37 -0400 (EDT)
Date: Tue, 15 Apr 2025 14:02:36 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2025041530-amperage-recycled-2131@gregkh>
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

Looks good, thanks!

greg k-h

