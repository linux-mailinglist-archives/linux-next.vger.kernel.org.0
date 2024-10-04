Return-Path: <linux-next+bounces-4096-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1471F98FC8A
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 05:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF19D1F231F8
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 03:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD7F4644E;
	Fri,  4 Oct 2024 03:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="chNUpk9E"
X-Original-To: linux-next@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162F98C1A
	for <linux-next@vger.kernel.org>; Fri,  4 Oct 2024 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728012968; cv=none; b=scQGRtrMS4gk1+5m1czHupMKijdhcOg/pQv01KkTFhHysO/aIVVfbdaHb4C8iwPjN7g/wOg3C6EIQ820u+UkB00+D5z+IPcixJx7QzkdvTvZu2Jy0wrGAjqEdwQZfUauL0EQujKnszcigjluWqUrQ3hYJhYgRHDIwVoaR3hoZmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728012968; c=relaxed/simple;
	bh=HI5Wqpc+qhv03Z5ZRig6bMZhU70UUhOAXVLBL2CkJnc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=QT8mrLsFhFKBjG3GLojoJq8Jll47HlSU4QotW1/kHvvVlWyEt3GA/V4H+BzspSV4sLilAswvFrft2Ax8xtSkrhl24RXfno2nSxViHyCtQzI07JdaAb+hJ+on9t9z1Prk06in/KkxCj1WZawgK1UeOEajhPUpXjsnvmFz50/7LL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=chNUpk9E; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [10.137.106.151] (unknown [131.107.174.23])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7FBEA20DB364;
	Thu,  3 Oct 2024 20:36:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7FBEA20DB364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1728012964;
	bh=T6foSdSwknQFl2GCFf+5C1Rir3XbUgyPSFPEJ7eGw3w=;
	h=Date:To:Cc:From:Subject:From;
	b=chNUpk9E7svz97d2tzg3ftT7xFnSzvfZXMdnMqJfqxSYh7ldvJfEpYxhfDxdOB6qe
	 q0zxAnbJ1/LTG809F41AmXAZ54eqovxBa8WVf3CiGieLYtG826spAS5kicy5CYLACZ
	 wGTsVQL3CgBlEDRe+KxTHvbvd+p4Uu6SraXrF8dI=
Message-ID: <991f7b99-25fa-426a-99b1-a161fef3b728@linux.microsoft.com>
Date: Thu, 3 Oct 2024 20:36:04 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org
From: Fan Wu <wufan@linux.microsoft.com>
Subject: Please add ipe tree for testing
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stephen,

Please add the ipe tree

https://github.com/microsoft/ipe #next

to linux-next.

ipe is a new lsm we introduced in 6.12. I'm still in the process of 
setting up a tree in kernel.org, so I have to temporarily use our github 
repo for hosting patches for the next merge window. I will give you an 
update once I have the proper tree setup in kernel.org.

Thanks,
-Fan

