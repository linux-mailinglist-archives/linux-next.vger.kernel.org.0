Return-Path: <linux-next+bounces-3068-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E2934773
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 07:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE09CB20F0E
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 05:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799423D552;
	Thu, 18 Jul 2024 05:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="KmPICPl+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vUd7bXvK"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5145639;
	Thu, 18 Jul 2024 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721279793; cv=none; b=PtFaapM1NER2BVWDeTxdGzJOCF5R3vJ5FcEDlg9OjS6k29d8mRdu6QwfANlZzyzQrGKD23gN61bdfW0P17pwG0z/CWvVElTtcLzv+Isa9wkEV/EsIB9LLAbtHOGGY600JWoqYaXtf/URi7UJAqzBNNKCix6bULuJnqHsGLxc9Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721279793; c=relaxed/simple;
	bh=U+MNUvd66B9/zZzu23Me79w5DPyBAqlSBVA3WMjHr+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nv6G21EE/gatOfDNNYs06a7OGf4CbTLGOnsS50Wv0nxF904m+BpM5eOesYJEoPS2udFykid5j5ArOlpGRxFkb4pPLXkd5jp/3HoPDV4MDSDfTxGdwYHaoA0K6QqXspqAiL84saCKQCy17iEKYuSkT/Qz2JPuA2IgUw4lRGctTrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=KmPICPl+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vUd7bXvK; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 99329114021E;
	Thu, 18 Jul 2024 01:16:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 18 Jul 2024 01:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721279789; x=1721366189; bh=DgyzIJzGj0
	madh9kQPP8t8uiYFv3p1rqYCgUXK2LLIQ=; b=KmPICPl+SPlNAI/EEUnNEa+qxp
	rHt5p7EqIoCZNruP9JpfQNBrVqwAC3prDcVwMf6q+lJOTgriIjflQQHcQpI+fw1+
	ouCe6DrLplcaWp6CWKx6TLeoDVJM3iEj/NMqny3aUSln118zPmAh/Xf2ot3M4fGe
	tk5BtmDN6/gvI9xvrvI5dCSzQKYJnLn2uQHCKBPiSfj2Y4cOczJgHx4XsomxOncR
	lUtA/q/FWkElAJ5mTJkNQu0dQkm+K9FetVbvpypPDzprYRfCoWcljxNuxz41vQyL
	RZX1d7KkNAIdEQX7uXNSzs1J1YFOPv1AgSqRmMqCxDtzQprxNzsorp8VgQAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721279789; x=1721366189; bh=DgyzIJzGj0madh9kQPP8t8uiYFv3
	p1rqYCgUXK2LLIQ=; b=vUd7bXvK57/m4m5mC9z3FD4ysUPKX/eCYeLEKkePw2OZ
	NgHd7elT3uXqhFzHslDaoiFsY38dezWGYp4N2urZKl15auQmoU7RWx20NmN6g/pn
	Dm1EBOExsXUi6/4GL//w0czE3cSZ0SDAZyCMTaKAAXYUKQpzwdDbslXlwWi815zo
	iU8aILw1MngC7oTycc913zOUPd5lofvT8qVuV9mBodN6bHxRmlvJK7Rv0VJIpozK
	+TxRfLHwP6Of0eluaPuZhDt41Aa3K5YuVhkamQCSgA9rQOkLnlwK+PpBXicjIwG4
	SSYOdgS3ysCZyd2Z3N8bKTWB8u1uDaj69rysxhoY7Q==
X-ME-Sender: <xms:LKWYZrxB6xJOm_2jMe8jqwfreQi6G8BjUwsIOlioX3s2XwMthib-og>
    <xme:LKWYZjQBgFS0PLrKnGAYRxKc0LwLmKRPSE3Na_Gm3NGBZzuEchA9HB_PF-Eqm40md
    uTbmJgMyhxECA>
X-ME-Received: <xmr:LKWYZlWT5Sbke7ki7n5zW7XX8Au81Qh83j6GzDERTCPqgQM-LtayChEouqtEIquZB2W8KsCT8RPQrHYEnVhXuH6xOdgpm007NAHBcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeekgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:LKWYZliFXZ9D7K4aBuH9QeokaTu7ivQkoyyfPGDdLceL16XO2-79cQ>
    <xmx:LKWYZtCaAloV67a9BllkhWH6hUlHE3PsZ2KFwBzwyvIw5nEz_WXSsg>
    <xmx:LKWYZuJm2UIR5wZvbLE0buEYvV7Na83kfydZkm51stFZG_BRBFN9qA>
    <xmx:LKWYZsBr9Q9swCYuhFi_DsqBxuTvLXBJjBSGFiv5t0XpLoYQMsqeow>
    <xmx:LaWYZh6BhZb8UmGN44kZ1E9oiLGeqS5MjylLZSQfGWp_oSe70PkCh24P>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jul 2024 01:16:27 -0400 (EDT)
Date: Thu, 18 Jul 2024 07:16:25 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vhost tree
Message-ID: <2024071818-resemble-errand-a58b@gregkh>
References: <20240718150141.49349347@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718150141.49349347@canb.auug.org.au>

On Thu, Jul 18, 2024 at 03:01:41PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the char-misc tree as a different commit
> (but the same patch):
> 
>   69eced9eb49a ("virtio: add missing MODULE_DESCRIPTION() macro")
> 
> This is commit
> 
>   89067019d7db ("virtio: add missing MODULE_DESCRIPTION() macro")
> 
> in the char-misc tree.

Thanks, should be fine.

greg k-h

