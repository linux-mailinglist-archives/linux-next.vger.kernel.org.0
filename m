Return-Path: <linux-next+bounces-2956-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EEB92F485
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 05:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B1A92832FD
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 03:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB6F101DE;
	Fri, 12 Jul 2024 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4fzRG6w"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956D101C5;
	Fri, 12 Jul 2024 03:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720756442; cv=none; b=aFxPcwe358VxaGdaXPhPuSTqOY56hI/DUqJ+KUAZYjcT6SYQimWOu2E6bxGX14jO8AM5cxATmYjw1C29FFJTqeadRWt293+uhW3rZZ35vRhLwQOG/IZBTPXxdQ4P+uiiGPZeA7YzeUSR5U1VdDPnF2GKRdx22kDaQ9vPnBiQT5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720756442; c=relaxed/simple;
	bh=WWUBlswncwwbJ4inWGQiISoHu6TfJPC8iilnZiac7CE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=pRr5a1Pewnllgys0pRag/Qr3HAA/yWz2Jlc75OcNsCB1/JwG+dW2PS/bybk4/jR2fM4sWSTEksroxLF+1qJVxH9kSx2L1ZCdnKbMo0ccsP1Mo6J+CyXKTUFfmXP7dc+rQy8jonw7f0piwwIC56YOzAcvk9zCAsk/iKAk7YVYmuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4fzRG6w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720756441; x=1752292441;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=WWUBlswncwwbJ4inWGQiISoHu6TfJPC8iilnZiac7CE=;
  b=N4fzRG6wsjI4ylS1UEZ27inhxg3Ji+Bqasm14U21VNutEB7mQquyDwPF
   P78uxg+oQ+/QLFSJVHguFZrTv5wEyC5XDknSsrgVNS16F2+OYT+ZgBvll
   FUjTeo92SzyxK6r/GU5j4HEcg1hzxeT0/n4ejnZIDdwPQZNKyqapvjrjy
   oD5HQSZvyCumZD1b+n0O+TRpzu96ah5/fvTzjeO3Db7EGwYkR2yvtFMMg
   AylFi94wqXVEqmldSfhcGpweFyuOXDv6oBKr3y/HDWRxevSKKLtUOwMpJ
   3161ZZE9FmNNjEwoJbDWwhATiVOhkN0m38DBI38bC8N36ZV8JarWkIUNz
   Q==;
X-CSE-ConnectionGUID: JJOwuz3bT82FXwJGQFvUuQ==
X-CSE-MsgGUID: 7Q+UMWanSweBum6dh5Z+cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28855756"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="28855756"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 20:54:00 -0700
X-CSE-ConnectionGUID: EhFlkDZTTxKfUmDUvECziA==
X-CSE-MsgGUID: vKYKXNnLSpyScB6Ef8Wv2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="53971681"
Received: from hongyuni-mobl.ccr.corp.intel.com (HELO [10.124.244.70]) ([10.124.244.70])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 20:53:57 -0700
Message-ID: <8804c63f-bca7-40c6-8be7-7b7bcfb66dec@linux.intel.com>
Date: Fri, 12 Jul 2024 11:53:55 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: sfr@canb.auug.org.au
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, kirill.shutemov@linux.intel.com
From: "Ning, Hongyu" <hongyu.ning@linux.intel.com>
Subject: linux-next tag next-240709: potential bug from commit "28ab42489515
 Merge branch 'linux-next' of
 git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi all,

on a local linux-next (KVM/QEMU based guest kernel target) regular 
regression check environment, found a potential regression issue 
introduced by "28ab42489515 Merge branch 'linux-next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git",

detailed tracked in https://bugzilla.kernel.org/show_bug.cgi?id=219034

would you help to check it?

please let me know if any further track/debug needed.

-=Hongyu Ning

