Return-Path: <linux-next+bounces-3640-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFF096EB0F
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 08:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26778287C0B
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 06:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8C47F48C;
	Fri,  6 Sep 2024 06:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="loJ5XAPS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jEp2w+mG"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396AD5B216;
	Fri,  6 Sep 2024 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605684; cv=none; b=BKP/mT4gz0JJFYkDj60g72tEHJ1gpfkOlEGfxQj0Cw0HnONqBTEZNsHKxQQGINppe+/sbdUNXoPm2hsTvpAFOEXjpeC0AVe2VTxpEo/zfh2HJxnJ2cHqUVUVDzEGvxSMgf4zxrMSb9u7mhu0ToIrO7bcmrx0AD8Ff0sQAZKV84g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605684; c=relaxed/simple;
	bh=rebIkz2HujIY8ER7tMnaQ8h60wBJ6PP/3wZDMXTtPgw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kso7KmVPuVEOCUSi2IL4mseYvjPOBnJLRePuRhjbfQbhYwLkdEpIIm8e4OBRPJAeM+31589/Onud3MrxwNJU24ZdW3usWxTzPjK63cgn7CKpg6KES+ZaOxpF3+1cdlqRzPvSYsNSH89KF3+XsOfVX0g5c0wscYIfOA4ty7apgCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=loJ5XAPS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jEp2w+mG; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2BE011140363;
	Fri,  6 Sep 2024 02:54:41 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Sep 2024 02:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725605681;
	 x=1725692081; bh=wdVPqNI+4uEs4cjQXwgvk8XdTUz/SDRJDwuY4iZrbC8=; b=
	loJ5XAPSbSkvBYNCSE4RVUImwzqsyf7af7S5PkmERQQjlr/J2/BekaCreq7gh01c
	ra7vuquqUVFOjZQEm55Oy9KmgH1IiUA7fYBSebfEyLDvq15hvogjE9paQcT7FLWr
	JJv+SIN3VriWfq66UI7Sa75+s2DoBAZd6tmE7gbLvVgg4YUJKFqHDZC2vMjcURsN
	NXauAuwz9H7TIJPn7xZA411k+dtHiU62kGwrIK0oRIj3jzjdLizKym1NpddNWEwd
	CgE8mHuwO2vNxTS1p6/RTQu+ofn1vVhTQpkEJcpemvGUBZzmpZUp3YVcOfPgyPTo
	yoCfUNM/HAQ/0oYAWPbz7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725605681; x=
	1725692081; bh=wdVPqNI+4uEs4cjQXwgvk8XdTUz/SDRJDwuY4iZrbC8=; b=j
	Ep2w+mGJZ1/9vhtJNxCN+IvOui87592NFtn2fh59YGfcya7gs5A4qZDYes8Qjn9w
	BEOsf/X6RTBhWE5Gz9YCAGlYB0+NDQPF+Q3kcAYzr3pAUE2sM/KjAJVi0bn33YU4
	CeAurMQkOmH1L7gbKNWzH+QmRkEoPEVbd+ONI2jDxrYP2K9EWN+BLu29XZ8IxsFT
	uE/S/57xLqtetIHSu/Nh7zJpFsutclRxj5c+sT9YjPZFdL5hKm088rPRxKkpBJ0t
	Bx0iGRw5/fZjHLuIZKdvvixrvCK3LkhxlNxuQ4nNclkW3JSKMTIu9GB3ykIpUSyj
	zk4jbGdrrFb8xuu+cw+eg==
X-ME-Sender: <xms:MKfaZkQrgTcgSqHOls4cPtRvi2q8wPWswqm6138fTvpQzeiXl9BwRA>
    <xme:MKfaZhyghNGH99de_MKu_V3ZlOg-hSAn9VPPy81Gza-VHCCxZ3QfUg5kNMjx1VSeK
    II3Mfghvrcjn8Edkyo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeitddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrd
    horhhgrdgruhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeholhhofheslhhigihomhdrnh
    gvthdprhgtphhtthhopehinhhotghhihgrmhgrsehouhhtlhhoohhkrdgtohhmpdhrtghp
    thhtohepuhhnihgtohhrnhgpfigrnhhgsehouhhtlhhoohhkrdgtohhmpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:MKfaZh2sgTYmn0T07YRSsjNP5rALS8NzEMTg61nJchFzMxBFzqOi0Q>
    <xmx:MKfaZoDCd8uzYLsrOQuicFa5DmxQX6Sj0ScNNJ7StTet0GN4pdSPdw>
    <xmx:MKfaZtiUAMVEfawxjptYMsVg_71HkQmNzDoTqT4GAXekaRykcdMFOw>
    <xmx:MKfaZkoMAG-j5sFvaS2TzLy1qMOBtoQeWtWtXNuAXNjPp7wFnzJdLQ>
    <xmx:MafaZoXpX-BQIkkn4cvUmj7HfqzCiqVZLnfZMpPo_X_YzKAnXA08Il29>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 84547222006F; Fri,  6 Sep 2024 02:54:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Sep 2024 06:54:10 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Inochi Amaoto" <inochiama@outlook.com>, "Olof Johansson" <olof@lixom.net>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <9b83c044-5f22-499e-94a2-1c81f41cb620@app.fastmail.com>
In-Reply-To: 
 <MA0P287MB282200D15F3A93CE187FA66FFE9E2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <20240906120436.74ffdd06@canb.auug.org.au>
 <MA0P287MB282200D15F3A93CE187FA66FFE9E2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Subject: Re: linux-next: duplicate patches in the sophgo tree
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024, at 03:24, Chen Wang wrote:
> Hi=EF=BC=8CStephen,
>
> The arm-soc tree contains these patches is due to I submited a PR to=20
> Arnd and he merged this today.
>
> And for the sophgo/for-next branch, it does contains these patches. I=20
> created the PR branch(sophgo/riscv-sophgo-dt-for-next) and cherry-pick=
ed=20
> these patches from sophgo/for-next and submited the PR. I see the=20
> commits in arm-soc are the same as that from=20
> sophgo/riscv-sophgo-dt-for-next, but they are different against the=20
> commit ids from sophgo/for-next due to cherry-pick operation.
>
> So my question is, do we need to make sure commit id the same between =
PR=20
> branch and sophgo/for-next branch?

It certainly makes things easier for everyone if you have the
same commit IDs, yes. Aside from tripping Stephen's sanity checks,
having rebased commits in your tree also means that the branch that
gets tested is different from the one that gets merged.

If you have multiple branches that you want to be in linux-next but
get merged through different upstream trees, your for-next branch
would normally just be a merge of those rather than a cherry-pick.

[Side note: you should also ensure that each of those branches
individually works correctly, i.e. it may add features that only work
when combined with the other branches, but it never introduces
regressions when merged without the other ones.]

      Arnd

