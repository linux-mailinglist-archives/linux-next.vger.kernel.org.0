Return-Path: <linux-next+bounces-6854-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD4CABDF8F
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 17:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66C117A514
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 15:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF5A252299;
	Tue, 20 May 2025 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dJdR1l0I"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03525255E34;
	Tue, 20 May 2025 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756116; cv=none; b=WV9DR8C4CX1jbHfCvfragHNEVDX8OJ8KhmMWixWeAJJqq/LloZ9G+FRaZJlYLtgvFdEqUOu+1q+IY+MBrmeP1m1obN40AiII3v/I5mXOISPmj/2BXIcb64Az4Dvfdobb7xp1JAsHVTpHljWUt17mHSedZU7B3JzNXiXcD+UYAwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756116; c=relaxed/simple;
	bh=LzI32Ca+VsQAGk7XX4prPR9QgOiycMsvL+zoP5hvH5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t3YSoD/1e5vYEuJorWnkeEhP53r86Iyxg7WNODLa2CH400vrvJwKIlyF1x6XJ2FEpAP0TdFT2lPQws2IiCzBm8BHBicJp+j/P1vuX6Cyx155GhLc2+Xh9uBfK3KVX2UFyk6kTsrd3tI3oPtHqU+7Mfc56D8OMLkrapZkk5/tB20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dJdR1l0I; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FQHcViEknIoIquspkS9lfvaNETr2qQ+5EKSi0ZIJdTQ=; b=dJdR1l0I9MGq/ZkaO01gmJiXMc
	tx//pXHYAyqKqKcNPNr0GWoaGdvRB+4nZOJ8hLHk58m4QJ7R+S0VOGUfykF4f62SFsLAdkqsr7kHA
	OSlg7pKwCFRh8nVJIb4Y9qbAUgj3C9Kg64J+ELqOLFJCZ3gLA1VhBl2RPxaQDE3sDGog95gbLRHrH
	AOgd/CnxxHcyYvT1Iokv2qoa57ARAqmX3I+UqbczKfBSuVGCLKYmX0RdsiRddc5VFfz5kPA8251DN
	oXhQ4D8th2pYwqQECUiT3OsBx7+sKcS18gkZBeaQjpzs4+Nrge3tnIW5fXOzWR/huyjSG9aBKO2VH
	BGfYr1zA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHPCd-00000000nC7-2Is3;
	Tue, 20 May 2025 15:48:28 +0000
Message-ID: <e88870bf-b232-4fdf-816a-32128d3791f8@infradead.org>
Date: Tue, 20 May 2025 08:48:24 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 16 (security/landlock/ruleset.c)
To: =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 Kees Cook <kees@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org, =?UTF-8?Q?G=C3=BCnther_Noack?=
 <gnoack@google.com>
References: <20250516202417.31b13d13@canb.auug.org.au>
 <e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org>
 <20250519.jiveise8Rau8@digikod.net> <202505191117.C094A90F88@keescook>
 <20250519.ba8eoZu3XaeJ@digikod.net> <202505191212.61EE1AE80@keescook>
 <20250520.uof4li6vac3I@digikod.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250520.uof4li6vac3I@digikod.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/20/25 7:45 AM, Mickaël Salaün wrote:
> On Mon, May 19, 2025 at 12:15:30PM -0700, Kees Cook wrote:
>> On Mon, May 19, 2025 at 08:41:17PM +0200, Mickaël Salaün wrote:
>>> On Mon, May 19, 2025 at 11:19:53AM -0700, Kees Cook wrote:
>>>> On Mon, May 19, 2025 at 05:29:30PM +0200, Mickaël Salaün wrote:
>>>>> On Fri, May 16, 2025 at 07:54:14PM -0700, Randy Dunlap wrote:
>>>>>>
>>>>>>
>>>>>> On 5/16/25 3:24 AM, Stephen Rothwell wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> Changes since 20250515:
>>>>>
>>>>> Thanks for the report.
>>>>>
>>>>> It is the same warning as reported here:
>>>>> https://lore.kernel.org/all/202501040747.S3LYfvYq-lkp@intel.com/
>>>>>

[snip]

>>>
>>>>
>>>>
>>>> I'll take a look at ways to make either the overflow macros or memcpy
>>>> robust against this kind of weirdness...
>>>
>>> Thanks!
>>
>> I'm doing some build testing, but the below patch makes GCC happy.
>> Alternatively we could make CONFIG_PROFILE_ALL_BRANCHES=y depend on
>> CONFIG_FORTIFY_SOURCE=y ...
>>
>>
>> From 6fbf66fdfd0a7dac809b77faafdd72c60112bb8d Mon Sep 17 00:00:00 2001
>> From: Kees Cook <kees@kernel.org>
>> Date: Mon, 19 May 2025 11:52:06 -0700
>> Subject: [PATCH] string.h: Provide basic sanity checks for fallback memcpy()
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> Instead of defining memcpy() in terms of __builtin_memcpy() deep
>> in arch/x86/include/asm/string_32.h, notice that it is needed up in
>> the general string.h, as done with other common C String APIs. This
>> allows us to add basic sanity checking for pathological "size"
>> arguments to memcpy(). Besides the run-time checking benefit, this
>> avoids GCC trying to be very smart about value range tracking[1] when
>> CONFIG_PROFILE_ALL_BRANCHES=y but FORTIFY_SOURCE=n.
> 
> It works for me but I couldn't reproduce the issue.  I tried with
> CONFIG_PROFILE_ALL_BRANCHES=y and CONFIG_FORTIFY_SOURCE=n but it always
> works without a warning.  I'm using GCC 15.  Is it specific to a version
> of GCC?

I dunno. I'm using GCC 14.2.1.

-- 
~Randy


