Return-Path: <linux-next+bounces-5175-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3013CA0AEB0
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 06:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 031F03A68A6
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338B1230D11;
	Mon, 13 Jan 2025 05:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="S26WNjSU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UVJMZvZK"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE7D1487FE;
	Mon, 13 Jan 2025 05:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736745616; cv=none; b=mXHKVrMgBnuSC5rLfZvHglD2ZRqpUPP/xo+pGZ4V2zIvgUJmvyhzQhN37H6ixfbudzinxqhEvz3yyCubnWj3Fu0ETdfuymEDoBv7xoHbjtFp2dm4PwEavN4T9hxcXlFwmQCCsv1gI7tER/8njaJlJoVG3RALwMIMrbhBAn3g1pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736745616; c=relaxed/simple;
	bh=d2MKZH5g3dJJynGu8OvB50ziRn6gwCRV1OnSp9SdLhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErZJiNHC/e9rGKVcePmk3PeQGUqFqO0HNwsxg9O4nNsUalU/wbv/dMpdabfz3e+c16S6/LQFZpW3MdrF4RGCUI3e2eWOWINNMTNZ/PQr6+7fKs+wx2QuhxbEhqEm+bqgaXwZITeNsnLF+Kc5FiABjsSmTzock8QJmvobVDqxlvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=S26WNjSU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UVJMZvZK; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 2274C13801EC;
	Mon, 13 Jan 2025 00:20:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 13 Jan 2025 00:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736745613; x=1736832013; bh=9cgw9BJcys
	LfNBn/l9DE2gyo2PF5abH6ZvxXo4eTtWU=; b=S26WNjSU7SjbKFjTrZpQ3KvDGS
	IW/LW8D/oq+TqbACmNXplRRFxgPTjrD90NQf2OTeDuxPcG0Z+vYZziAW4zOCvLkn
	8GPVxkV1bBji9OWkSr2hlTdVu82Rfr0lk2OSXCEDRGhB8Y0dNtXx68xqmOLtzZSd
	eyHrCQBTKi30+AV5WMZXlBa6e9Mou4RZ/Jwy6KRexqPB+qLYGoFne9CrtnPPeGDz
	X/uuMzebuQiLgPjhCgMjjJbExfW6eFQUsEraf/sqobyvLwPRX7XgxxLwJ4XAvzW+
	egsIYFwlGQPO8Zcwy4VZBJt589lBVxP5ISa1T4Shkv9evpcgv1Q4gmwQNwjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736745613; x=1736832013; bh=9cgw9BJcysLfNBn/l9DE2gyo2PF5abH6Zvx
	Xo4eTtWU=; b=UVJMZvZK2QeD0BD0p07MUwzEi9shBQ6nQlR/vsqgojLQA5/fMPw
	eRb3dXRJhXZsDQnrkbik85EyRlK0Zka36L4mOx+rkP/h37MXM3cgAMBIWtcxVe2Q
	Ge9pNjTj/ymnPSyyR+pZfFLJGTIKXWopg6lYO3IbBR3uVvsZhYWyH8yO3LVgl/Wd
	3a03Gac6XP4qOWpH7K70J3MqOeFheqX0RJtsF6G0/cWsN/gVyeijBM5bngV5kBXK
	6HVBbuN33fGJCqmzwGeO4WFGJZ/0ab05RUJU4ZQ9U2zfZp7wQUMQzmN8s7iWX2qx
	GofJE6/OESCzyhyBXDPRG3DiJrtkLn8cSXA==
X-ME-Sender: <xms:jKKEZ_8TrD9Odkg_4ML-QPOSI4jJqep9Tea6Lm9BBBan6KTtr0mssw>
    <xme:jKKEZ7u5RY8g4gC8YRMWOCPBSWD3M6J8InwvInUChpS1PeWJjB457zb7lRvHCsi5b
    8YmzzJCAOwRuA>
X-ME-Received: <xmr:jKKEZ9BuUv84_FSWtwE6ubcIPm4TDXsNAkBMQ6uVAyxGLkAI_ezpauVCC4EJU6EY-9EIbLvZa7sV1MQXcfOUv2P_PHqVt6mYee1E8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehfedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprh
    gtphhtthhopehpvggurgesrgigvghnthhirgdrshgvpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jKKEZ7d6S5KynZHzyqLLbIA5KTsNZlYxRItdqAHWqti7X_b4PTg3tg>
    <xmx:jKKEZ0NuWymf3TtjUdsCQaYH5q5VibSuKvwrtp1-TEQ6yAGDagmwtQ>
    <xmx:jKKEZ9nAqAE14CiPhMOQTkgK37Hgthh20_6w2GDo3X4DCh-Z4Naziw>
    <xmx:jKKEZ-ujxrpo4XZNxVFSxDMhuT1prtXgcyZrUiCExN_N56d8KawZqg>
    <xmx:jaKEZ1iruuZqwtMlFK4iQB8Q22RNmQIzifwbiblCo8cb3lMD5x1JL7nj>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jan 2025 00:20:12 -0500 (EST)
Date: Mon, 13 Jan 2025 06:20:10 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Peter Rosin <peda@axentia.se>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mux tree
Message-ID: <2025011357-deceased-press-cbae@gregkh>
References: <20250113142640.54d5eceb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113142640.54d5eceb@canb.auug.org.au>

On Mon, Jan 13, 2025 at 02:26:40PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the driver-core tree as a different commit
> (but the same patch):
> 
>   49a9b01803e4 ("mux: constify mux class")
> 
> This is commit
> 
>   7685ad5f08d9 ("mux: constify mux class")
> 
> in the driver-core tree.

Thanks, this should be fine, I thought no one had picked it up :(

