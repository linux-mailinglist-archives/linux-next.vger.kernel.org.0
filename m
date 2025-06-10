Return-Path: <linux-next+bounces-7128-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C7AD3DE5
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 17:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FD5816B1C8
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 15:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9D72356A7;
	Tue, 10 Jun 2025 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZ2VJSfh"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB211386C9;
	Tue, 10 Jun 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570647; cv=none; b=Tq8RtrJV2iV4L6tUVYuPQWg1YOUNcuioFcO/ehIa6eQM+grewc0PWQx0VhPYHEhLe5Xd4qjNRcjZ34wWE8o4ReV7ewa6nUGIUaQr9DtOZaYq257/y35vwVh/4JSOnQpdRNDPP1oU6Ay896Lsm9ufXTDNj6mVUNh03U97+emhAbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570647; c=relaxed/simple;
	bh=tYhj+n5Ybop0fiSluV5BrynfIx/rnEzGAHUHgayjLMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBl/fDfTIox7t3NyUbRRJ6ssdnEeM4bYflPcbjCva1c00CxPDRC/TUo6tSa1GhXlFU/awlEoioWhhV+Tv3amnWPFmX1c0t3URerLWW/KZEYdrjOBLBkakqHnSaQHtwlqiehOGEsvtqeJR8cCtZr12cKSEIbTeSNcA9a8TvcWiWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZ2VJSfh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749570645; x=1781106645;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tYhj+n5Ybop0fiSluV5BrynfIx/rnEzGAHUHgayjLMI=;
  b=QZ2VJSfhxUGGCB0q/qh5FoWF3j7Z2qlrHJU3fmjNt1uKkhjsbll9zQ9v
   LbSVke3F6SkOlin3Ro2+t2vpqFEarpvnmRxoeNZqs0xHhO7Asoa4CR392
   4pIKw7QS4kmEb8UcTx9BDe6FCSt6RtnV5r47vRIIbGS+wpPaVSUvt3sue
   +CtvKulrtW6uV5fQkH3x6AMlufJMfagExD8MQqIFArRHk/NwB+wLe1zZc
   viaDPS8tEbBHk4FoYPKzgudwg2uML7Q9eSQK5BgstKeLU/bKccyvbSTk7
   qtazsoJBAb81ftd9k/cCwOUVLJqO1MCN6Hw4C5PK0kEPocPXObMmvqRci
   g==;
X-CSE-ConnectionGUID: maJXSAfoRX6i2tEg4BvaXQ==
X-CSE-MsgGUID: bRLSopnHTtuVvksavLXXQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51784131"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51784131"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 08:50:44 -0700
X-CSE-ConnectionGUID: Yq1lQJ8/SX6G2MbTmDC75Q==
X-CSE-MsgGUID: DiO0Vc6HTruU4cfko48nXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="170070351"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [10.125.111.135]) ([10.125.111.135])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 08:50:44 -0700
Message-ID: <623e93ea-245d-44fd-9909-b74ec1e150a2@intel.com>
Date: Tue, 10 Jun 2025 08:50:43 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the cxl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Dan Williams <dan.j.williams@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250610142612.130714a7@canb.auug.org.au>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250610142612.130714a7@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/25 9:26 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the cxl tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/driver-api/cxl/index.rst:11: WARNING: toctree contains reference to nonexisting document 'driver-api/cxl/conventions' [toc.not_readable]
> 
> Introduced by commit
> 
>   11f401444201 ("Documentation/driver-api/cxl: Introduce conventions.rst")
> 

s/conventions/conventions.rst/ for the file. I'll fix and re-push. 

