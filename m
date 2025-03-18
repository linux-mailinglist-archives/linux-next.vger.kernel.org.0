Return-Path: <linux-next+bounces-5862-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40CA6780B
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 16:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01FD33B0FE7
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 15:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079F41A01B9;
	Tue, 18 Mar 2025 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="l8Pj7yMN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LZ+mP8Bp"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D59204F61;
	Tue, 18 Mar 2025 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742312286; cv=none; b=QOzwWKW7yLt4yY+bYsFmLoPAbtC1KFd6dSjhBqFQj7aCtUVSAbFxb5lJdnmGmALkoQFXpr5LnXmLAMwwiEOZaOdZu9OKW1NRS1OzBS5dE7zmGRxxTxV+4VFRJORMFeNAmNzg3nAatMHcJ/wElshunrch+BCQNkAIz2KbKJ/KBlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742312286; c=relaxed/simple;
	bh=7x44UfUcXAO5RROpDnfyJZzkL6f6a3obfh5Otgsjq9Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sEeHyBVOscFylO6/I2dkpvcfO0KjEsHWyYSn3LPAzY8NLi8sSEylJd1JIc2nU6LYGmIhktGhC02HG9fpDuB4wMZuRJVmvUJAvoZzfO6VAf6Nqa9sqQq+WoXGSDK9oNOPFvyIUabaaY0yYuFyLC886oEXGSNDWSzL5Hjs1ZqwBoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=l8Pj7yMN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LZ+mP8Bp; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id A312813833F5;
	Tue, 18 Mar 2025 11:37:59 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Tue, 18 Mar 2025 11:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742312279;
	 x=1742398679; bh=3iKFpYJbOoSqcX12db7ywgBPDK5wX2JNJ/GNaTnM2Gk=; b=
	l8Pj7yMNhGeM9qLbF+B5Qk9BJfpMBxMWrVj3aU4+6HbEoZq8gqLVALvYEnS7GDUT
	618ranUNf+H1uLkQnAiCojkiXLL4qcfkEyjAQkiTCUEKIso3n3I0w9Rzpu59V9C8
	s4eiF0w957vRHXACzo2+V6pfsRR3scmkjXVLSpycIOoZrzT/G6lQWELI95RtrnkG
	u0dn54Q992sjxlehWqiBQ16VRPUmhiCH+wEvcpj3kFUx5gTZr/caEfSWzlGxyab0
	EC9EbIBi2/eWsXTVOtQ6SdcZ7qy5VotQFdbeSuxwq4/DwXOFq+17GFMw2c+IY+3R
	Dz6YySoq6GF89SfYosxkvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742312279; x=
	1742398679; bh=3iKFpYJbOoSqcX12db7ywgBPDK5wX2JNJ/GNaTnM2Gk=; b=L
	Z+mP8BpPJeQY2R2sJHy2YsNoL4jlJoVtntMYN3iHsOBH8sygEQnc+od2wgCPeylk
	SFXld4pEn/64SoLDgeCdjNPhSMEb6gA6imCDerirI1gLul+Bv7mwe4b76UVuALP7
	ysLX+n2k5hNYloHli6QBYrkLlGazsbQpA+rXXHeIKDcmhDICzPnhlQgpDqc138DP
	LRUUGzKUsBlM9Ilb93/r9E9HGwlPUqhiWAQw9lv92ZIwQehrKvQj/+vCLP0aycEE
	GK4GSaOWHToWe9No8tSNYOThLy9NDsQGXmbUFdUFZK8NUYQSbdLPTIqinAHUdaZr
	zbNL4M047DX5vReTu2XkA==
X-ME-Sender: <xms:VpPZZ9WJpffXty5QnVjCvXStJxkd_MOg_nSeo0bjgWDsJj0PDYWAog>
    <xme:VpPZZ9kpozn0sID5w3qEmE4qi0tzrMum9HgAmAgToLWPwgtvyii6WCjF3B38ImOz0
    crxjcTpCp_3f7DiYiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhugh
    drohhrghdrrghupdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdp
    rhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuh
    gstggrphesohhmnhhisghonhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgi
    htsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:VpPZZ5YfftvS4RjAxrq35svRp56uusfGkiNjZToVbKRxWOwqBaXMvw>
    <xmx:VpPZZwWjPzzhMsQoZGs2Lxrfc6jSPDQWNUbNY9dWj06fMghboRCxOg>
    <xmx:VpPZZ3mrbq6mGDfJnTpAhAOTbcRFYgVUSlpSafQjwgaRyhtOD74Udw>
    <xmx:VpPZZ9dUoDWwZsRYD47x7PmVX9Dempe0BKNDuzBNuLw2O2qgobSF0w>
    <xmx:V5PZZyu1Uffs4yDMBfwfAhgmYfLKUMWFfu3WeT7V5_QU7wp_QT3m_CeK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 758922220073; Tue, 18 Mar 2025 11:37:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tcdc7c2a11dbc0e67
Date: Tue, 18 Mar 2025 16:37:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Marshall" <hubcap@omnibond.com>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Christian Brauner" <brauner@kernel.org>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <09c18763-7a60-4eea-b77b-85260b8b6b02@app.fastmail.com>
In-Reply-To: 
 <CAOg9mSTNLVWjqU4DnHFhBjAfJ7Do_Lfj1Oxe0cn55TBb-hYPwA@mail.gmail.com>
References: <20250318101256.01afbb47@canb.auug.org.au>
 <CAOg9mSTNLVWjqU4DnHFhBjAfJ7Do_Lfj1Oxe0cn55TBb-hYPwA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Mar 18, 2025, at 16:24, Mike Marshall wrote:
> Hi Stephen... is there something I should do differently? I might be
> using an older
> version of the patch, it was sent to me around three weeks ago.
>
>>>Caused by commit
>  >> 50fb0a7f43c0 ("orangefs: Move s_kmod_keyword_mask_map to
> orangefs-debugfs.c")
>>>merging badly with commit
>  >> 063f8013373a ("orangefs: move s_kmod_keyword_mask_map[] into debugfs.c")
>
> One has "Move" the one I'm using has "move", as if the author (Arnd)
> made an update
> to the patch and maybe I missed it...?

The earlier patch was from Matthew Wilcox. Our two patches are
almost identical (they add the same data in different parts of the
file) but sent independently, and the problem was that both got
applied instead of just one. I think the easiest fix would be
if you just drop my patch from your tree.

     Arnd

