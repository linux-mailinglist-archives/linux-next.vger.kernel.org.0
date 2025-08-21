Return-Path: <linux-next+bounces-8064-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD62B2F97E
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 15:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBA691CE77F9
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 13:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06550322542;
	Thu, 21 Aug 2025 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="lvbHXQzS"
X-Original-To: linux-next@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CED31B125;
	Thu, 21 Aug 2025 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781258; cv=none; b=LKHWie91visRyPu93830dquDoBuYOUbf10RM1DenSLh5CBYYbma7QIffOpdIDrJ5vz44RldXMhEuNKt70QsYBXj1HqYzV/jj4xTULvfAV4evAKI3M6m+g6nKi2ChQBYk2NVJ7DDA2/y46Kvma8yYwQ6tF0xkzfE7Albk84UXBBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781258; c=relaxed/simple;
	bh=9ba2oWdy2gFANZnPfwMrc2CW+QoDwkc3CcxG+upH78c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IL86YCO8fe1dKAzwou/peOGW5UYvuvXB1jF9An6nBvWnKHcnlOioNLL9TEwKmQloi8x0qHrAQA0hEHo+uHAmG3va3gQh80WUvJ+WqdicnVuIjF2ziQ+CNnSBIfPTr77hgRDuNLvMKnVMihc9/6ZcKTV31ytWHrkGykroQSyPwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=lvbHXQzS; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=7avwWKz/EvLYc1vieGzvYJzHL8jXYfFoIMoY/fbsTGs=; t=1755781256;
	x=1756213256; b=lvbHXQzSFthjwJ1cPKeLQxfYSWhS+n2PArM+gnLsEmjkNkQnRK7qSH1NGIeSe
	9S6WP1ce5tHYxbqz9K2jUEOSKgZCzXHe6fyJOMweH3/VV8gVa1mzwTpp0jqo5g2dT7/mIDP7Sig0N
	U3YX/2npr2S1b4I8tSPbNKIrEMgq+J/meA0HtWr0EhL26w2xbfmByOs+MI25YEMRXZRj3m8ECyPrF
	cCsH7U2/+rVTxA+SPMb1uwPrXOclWHNLIu/xQ5qL38i15Jmq8FUwgk6jkPQwhLFDdOJX3VpIkKKeJ
	p33Vg0X2lR9LfPeZQkFpJ0H1OpHjWYE7mWl/+wb57Y1JWoloJA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1up4uR-009Md5-1Z;
	Thu, 21 Aug 2025 15:00:51 +0200
Message-ID: <ddbf8e90-3fbb-4747-8e45-c931a0f02935@leemhuis.info>
Date: Thu, 21 Aug 2025 15:00:50 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 3/5] binder: introduce transaction reports via netlink
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlos Llamas <cmllamas@google.com>
Cc: Li Li <dualli@google.com>, Tiffany Yang <ynaffit@google.com>,
 John Stultz <jstultz@google.com>, Shai Barack <shayba@google.com>,
 =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Joel Fernandes <joelagnelf@nvidia.com>, Todd Kjos <tkjos@android.com>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Donald Hunter <donald.hunter@gmail.com>,
 Christian Brauner <brauner@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
 Martijn Coenen <maco@android.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Alice Ryhl <aliceryhl@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
References: <20250727182932.2499194-1-cmllamas@google.com>
 <20250727182932.2499194-4-cmllamas@google.com>
 <e21744a4-0155-40ec-b8c1-d81b14107c9f@leemhuis.info>
 <2025082145-crabmeat-ounce-e71f@gregkh>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <2025082145-crabmeat-ounce-e71f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1755781256;d8b16d85;
X-HE-SMSGID: 1up4uR-009Md5-1Z

On 21.08.25 14:19, Greg Kroah-Hartman wrote:
> On Thu, Aug 21, 2025 at 10:49:09AM +0200, Thorsten Leemhuis wrote:
>> On 27.07.25 20:29, Carlos Llamas wrote:
>>> From: Li Li <dualli@google.com>
>>>
>>> Introduce a generic netlink multicast event to report binder transaction
>>> failures to userspace. This allows subscribers to monitor these events
>>> and take appropriate actions, such as stopping a misbehaving application
>>> that is spamming a service with huge amount of transactions.
>>>
>>> The multicast event contains full details of the failed transactions,
>>> including the sender/target PIDs, payload size and specific error code.
>>> This interface is defined using a YAML spec, from which the UAPI and
>>> kernel headers and source are auto-generated.
>>
>> It seems to me like this patch (which showed up in -next today after
>> Greg merged it) caused a build error for me in my daily -next builds
>> for Fedora when building tools/net/ynl:
>>
>> """
>> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
>> gcc -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow   -c -MMD -c -o ynl.o ynl.c
>>         AR ynl.a
>> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
>> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
>>         GEN binder-user.c
>> Traceback (most recent call last):
>>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3673, in <module>
>>     main()
>>     ~~~~^^
>>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3382, in main
>>     parsed = Family(args.spec, exclude_ops)
>>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 1205, in __init__
>>     super().__init__(file_name, exclude_ops=exclude_ops)
>>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/pyynl/lib/nlspec.py", line 462, in __init__
>>     jsonschema.validate(self.yaml, schema)
>>     ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^
>>   File "/usr/lib/python3.13/site-packages/jsonschema/validators.py", line 1307, in validate
>>     raise error
>> jsonschema.exceptions.ValidationError: 'from_pid' does not match '^[0-9a-z-]+$'
>>
>> Failed validating 'pattern' in schema['properties']['attribute-sets']['items']['properties']['attributes']['items']['properties']['name']:
>>     {'pattern': '^[0-9a-z-]+$', 'type': 'string'}
>>
>> On instance['attribute-sets'][0]['attributes'][2]['name']:
>>     'from_pid'
>> make[1]: *** [Makefile:48: binder-user.c] Error 1
>> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
>> make: *** [Makefile:25: generated] Error 2
>> """
> 
> Odd, this works for me.

Hmmm, happened on various Fedora releases and archs in Fedora's coprs
buildsys for me today. And with a local Fedora 41 x86_64 install, too;
in the latter case (just verified) both when checking out next-20250821
and 63740349eba78f ("binder: introduce transaction reports via netlink")
from -next.

> How exactly are you building this?

Just "cd tools/net/ynl; make".

Ciao, Thorsten

