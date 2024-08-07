Return-Path: <linux-next+bounces-3252-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE994A80A
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 14:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF0AAB20AE8
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 12:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBA81E4F0E;
	Wed,  7 Aug 2024 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="V0IoLeHx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L5TBL6Et"
X-Original-To: linux-next@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8BC1C824B;
	Wed,  7 Aug 2024 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034830; cv=none; b=FWQ1j5F6Y0YD3/1M0ElIhX/Bvlo8KEphLK5hnz5pR7bvXsPwJfb7CAseaitVzCb4gsmJaFZFe+keKTEWubhw2XakH6vrBzDIURwntUWPjN/mAjs4ep4tgc4zRtSDrOaIVRZ1SNHOb+2fET4uYL+iiuK1oKDXd9YKHY3q2WV/WZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034830; c=relaxed/simple;
	bh=4X3P3sXiJ/UDqE4t8m0xdFpp8RiQAdBwVFw6oBqf7S8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=foCiyOfbPSM62z3LIaP3hCE19FHG1svLr2u7nzW2+k28Tx8HQDbBXfZs7fuONnIKB9d161gq9JOcvJYm4LlqjHjLyBLz+kUO7qpdbflV80ZHHoZMp+0ctczyf0f8UAfc94DjU9WwkEvVdvlCB+j1XGckHlh3+94xllLlG5rlCQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=V0IoLeHx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L5TBL6Et; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id C9064138FC1F;
	Wed,  7 Aug 2024 08:47:07 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Wed, 07 Aug 2024 08:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1723034827;
	 x=1723121227; bh=o2sOgG7rz3jM/pZWq6JqSq3X/mFPwfPo4FnOzh1Nn58=; b=
	V0IoLeHxVaHOLPv7lqK3T2HszVZgJHKfnlZhz3KDYxdH8gsptXLeskH3e5k0qvJM
	sOlW4wYyAfhZHq31611V4KJL/uzhZtZGfpMj+NJ/0Ct1tYMpGOUKhlDcbT4zNmjH
	2k7mnWFdjmOnuL+RVasE36A009gMvdHXr0KPgipKSostycsMiN/t9cckLPOCRac8
	jJ2mNLcGvNouo97hXbkdLEZDrVFqeANhN9W/WV6qjAlqJBjPDZf5t+3qGcKw6jfr
	PFwhEd5VbUdNIru/X5qWIWyCF35B2mzzKFU3Mm/wZQtMzECpCat+D/5zCqZI00HA
	mLW4cVWN2XG8QNQbXvaB1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723034827; x=
	1723121227; bh=o2sOgG7rz3jM/pZWq6JqSq3X/mFPwfPo4FnOzh1Nn58=; b=L
	5TBL6EtZP2UGvJvnYLt005tnNYYmgrw8+MuV6+QGYiaKQl2I38jmCm/LQOhT8XqW
	lN3uUtRt0sHc5e7NIhk60eHh//Fg7VutN075/aGOzt0A1LiRJQWoPG1RgwAOjiSn
	wzzly3pEzmTEtK/UdDEDN1G9DScVE0/1tc4uh57VegprO5SvpfKZ9mqKIU6pnOkT
	ZUdpMRdbclBiIxe137CK9gXloKCdWPCX1nkuMblfTToQy3hoBG9dE658s8486VVj
	H1uJ71+Taey7GNH2CzyVYLgaXbfK/crz+5CiMvLg5J1KvCg7O9okXrKAZrw59oSl
	9t3Q1ZpUEu0pm9urzuOVQ==
X-ME-Sender: <xms:y2yzZnl0ZvSFem-3mORaV_ZuLenhsIJfiexvDZ9_CAuLM6xAYuWQfw>
    <xme:y2yzZq1pxrHKkz4SE1NB8X9csUI8QyB9Uh5U8IUlKb76S-flrX6sjZgpz8xJvT3Uf
    Ckjgr4TpHbTLZ0t8UE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledtgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdv
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:y2yzZtrESF2aXMyM9nx9Mg44EdG_l13O7wdBWisn5ojF1y9dhHXVYg>
    <xmx:y2yzZvkYs-JcBL4TqYBtw4_FA5m5oQ-LAMNv1oWjALL7ERJW9ESp_g>
    <xmx:y2yzZl0cgZ62nPFkCVmAsOF-GXAS9buLXxPVv0vPY3ZtTzvjG11APQ>
    <xmx:y2yzZus9F8kwZx1K9ek9uN82_Nu-nptnYVoc5nb62Tzlqjp2hNHmPA>
    <xmx:y2yzZgQ9kZLVZPPzm5hU01LbFPZSRuZf2FVe06RjasewHWkjf-WxxAOY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 18AE0B6008D; Wed,  7 Aug 2024 08:47:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 07 Aug 2024 14:46:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Olof Johansson" <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <e7daf12f-482e-416d-beb5-8ceb8bbfda51@app.fastmail.com>
In-Reply-To: <20240807081751.7149e22c@canb.auug.org.au>
References: <20240807081751.7149e22c@canb.auug.org.au>
Subject: Re: linux-next: duplicate patch in the arm-soc-fixes tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 7, 2024, at 00:17, Stephen Rothwell wrote:
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>
>   5b92ca4b2368 ("arm: dts: arm: versatile-ab: Fix duplicate clock node name")
>
> This is commit
>
>   ff58838015c1 ("arm: dts: arm: versatile-ab: Fix duplicate clock node name")
>
> in Linus' tree.

Thanks, I removed the duplicate copy now.

     Arnd

