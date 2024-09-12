Return-Path: <linux-next+bounces-3790-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5329768BA
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E200D28183A
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 12:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B731A0BEC;
	Thu, 12 Sep 2024 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Qa4h3Pl8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SED5MqyH"
X-Original-To: linux-next@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D886D19ABA8;
	Thu, 12 Sep 2024 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142943; cv=none; b=tabhbtCDDeAc1fVrJgGMJVlN1PdllN70sILY6KhDls+GHHKAO+Bo29Vu9/dPr9+NE+IU5qgWJg5uJsbXw265DOLWQSMyeo+y1MlKPAe4ANKT1Uom+YQUfnbm1lydHnIRzgZMnIdeTH1utGWRox8ygGd7YH6Cd1qSNPwv7DEwvl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142943; c=relaxed/simple;
	bh=oRAi04yGDdgwaNrb48NE71vzDh79gGXCg0gAUcJvGdY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kCWH6dnXL4tjtIUcOkAY7sWLvaRiMp0E+M0DM1lp7bOcbqNMRNEy0VkfGZKeWNAIpN4yjvcx0roit/b/mFGc7c81lV8fgvxxKMHnIm3C/fiDkO2lifCEJHYC9V1o76begFiKYrNjXUOE0ViLGdNtWlg6fkfP1rvfXi3YxNM+7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Qa4h3Pl8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SED5MqyH; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id AB1051380619;
	Thu, 12 Sep 2024 08:08:59 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Sep 2024 08:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726142939;
	 x=1726229339; bh=sIxFd/zC/glVL7uLL/29pVv6KQW+eBqGPbDa7HeUJjA=; b=
	Qa4h3Pl8N1qMzuZIVmLfSQ4TEvxTo1UxeBT8wckzM/15hvsBpdtO+vJsxBfBwjDl
	scy/MEFUB0HkH2h3Rjlllh6UoV3LcF8n1BeK0vq+p8YnWfU9GRPEQdgTA6GWtU9X
	PYVZvWMfG1wDchdHkViyXUk4sdsA+PI07dlYGPq9ia3xsFosD/B1Kozj4XVIkYOA
	kAyn4gWcyVGBYFm9t73lxTN7CF1O9vdYeLUV/SeK8oX9n57ic+GAbPn5XmiwzXgY
	/BZSFpRZsMpIVtZp2YRzMuVdnkzpyKnnDijiucvSc10Kp/BY74WETnV04Pu0hHFQ
	y7r+K78hSPU2W1wn/SlSbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726142939; x=
	1726229339; bh=sIxFd/zC/glVL7uLL/29pVv6KQW+eBqGPbDa7HeUJjA=; b=S
	ED5MqyHu/KyNFhQ10W3M9GdfvptKZXOMhmIXUMQRYWe1CrtaF3kiZV7RCB71K8QC
	E4neNEmV7xx7VIfJEMsY2oBZqZm8gHQsZu5LiaqhM1ulebPztpwY7vEZuOjvp1UL
	0IrIGFkypLXm43VcFI9W6URQzkfaJM04Bq0fDbUkGw1tbkcW5Hrcvcw0xfV7WjmQ
	pd1EoVggMv/5bbwOs3dAlhqvF37OFe2fWwjbTIcj1UpdjdLnI/Mjfjsc9FvYCEeE
	2okJMA5FWYx8hoyfQ1TA6F6a2qDLW/0LqmXtN9uJP5WIBekYl4T7ewnG+7uYPq/y
	dfPBRdMiYNQDFyJv5UCog==
X-ME-Sender: <xms:29niZjtWteb9Cps6ZzrQslqjBamAcFTOE_CdymoWx1Gtr7WGGY7U2Q>
    <xme:29niZkfVCBf8wMbCUbf4-DBxcFSUUZU1oyEvwYloT2nqnKsKWe7J8QHCbsmpOYkD-
    MYlAqXl-tPVJOvr5N8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdroh
    hrghdrrghupdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgt
    phhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopeholhhofheslhhigihomhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhn
    vgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:29niZmzxNOWo-A81hP7F5ESVunQqTP0awKC-MigmlrhqH9RLOt0Xrw>
    <xmx:29niZiM_5aSacL44e4SvYjlHtMYPe-fm8sA6Fhhf47xkvOmvAL4ELA>
    <xmx:29niZj8Y3fZGE70dy7ME0_-LxsJRzXNG_tgPkIBxH91zF7BXixjMMQ>
    <xmx:29niZiWJ5jyr5LJu0BoEIzVgMZeLvjQGsP0ciT3XQ7oiQHVRfofcBg>
    <xmx:29niZjzA4NyN7ktKY7hFNT1Cy6UMXmzv6MDn2dnt-gRObI98hnrNukvq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EA809222006F; Thu, 12 Sep 2024 08:08:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Sep 2024 12:08:37 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Olof Johansson" <olof@lixom.net>,
 ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <7e5c452c-61ec-421f-bd87-506d66a58f55@app.fastmail.com>
In-Reply-To: <6e5c1a20-2232-4a2d-9a0c-181d50a99ecb@sirena.org.uk>
References: <20240912144459.634e3e09@canb.auug.org.au>
 <6e5c1a20-2232-4a2d-9a0c-181d50a99ecb@sirena.org.uk>
Subject: Re: linux-next: duplicate patch in the sound-asoc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 11:07, Mark Brown wrote:
> On Thu, Sep 12, 2024 at 02:44:59PM +1000, Stephen Rothwell wrote:
>> Hi all,
>> 
>> The following commit is also in the arm-soc tree as a different commit
>> (but the same patch):
>> 
>>   7817eb1ad353 ("ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema")
>> 
>> This is commit
>> 
>>   cf700e558e1d ("ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema")
>> 
>> from the arm-soc tree.
>
> I wonder how that ended up in the arm-soc tree...  anyway, shouldn't
> matter if it's the same.

I merged the entire ep93xx DT conversion series in one branch
that I plan to send as a separate pull request after the normal
soc/dt, soc/drivers etc branches, in order to finally get the
work done.

This patch it not needed for bisecting through the series, so
I've now dropped it again.

     Arnd

