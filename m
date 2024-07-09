Return-Path: <linux-next+bounces-2896-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4F92BCD7
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 16:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64193281836
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 14:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F4E15279B;
	Tue,  9 Jul 2024 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="WGeSD+zh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="egD80V9p"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2C128E3;
	Tue,  9 Jul 2024 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720535185; cv=none; b=HHD1I0xnYhZ1lGqN2KiJBaDYVWYEPw9bzRg+BgXjSViURvdGbBmhLdVpaYCuus1LUNoxzp5yrZ+xnSSFT4E4xi4E1dfVjphXV6f61ggYy/ktU82HVYjaNY5QiqyxBsLlcd7t5+3Pl5YE5YGdkLrZPozIuTzdeobqmkT8Rm1NxHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720535185; c=relaxed/simple;
	bh=6FcdC7Mc5sMY5oXzDQGddYkcaOVn3/VpejbieeJyTUE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=kbRl8v587l3lb/nnQTqnaSjpqrerWS+p/4au5Mq2MKLbWS1fa6hzJKs6132FxScbHvbO0IGo9VzgCUq+ZKZ3SxUrIfxWInaOmW2oXwzdESak/UH5yVQbhhlOXyG2gj5ARK966xe6Pe3mCc0cDMJuBbsSLVLwiZkMQ6+FEI6LWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=WGeSD+zh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=egD80V9p; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id E052F11413FE;
	Tue,  9 Jul 2024 10:26:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 10:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720535182; x=1720621582; bh=vS8QAGpCRA
	MVfkf3jvbW0/s6apul7+EyjTdL2KtCmmg=; b=WGeSD+zhJExiG9351I3bCvVf7H
	tyhVQda5dGk2EIaJZaPI+EadWkOtayxiLf9SWLO/Z+beSZFQ1cipQKI+AOG974Qy
	fJ7RWQFWtqk5xF5TTQTgmNR1DneEferOz7nnnM5MjJeGHJteN0I/wrYY9ZdY65/V
	HClnuHs8teqH2qLOCr805QwTadkLLPjTHo+baAEmUOwxt1/SapjFF38ueI0LezNz
	EXCB+j03fRbeHQP2l+JRthenkvVTtgjBqfVwWJ/aNF97zcipY5I64RDq0Zxh5gbJ
	zYoWJYdxStDLRIUuCWIduarP8uYuMToX7z72QP+PWGYNUDX8Pi20K80OU/5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720535182; x=1720621582; bh=vS8QAGpCRAMVfkf3jvbW0/s6apul
	7+EyjTdL2KtCmmg=; b=egD80V9pjeLgu+duhJUqdhyVnFjWQfbSfolRRH6ahpsy
	KC6QeIZfkw7B/y/S4K8V+VHD6OyMk2uzZf/Kal0K+c/E5zAogxH72O7F6OR0HGwg
	BRfI9AOx/fr+jh8ZvNu6r7/aqHHh/jPeiy92hUn8tiyyGAAJzPKI8xWUW9Bdq4+R
	TZxOHtADStB+N8OXGUXLqC5qYjGayXJwHJJHmZH/EDjd4XEP6ujsHiBQL2VWQF34
	uwROxDXj0OGvNpWnn2lNOf3wO0XWBWzP9430NhkJv7HJ2gk33aZ8mkBkbr3GylmN
	H5yTp4WUTZxHNeCTWA/1XPln5MF+2qOmmbj+lRTeMg==
X-ME-Sender: <xms:jUiNZofKCZNU1Ufwt008mVwZCpUvmYe3hIoGRtmAucKk-Ib9XQpViw>
    <xme:jUiNZqOhinXfGdJME1o7AScH8qrLj58UVM4L-5W2apE1gXQGJpmMUsYuLXgt5vC1d
    UX7mRvAWpqNc9pUkaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:jUiNZpic4-xKlj5lEIJXgH4U_wLYaZSbIZ5neH0TPtDhx4E5yaZMvA>
    <xmx:jUiNZt-oncwH1wzSJUofhogCfZBFvtqrEigm_ATj0ce-826WyrzADA>
    <xmx:jUiNZksFsRDJ0ZrpfD3DRjfi5wb6SaMEef6US2H1PKXTjRavAJmhZA>
    <xmx:jUiNZkE_K5IX2G6AD1xkw2fn-E2TvnCfEX2PtqgomAa5500MalmXTw>
    <xmx:jkiNZuXzwfXrxLZGOermTCjOFOkcgsymrXMgsVhKe1U92H-cbCJ2oMbQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 38791B6008D; Tue,  9 Jul 2024 10:26:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <918695c2-0fb0-4439-836b-572836f66a26@app.fastmail.com>
In-Reply-To: <Zo04ZYIEyayrvBYz@krava>
References: <20240709105709.18ce785d@canb.auug.org.au>
 <20240709200851.4d921e43@canb.auug.org.au>
 <784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>
 <Zo0kzIR_ZueaEjTa@krava>
 <c25a32c6-8ed0-4ef9-a13e-cb16a89edb73@app.fastmail.com>
 <Zo0wG8e7BwudENQI@krava>
 <736fde6a-7b2a-4920-af1e-1ad2358db785@app.fastmail.com>
 <Zo04ZYIEyayrvBYz@krava>
Date: Tue, 09 Jul 2024 16:26:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jiri Olsa" <olsajiri@gmail.com>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Christian Brauner" <brauner@kernel.org>,
 =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the asm-generic tree
Content-Type: text/plain

On Tue, Jul 9, 2024, at 15:17, Jiri Olsa wrote:
> On Tue, Jul 09, 2024 at 02:58:06PM +0200, Arnd Bergmann wrote:
>> 
>> If this cannot be used on any other architectures, I would
>> suggest adding it to the architecture specific list instead,
>> probably number #335, which is unused on x86-64.
>> 
>> I was under the assumption that this would theoretically be
>> useful for non-x86 architectures in the future, in which
>
> yes, at the moment uretprobe is implemented on x86_64 only,
> but it could be perhaps implemented on other archs in future
>
>> case you should reserve the same syscall number everywhere
>
> hum, is that necessary? I don't mind, but I don't see why it
> should be the same number on another archs?

All new system calls have the same number across architectures
since number 403 for consistency (except arch/alpha, which
uses 110 more than the others).

Linus did comment the other day that he did not think we
need to actually assign the numbers when the system calls
are unlikely to actually be implemented on most architectures,
but it would be good to at least add a comment in each
syscall.tbl file to say which syscall the number is going
to be used for if it does get assigned.

     Arnd

