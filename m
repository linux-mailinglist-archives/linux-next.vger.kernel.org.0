Return-Path: <linux-next+bounces-2892-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56B92BAC8
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 15:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C86D61F253C8
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 13:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805371581E3;
	Tue,  9 Jul 2024 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FnFwP8hG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SKlY68cv"
X-Original-To: linux-next@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B226AD0;
	Tue,  9 Jul 2024 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530969; cv=none; b=QM1AxYGN//NP/zapoB5ZZHyzo+o/qouYN4tpZlX6NxdKKyHgEiV3FPQCfxbXRdMFb+OUIkQrfoyM8IPBNVGbvOWw1aLFaJA8MhpjWT8axRwTGzawgoQMyJ52iLrDnI8qb3uE0bde1LraHPc2djfBUyNkkI6fbLxIbgtqbv6ErAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530969; c=relaxed/simple;
	bh=/nAG63nyq0Wp3ClVP493u/8kHz/KBkTw+MFGRwzENDk=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=DFFAUa6sM47SSQzdsKdypaznXGzrM1eXGOMXe+nfl2IFHohKgySAoLTgR8CAkUsAjMG7R0e2X/To8eWugHvxrskCwsIJTkpH3HwGfgdkM1keFcq0aiG+UM13GBf8V156oL8L/mAXqGdxCRvbp+3VxwbJy+jNYAQY8bLYcPsKom8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FnFwP8hG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SKlY68cv; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 85D401381D73;
	Tue,  9 Jul 2024 09:16:06 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 09:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720530966;
	 x=1720617366; bh=pJViaH5myuQ9GKC5vABBiWBPS5eqpjZ7itBibvIKUxY=; b=
	FnFwP8hGfmGlQWKlfR1G/bwMzn1jsFx26XSqzhPTt4RefJhs/hw2jU/rLaRLZeNz
	anXwyftVbKT19TSbYG1i2bpw9HJdDgO7lquGfcEc4Yq66Eq3JDOWlB+/QB4jsPBJ
	EVG3MMIQxGaLQmtcW/Z2meLPGU0m1nHYD6yzIMbpDxN+0ms+oWxC79TekMbBFYiU
	T72dWz2u/ymoMx/BrmXzNPEjrFzXGF6Jz3lxsUAAxq9u8wszpZv6rvuDODQo4uxK
	ZUIttfehEFGc7FUMdtQU/YJW5t5B9sY6Qv2H7kdx9JiSaFZtT22EpGhwjnV7cyDV
	a+kBDFGDmBAu8RmjYOQXUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720530966; x=
	1720617366; bh=pJViaH5myuQ9GKC5vABBiWBPS5eqpjZ7itBibvIKUxY=; b=S
	KlY68cvaRHQcF+vJ21D+CwJ4Lp133JlsV2Pmy35ZYMnQWDYLTT23lNcO3iG18TyE
	Ov26qQECcILId0zJWJlcCkKG1P3j5CTPGJ5WklrZWplymQ1BK6jpdLvwseqPu3cN
	Ig0DcXTDW2JvuMOyfwSwt+eoxXtuVvpaDoYPadHrUQshQRQA6g6AAgD4nk4nJseS
	kWOmRI2L6QGjl8xnKOilCqkV4r8mQgizZbfLtPi9Eqwrs+4MehpNHyIuq0kzjuc8
	TSLkPIK/1D+REe6sH87ysVZOAH9XLjebBl5azVVa2ZNLChX2dFWgI4zXdreAxbFZ
	AdTYnBRWnCKg7Jt8bsCWw==
X-ME-Sender: <xms:FTiNZrs4CvYBmCW-olQ9U9xsRcnv0i4E_VLhRFEXCTjXLNv7kSe3uw>
    <xme:FTiNZsdFrK_eYMjVtoXwLyt7T1A2jK7bdFuVfSj0EWcT-hB0YYUXiQVjSWeg-9DVL
    lnW1tunqlAaTJNDXB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:FTiNZuzX3m82ZdzjcwjQpa4-WaFwwFIGIMpkpUkgSEZO-fmRPm7xGw>
    <xmx:FTiNZqNjU9I9dnqzn9qVMg01rzvyY-kbACadHA-_EBCEORSJRZ9-jg>
    <xmx:FTiNZr-ijemOS783jOwzZ5pI_BU6Y9t1i-nsJVE9a2qMdN-W7rLLMw>
    <xmx:FTiNZqWBgNzACHHfsCp8WdhoPENrouVJ88hqogUQOkv034SawFyCEg>
    <xmx:FjiNZsPP3iOcWJ8BpUCFbwp-V56ucQA_nwv3x_Luex1vMcYt_wEJNttA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 01DBFB6008D; Tue,  9 Jul 2024 09:16:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <f2ceee62-2612-42d1-b727-2f087acc6785@app.fastmail.com>
In-Reply-To: 
 <CAL_JsqLmm6Da=4G9cJfAtKJB5j_dfbTywRRwHMKZyf3J7SAxfg@mail.gmail.com>
References: <20240709164618.69cfcfad@canb.auug.org.au>
 <CAL_JsqLmm6Da=4G9cJfAtKJB5j_dfbTywRRwHMKZyf3J7SAxfg@mail.gmail.com>
Date: Tue, 09 Jul 2024 15:15:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh@kernel.org>, "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Olof Johansson" <olof@lixom.net>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul@pwsan.com>, ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the devicetree tree
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024, at 14:42, Rob Herring wrote:
> On Tue, Jul 9, 2024 at 12:46=E2=80=AFAM Stephen Rothwell <sfr@canb.auu=
g.org.au> wrote:
>>
>> Hi all,
>>
>> The following commits are also in the arm-soc and risc-v trees as
>> different commits (but the same patches):
>>
>>   0620bce64afa ("dt-bindings: riscv: cpus: add ref to interrupt-contr=
oller")
>>   877097a2fab0 ("dt-bindings: interrupt-controller: convert marvell,m=
pic binding to YAML")
>>   c7ce06684bf5 ("dt-bindings: interrupt-controller: riscv,cpu-intc: c=
onvert to dtschema")
>
> I had to rebase my tree yesterday to drop a bunch of reserved-memory
> restructuring that seems broken beyond repair. Maybe I'm going to have
> to just do reverts instead. I had no knowledge that anyone had pulled
> in my tree and how is it just these 3 commits? It should be at least
> these:

I picked up=20

b1a4e71d4fc4 arm: dts: arm: Drop redundant fixed-factor clocks
f7e642bcd622 dt-bindings: interrupt-controller: convert marvell,mpic bin=
ding to YAML
2af8d8a583a4 ARM: dts: armada-{370-xp,375,38x,39x}: Drop #size-cells fro=
m mpic node

from patchwork when they were sent to soc@kernel.org. I don't
see the other ones in the arm-soc tree though, maybe they
are merged elsewhere?

      Arnd

