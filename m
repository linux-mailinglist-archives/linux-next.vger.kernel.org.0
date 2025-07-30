Return-Path: <linux-next+bounces-7781-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A084B16372
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 17:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8866A189849F
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 15:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83F8277036;
	Wed, 30 Jul 2025 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aLKsDrfg"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C012DC345;
	Wed, 30 Jul 2025 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753888455; cv=none; b=IjJjU2b2Z1fClvXStYweK6E7f3IpU6eCFjXkye3wc2/nO+kaF9J1wtcmjqL5RJMxa+OX7iMgukDLi4AsiQkAfURhQ781PqD9JwRoEFfW6WCK1haLG2CK5npz7EbiDU5bwYSF4XKMydLZlN4kwKq8vTCsMvT6tNm75RqlEtZO1S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753888455; c=relaxed/simple;
	bh=rXgxOJXKazwcCCy2Fo+fCW58qMIKsjE4k03ekkUv2ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3YTxfUCRsW1T7Qrb4k7T1egcLbMYP+3bx5UkWTjqW7ou6wYQsXU344oVZ4tBweVOPbe4rBn93SfLD1GjU7K7BN0uVN5HuM0cwlfL+ZIw9r7/82/EsuIic4+TLeOpDRrAWnozZSSrzkD20dhnthbArPsDDta11ru7FyciGxFHR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aLKsDrfg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=m+oXDpSbXkFh02pwXQyjxgNWqMEN7+TwK51jzavy4dI=; b=aLKsDrfgV3sov/S+dwotba19Rr
	NSv7IwEYsciotk4atSDJHXMTBFeSjc3JdOf5RA3qyzMIZ0kQYfUtDNlTPtzZoUlQ2W4f7NhMnY00A
	6Rcip4sjW0bCZBtxgXIlU4AbJta+AERHElD/pHf4ndlnYATDk4QBpVjwEDiY8oSwROZRydRu3yaTb
	dzXbcwVOvxMOSzQptRDj/mFimyhWizXZ7ez9UtCfeHBZVK0ZsuKO+fccFFNGrPAa5htWjgciTKp+Q
	jEcZlLepI7SKxc5DVbO2only1mreG1D+Kde/Xbnhnbsjz1JURzGwm5waVYXMcr6T/S2cyQwQiodho
	GIrMrxyQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8VK-00000001pES-3Y92;
	Wed, 30 Jul 2025 15:14:06 +0000
Message-ID: <7cedcdd9-c89e-4194-98ad-d3426a240863@infradead.org>
Date: Wed, 30 Jul 2025 08:14:05 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the jc_docs tree
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Vishal Parmar <vishistriker@gmail.com>,
 Brigham Campbell <me@brighamcampbell.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250730102931.6334022c@canb.auug.org.au>
 <87cy9hx272.fsf@trenco.lwn.net>
 <f10f6457-1a19-47cf-86d1-eb787badd6dd@csgroup.eu>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f10f6457-1a19-47cf-86d1-eb787badd6dd@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/30/25 7:30 AM, Christophe Leroy wrote:
> 
> 
> Le 30/07/2025 à 15:01, Jonathan Corbet a écrit :
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>>
>>> Hi all,
>>>
>>> After merging the jc_docs tree, today's linux-next build (htmldocs)
>>> produced this warning:
>>>
>>> Documentation/arch/powerpc/index.rst:7: WARNING: duplicated entry found in toctree: arch/powerpc/htm
>>>
>>> Introduced by commit
>>>
>>>    c361f76da696 ("docs: powerpc: Add htm.rst to table of contents")
>>>
>>> interacting with commit
>>>
>>>    19122a7c28ed ("docs: powerpc: add htm.rst to toctree")
>>>
>>> from the powerpc tree.
>>
>> Did that just get added there?  I've had that fix since early June...I'd
>> rather not drop it (and have to redo my 6.17 pull request) now if
>> possible...
>>
> 
> There was a ping from Randy about it recently so that Maddy added it the powerpc tree, see https://lore.kernel.org/all/5ac25ceb-023d-409d-8e7e-014d010c5028@infradead.org/

IDK. Maybe the patch that I replied to there was made against mainline instead of linux-next.
I should have checked linux-next.

-- 
~Randy


