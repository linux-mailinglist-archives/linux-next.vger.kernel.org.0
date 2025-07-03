Return-Path: <linux-next+bounces-7330-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B88AAAF6F9E
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 12:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3691C4287C
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 10:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A59E2E03F6;
	Thu,  3 Jul 2025 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="IE8ca/pD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T9oIkjUK"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066F22D7809;
	Thu,  3 Jul 2025 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536994; cv=none; b=c2p07VLqZNyThNF8VxYiJSf5FRdrguxqvoEBu/sW8ll9TRpHBlFKRIbPfzX2OFdOrYlrE1ljNURnuJXIOuBub197snhufrjO+5nKn5sBmNMTVMGMMwNm8+qqJkYUqHP8+iRqBEwIpE3HWxfwlxTwvpJrFm5Y1e1EbQEIroZju8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536994; c=relaxed/simple;
	bh=7kCRXDbpJ/oqGsu45izE3VNuOcYKltui017jXi8ARqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGikQEaOmAhVcS8j6AjlWVS2lA34qxIkEkIxWAfhJCr2zvUxu7/1KjGPFA/QvtinpMfEcdnoaEXAJUWd0rUkBZd53Ywy69NY6p70pnkie34aJjcQvMN3ifTsBH1Dp/dVVk9G4Aif/JmnR1Nr0GUk+qbG1xuTMTFYDM2UVtdsk9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=IE8ca/pD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T9oIkjUK; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 2241FEC0255;
	Thu,  3 Jul 2025 06:03:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 03 Jul 2025 06:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1751536990; x=1751623390; bh=xZedJBIhB4
	0JxUdzvrw6oQggPvy34BJ3nOEDE2aNBtA=; b=IE8ca/pDdO2e0d3YwOeACzTB8u
	NwGvoZ5Pqmbq/CXrfW4SDkN0dm/aWxNqB9srm+M4R94uec024oLJQuMlSY+v3yLD
	LokAXoq7z1X5nZd9VMs6N0lAZNa//Dq0hYgZNnYNDx11Ci1u1nKs7/pGSbGuj4RF
	NiqYcAqP6kSZ9yJyQZUaKHQlc9FfUC96hC+8nv4rAAnN2Nxez6FZRSdjknq+GfAZ
	v1F4LcY6fl1qRvJCadiXiRU1OuUl7zqLBSr1IMM3CHA2cSJ4JQGBm1foOj8VtmqI
	Au+/m4y9WH45Erp2m8KARIkCMrdgYAxHonPrts7V16H5rl/N9GM/9Yp/27qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751536990; x=1751623390; bh=xZedJBIhB40JxUdzvrw6oQggPvy34BJ3nOE
	DE2aNBtA=; b=T9oIkjUKgtbOoS/WGssDKTwouvBU+PY716u6D0R+G6aiIWI8hZY
	AKb6w5YlTF8mo4+y6pXkNV68KEhN9izSA4zEfG/9n5aswDw83K/e5CzYD7FPetHj
	943oJNo4vNhlSAEs4cwe/zqmld2t/0ypJIiCvAMhTO9bleys5KDdwdVD+9CMXN/1
	y+jBI5lM+hFWwLCBdWd5ZcQ2xqgF+aeWzXCJwIM/Dow4NJJR2Rw3ahWO2EPp/7ys
	P/bEmPJ5zgiUw/QbMtVtUiEjlXefnTPwJbCOTZ34TAjjTIDzFMMKKVSOOyYfvK4M
	4WNlQAR0UuQG389Ie5BlFFRAGZ2d+4+mk0g==
X-ME-Sender: <xms:XVVmaJZAgYJzZ_Hs4E8vBeTwgcnPDO1Xy1K-6M3SCd7jrgXlI4xP7w>
    <xme:XVVmaAZgTZeHmlowLJV3l6UNo5Yi8Ef-2wkz4ScfbjbRIY6kme64PQK0xhOyjFP8u
    _EwzEvbpDhUmA>
X-ME-Received: <xmr:XVVmaL-eH6HyquGs0yXFPdTU5H-UevgwrgKExEZ0eYYr9cac0rtpnCvraAV_YLrzzqZZI0vKqV0udLSnvniqW48TjgP4RDM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevgeelgfeihe
    elheejjedtfeejgfdutddtieelvdetkeduvdfhfffhkefffefgteenucffohhmrghinhep
    fihikhhiphgvughirgdrohhrghdpuggrrhhinhhgfhhirhgvsggrlhhlrdhnvghtnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehk
    rhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheplhhiiihhihdrgihuseifihhnughrihhvvghrrdgtohhmpdhrtghpthht
    ohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheprghrnhguse
    grrhhnuggsrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:XVVmaHqdDUIhJ3ggUvKDBCRj4gKLTatvGohsn0uEXXQBXwBpsfbQvw>
    <xmx:XVVmaEptA5Clmi8j5LsTUZ2nijG5iqfW3DquJvDJ9m76_wazIIBOlg>
    <xmx:XVVmaNSgxNK8UjKk8SP3_xvn_n3RnAFbBTCXFsbNajnvol0zllO3TQ>
    <xmx:XVVmaMqDRPTt0pSznQC0uPg3oWKegrmzwexZVdsF9-21y4px8oYjNg>
    <xmx:XlVmaMGvmqeT2B9nI7K1OdqG1PmWXWNfb_PlqBCUlOTVfUvH_IfzSjr7>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 06:03:08 -0400 (EDT)
Date: Thu, 3 Jul 2025 12:03:07 +0200
From: Greg KH <greg@kroah.com>
To: "Xu, Lizhi" <Lizhi.Xu@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI0=?= =?utf-8?Q?=3A?= linux-next:
 build failure after merge of the char-misc tree
Message-ID: <2025070301-albatross-angriness-00c1@gregkh>
References: <20250703171021.0aee1482@canb.auug.org.au>
 <2025070335-situated-sloped-bc1c@gregkh>
 <BL1PR11MB5979E06DF496FA3965009DFF8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
 <2025070357-scrambled-exodus-a8a0@gregkh>
 <BL1PR11MB59798DB1C2D7B2B2988BE2DB8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR11MB59798DB1C2D7B2B2988BE2DB8643A@BL1PR11MB5979.namprd11.prod.outlook.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?


http://daringfireball.net/2007/07/on_top

On Thu, Jul 03, 2025 at 09:44:13AM +0000, Xu, Lizhi wrote:
> 
> Perhaps you can focus on "struct vmci_event_ctx", whose members have already clearly defined which are the payloads.

I do not understand this statement at all, sorry.

> On the other hand, the purpose of the patch is to prevent the data in "struct vmci_event_ctx" from being initialized before the datagram is sent, thus preventing the uninitialized data from leaking to user space.

Great, then do this properly, again, you are just "guessing" that there
is not going to be any padding between the structures.  Are you sure
there isn't?  How?  Where is that enforced in your patch?

thanks,

greg k-h

