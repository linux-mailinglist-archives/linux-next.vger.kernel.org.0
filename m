Return-Path: <linux-next+bounces-3796-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA17976935
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C3261F22D6E
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 12:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE4F1A255A;
	Thu, 12 Sep 2024 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Swn5fGTI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YZJwDmzk"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0556DA47;
	Thu, 12 Sep 2024 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726144297; cv=none; b=qZtXRFx8fupGaaVWv1H0SSB98wUjHDHvC9IinNRwfdPjxG+WqWilbUF0m74P665rZwD0wtN94tBiZAZ5I1TC/i/YHdpJS9UFfPBECYctt3rnj6tG74iE18VTWLBPt/IEdG4f9U44dQ25dPvc1UxLWh5Nryiv9dMVg781+BmB3WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726144297; c=relaxed/simple;
	bh=q5zGyhNSihhxXuYK0xTUhIyVadAALCa6grEnzu24Ex8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mMZNP46lqum29YxoaKZ4hmHQdh5UNaj0sDxTjlPbPLryag33TTC16JZy9X/bYfaUCRjaI0BmpteimMBdBjSyUaZmyklTBNQsgPGpEdncueIaM581ym0nnpQVjs0h5cdc9O2utcRLRidfC2PRyJYCXvUf+pu2hhclhmG9xiffM58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Swn5fGTI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YZJwDmzk; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 253251140128;
	Thu, 12 Sep 2024 08:31:35 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Sep 2024 08:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726144295;
	 x=1726230695; bh=CnvwBBotXnuqrnDpPxLojv5OlDxpU/UsyUOZLrNkPpY=; b=
	Swn5fGTIrC5/YGFiMe4txbDpad41NofRv5qT/S4IN5j4TYOYibKeYBLrrgUsKjZM
	gkwdas1PG5bHlxt1cbMKo7KvGeBeztd/hxDNOgWVgMpZv7WlMz3nopGc0AvDsGy1
	3P7JRRwQYWE2D4FrDNn6lefVTFgd+L0/eJoaxYclILDJt+SqyPa7Jf2tI8B6RC23
	HJohteQcIqXKxMDTtZLuQel4ZY+Wc9rM32UjTZ0lmW7Ho+KkC7uTPyaumMV47Vmw
	gX2wHBwBOrKV2IB8ROLQ9ut3xVd2R1zwBJJOuTvgJMvDBi6w+qGxqFVj5+MZi/+a
	qjk3E3Jnxrr/3iw6uIbgHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726144295; x=
	1726230695; bh=CnvwBBotXnuqrnDpPxLojv5OlDxpU/UsyUOZLrNkPpY=; b=Y
	ZJwDmzkr25ocJySYeKXQBqQqXjkZpp2VohupTJKfpd5upAUpvPku5rudrIiD15yW
	k7UKTkfpCwrP+TLP7N5O1Eryc23VRfR4GuDXTvPbr9/pHyIQQ/wcq0J1YLw4Jhgf
	O1ngbiRV7ANk4n33c8PtbtpwANX0++InIpTiG/+U4Ma/vGxEHXRgAbjf8bQMMv3O
	2wWUSxN+L4CPbj+cNqRjrBwpaYTEMN3fmjj2vE/dN9VemWMrqitf5MNmM/xvGAX+
	TqNXhG8QBDB5Kg+k2CI25SDORhgBv2h45E9B7ua0Hx4qDOm1hsadDkDpkBGHo6rE
	ZNuLmC5VHyzBAecx0pNoA==
X-ME-Sender: <xms:Jt_iZms40TSd42vyMcg0kWimiD55OmvIyP5njuecJBmYHBpB_Ucf-w>
    <xme:Jt_iZrdDX4pgzASpowuh8pXLOB3QwASAhWe_RDkorq7xAnwiEN9PXP19HfYKMqnWg
    diXukNyFShFNzNEQlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlh
    hisghrvgdrtghomhdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgr
    uhdprhgtphhtthhopehssghohigusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdp
    rhgtphhtthhopeholhhofheslhhigihomhdrnhgvthdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Jt_iZhyXepdSNvl1MKuN5tNcTUcyn0IjU-7rxUiUcHMxt4s4AMVaiQ>
    <xmx:Jt_iZhPrqH1VJphYQkOyxZnpxLAxbECagT0_3qSrEIeJDoxRvjML5A>
    <xmx:Jt_iZm_t5q-3NpfdDM17LUzL-djzwYEi2Of0tVcCezJFpTj-crHABg>
    <xmx:Jt_iZpVu3wPocytywoWxoi3v4UfXSt8Hs0gmBx8c995XJN3rdeZ3Cg>
    <xmx:J9_iZmyOeWcz1_sFMq_e3IP35L7BGZi7WNhBnRHnq4em8ld8p5nIi-mz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9B5E7222006F; Thu, 12 Sep 2024 08:31:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Sep 2024 12:31:14 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>, "Olof Johansson" <olof@lixom.net>,
 ARM <linux-arm-kernel@lists.infradead.org>
Message-Id: <a69d050c-598a-48ae-8d39-a050e4ae0ef3@app.fastmail.com>
In-Reply-To: <1bd91561-73dd-454e-91ab-49fce29eecb0@app.fastmail.com>
References: <20240912105349.0453d06b@canb.auug.org.au>
 <20240912105551.6e3a33d2@canb.auug.org.au>
 <1bd91561-73dd-454e-91ab-49fce29eecb0@app.fastmail.com>
Subject: Re: linux-next: duplicate patch in the clk tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 12:14, Arnd Bergmann wrote:
> On Thu, Sep 12, 2024, at 00:55, Stephen Rothwell wrote:
>> Hi all,
>>
>> [just cc'ing the arm-soc contacts]
>>
>> On Thu, 12 Sep 2024 10:53:49 +1000 Stephen Rothwell 
>> <sfr@canb.auug.org.au> wrote:
>>>
>>> Hi all,
>>> 
>>> The following commit is also in the arm-soc tree as a different commit
>>> (but the same patch):
>>> 
>>>   706ae6446494 ("clk: fixed-rate: add devm_clk_hw_register_fixed_rate_parent_data()")
>>> 
>>> This is commit
>>> 
>>>   f579278d690c ("clk: fixed-rate: add devm_clk_hw_register_fixed_rate_parent_data()")
>>> 
>>> in the arm-soc tree.
>
> Right, this unfortunately has to stay in the soc tree as a dependency
> of the ep93xx driver.

I figured out now that this was originally merged into
my tree as a shared dependency and I accidentally turned
that into a separate commit. I've fixed it up now, using the
commit from the clk tree.

      Arnd

