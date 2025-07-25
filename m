Return-Path: <linux-next+bounces-7721-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D062B11DE4
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 13:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70CCE5609F9
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 11:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168922D3A9B;
	Fri, 25 Jul 2025 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HaM0kJbG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nueOdbnN"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C106223716;
	Fri, 25 Jul 2025 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444138; cv=none; b=jINKH7iPbY3px0m1eF1QDYv1sTgZKPW0gW1rWdWv4MZWEHO71kKp2Z0mLfV0tXeEMmKgc1JCbW0uFfRKAum3vY7jiASd9Eg2DFTDfcqINYtjCXu3bxA8AkKq1v2hUQoLPSj6L1622kHfW1YilAQFW6s1S9TN+guxIhtTin1kCJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444138; c=relaxed/simple;
	bh=2klBBy10cACWU9aXMPxCdq2VDb5LAYi2ko4QYviNjiI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gKiyfHwUAWsATwVW+xNgPMgLWJGxwInY5tD2Ydh7dKCSb2AL5Jch3oQdROdt2iemucu1ZAD8qhfUP40u/CcC6adUoGC8nEL4Lg9GQDwDGseyb8EJ85wryuW+OkUsA9iGg+iF2cZI1gaiKqGb23Hp06SVjFumZcFBYr6epjRwdOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HaM0kJbG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nueOdbnN; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 154B41400043;
	Fri, 25 Jul 2025 07:48:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 25 Jul 2025 07:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753444134;
	 x=1753530534; bh=iX3Sod6bQ4J8kY8g6SMBYCTMuOOksQmjlw0t4ePXhwE=; b=
	HaM0kJbGFO46KYskNpftCyKLsUBw8uWJ0PpGuXEJbG0yUjKpwOvk3FBPCIEkRhbp
	3nVZlcigkUYZXSu60eJsJwnqyITBqeQ3GMD5qfK61kjoaSD/hdkTZeXb9jLvw78V
	TTGc/hHdIL6ccKNcsMO/tb7FhgbOCXkApIlKNmC54zRPI7Yg0rSaNjymTwOeSaOb
	2FeFqWCjxq0MT2+1xH1dT4Cd6PdslBtB4gBhBiu6w2uB/7OKB263Ob06QgdzEj/T
	cqCNsO1a94RdAFYqbEavzliOyiaZYPUc6CSBlwYmQrJJfe0VwVBp9Ff1+HgrDyvs
	MHSg/PwzYgz4e7Geu5W/1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753444134; x=
	1753530534; bh=iX3Sod6bQ4J8kY8g6SMBYCTMuOOksQmjlw0t4ePXhwE=; b=n
	ueOdbnN0rgWHMfsBN1NCsFUULARZXhTLTuC0bfOlfL6uuCISs1NfeetUR3N7Mn+2
	suERSpgYZHd1fqeH0R5fQB5LGM6qzN/NrAk2CPdd4i0yFkZyDeQuoiWWY2srj2sq
	3G3lWSI26bQ3IDtK1wcJROmUvuExQtplh65FvBptLjYYVodc5e1cBUPXrxhjAf8P
	tDtQwBu6jXyOkc8n43Qx3MCIKxW/xq2LIQbmeJ+P0VRDZaw9QDJBvLbYOEc+7CFC
	J5x67GQpfOPcGMqsFmcMRemw0aF2hQWQ7TnJibpmCc6OU6w3C0EOQyUDOvfwlcvQ
	U9aa0wOrVTcKEbs0226jw==
X-ME-Sender: <xms:JW-DaPElu7SGv8YRqTeq07tiNq28gqyD6OUFQKhlkejLWMTdPJ35ZA>
    <xme:JW-DaMXJ51fbI3lg6CzAhaHRr9pn135DkLVy9wjf8P0gyEwFnmeNEcljXtOcqXRFO
    7sGfa1k0Uxfj4YyPQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrd
    gruhhughdrohhrghdrrghupdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:JW-DaLORVqBMetOPbqzHMV92hH-i8JPF9cuGx6RR2_3Mh1SdG5b6Tw>
    <xmx:JW-DaNVRz6TcnnYubIDplV-CdvY01L0rTzkc57m3t3DGP-oZ2m8wUg>
    <xmx:JW-DaP059ZTjD6oC7nNlJ66Q37nUB14kwPQ3sImiMCrboRchNpW2VA>
    <xmx:JW-DaLraAoWWiy4jQMUkbVz_XLqvD6Hh8Thgv_wKsJtQufzwZ-VXlA>
    <xmx:Jm-DaFlJT9i23Q0VVcgYzNAU9iifzm3xLv97lOm9c1a-dhzwdiM0zq2T>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4EA9A700069; Fri, 25 Jul 2025 07:48:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T8969479896fa1a68
Date: Fri, 25 Jul 2025 13:48:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <a8d0eb68-fac5-4878-be16-05f436a190df@app.fastmail.com>
In-Reply-To: <20250725113539.GB11056@google.com>
References: <20250725113657.039aa5ce@canb.auug.org.au>
 <20250725113539.GB11056@google.com>
Subject: Re: linux-next: duplicate patch in the mfd tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 25, 2025, at 13:35, Lee Jones wrote:
> On Fri, 25 Jul 2025, Stephen Rothwell wrote:
>
>> The following commit is also in the arm-soc tree as a different commit
>> (but the same patch):
>> 
>>   ba9ae011e837 ("soc: apple: rtkit: Make shmem_destroy optional")
>> 
>> This is commit
>> 
>>   0445eee835d6 ("soc: apple: rtkit: Make shmem_destroy optional")
>
> Odd.  I don't see an applied email for this.
>
> This was applied to MFD and a pull-request was provided for the other 
> subsystems:
>
> https://lore.kernel.org/all/20250724102529.GA11056@google.com/

This is the one I pulled in

https://lore.kernel.org/all/20250722163258.62424-1-sven@kernel.org/

I did not see anything from Sven about a shared commit. I can
throw it out again without too much trouble if you already have
the contents. The only other commit in that branch is 
65293c3276de ("soc: apple: Drop default ARCH_APPLE in Kconfig"),
which I'm sure can wait as it only changes the default.

     Arnd

