Return-Path: <linux-next+bounces-5979-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7CAA6E180
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0C101894158
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012532641C5;
	Mon, 24 Mar 2025 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DXmzlsWg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HhLS0TR7"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8378026463B;
	Mon, 24 Mar 2025 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837891; cv=none; b=u80IsG8cKMONyx+vdpMv0a+MC2EmBX7iz5DR8GsZhiVog25viskB39rW4j0/RsAZuaL0WqKdw/UoauudVlZUBEiudOcOMj5i7g+NkNeZRoNG985r1gtCMngcfjTcXvQU8KnuTvyBuf6PPyPcjJOKblzGeVWXhVpstnkASyISO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837891; c=relaxed/simple;
	bh=Pl8ZVDDj01kH0entjLJU7sWrwBBGgSDZhTkUajTovBM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jbIh1LCzaznTgT1vPTJBc0nBXzRL+1O+Il/pRkPbKFhYD+upLlm2kFH6lXdwP+BnM+GYbfMwUMvNwt6W3wQq5uPqzMFVRFFrjYQ4utyGccdHlF48jcW0vqxH3HhxYCd55oZY8edBdcV6wgrYoGHrzhBg0Xm5MBvtgQDJAeMZGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DXmzlsWg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HhLS0TR7; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7DB531140163;
	Mon, 24 Mar 2025 13:38:08 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Mon, 24 Mar 2025 13:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742837888;
	 x=1742924288; bh=0ikk+C+FnOn4DT6thNF5NrWTB/loSybHk2l4v3CzNfQ=; b=
	DXmzlsWgRAVmHzXqk4SjUmKq3FroqR3wamyO1xhLiIoH1BCtOwRp/723XkJr+IWS
	YfNDkxGPljYRF1L3FsB1aIwgHGp2lLmC51X6Ajl/l2nH1urg+dmGolpPfHGibzb8
	FP+nSUCqE6G/ULs93aa1prZF4bVcT8FMOOJBbPisuq4/hQ52dc3DoqUCYa9LLpvP
	lHt5eJdW/AvRxH+o4icyrQpXBNNiNzlnAru8j6yl2CvXv/O231cxeKvakDjw9iPw
	buqv8dNt7V/dIBenTiWIezoPI7Bq3lJ9Pdw2BfDUQp/Zs+ppzT8QWr8NhRpwLX/a
	g1EJza4BtYJWUQnZwM5lUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742837888; x=
	1742924288; bh=0ikk+C+FnOn4DT6thNF5NrWTB/loSybHk2l4v3CzNfQ=; b=H
	hLS0TR7gvCubWTavhyXtaYcVxakySgop13VtLB2oOw7mNiKDiCHYiaOdiEib0rvA
	sLzLyq9hk5VU3+HI6za+sK9GfNuc1U1aPxujcnhAVZwSve4aR6Aze3Rt1+D+oHnb
	9GRto9q/POQaUXq5jPbpZIoeXQHKrCy95Q9FFITyVQFPUx5dfyMHIVSDYDojvM85
	FGulHEuOMVMJ5oUlyyFDZ6J8jI2XJ0WQypyn8QOz0kHxGE2U0HM8wlwxN8wZXQej
	VSh1GRBcwuzfTfLqHuc78SB8Kv12sLg/j45SVDaJnNNJaxbSGYD+ieEFQnJdzZ8e
	xRwXI/sDmmAulywlKnCjw==
X-ME-Sender: <xms:f5jhZ1zjV0SjtJpFsHeYs74lk2MifsgWnORrRrtZfj-ULvkKNwhReQ>
    <xme:f5jhZ1SSdrjuFsLhI9OGt4VposD2bNUcbcqUfRewKRnk7Jl0xn_p968CTwFc9JIN3
    lhRlruqxXjJcLamcLo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhugh
    drohhrghdrrghupdhrtghpthhtohepghhlihhtthgrohesghhmrghilhdrtghomhdprhgt
    phhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkh
    hpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepjhgvfhhf
    rdhjohhhnhhsohhnsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegrtg
    grrhhmihhnrgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggt
    khdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:f5jhZ_UdxMaTbbr822PQ4ilOV-zNjLhEOUvKq9Z_gSC20B_Mq6rlEA>
    <xmx:f5jhZ3hLKi3uMXlmdhtnNrz87fog1yed7I4Cx6l1rMd8cRDo2VDVHA>
    <xmx:f5jhZ3C2sxlh8WcCEfiJBiGliLCLbvCfDfkgMTPpIKXVA2oCRqY7vA>
    <xmx:f5jhZwLqkzeD6YExqg5GyBFZYrosCjHPc7FfcZ3RiEQ_s2M-VnSIdA>
    <xmx:gJjhZzs6yRsRSLuVgAaWmuRqhGbDXrpkemStinyl8WRzuRVM8K71hlu9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8773E2220072; Mon, 24 Mar 2025 13:38:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 18:37:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>
Cc: "Oliver Glitta" <glittao@gmail.com>,
 "Alessandro Carminati" <acarmina@redhat.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <5d58bda3-4f6f-435e-962d-a8a5724112f5@app.fastmail.com>
In-Reply-To: <9faf14a1-ba47-46bf-9ddb-629782b8b52d@oss.qualcomm.com>
References: <20250324103048.3d8230f9@canb.auug.org.au>
 <9faf14a1-ba47-46bf-9ddb-629782b8b52d@oss.qualcomm.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Mar 24, 2025, at 14:52, Jeff Johnson wrote:
> On 3/23/2025 4:30 PM, Stephen Rothwell wrote:
>> 
>> I have temporarily reverted the latter commit until the former are
>> fixed up.
>> 
>
> +Arnd, will you post your changes for these?

I have sent out the last 10 module description patches
I had in my tree now.

      Arnd

