Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E132CED45
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 12:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730097AbgLDLku (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 06:40:50 -0500
Received: from mga03.intel.com ([134.134.136.65]:47116 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729196AbgLDLku (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Dec 2020 06:40:50 -0500
IronPort-SDR: NCwSvJ22hZKtlhKtjbtsBb+ox6V0k9oKCFcwkYRALOtYVpYnd+22BbZqhH7HhxBmSfYrNG76Q1
 pDaDjVLTJfnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="173458486"
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="173458486"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 03:39:08 -0800
IronPort-SDR: IXJ9tIGRKuQ0kVi/NCMNRCQEO94DuKe9xI04od7j9zJurcxJ7mVYaHQj9Xaiz1Qn93fvS7hc/x
 EJJ1VQk0Iarw==
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="316923587"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 03:39:05 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E5E6720676; Fri,  4 Dec 2020 13:39:03 +0200 (EET)
Date:   Fri, 4 Dec 2020 13:39:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Luka Kovacic <luka.kovacic@sartura.hr>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the mvebu tree
Message-ID: <20201204113903.GS852@paasikivi.fi.intel.com>
References: <20201203115137.6620f27a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203115137.6620f27a@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 03, 2020 at 11:51:37AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the v4l-dvb tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   8c4e256e3d42 ("MAINTAINERS: Add an entry for MikroTik CRS3xx 98DX3236 boards")
> 
> from the mvebu tree and commit:
> 
>   b24cc2a18c50 ("media: smiapp: Rename as "ccs"")
> 
> from the v4l-dvb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, Stephen.

The resolution below seems good to me.

-- 
Sakari Ailus
