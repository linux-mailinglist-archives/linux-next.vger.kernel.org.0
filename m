Return-Path: <linux-next+bounces-8599-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D8BE0C7E
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 23:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 874C1403CBA
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 21:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694D62C11D4;
	Wed, 15 Oct 2025 21:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="o8Nm57Vn"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1928D1DE2C9;
	Wed, 15 Oct 2025 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760563018; cv=none; b=mkA1IwCGft3tykczTFB+puOsS1npk+T709KX7mBwS0SZTHfWZ7GOnYLPQIcD4n3d6k9nlspC3FxRtkuZxdoHrO+kHaKb/cv38HGtJDNlw09yyW4xTOsDg23YPsbDpJ74Nu3OdT3YiDDd4CR1Y2/ar0fDpzAvlznDJwtIXH2eTpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760563018; c=relaxed/simple;
	bh=CdfQkhVfqZGBRCRc7/+iG2UgfM8iV3rC/pkJy2TaIPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ovoyh6JzKutqerRyF6twhB/duoq5NVrVsQnczSnvZUSeh+eu+eo4xi2faMMXGDV157XvBdLNU5kE16Cgng/rGY9e3LF5dLzJ62vCzsVgEEkh5YDdA5y81xQ1hfJ0EpC+ZNCDYTUpE9pEAnZdeMZ2iSh7/acPSzHDpl4Kr//YaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=o8Nm57Vn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=lT1MkkyKcvKrJNWhdEsmS/jaxhv8FHnr5JaYNcDRZ0Y=; b=o8Nm57VnnqTeyIu+5irACMZ30D
	yncyzoqTX2Wwq/Hxa/TRyftjCmvzm6MUhdbrbSzKy3V2+AC7q1MKL15+XkJH7kQNUfhC46DtDFd6c
	qsjXv8R59yPbGnHTZ3xCKZr8t1Cnqnd6EceKMwBpcjCvwrTZRsaVULOsB8mGdMgNRMkEHpAvayIH9
	A1ToLm5soYyCfqj9acJ28SzUuu/KZ+29PoHn7xvaId8a6XIWeU3dek4GDrX/RbjsoeDlqwHLU1/MW
	dUw/5C61JsEX6g4ria4DlTsUkOlzNY60bX/NqNoPgFoC1R2uaLQDdlbtrSN7oMyddrXCHYrC0suQ9
	tUhw6VHg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98rg-00000002vij-3AR2;
	Wed, 15 Oct 2025 21:16:56 +0000
Message-ID: <22e7918a-58f6-4451-a489-7aec4ab8d765@infradead.org>
Date: Wed, 15 Oct 2025 14:16:56 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs build problems
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Documentation <linux-doc@vger.kernel.org>, linux-next@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, broonie@kernel.org
References: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
 <87sefj7tom.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87sefj7tom.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/15/25 2:15 PM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Hi,
>>
>> I am back to having one former error and one former pair of warnings
>> on today's linux-next (20251015):
>>
>> ../Documentation/Makefile:71: warning: overriding recipe for target 'pdfdocs'
>> ../Documentation/Makefile:62: warning: ignoring old recipe for target 'pdfdocs'
>>   File "/usr/bin/sphinx-build", line 1
>>     ELF..
>> SyntaxError: source code cannot contain null bytes
>>
>>
>> Did something happen to the docs/docs-next tree or was there some kind
>> of mis-merge problem?
> 
> I pulled docs-next forward to -rc1 and merged a few things, but I
> wouldn't expect any of that to create that kind of problem.  It seems we
> lost the makefile fix somehow...?
> 
> jon

and sphinx-build-wrapper fix also.

-- 
~Randy


