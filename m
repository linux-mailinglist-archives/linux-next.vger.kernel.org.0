Return-Path: <linux-next+bounces-2890-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D547792BA2C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 14:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F9F4281F12
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 12:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54CE15699E;
	Tue,  9 Jul 2024 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ezPDb30+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IIDMttrI"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEBD15A874;
	Tue,  9 Jul 2024 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720529910; cv=none; b=sIuIvc+AHxkR1MNwvtUr3JfAHe9IB1Jhp3bikHmy5DI9yCQ10aS8FTwzS1v5fdn1tf/mfc1yD8yLMmZllBmrnCXZxW4MYGj1O8OM8Z6D7gY77EJTcQxcsulz+NoGSifcAXboMGiepZP49gd2MQjb6bEIK7bKSQB66VExqaErmTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720529910; c=relaxed/simple;
	bh=SZqpp+8uBi9BeJ6ui4vfsCsN4ZmNidm8v/FMqDTL9Co=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Z0kOTs9aICWAnUR2ZqP/PJiNnNX8/11WLEX52its1eR9ic/pKGdTdTSyVDZadphrtPt4Qp/1j5vG2QAx1A+3ZFO/323PcRl9cqkfLGyukxJoFjNyFRVJSQPrKxThkk0/WdoOmdGraDTkiyeR53g+9SVQZ+U4WlEMIMvyhy6xXhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ezPDb30+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IIDMttrI; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D4C411143BB5;
	Tue,  9 Jul 2024 08:58:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 08:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720529907; x=1720616307; bh=RlRmT5ThLi
	RqMOTKoy6+9YzSK2zOFyc3+8F3McMUc3E=; b=ezPDb30+/gyO7wi2XDjj6AKdmO
	vEbJZz457q6JWgzNzEHToAvCCHp2bd4Y4gA8e4UwS7UCbUmwe5rQQllki4SUtC3N
	wQLeUsTUpQz9q6hLE6krIkIl0rE5BsCWmiUAe5yUvzzcLan/92Afw/BUEupvJkM6
	c00MQliFRNae4zo04HUfrFHc9x3hS7UZhQ/TnolCleF9KInaSSCZuV1cGSMJNTUL
	PnsvtXE8XgEe4MtACHlyoy3GD9Py3d0eFFPVuQgT1f6KvGJNs+G27XT0N/rgL7A3
	Mkj5Io8LASR09h4yh6EWSbHmWFnc+wIvd1d8dI5lVXhwpaAU63rLI8oLsp3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720529907; x=1720616307; bh=RlRmT5ThLiRqMOTKoy6+9YzSK2zO
	Fyc3+8F3McMUc3E=; b=IIDMttrIlPZxhC+uyEvt3vO/2WIoh8baQqtj19Yw+KAv
	3RaJV7gMZ7J3pQ4UKlREZbBPbuCnpIHLGtmsOehIf1+SvxCY4OICLxiOjrYfCDWx
	SVtML5ShJNHexfK2+3QoD66A5yc2+787M2wl0SVJowGDZOYWhCh3GkuO3nGEfAPB
	FSFJ0g/QGA7Vq1BrLzWnqZEJbZVR9XbghICq2fwmTuJ8kGJsaCWIx0ReYiAujhEb
	ncbWdaL9ce56WWfbx8FsFRfsBwlP6cSRevaJ6srvEruGYb8B5Ys2+lhv/mkjDFb7
	4nhEoap2hL0wt8Qe2sTuCNvhTTTxw6dKTYV+MgVxqg==
X-ME-Sender: <xms:8jONZkbLgUyqrLEjAmiKjtG5J-loV3oo2YaIr2wPwpPTziXRf4HJOA>
    <xme:8jONZvaMYpC0pJwLGEu4G-Hq8putClDWWrJmx3ke5GGA2CVzJLVFXtb-zc0nmwXRF
    c1foYBxeoO3jh0A3os>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:8jONZu9gw0Lycd1z9j8EkdfLq5VxosO5fDmR3jsjJqQZE9HBkSysWg>
    <xmx:8jONZuprftmzkYHxiIkAbf1q0-j78NG4Zb_hzs-OX3dhrfjaHvdOTg>
    <xmx:8jONZvryw9Ogsg0C7MlaKIXGpVt8RtpUn-QkjDGx1Fn4TWRU5vqPCg>
    <xmx:8jONZsSsGYID06wjhwqZEVo98-888RPQKlwGY_kDaKimn7jXm-ylwA>
    <xmx:8zONZgA5qB2YMG3KTSqQYqcoCv1OEV5ScQKC-tjEZAE1-pu0mnF_13m1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7EB73B6008D; Tue,  9 Jul 2024 08:58:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <736fde6a-7b2a-4920-af1e-1ad2358db785@app.fastmail.com>
In-Reply-To: <Zo0wG8e7BwudENQI@krava>
References: <20240709105709.18ce785d@canb.auug.org.au>
 <20240709200851.4d921e43@canb.auug.org.au>
 <784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>
 <Zo0kzIR_ZueaEjTa@krava>
 <c25a32c6-8ed0-4ef9-a13e-cb16a89edb73@app.fastmail.com>
 <Zo0wG8e7BwudENQI@krava>
Date: Tue, 09 Jul 2024 14:58:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jiri Olsa" <olsajiri@gmail.com>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Christian Brauner" <brauner@kernel.org>,
 =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the asm-generic tree
Content-Type: text/plain

On Tue, Jul 9, 2024, at 14:42, Jiri Olsa wrote:
> On Tue, Jul 09, 2024 at 02:20:26PM +0200, Arnd Bergmann wrote:
>> On Tue, Jul 9, 2024, at 13:53, Jiri Olsa wrote:
>> > On Tue, Jul 09, 2024 at 01:44:34PM +0200, Arnd Bergmann wrote:
>> >
>> >> Though I'm still not sure what uretprobe is only added
>> >> to half the architectures at the moment. There is a chance
>> >> we need a different conditional for it than '64'.
>> >
>> > uretprobe is defined only for x86_64, not sure what that means
>> > for scripts/syscall.tbl though
>> 
>> I meant you hooked it up unconditionally for all architectures
>> using the old method, i.e. arc, arm64, csky, hexagon, loongarch64,
>> nios2, openrisc, riscv32, riscv64, and xtensa in addition
>> to x86-64, but not for the other ABIs: alpha, arm32, m68k,
>> microblaze, mips-o32, mips-n32, mips64, nios2, parisc32, parisc64,
>> powerpc32, powerpc64, powerpc-spu, s390-31, s390-64, sh,
>> sparc32, sparc64, x86-32 and x86-x32.
>> 
>> If that is not the list you had intended, do you have a list
>> of which architectures actually have the required hardware
>> to hook it up? It would be good to do this correctly from
>> the start so we don't rely on architecture maintainers assigning
>> the numbers individually.
>
> hum, so it's hooked in:
>   190fec72df4a uprobe: Wire up uretprobe system call
>
> and the intention is to have it ONLY for x86_64 (as stated above),
> if that's not what happened I need to fix it, please let me know
> what's the problem

If this cannot be used on any other architectures, I would
suggest adding it to the architecture specific list instead,
probably number #335, which is unused on x86-64.

I was under the assumption that this would theoretically be
useful for non-x86 architectures in the future, in which
case you should reserve the same syscall number everywhere
now and rely the stub in kernel/sys_ni.c for those that are
missing the implementation.

     Arnd

