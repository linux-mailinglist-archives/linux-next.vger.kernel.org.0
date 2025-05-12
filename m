Return-Path: <linux-next+bounces-6686-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4232CAB2FE8
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 08:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 987AB7A27D6
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 06:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5C8255F4D;
	Mon, 12 May 2025 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="J641JMr5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i3Ly1Uik"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE9A255F4F;
	Mon, 12 May 2025 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032238; cv=none; b=hK2MxO9o2bDNahUBk9LYMnibTOeE1P4rBHo8mkqQKoplgCJlS3Ir5eNGeT6luVkld1zivVePdXiUJTL6IBsz5FGhvMHtV07syc7X18xJCEoUpKYweAfOn3m0WUnLQCVzPidV3hXOO7TcY9cbFOq869zZc5BDQWB3xHP9B34ma34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032238; c=relaxed/simple;
	bh=gCt5tZmmSwqyur/DE+455PZYL3EjaK9Mfdj9SUSmHtM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tZ0V31sivp3mr+Rn4ggi10MI7wJAiu/9YvMhErYio+KifgkZzYjlUFNdrOyvVB01Y1HBkiJsbTvT+kdW8U9QMeYkh3jc9jUTzaVmIywOSfNYKt8TAYl7758wdEZbw3sQGe+Vd3Lk1NTvot1oCUzB1q0oP361RPC1cSG/IjI6gmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=J641JMr5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i3Ly1Uik; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3A390254011D;
	Mon, 12 May 2025 02:43:54 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Mon, 12 May 2025 02:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747032234;
	 x=1747118634; bh=BSIocOw+TXBnqBucngWWomxUrtwVR6XyQakzrwOsw+c=; b=
	J641JMr5YcPIFe8iBhYxK5MmhOnDE4eWtO81QOMa9m2lGujHOTbIRy4VDIr8zDeV
	FbV+3fryN75KPeSbzTObiWPRS3pIf9egeihwPMWM8VPC8dJoQfCNVb6bL1Sx9BAh
	dPLZzsqWMdH061ZTJewrQlKRye82gxzDos98YYTbicfRoqQbk4qnUGpG00h0YzRx
	HCqJ7oilvYOq9isjtsI+W5OPl9UP49V64+fLlM++6XuCA5XDzK13Q462uCRT20s3
	L0rJCPlM07WUIXhn8IV679zSpkAoNPoaVFvDrtgY8YmEjhiui81AIlLJv5yx1wcv
	ggRzpabTEoRDbMc1yCMQMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747032234; x=
	1747118634; bh=BSIocOw+TXBnqBucngWWomxUrtwVR6XyQakzrwOsw+c=; b=i
	3Ly1Uik57CKRZfELEQW+4vXaQy9otc2FfkGXUVjWwBGGxq4YKySkS7DJ/MORnign
	5COCLaDSrt2srefs3s80BV1S4RWNhBZZxiXI5+w+816szRwVDRfRNo82/RfQB5MY
	Ja4S3POrqsuP6pL5ZHzeqJv5mI/lRaOTPL5HZ3c9+1r1XWoz1lB0laW8aK9CQBd2
	ipT78fVl2S6iMSqbxYqsMbTfnco3eckdyHSLZ6CKiFW1kfVKZ1RcXk/CxuZsoi8Q
	WKhRsBRQKCzb4uzfAFZPOdEEIw71FkRnwLO3042ndHq+Lq99nJ8lyQbOQ1Qd3pn4
	c/t5GXAXUG5LRD2Gcr+rw==
X-ME-Sender: <xms:qZghaNgMBjzHyeEZ9L16EbsBLvZuWas9UR_X_b1hQFSpAiuMKWbcvA>
    <xme:qZghaCCkM22aMm40Y__kkTMP4irVR3O6ifN_vT_qcr955wOzQ3agVGeK9GC3EXrmZ
    yyBD97CvGVVvyVAL-8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehk
    rhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrh
    hnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qZghaNH5UenF_83IJLNZ9ZsRUJi0R2CHgyQT5juWrh5EvxxnRLJlLw>
    <xmx:qZghaCSQ6M1r45xHJYyq1hq_jm00h26S62NJOuHbyYi5qR5xIShvuQ>
    <xmx:qZghaKx7-fLshdueNT16daH24NI4OgaW90VuZIq0sv3FCVBDDQURtQ>
    <xmx:qZghaI7MzEQow_BLo57BdtcPSrlLdGHP-jLFXVyyeJlMDH6XByuZvw>
    <xmx:qpghaE59Uuq-DdRZVDMChtc8oPxYwLDMoAr30P-M6uKR3JM3zInuFOfU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B93111C20067; Mon, 12 May 2025 02:43:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T9798bf764b1c8a11
Date: Mon, 12 May 2025 08:43:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <f52571c5-2d26-41cd-9266-21433423ba73@app.fastmail.com>
In-Reply-To: <2006c4aa-7d4e-48de-9c27-46ddb359ac48@kernel.org>
References: <20250512145955.617fd207@canb.auug.org.au>
 <2006c4aa-7d4e-48de-9c27-46ddb359ac48@kernel.org>
Subject: Re: linux-next: duplicate patch in the dt-krzk tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, May 12, 2025, at 08:34, Krzysztof Kozlowski wrote:
> On 12/05/2025 06:59, Stephen Rothwell wrote:
>> Hi all,
>> 
>> The following commit is also in the arm-soc tree as a different commit
>> (but the same patch):
>> 
>>   b112d9ffaa65 ("ARM: dts: vt8500: use correct ohci/ehci node names")
>> 
>> This is commit
>> 
>>   7dc891191e64 ("ARM: dts: vt8500: use correct ohci/ehci node names")
>
> I will drop mine, but I am surprised that this patch appeared in
> arm-soc. soc@ was not Cced on the patchset.

My mistake. I think what happened was that patch 0/5 and 3/5
(the one for spear) of the series were sent to soc@lists.linux.dev:

https://lore.kernel.org/soc/20250330193833.21970-7-wsa+renesas@sang-engineering.com/T/#t

I had some problems with patchwork recently and picked up some of
the missing bits through b4, which always applies the entire
series. I made sure that the patch themselves were ok and I saw
your Reviewed-by tag, but I didn't realize that I was not the
recipient for patches 1, 2, 4 and 5.

      Arnd

