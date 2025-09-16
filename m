Return-Path: <linux-next+bounces-8324-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B68B59149
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 10:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A779B166FD0
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 08:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2045328313A;
	Tue, 16 Sep 2025 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZHgWa1E"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67753275B1F;
	Tue, 16 Sep 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758012582; cv=none; b=X+hvGa0nZ40vnTGg0GMOlaKqhBRU33npH43z8dBw89HNuPM7UDQFR7LmuhKayrrHzD6R5rgS5i9GI4N8ObHFff1KehkAFZTqhT1+GYfzwbcmGtfq7prSQrI7gykmzvTisYad3qhdSDMHtHG0VK4JIrxzM/ClLbBmvVN3b8MODYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758012582; c=relaxed/simple;
	bh=XACujb/waoNFbdX5lO9KBlT7ea7U5VOdh7HZFWCOvL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlgB9V3bqbgpeNqMBsrblTyjhu4scC4AQp0ieK3pNXywZI1nnYIzA48C4UW3/pe+hK4/ZsDdKkIhd5+IPl8SFYsYxIJL3koV05ITmPlukzOeiq7Uh0bmgs27GnjZJGQWlF7byKaCSyfi8frsitrupYbSgM61+TkdZjcWNjoKfF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZHgWa1E; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758012580; x=1789548580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XACujb/waoNFbdX5lO9KBlT7ea7U5VOdh7HZFWCOvL4=;
  b=AZHgWa1EXq4i6Nf9aiHqx5JyBPlJv5b7bYEorUlzlQAik5EOnRZnKaY2
   znA9NSO2r8Eejxx5WZXbdYan7753rXOYI821fgg7WqjN6uLa85EzZ4KkW
   wNhvjqrpk69mcFFeWTPfsOAKVC7a0aoVZuNlbXc+FcVsMSkVCHPSqvTEj
   SJTwdXYO1pRbve0aLe4UFvX9dYXDS2zo504xfdlUHMspcLNtTnNKLMX3n
   /yR0aZDJnLK75cCB4Xrk8U1LXZq7RvG/XS9YMbP+AUWxlxWLgUDy052rH
   d3F0Su/10r7xVKlG/2hgJGULL1mspb9QWnmL9Cukpj5cHGC7E/pT1Vuud
   A==;
X-CSE-ConnectionGUID: FFRJOw+zTkyd61KcLrTcBw==
X-CSE-MsgGUID: 7DGdWtKbQw6c6j0tP+a4kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64091780"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64091780"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 01:49:39 -0700
X-CSE-ConnectionGUID: iMcBTyxSTY+AF/kGEVSfKQ==
X-CSE-MsgGUID: wtHeKtfCR6+LKmTF7+B/RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="180131267"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2025 01:49:37 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyRNW-00007R-2l;
	Tue, 16 Sep 2025 08:49:34 +0000
Date: Tue, 16 Sep 2025 16:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Amir Goldstein <amir73il@gmail.com>,
	buildfailureaftermergeofthevfstree@sirena.org.uk,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the vfs tree
Message-ID: <202509161649.GzVNYeqs-lkp@intel.com>
References: <aMhzi0WpakpN7oH5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMhzi0WpakpN7oH5@sirena.org.uk>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[cannot apply to linus/master v6.17-rc6 next-20250915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-in-the-vfs-tree/20250916-041652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/aMhzi0WpakpN7oH5%40sirena.org.uk
patch subject: linux-next: build failure in the vfs tree
config: hexagon-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161649.GzVNYeqs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161649.GzVNYeqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161649.GzVNYeqs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nsfs.c:582:11: error: incompatible function pointer types initializing 'struct file *(*)(struct path *, unsigned int)' with an expression of type 'struct file *(const struct path *, unsigned int)' [-Wincompatible-function-pointer-types]
     582 |         .open           = nsfs_export_open,
         |                           ^~~~~~~~~~~~~~~~
   1 error generated.


vim +582 fs/nsfs.c

06c4ff965e95b0b Christian Brauner 2025-09-12  578  
06c4ff965e95b0b Christian Brauner 2025-09-12  579  static const struct export_operations nsfs_export_operations = {
06c4ff965e95b0b Christian Brauner 2025-09-12  580  	.encode_fh	= nsfs_encode_fh,
06c4ff965e95b0b Christian Brauner 2025-09-12  581  	.fh_to_dentry	= nsfs_fh_to_dentry,
06c4ff965e95b0b Christian Brauner 2025-09-12 @582  	.open		= nsfs_export_open,
06c4ff965e95b0b Christian Brauner 2025-09-12  583  	.permission	= nsfs_export_permission,
06c4ff965e95b0b Christian Brauner 2025-09-12  584  };
06c4ff965e95b0b Christian Brauner 2025-09-12  585  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

