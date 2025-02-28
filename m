Return-Path: <linux-next+bounces-5616-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 566BCA49C54
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 15:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D61D18927F5
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 14:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A027026FDB6;
	Fri, 28 Feb 2025 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EnuqdeUC"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C518C31;
	Fri, 28 Feb 2025 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740753873; cv=none; b=SWzxVozcd5dTi/EVKkKYFyq62qBE9vAL7GI2ITtAN4tWtaYgeHWbjUs0ZdKMc9lRdwctdARm9e9SU+oLg5peLN+TRYWmn8bWw98+I00sw3OSy5Prx7OuLxlDwF53LJDcdxWwC7AgxBd7gWT+55R6xEE6RMSnd/Sbm+fuwAtBUYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740753873; c=relaxed/simple;
	bh=sYyt7j+W7NXI/q6IXsYFDTRUuvsWwtgjn1zujNIuo98=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fkZeALQVwJb33q3rKI/cQcpua5TzK77TJrBOpFEztwbLvStx6egs45k5p5Msvo6YZJ8at6WYeaKpcuWWWCdLTHKle4Buy8/vxoFOvD14KKVXZBsR///37+feT0hPeg1eMBjrP68PQ4MAqzu7cE5vzGxrTva4Qc2+Lrv32dQoVXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EnuqdeUC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 03987404E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1740753871; bh=EA0Rr524KbYfrmQCryy1Nl43xYiTId+OeKrvkwYK2fM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EnuqdeUCsIB9HgB+vj6QCQBfim/UNu5vpA6iyuMZvZKHKddXqIhjbyMvEf6trrNJq
	 HmtGUPBbAC7G5ny594wu+JCmUAQ+1/QNGmEW8OcjR0YzjPDdJF4v1oBVHLefa2bfdR
	 LqP3wJ9i0SaUMtNCaG1hapmnt1u34ugMwnGguUYta419Q+490X/5aLFyU0n1BqAc4U
	 ydAd9y6Xz1+wedvG7f6V8YWrOjV+P+vCS62bhL9JKJDEs69Txtl0lwmMmiU0NzSK9j
	 LICURgdJtTIZA6scTFG+QHn4LZ+yVQAKOvKiebD82uFgj/PaxJeTLaL/l8K7xCpGgA
	 mZWBfDfHPY8pQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 03987404E4;
	Fri, 28 Feb 2025 14:44:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Borislav Petkov <bp@alien8.de>
Cc: Shiju Jose <shiju.jose@huawei.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Tony Luck <tony.luck@intel.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the edac tree
In-Reply-To: <20250228103559.GAZ8GRj0xj6AKGVLj3@fat_crate.local>
References: <20250228185102.15842f8b@canb.auug.org.au>
 <af3e1e183b034ea89ed6582a5382e5c3@huawei.com>
 <20250228103559.GAZ8GRj0xj6AKGVLj3@fat_crate.local>
Date: Fri, 28 Feb 2025 07:44:30 -0700
Message-ID: <87jz9ann75.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Borislav Petkov <bp@alien8.de> writes:

> This branch is now public and immutable so you need to send real patches with
> commit messages which fix things ontop. But before you do...
>
>> diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
>> index b52ad5b969d4..ff4fe8c936c8 100644
>> --- a/Documentation/subsystem-apis.rst
>> +++ b/Documentation/subsystem-apis.rst
>> @@ -71,6 +71,7 @@ Other subsystems
>>  
>>     accounting/index
>>     cpu-freq/index
>> +   edac/index
>>     fpga/index
>>     i2c/index
>>     iio/index 
>> >
>> >--
>
> ... let's see what Jon says.
>
> Jon, ack?
>
> Is that the right place to put this in?

That will solve the problem for now, though that file is kind of a
dumping ground.  I'll clearly have to get back to my project of better
organizing the device docs...

Thanks,

jon

