Return-Path: <linux-next+bounces-5329-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6906A1D14B
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 08:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDD7D3A6743
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 07:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEBC1F5413;
	Mon, 27 Jan 2025 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BCTaA27H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tUFrBF/Z"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ACC15B135;
	Mon, 27 Jan 2025 07:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737962722; cv=none; b=sVrlExuYIE7ozt1jA2eJdhm0vf8ickAxJc2O0Y6l6V91TcaJpMd9M87VpUU8+xArc9iv2FbN58WE2WQx3rGHcWymFK9w6zk/wJX9HwQEFKTqfYGnym4dX68bG2RbVGnG9rDEKFLOWhXWx9LwKwZlGMk76wGQ0Gp/+f6XHEN5D6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737962722; c=relaxed/simple;
	bh=dGFOXm82N/IwRSjynvsXze1g6jQrXa1UM2CBnqUv+zM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hhBrhbam0m4B/N9Q3Ktc82zpv9GezVgS8mFCz61xmDb501FxoEK1tuzj2RF68fbJmRmbE04ycNEw4Yxsit0rlQS4L6QGQxuplZEEb9BC/ChwLORo0gZg99tVMQwG1RWLcSOgcn5rozaF73Qd8yEc5Pb+AHTMnUwELR+B4i52ljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BCTaA27H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tUFrBF/Z; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 964111380ADC;
	Mon, 27 Jan 2025 02:25:18 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 27 Jan 2025 02:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737962718;
	 x=1738049118; bh=PA75cmb4q9oaSiGTVBpWOcTFkhaeDK+5Y2JGVmDb+KI=; b=
	BCTaA27HTV/pZU6PkvC1pFJa1F4qOXTL9gOgJKUZxGJjgiP21HI+rZ2kvxp80eCH
	mk1tksPPvhXIN7tiJsc4JSV5rRSduGaWMiC3Y1X5YPxKx3bQn1W6xwU0Vzsqmb8d
	/l2QahcsoDjbAWmxr6qczVcT+EFIcFTm1bonpjTPvs/u7PABxDmVRSeZh96uEzZG
	BTfSFNDJOrUsjYBVN5EQPQCcJ9gMrIN6iany/KfzwJAVYHLekGy4vxzIuHS0zNwQ
	yZOJnZQdnOfuuWL6NW+KNTDKeRsNGk/1q7KZEIe0x/lGa1kHXJxDvQ2Al+vSS96j
	DchWx9zlsjBCJaqu41cKzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737962718; x=
	1738049118; bh=PA75cmb4q9oaSiGTVBpWOcTFkhaeDK+5Y2JGVmDb+KI=; b=t
	UFrBF/ZwRrIBpuvG0sS1D4JkFWDbNVBLbqtrwEKeEfQAh0/aVmUAdOtc3bjU1GwV
	x6N/NocdCHQNC98tGlHuDVWqMt7an/r7d5YNme3IPneGnQ7/VZiHOEbAe5xab9yN
	WV36uXwsezpQhQR86DBo5uFHzZyz26H+G386/ZW5ibY7mnVxChsFzDkXv9HeprjG
	PDiHvs41OcRV80uUbPsAFXTgRSebxGhfKrCKEmnS+dBbEo/rpa4/diJ9xTlrBati
	/nOlVQd4es5OVoBbq+wOa5tufRgI8PUEIR0eC9vz+l6BmFQ693aCWO1+XD1m3jQr
	V/UZ+9mV4LeMMVE5VGIZQ==
X-ME-Sender: <xms:3TSXZ5ctuOzgKyf-7l6wtFVmypKTk-WI0yQq_N3tR6UvCTHxUaY_Tw>
    <xme:3TSXZ3Mvi4QxeUokTwEcvx8pMJ9E82mlD5oNf9sTSmd9AUMb09IfnZ1lLx7MCkkNH
    -5fnKC1R2EnuIeIHOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedguddvheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhugh
    drohhrghdrrghupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgiht
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3TSXZyjeSOubUFL9y7a7SekOqG_Ne-hj75EHBo765xru82K3MjNeUA>
    <xmx:3TSXZy_zYWcZevFDJuA75DrfYMKFtAqmcRSkBVSL46jL0OIlViNhuA>
    <xmx:3TSXZ1uJyDJRlwbTnLhZsnfvyOkWirnLh8i8lqQsUdNB_9VipE1RMw>
    <xmx:3TSXZxHalNXrZZqGByis5s48C7NgQelZBpzo3wynufJjGlnuNB4SKw>
    <xmx:3jSXZ9IQvvTjJxQsn6yccxBA2zP4d9TDoblCvw-IWwqJiT2SmPQqodCe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A82BE2220072; Mon, 27 Jan 2025 02:25:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 08:24:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 ARM <linux-arm-kernel@lists.infradead.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <0cf32861-dd67-4c37-95f3-066b3f77e85c@app.fastmail.com>
In-Reply-To: <20250127135717.00817b0a@canb.auug.org.au>
References: <20250127135717.00817b0a@canb.auug.org.au>
Subject: Re: linux-next: warning after fetching the arm-soc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jan 27, 2025, at 03:57, Stephen Rothwell wrote:
> Hi all,
>
> After fetching the arm-soc tree, I get the following warning:
>
> Commit
>
>   1f8dba7e7b83 ("soc: document merges")
>
> added this unexpected file:
>
>   arch/arm/arm-soc-for-next-contents.txt.orig
>
> Not a big issue.

I've cleaned out the branches now, thanks for letting me know.

      Arnd

