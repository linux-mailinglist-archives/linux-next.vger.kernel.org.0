Return-Path: <linux-next+bounces-472-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1A8194E6
	for <lists+linux-next@lfdr.de>; Wed, 20 Dec 2023 01:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0FC12874D0
	for <lists+linux-next@lfdr.de>; Wed, 20 Dec 2023 00:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD918BE7;
	Wed, 20 Dec 2023 00:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="by8jg+z7"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2D8BEB;
	Wed, 20 Dec 2023 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BB5DA7DA;
	Wed, 20 Dec 2023 00:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BB5DA7DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1703030579; bh=mI203P3YTS2g8KlJZr3ogvzfFLEeaLSImTizxEpDFYQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=by8jg+z7YbNuRtsxLjfaH0m7FfUuPb2n6RSW60HszKZEAPSDeSUkhghHsHTvXHgBr
	 +osI/qgcH7nCEkMNVaRBMZXTpLROS6CmnX8MPlLULlUnCfpPn7c8se5bRHUwM/utB7
	 TfLF3h96vJg4MnEnGKpIM6gwSErLyPc6X+hz3EqBkPSWznGcCzKO+FixkTFEctHF90
	 fKaPiA918Qc6GNhBqSUxV6hwRZrlFWPjpNF4BFcqdyn81BpJjOeRbjZkrSxDt+bHbb
	 ks/jp4bNB/tSB6mqB7U14BSce/bhI91R1oGnoouZi5MS0MMNGG53CMvH4/XwO5kLKh
	 4eretNHgjR1Gw==
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the jc_docs tree
In-Reply-To: <4cbcd213-55f9-4525-8be0-29db00a468d2@infradead.org>
References: <20231218182825.39a6562b@canb.auug.org.au>
 <87r0jjmw59.fsf@meer.lwn.net>
 <4cbcd213-55f9-4525-8be0-29db00a468d2@infradead.org>
Date: Tue, 19 Dec 2023 17:02:59 -0700
Message-ID: <87le9pg2q4.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> On 12/18/23 06:18, Jonathan Corbet wrote:
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> 
>>> Hi all,
>>>
>>> After merging the jc_docs tree, today's linux-next build (htmldocs)
>>> produced this warning:
>>>
>>> include/crypto/hash.h:248: warning: Excess struct member 'digestsize' description in 'shash_alg'
>>>
>>> and 636 new similar warnings :-(
>>>
>>> Exposed by commit
>>>
>>>   b77fdd6a48e6 ("scripts/kernel-doc: restore warning for Excess struct/union")
>>>
>>> I am not sure what we should do about this ... last Friday I only
>>> got about 18 lines of warnings.
>> 
>> The warnings were expected, of course.
>> 
>> The alternatives are to fix the docs or to revert b77fdd6a48e6,
>> pretending that all those kerneldoc errors don't actually exist.  The
>> fixes should be pretty easy to do (and there's far less of them than it
>> seems from the number of warnings).  I can't get there right away but if
>> nobody beats me to it I'll try to toss some patches together.
>
> Hi Jon,
>
> Attempt at a little coordination:
>
> It looks like you are working on some net-related patches for this.
> I am currently working on fs/ and kernel/ patches.

Oops...I did a few net ones now; they are all sent and I'm done for
today.

Thanks for working on these too!

jon

