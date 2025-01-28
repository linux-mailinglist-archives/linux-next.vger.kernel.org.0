Return-Path: <linux-next+bounces-5339-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB170A213D6
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 23:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E30787A14CE
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 22:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8F919ADA2;
	Tue, 28 Jan 2025 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hnFJ+1n/"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938237DA62;
	Tue, 28 Jan 2025 22:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738101809; cv=none; b=MXDUhK40EorA0g4XyZHW2RHfwVxfEC4HWkAvDrAtSYSV5px9fLSrVRsJMHjjb8vr+LwNbpb2yM4A43SYHC/cD0fUQbpAd66DwPfoOL1DMcJm3oQBR0/IdhaYx6c07px+gMUrFYpuSJh/uQ3+mL38H0xxP82UWbXT8b0ByyUf6sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738101809; c=relaxed/simple;
	bh=PJgp0lSdevMc1knIjUz75nQexXRPcNE7gf/emh38NUg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ucenEIBgYbkE+3bk8YNXolZJqGt7o6p54I3vvwYeIxV3xW02Lq3LyhyPh3ygj6p7OEzPFB4V43jtAHISimsK+634q7lv2K/7qGgn6zcNkeCbt18vdRlE7Co43gRGOpSdXslguebBATuy2BJXf5Q6HxCLRghTCw9MTaDTMnsdlcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hnFJ+1n/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 02068403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738101801; bh=pObLU3/odRsJRCQYcGtZUuqUMwEUOI04VzNwVrx1guk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hnFJ+1n/vIeFPrMA6MT8Mmd/oUgaD7lZhvdJg5jV2ie8RK1eCr3RinhGmuyowYWRP
	 /wOl3h3YWZ8T/ryAG9dq0v5jB5V1sD833s5xmm0k/UTD4KmqCPpFae1U3orLPpIYyg
	 kukfpuUhriZug3ZAzrHRvjZWbWR7vLMfyNrhF51IQjLvflXeKl252nhVrKSlbf7bXn
	 OY4T+4XKA2NiO3hctBvB98tjfPwLK12TAQbiHZL+ac2Dny9MfLcvbiFXfoLTkv79Y3
	 IoZGQyPch8T0Kmjx9uFDsVFp8DbhGCH7sVylkEHVv66uAdWpRrqzEKP82bH6YX8T+l
	 UTwS7aBhTuLsQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 02068403FA;
	Tue, 28 Jan 2025 22:03:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the jc_docs tree
In-Reply-To: <20250128114901.17b5b765@canb.auug.org.au>
References: <20250123120728.5fb6e1b4@canb.auug.org.au>
 <20250128114901.17b5b765@canb.auug.org.au>
Date: Tue, 28 Jan 2025 15:03:20 -0700
Message-ID: <87y0yu7g0n.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> On Thu, 23 Jan 2025 12:07:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the v4l-dvb tree got a conflict in:
>> 
>>   Documentation/admin-guide/media/ipu3.rst
>> 
>> between commit:
>> 
>>   3961fba7e1e9 ("media: ipu3.rst: Prune unreferenced footnotes")
>> 
>> from the jc_docs tree and commit:
>> 
>>   688c0a6907a7 ("media: Documentation: ipu3: Remove unused and obsolete references")
>> 
>> from the v4l-dvb tree.
>> 
>> I fixed it up (I just used the former - it added one more line) and can
>> carry the fix as necessary. This is now fixed as far as linux-next is
>> concerned, but any non trivial conflicts should be mentioned to your
>> upstream maintainer when your tree is submitted for merging.  You may
>> also want to consider cooperating with the maintainer of the conflicting
>> tree to minimise any particularly complex conflicts.
>
> This is now a conflict between the jc_docs tree and Linus' tree.

I'll just drop the offending patch on this side - its objective has been
achieved.

Thanks,

jon

