Return-Path: <linux-next+bounces-3016-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1989313CE
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 14:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19A1D280D50
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 12:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E45189F5C;
	Mon, 15 Jul 2024 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPE6b/eQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064DC1891B2;
	Mon, 15 Jul 2024 12:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045610; cv=none; b=jA4AsdV6Uh+MCmBKHmxdsV9+4WyGSMda/aihYJLImkZBVOYobRRQSjyf8ijEXLvzBUYn18KXEpOYJGCUoPFAMEeR3DfovTw2rJuqs9fbf0U3xnFMQ9ZY95mHeAZ6bdICk/TX3BlngC70lcvOU9D0f/iBs58HJJN7NgH+zJuO1PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045610; c=relaxed/simple;
	bh=Zn83j3eNWdHYHMJ+UEUHTLaYD3lLIIF14eNqyo8jTtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GamuUPshqHhU6dsLLInoP9OhMrkgyD/bFNcZA3uA9m1l/I8BsL8GO/WaWEv1ZoqKkO7GrCri4Wd749vBH7hRT2LeCae8ronmiyFf0EN6wvliHIXCFU2hisqm/dGMA8otouswBIivO8zsJrSwTUl8Hz2QhTAfep8ybOQhHczqJlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPE6b/eQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721045608; x=1752581608;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Zn83j3eNWdHYHMJ+UEUHTLaYD3lLIIF14eNqyo8jTtc=;
  b=fPE6b/eQ8N3oV/Ilu9VwZcAwLbXJD/KQUXP+BMb4jVbeH7ioOkSEW3/U
   2f5LhTsOAKWrW1x2HY7PoFY69nazHwvpH/3CYU1Zr2zEcO3uMxjbsqoOr
   i3SP7QwhUcd8P01zfJLY0dQ5ZhnLcEtlHtrNi7DB47hz7LuwxE4XuO+l8
   hOMLh4OHjmsMm4bqHQ50JuwzugdGuISBTgvfg02fxO548tq9oqQUlz/kN
   oAZD4YIEiIpZdGsXdDJSuqKbNTRgz+27dQzWNdirLFArdLM8ZPKZ49AaN
   gP29HXOUVqU7ZvNmNCoWP5j6Kmntetgr5xigkCyGQ53Zrt6ywsyxymp7X
   g==;
X-CSE-ConnectionGUID: DNwVYRqrRyyMzZzH5cAnPg==
X-CSE-MsgGUID: AhsJMa/oTFOsCAMlWi1gFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="29010144"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="29010144"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 05:13:28 -0700
X-CSE-ConnectionGUID: K8N519t3SiGQNzO/0yegBg==
X-CSE-MsgGUID: 04/0i0imSR6PN1Pm890slQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="50371332"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.220]) ([10.245.245.220])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 05:13:23 -0700
Message-ID: <679e9674-9611-48a8-8f94-4285b080d3f6@intel.com>
Date: Mon, 15 Jul 2024 14:13:37 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the drm-intel tree
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240612141110.3aebb166@canb.auug.org.au>
 <20240715091234.5e8b2701@canb.auug.org.au>
 <774fa28d-b196-0030-2fb2-5d5fb8a7d1cc@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@intel.com>
In-Reply-To: <774fa28d-b196-0030-2fb2-5d5fb8a7d1cc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey,

Den 2024-07-15 kl. 06:21, skrev Golani, Mitulkumar Ajitkumar:
>
> On 15-07-2024 04:42, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Wed, 12 Jun 2024 14:11:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> After merging the drm-intel tree, today's linux-next build (htmldocs)
>>> produced this warning:
>>>
>>> include/drm/display/drm_dp_helper.h:127: warning: Function parameter or struct member 'target_rr_divider' not described in 'drm_dp_as_sdp'
>>>
>>> Introduced by commit
>>>
>>>    a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
>> I am now seeing that warning after the merge of the drm tree.
> Hi Stephen Rothwell,
>
> I have already floated changes : https://patchwork.freedesktop.org/patch/604143/?series=136072&rev=1
>
> Need help on Ack from drm-maintainers to merge.

There you go, does it need to go through drm-misc too?

Cheers,

~Maarten


