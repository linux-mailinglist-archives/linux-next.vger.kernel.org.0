Return-Path: <linux-next+bounces-3794-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D759768D7
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D47EB1F244FB
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 12:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575471A2654;
	Thu, 12 Sep 2024 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LoREotbR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C7Pb6Eju"
X-Original-To: linux-next@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4801A263A;
	Thu, 12 Sep 2024 12:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143273; cv=none; b=dNkmFdb6EMkQOAoSRc3SApxMuj6MWZC/SPbwKw4e194eXRJ/UFK7oP2aX4NTmzk8AfF2yklWKgnoXsG6oHYIEIpzdL+eXNbzZuJ9W+Oiy5HZ8hD75vkNeDuMfafbTkFNXVyAaSnbjypad6nkEsKxDEi2ZlFyXgt66gxt6Wd7D/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143273; c=relaxed/simple;
	bh=wfy7BXzUP++0BaErFdBByS3tw68gIefu8iQ4Ueg9cro=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZDV0kIIi+YjZXIK06QvWI9o/yIQ8TUPXQOLsqDwqhjB0wOfIJBvBm6/a0GvW+qeOBZP9fe0gUiHo4hK7NM8bcl3quNbwFWe5X2nWz7dOzLuHiM23lHctWBas7pawkZyrpUDwmLkfG0bR3bmHfRYKKovrXfK6ePSWmt6YRFgNcKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LoREotbR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C7Pb6Eju; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id EF4C7138013C;
	Thu, 12 Sep 2024 08:14:30 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Sep 2024 08:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726143270;
	 x=1726229670; bh=reaSEXaRRQ1hjONh07KHDbOBlC1RQgriGSWx/Pcwh1Y=; b=
	LoREotbRQ4ZIqT2OhqtqhDcvR+VnP9PAFxxO3qT3qxKWYk3bh491wApIvDNE6PuS
	35xVtVqsLK2KD5c6y9psDpQ/jU5YPwL0bRvdOuJdKOMQKxXCITG6bb10Z9iadMip
	0u2C1db40qQCHU/cLsl4Bd3fNOx4xp54U6qJ0L5LzkuL09X4V5UAIzZoqGp1Wzo3
	k4joYANqcV2Q1EWB1fVOtA4fQCsbyF9/pfjFAIG32d6633m/fRKwHZ8iAJ2luCtZ
	jMWlKanxbQflNCuWEDBOmmH7hxJef7mT3Hf5N7xrujoE3lAW9RNjtNwOJr8PeGIw
	WDYPIGoiMscI22EC9yk9sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726143270; x=
	1726229670; bh=reaSEXaRRQ1hjONh07KHDbOBlC1RQgriGSWx/Pcwh1Y=; b=C
	7Pb6EjuwfYEp4HSI3FlinzA/EsvUzNuF/uctjzCtE5JxBypYf0pCoovNFYEdMy2A
	w5voXs3Ji0m7eSU0mo9+TvrcIj3V3upzUSp716/psJTFZXl/LLTy/8kHzfJfE9dW
	knKEh8a88UYox1WjHtIqGickF1r30ltsJgRfIJbVX7V9T4qs+YwMQwdOlSgO/CEM
	H2FW5TyTSHS5VC90Y5hkoLV+YtHcCklLzIB+E0DvnqdIcbEc/HFbflsjdHNz2ep9
	S/s+ctA2ONX3eIwaLPYMngS+hsT7mATSiFvVOswGlUsCsbw4toiIG+zrUuhP1FvC
	R9OITnd97BtcWzQ01W3ew==
X-ME-Sender: <xms:JtviZoES2zax_tGI3zH2kKHIXr_ww-VPJvO4o757Qj4ckbsdelV-Tw>
    <xme:JtviZhXjyGJ_h2rUwv7XxWDjvXced51Rty0aQv2v2wzso2C7FDTGeBLYC5bYx76a7
    fW5otLaKBEF4xQqUSI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlh
    hisghrvgdrtghomhdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgr
    uhdprhgtphhtthhopehssghohigusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdp
    rhgtphhtthhopeholhhofheslhhigihomhdrnhgvthdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:JtviZiLmSRC9BBvgaeHvK5xpp4-YliZMW4iyfEp-vw_pwzbool83eQ>
    <xmx:JtviZqH0dDy6Xndt8_oX8Db3-L3glFstrce2AEeh0_dcgUgdRmI-Qw>
    <xmx:JtviZuWSRDDDlIVRHT6Z1wIiSnVyt5Vtom0p5tOMqj8WeU9ukwhZwQ>
    <xmx:JtviZtPlLqtEPx__a4-0Xa0sfqNim0RsterOMgmshDcgGjeV21KQtA>
    <xmx:JtviZgIaphFWNTcHKuYxmltxspw7lUe43XbDKK3vemJFEFqMzTyZ9xJw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8F39C2220071; Thu, 12 Sep 2024 08:14:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Sep 2024 12:14:09 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>, "Olof Johansson" <olof@lixom.net>,
 ARM <linux-arm-kernel@lists.infradead.org>
Message-Id: <1bd91561-73dd-454e-91ab-49fce29eecb0@app.fastmail.com>
In-Reply-To: <20240912105551.6e3a33d2@canb.auug.org.au>
References: <20240912105349.0453d06b@canb.auug.org.au>
 <20240912105551.6e3a33d2@canb.auug.org.au>
Subject: Re: linux-next: duplicate patch in the clk tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 00:55, Stephen Rothwell wrote:
> Hi all,
>
> [just cc'ing the arm-soc contacts]
>
> On Thu, 12 Sep 2024 10:53:49 +1000 Stephen Rothwell 
> <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>> 
>> The following commit is also in the arm-soc tree as a different commit
>> (but the same patch):
>> 
>>   706ae6446494 ("clk: fixed-rate: add devm_clk_hw_register_fixed_rate_parent_data()")
>> 
>> This is commit
>> 
>>   f579278d690c ("clk: fixed-rate: add devm_clk_hw_register_fixed_rate_parent_data()")
>> 
>> in the arm-soc tree.

Right, this unfortunately has to stay in the soc tree as a dependency
of the ep93xx driver.

     Arnd

