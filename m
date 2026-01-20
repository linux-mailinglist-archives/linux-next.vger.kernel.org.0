Return-Path: <linux-next+bounces-9734-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31AD3C29A
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 09:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 530C04C6198
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 08:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6567E3559CA;
	Tue, 20 Jan 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8+Zh7vE"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95C34214A;
	Tue, 20 Jan 2026 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898393; cv=none; b=R183tWmUpqcpwfSaE6P9GigGQrj8WJR4qX6vCyeKRxFXDeHNsyqPGuRBohibfhnay+QBXnPrcrd0uyb8WUAfMm7iTfN/qhw1OS1EZV8autY2E3S5jo6Q185Nb/G9b63wicEKK0gCraoTWcaHj6L4FHBNxPMevz3ua+RApwwnby8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898393; c=relaxed/simple;
	bh=gyknzVYbQz+3C6pNFs49TMdgVch1zIYC5+49dltZUBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiTHGWc5SYby0MsWx4+gZrZFJr8CAf9vdR9+uvkpWy+RWKsovMsBMLCyuHAOJLq+jZ477nknt8ylNgVcFxyvqHQPKddVZQQL1hrYPtgNXM8Qg5n6a//LY75JJI5qDmsYUC/qCjzPLR688nXz6xs/1MmFEkdncRxSzEDtevjo5c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8+Zh7vE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768898392; x=1800434392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gyknzVYbQz+3C6pNFs49TMdgVch1zIYC5+49dltZUBs=;
  b=Z8+Zh7vE0C0L5OK8Cc7aXk28a4fhL4FDG4eLIyGUOvUzkfe3qICSGMQ1
   Vh1j/8ohUwpAsFwxHPBJkilTAIy8pQdMYTCgynqhzmtj9ZXyO3s1Z7SQR
   l79Q6GGnsd5ik3QnLoVseXYO5mx6vc2+R9SdP5KaTrDMupgLh959yQ0t2
   eZ0OL1iRKzLT3oFnbh+IyWNBd8lZtc0+roFLOqwqY2pyRCaIBdVx6R2Gp
   vga7VCA3q11yNmDeOri4+GZ3aXAtNPUgfTMZ3G1nRp6aRYm2fx3D2Vy6g
   gKAATbXUtBpW6t8sRMFxOotaNGLLyOpvDYkXB9XhingMvnoC/9AJrNGE7
   g==;
X-CSE-ConnectionGUID: J2sMaVbDQo2jxRD7XYhKLg==
X-CSE-MsgGUID: xYtVFVQQTrC0NbbcIF1vZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73957199"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="73957199"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 00:39:51 -0800
X-CSE-ConnectionGUID: B44mzRXST6+3wL7m0Wqszw==
X-CSE-MsgGUID: UPRqIYh9R46/J9RdTnNFrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206486951"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jan 2026 00:39:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi7H7-00000000Ojd-3fJu;
	Tue, 20 Jan 2026 08:39:45 +0000
Date: Tue, 20 Jan 2026 16:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <202601201642.SjxE1oMu-lkp@intel.com>
References: <aW5AGPFq0HPi440m@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5AGPFq0HPi440m@sirena.org.uk>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260116]
[cannot apply to brauner-vfs/vfs.all xiang-erofs/dev-test xiang-erofs/dev xiang-erofs/fixes v6.19-rc6 v6.19-rc5 v6.19-rc4 linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-vfs-brauner-tree/20260119-223859
base:   next-20260116
patch link:    https://lore.kernel.org/r/aW5AGPFq0HPi440m%40sirena.org.uk
patch subject: linux-next: build failure after merge of the vfs-brauner tree
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601201642.SjxE1oMu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201642.SjxE1oMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201642.SjxE1oMu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ntfs3/inode.c:678:42: error: too many arguments to function call, expected 2, have 3
     678 |         iomap_read_folio(&ntfs_iomap_ops, &ctx, NULL);
         |         ~~~~~~~~~~~~~~~~                        ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   include/linux/iomap.h:347:6: note: 'iomap_read_folio' declared here
     347 | void iomap_read_folio(const struct iomap_ops *ops,
         |      ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     348 |                 struct iomap_read_folio_ctx *ctx);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/inode.c:702:41: error: too many arguments to function call, expected 2, have 3
     702 |         iomap_readahead(&ntfs_iomap_ops, &ctx, NULL);
         |         ~~~~~~~~~~~~~~~                        ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   include/linux/iomap.h:349:6: note: 'iomap_readahead' declared here
     349 | void iomap_readahead(const struct iomap_ops *ops,
         |      ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     350 |                 struct iomap_read_folio_ctx *ctx);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +678 fs/ntfs3/inode.c

   647	
   648	static int ntfs_read_folio(struct file *file, struct folio *folio)
   649	{
   650		int err;
   651		struct address_space *mapping = folio->mapping;
   652		struct inode *inode = mapping->host;
   653		struct ntfs_inode *ni = ntfs_i(inode);
   654		loff_t vbo = folio_pos(folio);
   655		struct iomap_read_folio_ctx ctx = {
   656			.cur_folio = folio,
   657			.ops = &ntfs_iomap_bio_read_ops,
   658		};
   659	
   660		if (unlikely(is_bad_ni(ni))) {
   661			folio_unlock(folio);
   662			return -EIO;
   663		}
   664	
   665		if (ni->i_valid <= vbo) {
   666			folio_zero_range(folio, 0, folio_size(folio));
   667			folio_mark_uptodate(folio);
   668			folio_unlock(folio);
   669			return 0;
   670		}
   671	
   672		if (is_compressed(ni)) {
   673			/* ni_lock is taken inside ni_read_folio_cmpr after page locks */
   674			err = ni_read_folio_cmpr(ni, folio);
   675			return err;
   676		}
   677	
 > 678		iomap_read_folio(&ntfs_iomap_ops, &ctx, NULL);
   679		return 0;
   680	}
   681	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

