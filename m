Return-Path: <linux-next+bounces-5997-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDDCA70273
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 14:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0650517A589
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 13:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE99781732;
	Tue, 25 Mar 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndT6DZJu"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B81259CA2;
	Tue, 25 Mar 2025 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742909601; cv=none; b=FRpNEfMvYOX5987wJv0GdB/joG1GGmBQvozvNzQKlRGuXXpdlW/onhxHAnekGJCMR5VnjTiBuB9hnIyemRV/tyRkX2q6J7iR5ykYqX7F6wctmTIDPVzhWLZe6PLUKxEBg35AnkICGzBHpeiFFPEWHc1KGFDGbHioyHMU0vX5oT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742909601; c=relaxed/simple;
	bh=BKF23zGSOyZlQEQGc6GyJrf5li3gckRHl1ef5SAMu58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmspOQmmDVRUtAnHDk8st6PHtrVhPq4gTZ8saMpk3pEvfxn6DTyU+PcBY5YUQG+Hmcm2RvCQgiVeMNmT4ug0oNaIdneC4HC0wucoETz+kiR2aVL9JT9Mq6L2DCNoggljfugAbf+Gfhnq6237oSDFaSnWVn1jD/31GX99lo1Yjh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndT6DZJu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742909600; x=1774445600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BKF23zGSOyZlQEQGc6GyJrf5li3gckRHl1ef5SAMu58=;
  b=ndT6DZJu9CXhUVysvXTCd3Q0/suIBz/+wYZPMUt3lX+x+oAAr/Xtoz++
   Q9keG1g9FzMIu2hKv5wUbykoMK/unZNIQMRlbF8iOXJc1kRzJd9yJHOT7
   tF95W39tRILxcmm4c2HXgVzGxmS0koo4jDkVhGcjjEe3NxZClMDwaA01p
   IZ2jjGnmCatFzoN7h2BK7bXB2ydrPU8mfFds/8sK+dbKcN1sbtVZXTDZ2
   gpiPo/vRcMUMxNdpOnclE3WeAWtvK/dMGYlEpr8uFMNqwryRDZzp8BDG5
   G8FjDAoZa8dj6Pk50rqSA6juERgNLBwyHns5Watqivg37K26ytebGyWt1
   A==;
X-CSE-ConnectionGUID: kFwRKtEMQVe38NoRWWr+Ug==
X-CSE-MsgGUID: rzEhD69rQ0SZ1ggFrb280Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="31759281"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="31759281"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 06:33:18 -0700
X-CSE-ConnectionGUID: ByO82vrGR8mAPXI+Zm8Xow==
X-CSE-MsgGUID: Z44/HhGBRQKJKMmZjXOKsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="129489361"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 25 Mar 2025 06:33:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id DB770367; Tue, 25 Mar 2025 15:33:15 +0200 (EET)
Date: Tue, 25 Mar 2025 15:33:15 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, 
	"Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Message-ID: <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>

On Tue, Mar 25, 2025 at 02:40:00PM +0530, Aithal, Srikanth wrote:
> Hello,
> 
> 
> Starting linux-next build next-20250312, including recent build 20250324, we
> are seeing an issue where the SNP guest boot hangs at the "boot smp config"
> step:
> 
> 
>  [ 2.294722] smp: Bringing up secondary CPUs ...
> [    2.295211] smpboot: Parallel CPU startup disabled by the platform
> [    2.309687] smpboot: x86: Booting SMP configuration:
> [    2.310214] .... node  #0, CPUs:          #1   #2   #3   #4 #5   #6  
> #7   #8   #9  #10  #11  #12  #13  #14  #15  #16  #17 #18  #19  #20  #21 
> #22  #23  #24  #25  #26  #27  #28  #29  #30 #31  #32  #33  #34  #35  #36 
> #37  #38  #39  #40  #41  #42  #43 #44  #45  #46  #47  #48  #49  #50  #51 
> #52  #53  #54  #55  #56 #57  #58  #59  #60  #61  #62  #63  #64  #65  #66 
> #67  #68  #69 #70  #71  #72  #73  #74  #75  #76  #77  #78  #79  #80  #81 
> #82 #83  #84  #85  #86  #87  #88  #89  #90  #91  #92  #93  #94  #95 #96 
> #97  #98  #99 #100 #101 #102 #103 #104 #105 #106 #107 #108 #109 #110 #111
> #112 #113 #114 #115 #116 #117 #118 #119 #120 #121 #122 #123 #124 #125 #126
> #127 #128 #129 #130 #131 #132 #133 #134 #135 #136 #137 #138 #139 #140 #141
> #142 #143 #144 #145 #146 #147 #148 #149 #150 #151 #152 #153 #154 #155 #156
> #157 #158 #159 #160 #161 #162 #163 #164 #165 #166 #167 #168 #169 #170 #171
> #172 #173 #174 #175 #176 #177 #178 #179 #180 #181 #182 #183 #184 #185 #186
> #187 #188 #189 #190 #191 #192 #193 #194 #195 #196 #197 #198
> --> The guest hangs forever at this point.
> 
> 
> I have observed that certain vCPU and memory combinations work, while others
> do not. The VM configuration I am using does not have any NUMA nodes.
> 
> vcpus             Mem        SNP guest boot
> <=240            19456M    Boots fine
> >=241,<255   19456M    Hangs
> 1-255              2048M    Boots fine
> 1-255              4096M    Boots fine
> >71                 8192M    Hangs
> >41                 6144M    Hangs
> 
> When I bisected this issue, it pointed to the following commit :
> 
> 
> *commit 800f1059c99e2b39899bdc67a7593a7bea6375d8*
> Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Date:   Mon Mar 10 10:28:55 2025 +0200
> 
>     mm/page_alloc: fix memory accept before watermarks gets initialized

Hm. It is puzzling for me. I don't see how this commit can cause the hang.

Could you track down where hang happens?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

