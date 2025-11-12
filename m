Return-Path: <linux-next+bounces-8941-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA96FC52458
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 13:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89CD23B1B46
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 12:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDCD3314DB;
	Wed, 12 Nov 2025 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNBkTfOS"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7035CBC6;
	Wed, 12 Nov 2025 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762950682; cv=none; b=YyDwhryScoBNJA1GQFyGQm07IhhrfLNPDTe0djXwso6y9bUCJd3EjfH1GieGVIHu90O4Ec3ijXeMa8V4stgWggBU8t4U/d3GtGwNDNPyztIt0s9vKGr2Fk4W5bFrtwN5GZ7nYsYadJdZz8gnbkdLRCtL7FY3baApeWI9Jr5TlQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762950682; c=relaxed/simple;
	bh=BlE5g+SiMSq6fj99+C5fH+eZFaLaTysnZRh+Dln4QhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQf6cxYF9nuwouVGTkzpUq/0dMQ0hWaUeL+P94dD8BmfNKcB8lXi//FTFlYHKvBKto6BzLdS2psWh0emvQimpVij8bIhDiiepU1ugT4S3jO+XOUWzJoOqUDj/3pcMXJKLswXPkuBVGaQJp7wXfKYDlt34VWOKB1Sp7OJOtncpIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNBkTfOS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762950680; x=1794486680;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BlE5g+SiMSq6fj99+C5fH+eZFaLaTysnZRh+Dln4QhY=;
  b=HNBkTfOScyG0GE/hCvBw1W66hprFUFiHKm8Q/1ONnkByqAxK3eraHySQ
   EqjUALOWu5dp767b4STj7BK8v6EDtwiBTikfLt0HR3sKHWSD/sPrrR0Xw
   GpSiMd6JrCfVSuB7f7DAifoa2af8u54SATIlpzoVlhK+6g752oUhqwBlr
   cpnEDczev/4D0LUkfusuIXQe1ZjIrsY1lTs/MXBEA4dzo+rK1EZDf90Zn
   ThmigeSwvlpKMr0AxGbpre1ECfwI5n5ZRRv1r5OdKlda0SpODPOL6IcPi
   xfe7rN6rN7J31sY/mD7X1vWQ/TFyPgAf2aJ86cIEK3irv6AN9MHrSDSDh
   Q==;
X-CSE-ConnectionGUID: qsiyQ0RqRRaVYmDPecIdoA==
X-CSE-MsgGUID: fjf4CbUYSzO2xhF9TPcEbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="65163337"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="65163337"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 04:31:19 -0800
X-CSE-ConnectionGUID: VwBKkr/QSdClLx3bkIHvCQ==
X-CSE-MsgGUID: fVZS0ikbRoCheqNQv8PZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="219945965"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.232.65]) ([10.124.232.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 04:31:16 -0800
Message-ID: <11a8a24d-d220-4636-9939-554a8f55062c@linux.intel.com>
Date: Wed, 12 Nov 2025 20:31:14 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tip tree
To: Peter Zijlstra <peterz@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Kan Liang <kan.liang@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251112154200.4d3671f9@canb.auug.org.au>
 <20251112093928.GD4067720@noisy.programming.kicks-ass.net>
 <20251112214515.41daf9cc@canb.auug.org.au>
 <20251112104814.GB3245006@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251112104814.GB3245006@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/12/2025 6:48 PM, Peter Zijlstra wrote:
> On Wed, Nov 12, 2025 at 09:45:15PM +1100, Stephen Rothwell wrote:
>> Hi Peter,
>>
>> On Wed, 12 Nov 2025 10:39:28 +0100 Peter Zijlstra <peterz@infradead.org> wrote:
>>> It appears you're way faster than the build robots :/
>> I was hoping people would put their code through the robots (or some
>> local unit testing) before publishing it in their linux-next included
>> branches ... ;-)
> I do, but sometimes they just take forever :/ And clearly I don't do
> i386 builds myself.

This issue educates me. I would add i386 arch building into my BAT test list. 



