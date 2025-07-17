Return-Path: <linux-next+bounces-7611-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B6B096F0
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 00:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C8BA3BCFD6
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 22:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF58E224B09;
	Thu, 17 Jul 2025 22:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktBh38yA"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A271E192598;
	Thu, 17 Jul 2025 22:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752791697; cv=none; b=rNBfhPikpoABNtmAin7WDzuy8kLAmJwXGxhBh4aeqruimE5leRhYRQK7QF9fO0zvIoVG+ojlL+WL2LH9whdok9eqL6P/Nz7PIvIW56ndbzEalE6xlTI7MgvgWBIKPbqNvlCYtBmZPbnWvymAXRpRjVIwm1cpiRbsLoPbZVfMveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752791697; c=relaxed/simple;
	bh=6NPNN/8k4ACslilAsbpfSZQ5F5VjHTpBCjqVxYYDyRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klDUyNY8Mx0iyzo3uX4rgFkG+tw/hpmyVOKqPpOxwqoTbTZ30+R4YQlPmI7Uvd7OFOf5aPcFcy9oMg6IbT1zcCk1VvEoPwGjkTId8b9CkkuKsnvjjTFZRQnEtcP83D2xAxF6xeyZ5rMZ1NBqr91G57QnhdyENcz9HxLIdtNXzHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktBh38yA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752791696; x=1784327696;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6NPNN/8k4ACslilAsbpfSZQ5F5VjHTpBCjqVxYYDyRA=;
  b=ktBh38yAnYMGokO0k80UzTCExCpQxlXHM6/ockwi3lsLwe/ewp6f+8BB
   mHdNmYaVSFpYLsA+Lejkxt5SROp/XiYFd2dmM5efeq5B0VVuc/RFZM5aW
   26+7j11l7QcJom2BJs8eurSSflU6nmyA/kiZ0HPUerM5n8qFIg1l9aNUN
   RixwUy1iNokgIS+lau5KFedk7SLdCi6Oc12ZQQ2zhU7bQjOWnAQgPwod4
   pjRqenlcFZIj7GAKJVpAeq8nkQ08Naq/HD1h3srHMR+HzamqFo/V6X2Id
   LVINA4fb50f/amXjgReFN3k+r5XoF759sPuVK6xfl367zXJ5YCFsgXK5S
   w==;
X-CSE-ConnectionGUID: OZrskPCtRRyU84bdqOwKOQ==
X-CSE-MsgGUID: NmQoNqZnQYiZe1TKnmayKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54940908"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="54940908"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 15:34:55 -0700
X-CSE-ConnectionGUID: 4YLSw72LSUig6z6adnXKXQ==
X-CSE-MsgGUID: s8yjVlfXRQuZD/LyJLkqzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="161937147"
Received: from ldmartin-desk2.corp.intel.com (HELO [10.125.108.3]) ([10.125.108.3])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 15:34:54 -0700
Message-ID: <4d47daed-2af3-45c2-a7be-ffe06da59738@intel.com>
Date: Thu, 17 Jul 2025 15:34:53 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the cxl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Dan Williams <dan.j.williams@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250718082936.40138acb@canb.auug.org.au>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250718082936.40138acb@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/25 3:29 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   105d55ade07f ("")
> 
> is missing a Signed-off-by from its author and committer.
> 
> In fact it is missing any message and any patch! ;-)
> 
Hi Stephen, sorry about that. I started doing a debug for the doc error reported via stgit and then pulled Dan's fix via b4 w/o removing the debug commit. Should be fixed now. 


