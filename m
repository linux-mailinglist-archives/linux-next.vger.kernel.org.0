Return-Path: <linux-next+bounces-2461-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2E8FA97F
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 07:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28411F2403D
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 05:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B8613D53F;
	Tue,  4 Jun 2024 05:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HV+GjgbM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JT+m5en8"
X-Original-To: linux-next@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F99177A1E;
	Tue,  4 Jun 2024 05:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717477726; cv=none; b=aJXYy5H4Cg5leuvheou/J4fWzuGRk4DWauBLSmFZ3BSn4jtWLXtjMFeQx3cvGZ78mxMhG2TNC0cIAAmP/XgUYp0a8sVg8cTvyrwA3K/V+SXzwKCcB14113DzmNFHYfCB89N6pXZqJwHE2OjkTGUauzG7fF7nK9pR2hBZz2JiDJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717477726; c=relaxed/simple;
	bh=Yhs+Trzfw2UYkasFfbTkjOuR07fTN02HNrxpExajLgg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=bvZ0RTZseKrJHFC8czay+n+vcQ20tN8amARtmjYC6PzcKsULwnUpX3Fs/O7zUb7EkTDIYzo1ybi46AzNQtWVVAIjnYFulrkHxuj/S6dF1JEq2pt8+RqLwnWLZpa19Uo6WWNkRmTraHhvHU73PV2pn2gmFrhvNampPngVXrpOebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HV+GjgbM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JT+m5en8; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id C8B2B1800160;
	Tue,  4 Jun 2024 01:08:42 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 04 Jun 2024 01:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1717477722; x=1717564122; bh=O24HxZ2FR/
	QfFJfNzwiXTjH2DTdDQikschmKkwMV0UU=; b=HV+GjgbM23DiWwvZ9MEVu4CveG
	h/9TTrM92zxDoQQLb94Ymv3XC+3UtM7UZfmlRqOtdHfGzikRirOvO1KQjzfw5qEH
	moha8Pv6GvcGP5DeHDkoVLQX8i0t1PqfDfCKjmKrvgsAMxrpTj1n9EPqWjJQUpU7
	5tVLpDHKf1OVy8uL5sWsjNf0Dyjm0U5U76Un/hm4AS3WJEIn9b8GDTCeDw9P5iuE
	UD7LglTcveQe4BYiqHP7J5s6csHIylUI9LdXpZdPCnxODpib/gJMQEdQumEl6X77
	bYEIMXgXLMu5sa3vxNKpw6jawMZGSgF/4VtJmDGv1fmeGKhrzVesHqYdU3cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717477722; x=1717564122; bh=O24HxZ2FR/QfFJfNzwiXTjH2DTdD
	QikschmKkwMV0UU=; b=JT+m5en8tm9vxgxfG7NXG3Ovb2cPHKlHz6tUerAkJTDq
	ux8k3U0T9UfOw22vLB6/xG1rhuFDP5SaBQJeMZNMRwjUCwPXXA0hWPfpdqJdI34R
	Mp8XbY9I07AzQAbxpcVhRtVWIY5h6Ck3J9O+loxcCn1ODlRdSqe5rv0tyOXSW4rV
	UNFyua1I9s4tvKfcLFOsjjeP1vryWhEbiWY0fp/A2UQGFBhag8fozcvlFJqcSyPo
	CZPwQZN+m3Kyp6Q8ZYhFjUHpjCxdifXM4f6yjuZIeLhiTbh+12CykiVKowriucMc
	9x8hHpezXYQRLBnnmORAA94AAwO4tQB53uWX77EOSQ==
X-ME-Sender: <xms:WaFeZhbOl4ZvAr8Sl7DqYbIGbpxPIbeUSWBudnEF_9f3FcAWzcej1Q>
    <xme:WaFeZoafCArsDMAa-Dr_By9vgT9ptafcYDD9ZQxuj-kxX3hmHz0rHyXcvzCGX4hMo
    biG8DQgjbcEbUvRwZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelfedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:WaFeZj-o5j_ehrGCA7qjcfcvDc_eWbaduw1X-s0mUo6Tv5_Yo3mj0Q>
    <xmx:WaFeZvqoVXFd-OQermMGYqMXHKMLrUtx8yaNvDhoQmczUuD9TRbTWQ>
    <xmx:WaFeZspSBQa6GFMbLGFRy2sjz7nDX8xRTGO7OgNNYFYE9F6Z5huEzg>
    <xmx:WaFeZlRYxFeBSRy2LJ8FSYkPhmvRniGjrbn1rDMG0xf_5KXpmjdPJg>
    <xmx:WqFeZtfkjKn4RyRt9rhOVtDq-HgyYw--heVlBBho0diRzbWZIz_YgTt8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7D78DB6008D; Tue,  4 Jun 2024 01:08:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1bf553b0-bc37-4922-b480-41d965ce5224@app.fastmail.com>
In-Reply-To: <20240603171957.11cb069f@kernel.org>
References: <20240531152223.25591c8e@canb.auug.org.au>
 <20240604100207.226f3ac3@canb.auug.org.au>
 <20240603171957.11cb069f@kernel.org>
Date: Tue, 04 Jun 2024 07:08:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "David S . Miller" <davem@davemloft.net>, "Paolo Abeni" <pabeni@redhat.com>,
 Netdev <netdev@vger.kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Content-Type: text/plain

On Tue, Jun 4, 2024, at 02:19, Jakub Kicinski wrote:
> On Tue, 4 Jun 2024 10:02:07 +1000 Stephen Rothwell wrote:
>> > 
>> >   727c94c9539a ("ethernet: octeontx2: avoid linking objects into multiple modules")
>> > 
>> > I have reverted that commit for today.  
>> 
>> Any fix for this yet?
>
> Arnd, do you have cycles to take a look? I don't unfortunately, if you
> don't either perhaps revert for now?

Let's revert it for now. I tried reproducing it when I got the
first report but failed, and have not had a chance to look again
so far.

     Arnd

