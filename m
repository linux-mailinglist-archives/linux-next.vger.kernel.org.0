Return-Path: <linux-next+bounces-7327-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B69AF6EA4
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 11:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F3F11C801EC
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 09:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B122D0C70;
	Thu,  3 Jul 2025 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="YEni38Zp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KusjADoi"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616D72D63F1;
	Thu,  3 Jul 2025 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534928; cv=none; b=WAseU+dz8xjTvn2gvb1kd+KUQNvGiv5O/q4GQr1S+o3+oIIBh4FHetI5kJnvdNR+migHq+A8Burs+sfD91UvIL7TkmhVAVZYpSHW6ZsR+vfaWRvmPMKeP7CbiFAHGO9VdqbqqfLHRk4OzQWvHLRHZiQHpgCEQ09M+IhZnsHpwzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534928; c=relaxed/simple;
	bh=0FcmFPjtKiITMHXxIG7e8C0g5vzXq3RBzJ9AtYZn7UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzkcFgetG0AhAn+7UwElYbPBtLrnqRGSJPZqZQXKutqVd9GBDKSWX/OnhqI80M2dDN5rQ16fm52Qhx0SCu5wYfziqvfRZw80ENFR50TvJsLxpJdACrbgTWMpkvX9T8383ndtOBjBvA+PhE2OlpvpaHvHxGujz3eJK4tJP6zLLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=YEni38Zp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KusjADoi; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 61C9F1400210;
	Thu,  3 Jul 2025 05:28:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 03 Jul 2025 05:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1751534925; x=1751621325; bh=HCW1retZaq
	NyCi0h0VBm4JZiyZFqspKMG63sAn1ILro=; b=YEni38ZpRq7Pp8sLTcSWJjFn5q
	EL2pxn/qTQOcyY9rubrENcjBRvf9/wUm5XB2QNSRI3eF14jaJWgV2XRY15uG164Z
	eeUIxy3UFB2JP38CaP0v3l2Mwy8qg787D1CRfzY9uZaW5FYXbz48w3LqDhdr1QAP
	/jcz0BdoSe9qBsCUXOYsbe+HWeSm3da6WLxlhmgRO0j6SWAtUoOX4AnDhrh4keYT
	uI+6zRnoU62cHM8+CTlToqAVutTu+m2h47IAhw2u1VyUz546LC7rHqdLwE/Y0+cP
	RPw5m0dTfDQ6xCxiXGSDhztjTJaX72xupuvpMWk2RJB77uJVrCslkEBpiB1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751534925; x=1751621325; bh=HCW1retZaqNyCi0h0VBm4JZiyZFqspKMG63
	sAn1ILro=; b=KusjADoi2s6s3+CqTfv6ccoz2ZTP453BSdzqzwUsfXx06WOL9is
	dbTk08uK4wwjBC68taAMOtz3j4GpCq6ZCsiDvVrT6h/v0aTT8B3miJ7THJpFHio/
	tA+rOfADqka000QVb5TxLm0EFAqFkan4rE5+e1n6+YFaQDRcAETliXU2kEt//fEx
	J/AmH19eWrbsmW+1s2eVmEGYARyGPa5WFPzAm2sh/YvkgIVa+/lwROoGpZ4ReztA
	IHIK0DeRCUVO6YOnn1RxsytQZzDZ982wvLNycDgcOVVTVg2+8sjnr2wXLa2+GGjA
	AYpYOIVZXZey+rqJpyxdNTzr/YyPI1A5dwQ==
X-ME-Sender: <xms:TE1maLvGq0Sk6UBp5Mkn_yCy-rFLIOx5sXQ87ZziRZR_xhFHoFNbrg>
    <xme:TE1maMe7CTgC4alQFU39KkvYlHe8cdzX4yBJV5nm0X3UMrkwV47b9LIIc-us9Bht5
    024ryeqR6V72w>
X-ME-Received: <xmr:TE1maOwVrj9vJ0W0EjeiAWcWRMfi86VKhGeKvKMTZpGWtRlO8nJWUNEoMJlbriQB1Ufm8K2UiqrccXx2CC8OEmL21nPNamQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegheeuhefgtd
    eluddtleekfeegjeetgeeikeehfeduieffvddufeefleevtddtvdenucffohhmrghinhep
    khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhiiihhihdrgihuseifihhnughrih
    hvvghrrdgtohhmpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghu
    pdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:TE1maKPJRKe9SXjmBZo95wW22U2-6ONCGOB5_nIY4mpcgX5lP0GFSA>
    <xmx:TE1maL8Q-n3w4-63mUPObn1HzM21GUUVfvn2OEU9CAV8XBW9-5qy7Q>
    <xmx:TE1maKVXf-FZbpMW6xTrEhpCLm0VblyYwXOKTUaJFs-0xgP5_2j0qg>
    <xmx:TE1maMcgsMAdu32459OYvkU_rm1CWK8sRg_KG2a-TY0z_TJJSBHFxw>
    <xmx:TU1maDZQMi5z97Ri9A6WcK3JfKbBcFmV78FP7cuVN1vRtOy1JlIsUgm7>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 05:28:44 -0400 (EDT)
Date: Thu, 3 Jul 2025 11:28:42 +0200
From: Greg KH <greg@kroah.com>
To: "Xu, Lizhi" <Lizhi.Xu@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?= linux-next: build failure
 after merge of the char-misc tree
Message-ID: <2025070357-scrambled-exodus-a8a0@gregkh>
References: <20250703171021.0aee1482@canb.auug.org.au>
 <2025070335-situated-sloped-bc1c@gregkh>
 <BL1PR11MB5979E06DF496FA3965009DFF8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR11MB5979E06DF496FA3965009DFF8643A@BL1PR11MB5979.namprd11.prod.outlook.com>

On Thu, Jul 03, 2025 at 08:55:31AM +0000, Xu, Lizhi wrote:
> Greg, 
> 
> In ctx_fire_notification(), the following code can fully prove that the header is followed by the payload.
> ev.msg.hdr.payload_size = sizeof(ev) - sizeof(ev.msg.hdr);
> 
> I sent a second version of the patch, did you notice it? It can solve the problem reported by Stephen Rothwell.
> 
> V2 Patch: https://lore.kernel.org/all/20250703075334.856445-1-lizhi.xu@windriver.com

I see that now, thank you.

But, if I had not reverted your previous one, that patch would not have
applied :(

Also, how can you "guarantee" that there is no padding between those
structure fields so that your "pointer math" is correct here?  Why not
fix this up properly to use the correct way to define that you have a
"payload" at the end of a structure, AND properly define how large that
payload is with the specific variable that describes that?  By doing
that, then the compiler can check when things violate those rules going
forward.

thanks,

greg k-h

