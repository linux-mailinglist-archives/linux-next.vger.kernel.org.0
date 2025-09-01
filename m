Return-Path: <linux-next+bounces-8155-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB73B3E5DE
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 15:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EC83168645
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 13:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1722264BB;
	Mon,  1 Sep 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fSMGru78"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F9B18C031;
	Mon,  1 Sep 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756734333; cv=none; b=lAF3pCaCFbJALFF29ZEccVAXslxe789C0LSUtHDLC5c1sceJ7VwbHXRnsR39zBWfBpciK1lS9s5IURBFOD2/7YeZilTDRcjKnSTLY9k9ip4wDyOc0xJnZSx3eSb+B0erlP5MuFjrkBoioecsCZUxHLfzMd6x2JgmDgaOfkP3bkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756734333; c=relaxed/simple;
	bh=puWX9n0DjwaPFG2uC2QdXCWrl8q3UKV3n4bTHIFgaFA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jnPax453CpxEO/TcUDGG7IgUZS64tWBZlNFIc2B6ctN4Rvys4hiBl2pHf8F2Ui9EA3aPl6+jXXdKJp5dNB99TIxpbO5zJBJGMujj7JwNcMerjrsGxDtCyJr0esU5c53l28M/sF+4xMUa3+MnOfOrqO//XbMWBrHWscTHZbiZlpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fSMGru78; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 95F3740B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756733881; bh=7Sb+3G+1iZahVE9c4/KBcvPNCWMGur9xHaVJsOgxLLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fSMGru78/QFpc95Ei6rnFyK4TeC/s4vs7XX3tnVK0zgJqqCBD16BUTm5K45yEKmTE
	 l1dlMy0NiMFcRpTW9D1aaeUiCNlZs3HFxPuDgY94Y+eh0BDG7d6fk5kNMnUZ7xXao6
	 U45fTFKm3xi4SqRgWeH2tYEM1jxJJhoahMf4gYj4a/JuCcIGbqSobthF4bWaMw51Bh
	 dGVzTL128v3Yw//XthqMJqoWtIKLjO4QbeznRZlQRVkIwnVp6FQIdjgoOFwd5/5aij
	 ff9orHdowWqhIRY/79ECDi9mksZ+iNHUgL6uGzSLVhzyEcOWLtfEjstn7AN5cA1/dr
	 Guyr2jqpcahQQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 95F3740B01;
	Mon,  1 Sep 2025 13:38:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the jc_docs tree
In-Reply-To: <20250901152330.0b64e07a@foz.lan>
References: <20250901142639.4de35a11@canb.auug.org.au>
 <20250901152330.0b64e07a@foz.lan>
Date: Mon, 01 Sep 2025 07:38:00 -0600
Message-ID: <87v7m2z41z.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Mon, 1 Sep 2025 14:26:39 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
>
>> Hi all,
>> 
>> After merging the jc_docs tree, today's linux-next build (htmldocs)
>> failed like this:
>> 
>> $ make O="$HOME/htmldocs/htmldocs" htmldocs
>> make[1]: Entering directory '/home/sfr/htmldocs/htmldocs'
>> Python version: 3.13.7
>> Docutils version: 0.21.2
>> Using alabaster theme
>> Using Python kernel-doc
>> 
>> Sphinx parallel build error:
>> FileNotFoundError: [Errno 2] No such file or directory: '/home/sfr/htmldocs/htmldocs/include/uapi/linux/videodev2.h'
>> make[3]: *** [/home/sfr/kernels/next/next/Documentation/Makefile:109: htmldocs] Error 2
>> 
>> Presumably caused by commit
>> 
>>   8a298579cdfc ("scripts: sphinx-build-wrapper: get rid of uapi/media Makefile")
>> 
>> I have reverted commits
>> 
>>   aebcc3009ed5 ("docs: sphinx: drop parse-headers.pl")
>>   8a298579cdfc ("scripts: sphinx-build-wrapper: get rid of uapi/media Makefile")
>> 
>> for today.
>
> Thanks for reporting it!
>
> Just sent a fix:
>
> https://lore.kernel.org/all/da91980ce42f31730dc982920167b2757b9d2769.1756732363.git.mchehab+huawei@kernel.org/

Just applied it, thanks.

jon

