Return-Path: <linux-next+bounces-7491-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E18B01E5D
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 15:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACA6A3AC2E6
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 13:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD7A2D949C;
	Fri, 11 Jul 2025 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fsIEixqa"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D622C1591;
	Fri, 11 Jul 2025 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241954; cv=none; b=Y4m/PxGctd+xkQYVZIPyPdcPf56GPu2o4BJEDrKcSwYZ8b6LLSTt2/zduUQODWNWMAPycldlrCAyGlaArEV/6Y67jB3eoRfZ65A/gW1W7aUeRvtunSp/tn+ukaXunGILIJ3LKJDhcQnA2ccCehIoeQtMHkwj14HdotG+92soYUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241954; c=relaxed/simple;
	bh=A1NvIf/cMI2/G4TKe3ep1TdVHeGeSrv+LOvqtuE0iXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sivHEbu/1IGGQOva6k+YmKuVdf7bKMFPYxpK1F2kVIuk6/AHIpO+TX4q3zucYA6MmJYdNnSpk9MYUa7z2R9xkb4/CNEmzVuhjfMO82H/uemTsV2oOcgjE7Vn8/BH3hjk29/1HCKlzaOfTL6tt3KGgWDRlH2bCa94WBTHcYgyVdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fsIEixqa; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NKqIfuyJtyGfR0SZJka2+dpyfUI6TQBVPgy996gWC+c=; b=fsIEixqa0w/XhKgEDC/043kktZ
	Rsir7dCoHDJRddE2cen9wi1FWgKWOs7rFRlKrUQJFG+9//6yvvpPw2z8spwsSRnXtNhzFyaqgnzql
	TU4LqW0GKCOmO9E49qHr1yeFhxPWW05b6wldcXs8Xn42rC566RrGo1evIF7QQz9waXHQWRls3Bk8Z
	xVsB+sEj9g3L5hvGp+lKHLun4MAYGNV07t6sVoOhLYy63QFMMUQUUDd7Mz97Aw8KQG6QKVgAv9Cbo
	g6PzhJkuoL4ZfssgUNMWA0Mh0eTNnxitGLiCGNROVSz2iOxFvnTVm7V1rw0u4SlvH7e3yJuniRygW
	/pu93vpA==;
Received: from [179.118.186.174] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uaEAk-00FOet-V4; Fri, 11 Jul 2025 15:52:19 +0200
Message-ID: <018a61b2-a5d9-422e-b0a6-890d584d83dd@igalia.com>
Date: Fri, 11 Jul 2025 10:52:14 -0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/doc: Fix title underline for "Task
 information"
To: Raag Jadav <raag.jadav@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <08de556b-e63c-420e-8ab4-c03712be9709@igalia.com>
 <aHA33ispT8V6GUhn@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <aHA33ispT8V6GUhn@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 10/07/2025 18:59, Raag Jadav escreveu:
> On Thu, Jul 10, 2025 at 06:27:45PM -0300, André Almeida wrote:
>> Em 04/07/2025 16:07, André Almeida escreveu:
>>> Fix the following warning:
>>>
>>> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
>>>
>>> Task information
>>> --------------- [docutils]
>>>
>>
>> This series is now merged at drm-misc-next, thanks!
> 
> Shouldn't this be drm-misc-fixes?
> 

The commits that those patches fixes can't be found on drm-misc-fixes as 
it's now, so I thought I should merge it at drm-misc-next.

> Also, this series continues to not land in my inbox. This is why I use raw
> emails in my sendmail automation.
> 
> Raag


