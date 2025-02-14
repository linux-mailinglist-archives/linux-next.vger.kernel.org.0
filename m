Return-Path: <linux-next+bounces-5454-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 925B2A360B9
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 15:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFDFB3A8708
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 14:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DB526657D;
	Fri, 14 Feb 2025 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fs60fQ7B";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cuuM4Baw"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A15266572;
	Fri, 14 Feb 2025 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739544202; cv=none; b=jDi/0v7aRHPcqBEdYlxyuEXWGBW9q1wAvOxs72sOCMcjJFNWhsIvZezHcrJXp8behM3YsqShIdN0g7g5bCKb+F+0fyForgQdMes741bEPFd8K/j8BcVoHmhb6ifwgqiuEbfQC41JjCsCLw4B8uGfen8axeHTbu2z+VO1WO2u0JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739544202; c=relaxed/simple;
	bh=8o0zBy52eBAQwYjBYC+nU/MUicg8J3e3oWJmjLQxMZU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WD2iuQDzORZyIZiWISFk3QM/rpJBc4RJJBpp9Q+K17yxb3YP8Tzh9pnYOG+5zvMDtl2b1/SsoUIpq2RYB4MN4VcwEyCB7frETu9FCphreeMcqrSgJGD7hkPFv0uW/sEKnHa5ndm5p95HWyaSiL54GHBuZFatGNdg/CPweydZ7e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fs60fQ7B; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cuuM4Baw; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 67B6D1380894;
	Fri, 14 Feb 2025 09:43:17 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Fri, 14 Feb 2025 09:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739544197;
	 x=1739630597; bh=/SbMJsZTVEbKRuVrUDYyc5PB99lv959TP0uVc5Xd2A8=; b=
	fs60fQ7BtStTUuwD8Q8P+uojYJ9MTo2VLZrNnTANUDP9iK3Se8p27diSIjh3sXyU
	uwbZNUVjqs99k0schJIwsyoYU4Mcnxr6LPZ0omnJJXPthtmrKP0SNdgkd/ricOnf
	BNdN6i/qMPcIXDkmI1mKuWlukFjMNlsmfARyXod7pAcluMUT97gJXtO/lKWV5Buj
	25oYwqqjrjWadiMQLkfkAZADuvjOH4uDccjeCYBUov7fvM7UBkE0nwppPywsdBzx
	g7moeNP0APLqgZhD7i1xLY6CAeXRMmgtEcIb/SECkYsKM3mfQ7iQMz5fqNGyAn2l
	0Wh6IXTmoOZ8YMNpX4qtDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739544197; x=
	1739630597; bh=/SbMJsZTVEbKRuVrUDYyc5PB99lv959TP0uVc5Xd2A8=; b=c
	uuM4BawgJTWa5LmvMeClLgw7jOrfiHdwckzVV+t43Im4l34SxLhId9hgEj8Btqux
	eXqUSQxBvr5r3TG8suRPv/T/RO2H09EDTk9tuZAifcWkGeBwaQ/KiQqKE20eVE+x
	IneZJ3go+Nd3qBNF9Qkp/b03OHm2bGvNTyuVy6ptON3JNTHlv+J9tbKh/6CHnkvZ
	qs6FYcvUG7aaj5b0M+ffoK6aFfoHDDQti8Ab4L2xp9fHgK/vcFC1AFfyAYF6xhnL
	4+TFaPc4khMdDQcgqUU9rii40v0GU+73LGErb9CN7Q85hx7+20Qbw6nNtLV+rd4o
	k4vxkSXcMCJx5EqnpEgEA==
X-ME-Sender: <xms:hFavZ0DuHdk3xOAWhFZEdYESurpx1uHeUvh3RyltzVZhz_Qy1vfCtA>
    <xme:hFavZ2gNwsAqf2F3WSSW-h5qqB6K4K3xo7TDuNJsFMSIB5uRqDWGbMUweQfCMan49
    OKeHkNdtsQzXlt5FSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:hFavZ3l96-0p0JHEEXGAmVruAvob4iabU8xg4PZ9HsV--2xGhK5B2g>
    <xmx:hFavZ6yObr5oqRwXPuyTKzmJRjCsI4UqGi8yAzcEbJza91NLIuuG3Q>
    <xmx:hFavZ5QLFVS_rA3WkNmkCjlItZAH1Kl58HpcwjX3IkVJdeuTQ37azQ>
    <xmx:hFavZ1aCszo7vYHc70g1zV239uwSrnkQOCN_SYP8wPNWMSz82y1gzQ>
    <xmx:hVavZ7ecLTXSFUDpGYlLgAAFj_R81csrc_xcheXbwboeyCkObn6ja11K>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BFC6B2220072; Fri, 14 Feb 2025 09:43:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 14 Feb 2025 15:42:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 ARM <linux-arm-kernel@lists.infradead.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <8f70d200-f55b-4ded-97a3-9586615bcaa9@app.fastmail.com>
In-Reply-To: <20250212093147.02ddbf2e@canb.auug.org.au>
References: <20250212093147.02ddbf2e@canb.auug.org.au>
Subject: Re: linux-next: failure fetching the arm-soc-fixes tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Feb 11, 2025, at 23:31, Stephen Rothwell wrote:
> Hi all,
>
> Fetching the arm-soc-fixes tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#arm/fixes)
> fails like this:
>
> fatal: couldn't find remote ref refs/heads/arm/fixes

Thanks for the report, should work again now.

     Arnd

