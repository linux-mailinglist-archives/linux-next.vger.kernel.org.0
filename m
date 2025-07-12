Return-Path: <linux-next+bounces-7501-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3BB02C80
	for <lists+linux-next@lfdr.de>; Sat, 12 Jul 2025 21:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6311C22BA6
	for <lists+linux-next@lfdr.de>; Sat, 12 Jul 2025 19:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F0B21766A;
	Sat, 12 Jul 2025 19:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWjizx5l"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAFE111BF;
	Sat, 12 Jul 2025 19:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752346961; cv=none; b=c4adAat/oBhMrBME/9Cc6RlFFJkSZtCpOwKgggjvfovVGOc7DmYPInLWsynH1+lLNr4EWaVN4V8F/xG3g1EEXr5xKH7gel1gubthfr30HJwJrNrMAZ+8qZIM6vMbZZXa20jUNHguOO1yM4JdS5Ta60sf/gG5LpOR8RFeRP//wZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752346961; c=relaxed/simple;
	bh=LhsEIKj1SLsQCAk5TPT4MTfImsiSbwHmFcHOMwWmXc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuI37DV0HEHCgdJLe+RWLjBORbWcTqDgujSGka70k2xaTOAValP9H/SLx8RmBqtjFwGNiQ3K6g9O3UpaTOwBegWcXkhTK7pRDwqiB6Fl+eIqIOG9GWKiBY+d9M3UqpI/jrqwWqr8ZPjHn4SHRGBTAcJwPYrpB/ZOj3ZF6QpqTT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWjizx5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045A7C4CEEF;
	Sat, 12 Jul 2025 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752346960;
	bh=LhsEIKj1SLsQCAk5TPT4MTfImsiSbwHmFcHOMwWmXc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HWjizx5l0FEQT25bpugRRwK1iwSRYSUMnnEfumnnbKkrN1YDIHJFkE8VgedfrpLRH
	 dogoPSSvR5+vV2TXvrLEB3e+GRLCNQ5J+JnwTSnwYJBqhbSEYRUyhsWp25MUqYlCbp
	 QhS8oFlveZ5w9be6sF23N78x/sru3d5CnLo+5eZ3UF3HV6Eoy55hqAJ6v3lM9Qm1fs
	 ZULGTqqGmC3OckTk9IhfXYJ1NS25fOe0nTLMoH6ae2dEwnnL7Hx2m6cHXw9hryCOCa
	 r3C/mHyyAsrsfVhfUEaiXn/KIkEm3dVV0XDmhEo1XjZmYqCcRqVFr5uAQzdE1yshMW
	 H8COPV+f4FwFg==
Message-ID: <35f0dd7e-f4c1-4042-bc85-19d277f4b1f9@kernel.org>
Date: Sat, 12 Jul 2025 14:02:38 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 11
 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Samuel Zhang <guoqing.zhang@amd.com>, amd-gfx@lists.freedesktop.org
References: <20250711191014.12a64210@canb.auug.org.au>
 <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
 <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/12/25 3:11 AM, Rafael J. Wysocki wrote:
> On Fri, Jul 11, 2025 at 11:25 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>
>> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20250710:
>>>
>>
>> on x86_64, when
>> # CONFIG_SUSPEND is not set
>> # CONFIG_HIBERNATION is not set
>> # CONFIG_PM is not set
>>
>> ERROR: modpost: "pm_hibernate_is_recovering" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>
>> caused by commit
>> 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for normal hibernation")
>>
>> Rafael, is a stub appropriate for this case?
> 
> pm_hibernate_is_recovering() is not supposed to be called by code that
> does not depend on CONFIG_HIBERNATE_CALLBACKS, but a stub returning
> false would work for this.

Thanks, I just sent out a fix for this.

> 
> Mario, it would be good to fix this up in your tree.  Also, it would
> be good to expose stuff to 0-day build testing before letting it go
> into linux-next.  I use the bleeding-edge branch for this purpose.
> 
Honestly; I'm surprised that 0-day didn't raise this on either dri-devel 
or amd-gfx.  I had expected at least one of those lists to raise this 
over the last week of patches.

Anyone know the history why neither has 0-day?


