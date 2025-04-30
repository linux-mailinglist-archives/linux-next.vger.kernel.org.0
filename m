Return-Path: <linux-next+bounces-6475-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29AAA53FA
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 20:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A82244C5BC3
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 18:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7234266571;
	Wed, 30 Apr 2025 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b="jBqnjifU"
X-Original-To: linux-next@vger.kernel.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985618024;
	Wed, 30 Apr 2025 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.96.170.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038647; cv=none; b=YDc5/SNlXUmaqckAasg2D0w5kl+0Aq+jHFCL84JzNM0zdEaMI7v+YP+iIYharPnz2O4CYSJP5yKFho0FEzOsJ1Cfx+BKMTeInhNxHNeP/nlbnfeIAGCKKAFM23fX56HAWwWRa39TBCuz32eTt8jYnx1Kpedan7rv9dQxWX9ExxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038647; c=relaxed/simple;
	bh=/MSlxHXwD8ceEsyrqT+gc+tMqTVKtl/b+/SL15MFlk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ff6CdHD1Aii85RyJIHfYtNvuTuvWPfMRpxKs7j/D+F9dbmchBfjtCkB9d3Ll6nc+b62jJlHEP98HJY+sOC69e6UnTfF8G2Zj89yMVDM5ydeKPEAVqe4ArCAVUzdDJERBd+5o2KCGT79irTJ27bnVOhZQqiF71OpHK0yw0gtn2kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net; spf=pass smtp.mailfrom=rjwysocki.net; dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b=jBqnjifU; arc=none smtp.client-ip=79.96.170.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjwysocki.net
Received: from kreacher.localnet (unknown [217.114.34.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cloudserver094114.home.pl (Postfix) with ESMTPSA id CA2F766690D;
	Wed, 30 Apr 2025 20:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rjwysocki.net;
	s=dkim; t=1746038644;
	bh=/MSlxHXwD8ceEsyrqT+gc+tMqTVKtl/b+/SL15MFlk4=;
	h=From:Subject:Date;
	b=jBqnjifUracd292HVeQavKG5bzoUZyvvnM/32rvhe+jLN0Mjvfp6AIQZT+wPPpTUx
	 CajDOlny/medj5BBLG00ywOFXBPvus6wbpOKlbNUQouWXU3KHEdxZnY7VuCrxDMLQ+
	 FtPwEPGN7lPH0Ti8F2ncjGTXWzrLp8Zl2arl+TBkzF4NL69+hRvlVTNh/uL7IM455j
	 HMW5JBs4wBVKpwveq75Pij4DvJxwXrvuPGW3QwD6AZJJFRDtqREzOWrnIIcxu6E7Qq
	 mVC/UoR10z83dgQTj1DJ9LDTKqBlr9XF0RSU5VyzSti/L7lIfiZzI9fottsvwspmWS
	 54ktBO/SoKtnQ==
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Colin Ian King <colin.i.king@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pm tree
Date: Wed, 30 Apr 2025 20:44:03 +0200
Message-ID: <2229054.irdbgypaU6@rjwysocki.net>
In-Reply-To: <20250430085312.41d04946@canb.auug.org.au>
References: <20250430085312.41d04946@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 217.114.34.19
X-CLIENT-HOSTNAME: 217.114.34.19
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepvdffueeitdfgvddtudegueejtdffteetgeefkeffvdeftddttdeuhfegfedvjefhnecukfhppedvudejrdduudegrdefgedrudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddujedruddugedrfeegrdduledphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhjfiesrhhjfiihshhotghkihdrnhgvthdpnhgspghrtghpthhtohepgedprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegtohhlihhnrdhirdhkihhnghesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-DCC--Metrics: v370.home.net.pl 1024; Body=4 Fuz1=4 Fuz2=4

On Wednesday, April 30, 2025 12:53:12 AM CEST Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   b2f79c0b8352 ("ACPICA: Utilities: Fix spelling mistake "Incremement" -> "Increment"")
> 
> Fixes tag
> 
>   Fixes: a171306ed1a1 ("Reference count: add additional debugging details)
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: ff5340f8ac94 ("ACPICA: Reference count: add additional debugging details")

Yes, this is the commit that is fixed.

> Also, please keep all the commit message trailer tags together at the
> end of the commit message.

And it should be corrected now, thanks for the report!




