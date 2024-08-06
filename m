Return-Path: <linux-next+bounces-3242-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803C948966
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 08:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 826381F21E72
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 06:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AAA15B14D;
	Tue,  6 Aug 2024 06:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="OslsTHLx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vk8Nz3Mj"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518E27710F;
	Tue,  6 Aug 2024 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722925853; cv=none; b=X8lL0I9BIa/0GOlUBdB+a03WUvpDuzIhqSph3mhY+lEd/KBl55eP8F1Q+2+Sxz8O3vRJDCu19iOoK4f5Myq1GZ9AZDrE3DzP1Ga6bl0uRfPoB45v7rNWRqXkABAl0xRf06JahBHJqOE593wGvPnPQf+VvdVZrw1fBmlz+JGMHKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722925853; c=relaxed/simple;
	bh=HlPWsMKW7DVkpLnk1zRtpXpswvXRYNegCEI1JGUsEQk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jnSL2A5K3xaUbJMNRcNmuVj6A+QZrpWP49BnBgSiZaH9GHX1QzWoyOXqFDO9BmyZzNd26cJciJ8pXlWcjetawrnJ+l4pIvI0gl3nJUoE+cLzxCnYuTwlIhc+pSI1BawkfuCe/Lv74lIq1FsCcm8TJ/840dWuMGN0wwmRropyjVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=OslsTHLx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Vk8Nz3Mj; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1BE871151AF4;
	Tue,  6 Aug 2024 02:30:50 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Tue, 06 Aug 2024 02:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722925849;
	 x=1723012249; bh=Lo7zeSnfoTJrbddmSol6rUeMj4whpfrgo3jgXmwu6t8=; b=
	OslsTHLxuXh2bR7EZwrIUTnIjJhlnPg9RAbvMP72eS/+aVEl8vriiqBB/2m4rSSp
	7ojrg93wr62cSL2OGUAiZEeMJGSCBUgVqf6C8FP3qprl6l/yogeKNMTt08JGBevK
	TCBU56j/+Hzu4mszaKjj59aTt0q86fRPKyz61OSn6quG4BWTXgmKSF/s42OgZDVn
	qZ5LOLsr7a/yyvHQ0KhBoA0pd8ACVsVz6g4JM4pkJYUgH0QvX+K1UuwdmL4Ti4uk
	0Hhs23HF1KHZ4NSnXmzKMEpIibO3qg3rxSVNeuXqyVKrfdW9AtUjhlmA3YP370MQ
	oaSi9bT4F6fyhI7pbb52hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722925849; x=
	1723012249; bh=Lo7zeSnfoTJrbddmSol6rUeMj4whpfrgo3jgXmwu6t8=; b=V
	k8Nz3MjQew+QCrV/tgNvZvwMfW2y7E6qhGO/zf9UoO8z/VPRzkamJM/MLSkEKv7M
	omIr56rWY3HAa2WzLvkOAYF+nqb5q3GtKVcyR2ipmnPv7sf+Rfzs0erh1eaSiDb5
	NSjeQR7S9fOo/xoeFxXm3jBDlhDkAnbMf38sO5NqI3dddnlsG7zWrQbVX0Uk82j5
	OYkW2OxoaS0OS2gH8sPSYwVQuaXkW/hCoefFHTwDj3ofN6HoX9hCmqdrM1vLxqyx
	2r+xYbxrsEcZpG7IG7RSqAkVh9FxJ6Eq6saxRz27g7KPDUEKkpaFVJKB7mw+CXUt
	GBfSK91t/GIkg8U0Jn1yg==
X-ME-Sender: <xms:GMOxZlGJodkENJXPl5nUuW7NJ0O_OptSSI9CE_NasJYjdj14BB2YRw>
    <xme:GMOxZqVZyOf1WMisl21HuYA7JRbCDWzYONaBgDCX0kYTm2wHYSN1kIy8PyYcgAjjT
    s2k21zyw8EudlX3dSI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeejgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefh
    vdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:GMOxZnLBVGJLLtkXVgeqtIiNSUqmQgRg8mX3702Kr8wHMs2FMxIhwg>
    <xmx:GMOxZrE13nmGRl1xio3HWz9CtKMK7q64rcTgyH04GJArX3K93bG7Bw>
    <xmx:GMOxZrWmScFdrwnohbKIkc3PV3yUNV1N9XgRwtC9fGukrwSGutHZzA>
    <xmx:GMOxZmM15Z03OO5rtioU_aeQcrSRaLavmPdA9AVO4jGzMRRiyT7CzA>
    <xmx:GcOxZoj1_Oic5DEHoqLp5D6BUcckT0Muz5GmXAYJzeLSt-qDVOExpOiK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A3D58B6008D; Tue,  6 Aug 2024 02:30:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 06 Aug 2024 08:30:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <f978393a-0250-4493-8e38-a4d80b2b5698@app.fastmail.com>
In-Reply-To: <20240806145453.5297d452@canb.auug.org.au>
References: <20240806145453.5297d452@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Aug 6, 2024, at 06:54, Stephen Rothwell wrote:
> Hi all,
>
> After merging the asm-generic tree, today's linux-next build (arm64
> defconfig) failed like this:
>
> error: /home/sfr/next/next/arch/arm64/tools/syscall_64.tbl: syscall 
> table is not sorted or duplicates the same syscall number
>
> Caused by commit
>
>   95cca8c0b665 ("syscalls: add back legacy __NR_nfsservctl macro")
>
> I have reverted that commit for today.

Thanks! I've pushed a fixed version now.

     Arnd

