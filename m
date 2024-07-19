Return-Path: <linux-next+bounces-3084-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289393735B
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 07:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09062833D7
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 05:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB3439855;
	Fri, 19 Jul 2024 05:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="LW6dVYZB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zlby3YHa"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71188A35;
	Fri, 19 Jul 2024 05:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721368213; cv=none; b=XeAloBvLpharwqfiN8ck4h8TaNNvMb66m2wfh0a/ir+WJRa+7+SZgibMFEPy8nLFlXT2kHm3IpFzVjMeVpw3b+sjcHoYVXzMzbL3QazT4WR/OJJ8+Q5NOoUeHkeKLavOprVmDbkR8uCEOixGMSIT5Wwdb/u5yQFs9wjNIvgwtas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721368213; c=relaxed/simple;
	bh=J9W6Z85LPGk0MxzfKfgbWzG8llz6oNLxWqEU/X5SgvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSQk/GgpM/6r/uaxiFQZTnYKB/Ubvc65GtToqmNYvZY40ooPMm5quS66+kwjuc9M470oZy7Kxd1f1Zk3/6LgNXzxGTQ3TJ5nNTqmDSTboUzZIRlXrHecKx7SfijZbVRUek9UnwULvlBJCk6HqeQpAkIBAFIVYMSJeAGxf54CqFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=LW6dVYZB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zlby3YHa; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 43BDD1140488;
	Fri, 19 Jul 2024 01:50:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 19 Jul 2024 01:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1721368210; x=1721454610; bh=HHxr6OwtS7
	YJlrRmoOWN0PbX3/0+HPWwGmbWJwzNthQ=; b=LW6dVYZBzun43KB/uVCmTWlwHC
	aYOBFb4uxWHO++rOz+UGkEYr452nD37M2opwnMjcvPk3k5jBXOTWoIUg1/d6pGKY
	n1AhcpZVNQukol67zsR0Dk4GHJRljijB5x36rgyM+4euKtIpjHm5lj64pQQeIZ7Y
	Nz79s5A8IA9c2dnynQwnaStV2KkOpwPdTWJVgfqLjO2AMT07sXbbZfFxAvBVZfyn
	0jdX6n2KFX8/RtS+kEe67hHpoSyC0YhjUhp0u1HILhVqBkIQWrdtPq+Qwq2Uwm5s
	JMLGRR8mSV2P2Vmx3foM1yFMIK7OXOqJ4ucF026LGhFqpR45EcuMvbDqbsKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721368210; x=1721454610; bh=HHxr6OwtS7YJlrRmoOWN0PbX3/0+
	HPWwGmbWJwzNthQ=; b=Zlby3YHaCynOvfRKV0V4/fIecL22R6oYAniO2Q1I/she
	+iABONK2FY3LYuuIQDLaV2rEC4UFzE3SAGYRV8KDGYvs0TMXzAXK4Zqs07N55z2b
	rnkXQ8xcyXwxXWg3QhPhTADXw/2cAsWor8q8GcA7Z8WW0kubcsJZLGEcV9XBV5Wk
	zsIwQO7bvQm81v/vfs86CWOXSB+NdsJ+Gyr/TQ05O++cU4tkF3/D8YhIu2V0OzDd
	Sd8eahQL+I2lrm4+VYbLdK0ygT9He069rqMTv8MFCcAt5kux5fCsWaauxXpVYHEY
	6+sZzaAD0lHaWRtt+Hf4RK6Tz/XqIl6VA3+znZDhTg==
X-ME-Sender: <xms:kf6ZZmWU_PbJQR3DT3_HM2Att4-IkuNJrSdeqdBHGtA_0pHiWeETGg>
    <xme:kf6ZZikJ8MGbem-1L0fEqSL-AmwSW_krZ4N-5IP7seRnST753l4mHxBTO5PBQyegx
    x00uiaho4BxMg>
X-ME-Received: <xmr:kf6ZZqYUmzLwXDr8uZacg216lq8pgJORlkKJ2eiFH8ZZgvRfAdkuKSEla6C-GL4UI82WRuBVgCtuL1KeGlObu516U6bXoJ6CWP2Dag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:kf6ZZtVagCK46SaV9uYGmFeV-0LtW77C98rv5WHIKcjqOu6EmKsLKg>
    <xmx:kf6ZZgnP4bBTPCbfGPsFjxqo72PNxxaHL0oyxVFyjCoabz8zwU6JAg>
    <xmx:kf6ZZifZWVs4NOFzPiO8o-fKLS-maU2eCOPjWHFf0CRbcZD7VgllEA>
    <xmx:kf6ZZiER7BJohmcwR16M583bOw-cupaoIdlJAaojvv6jxnhVtowiRQ>
    <xmx:kv6ZZpc1bm201yCNR45ItpDcBJX3w1L8pp-8gP694ri2EDZlm9YK-8gc>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Jul 2024 01:50:09 -0400 (EDT)
Date: Fri, 19 Jul 2024 07:50:06 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the spmi tree
Message-ID: <2024071958-flaky-heaving-6637@gregkh>
References: <20240719134648.78e28600@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719134648.78e28600@canb.auug.org.au>

On Fri, Jul 19, 2024 at 01:46:48PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the char-misc tree as a different commit
> (but the same patch):
> 
>   41addb6b6044 ("spmi: add missing MODULE_DESCRIPTION() macros")

Should be fine, thanks!

greg k-h

