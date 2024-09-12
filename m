Return-Path: <linux-next+bounces-3792-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D53ED9768C0
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 621E3B2146A
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 12:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8F01A0BFC;
	Thu, 12 Sep 2024 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UOccp/JK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FWclPKNe"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538F72C6BB;
	Thu, 12 Sep 2024 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143062; cv=none; b=m/0ymZP4hbhtFJBfA/LKOaRv5pP0l7xuFkGTRqE/1D8AMEmHc3aJKFtdbsn6U3/R8CqvqOzupK7+3ykTXlvV4QEDhEBsy0kMtt6V2e4M55QovVvaI1yVichTmfID4p/zF2UVNvjNHbOeTvxnJ5JLcusMJaBhhGJzVAnXEn2lD0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143062; c=relaxed/simple;
	bh=hoZ1plS8UPsbZtP87gnCqEB1VwEkiLQVgsJJB6QWxto=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GFCSLQT/o7RPGSOUyNvoLdORrQjau/oGiiNLBD8+ASNs5VPnmnae+0MZqR6jEdbJU476mswybTfvjKvGWc4kGvVOLeAQqZQSVC+0AH3kP1zwBNKvfi1t+LB5q4u3SQUafl+eKYtvgp0XF2ujqRXJtzNQYa602Y3QVPda3uLY5KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UOccp/JK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FWclPKNe; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 90ED011400D9;
	Thu, 12 Sep 2024 08:11:00 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Sep 2024 08:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726143060;
	 x=1726229460; bh=Co6JbhxuR2zoGmGKNgs9HMjfAVECD5ud6WlxUwfcNUE=; b=
	UOccp/JKlTVjv8xTxT/nrui4XGi/YmIr9SdquTNJFO0sqb1klQhMwEFuZpAX7YTv
	ty79JnfULp8qz2FInkQOt7Up5OuRxezh+VuK9SMohFAfWMhAVighhupTtL1/BtZ3
	86qd1NRm5Ziyu4sx1WZ7GFoLbsNSkSRDaS+NVaHQYgsA3dnukjFjy9ilIXS6RqES
	9oYBa5PoUDYoJ3NTJxfx0KNwKWiROKZ4gZn8dpCtGVwLptmRKt6rx3vcAnp1Lzcs
	g5oZkUQwVTGdxhwFmCUFMEMCrtyr5rao04i7bsEnTPMYrNwZn/dj+/TdlRDSLj19
	86zU5CYP/7JOU1DmctWgLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726143060; x=
	1726229460; bh=Co6JbhxuR2zoGmGKNgs9HMjfAVECD5ud6WlxUwfcNUE=; b=F
	WclPKNeYMqa6LYZJ8YqTNtCCrLx/RO9PcygZWB67lI9Jllz8LbPWT8yhoQCRwBpx
	2+S6cV4rBTlA3C7gozS3n8DVc5MGiC2uo43Vr35XExpy7205poHzRekkerfmd4qG
	gMHKBWjWpKsPmP7U/4ju+iDfebMG85wHRcDioj2Xsxt/NfDDlT9a/shEjobdl8r9
	SH9+qQt9/XLrHSB+iqCwrX7WuFrJZUXeVWOcNw1ICaJbtpLkK3OoYQrQliU1JlgA
	KZVYj8JVOFD9/5yCphQrWcFRLfPZyXtrnOKVSg6jY8ql4ux4yUBfQz3yJwHSgM6e
	t7FDJZqJELyWs3an0isQQ==
X-ME-Sender: <xms:VNriZmIlkrKZFa-d8XeuENccYkxMkkvkESO59HTEF1PAtEbOXr0f-w>
    <xme:VNriZuISHhCtB0YZ58Q_Up5vPpeHM9kMY8T84cilorpoTfBWY4jW7sUZAEkjsPy_t
    NzmeRMzS0I9-aC00ro>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprh
    gtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegs
    rghrthhoshiirdhgohhlrghsiigvfihskhhisehlihhnrghrohdrohhrghdprhgtphhtth
    hopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhm
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepohhlohhfsehlihigohhmrdhnvghtpdhrtghp
    thhtohepnhhikhhithgrrdhshhhusghinhesmhgrqhhuvghfvghlrdhmvgdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:VNriZmtufT221XJ277zFIzPvhHE36AddJc5jLJSloH1Req_H-IkeYw>
    <xmx:VNriZraRI7lWdPdxOwJ4YyX3s7QppNx12GkmoffQ90ZAS5I985I84A>
    <xmx:VNriZtZSGi1qiozgbxtMACC-MWw7c83jJB5wC0XNQr1_QYRIlPHQ0Q>
    <xmx:VNriZnAl0ExLfzEORykxP5SwGol7PaBFFWSjKSNluogdD1OIPu0PKg>
    <xmx:VNriZrPH4PdunnxD_MZ1zcm48xomCURHOrUoRcgoGKPcB7L-RHyQzy-d>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3BA91222006F; Thu, 12 Sep 2024 08:11:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Sep 2024 12:10:38 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Olof Johansson" <olof@lixom.net>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>,
 "Nikita Shubin" <nikita.shubin@maquefel.me>
Message-Id: <a124f713-8cbb-46d3-850c-1dd1b9010258@app.fastmail.com>
In-Reply-To: <20240912174842.57a43921@canb.auug.org.au>
References: <20240912174842.57a43921@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the arm-soc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 07:48, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   arch/arm/mach-ep93xx/vision_ep9307.c
>
> between commit:
>
>   3e0bae7f35c9 ("ARM: ep93xx: delete all boardfiles")
>
> from the arm-soc tree and commits:
>
>   4b2b0a2ce815 ("gpiolib: legacy: Kill GPIOF_INIT_* definitions")
>   8c045ca534d0 ("gpiolib: legacy: Kill GPIOF_DIR_* definitions")
>
> from the gpio-brgl tree.
>
> I fixed it up (I removed the file)

Looks good, thanks,

     Arnd

