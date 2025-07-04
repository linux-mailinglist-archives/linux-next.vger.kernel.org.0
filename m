Return-Path: <linux-next+bounces-7371-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95431AF9AE5
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 20:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E391C40300
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 18:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4256D1B4F08;
	Fri,  4 Jul 2025 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="XWURf2Eg"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC68F433B3;
	Fri,  4 Jul 2025 18:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751654995; cv=none; b=rvkqjJ45idb3IvJLSw/emZ6PvDusXLZpOcAmvXXCf0zyUmiyP6hBuvQycYgUfqNagtkxIoLckpYgzdOpsrBUxH4ZKKbLpO4IA8P8EzEvKGxf5dT/cgkqJIpcX0veD0ccAazEj6ZyOxWTxJlbmUo/RBDGzLEnbR7SNXizQuQBbr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751654995; c=relaxed/simple;
	bh=Xs5fDQ3j7KdRZFTzX4Jjd1hJO/4elrZ6jHbLtZh2Now=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZXpCifq0SIWiGZqMw9D8uk0vHWpfGq2wzrPFDf6+IorgtlgeobKA84+YyWA/aGce/2dsTDDKCTFLqd2zKVgRU8oxHDmCXxBCl7DUoTxYfYu70plvBLPL+l7iSFPwmudnNHeHcYByHIzfKcnZhN4d5cgLCHP/9xB6hECg3WZLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=XWURf2Eg; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=42XmKWmkZOBKqoppcAX7MLfKR1swd4WMG7QYpGY8LJo=; b=XWURf2EgT9RSMDqbX8m/Z6/qED
	AdAugS5J7nUAbyOKXGydPF9fipN9BGzfd3Oow+ZiOORFvIhblkdS88FshK7SB3AmBpje2spU1eOBx
	zoq3PKbVaUg2bv4plPwQCJdcGaZnNMtMAHk3oXHD/jePYGa5E6ka+kchbi0n8GAc+upoT6bffjDzI
	qKsgXprvqt9Jtv1JCKvYi1aLKblqsiP7NLQzo0soT3Q2reI0BXMz9ZUfFKVa5bUHtUjwhEF7/9i0f
	JvKXEUPPI7HQRWKo7rUcS6i9IxwpB9NAtk17EfdK3gglzsIUJFRvzqkWaLoyh+VMAN71BhYxMyGeC
	IVi3M9nQ==;
Received: from [179.100.5.63] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uXlTi-00CXk3-Hi; Fri, 04 Jul 2025 20:49:42 +0200
Message-ID: <73a84621-400e-41f8-b3a3-96499fc3320b@igalia.com>
Date: Fri, 4 Jul 2025 15:49:36 -0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/doc: Fix title underline for "Task
 information"
To: Raag Jadav <raag.jadav@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <aGggPuSCEK_opydS@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <aGggPuSCEK_opydS@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 04/07/2025 15:41, Raag Jadav escreveu:
> On Fri, Jun 27, 2025 at 02:17:13PM -0300, André Almeida wrote:
>> Fix the following warning:
>>
>> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
>>
>> Task information
>> --------------- [docutils]
>>
>> Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> v2: Add Reported-by tag
>> ---
>>   Documentation/gpu/drm-uapi.rst | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 263e5a97c080..10dea6a1f097 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
>>   complete wedging.
>>   
>>   Task information
>> ----------------
>> +----------------
>>   
>>   The information about which application (if any) was involved in the device
>>   wedging is useful for userspace if they want to notify the user about what
>> @@ -728,4 +728,4 @@ Stable uAPI events
>>   From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>>   
>>   .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> -   :doc: uAPI trace events
>> \ No newline at end of file
>> +   :doc: uAPI trace events
> 
> Unrelated change. Someone with a different editor added this and now
> your editor disagrees with it.
> 
> Switching to binary mode usually fixes the issue.
> 
> Raag

After fixing that, can I add your Reviewed-by:?

